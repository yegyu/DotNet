package handler.main;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;

import handler.CommandHandler;
import main.AskReplyDataBean;
import main.BoardAskDao;
import main.BoardAskDataBean;
import main.MemberDao;
import user.FrDao;
import user.MessageDao;
import user.MessageDataBean;


@Controller
public class AskContentHandler implements CommandHandler{

	@Resource
	private BoardAskDao boardAskDao;
 	
	
	@RequestMapping("askContent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession sess = request.getSession();
		String id = (String)sess.getAttribute("memId");
		request.setAttribute("id",id);
		int num = Integer.parseInt(request.getParameter("num"));
		if(id != null) {
			MainHandler.userLogger.info("askContent:"+id+",num:"+num);
		}else {
			MainHandler.userLogger.info("askContent:noMem,num:"+num);
			
		}
		
		int check = 0 ;
		Cookie[] cookies = request.getCookies();
		for(int i = 0 ; i < cookies.length ; i++) {
//			System.out.println("for loop : " +cookies[i].getValue() );
			if(cookies[i].getValue().equals("#"+num)) {
				check++;
				break;
			}
		}
//		System.out.println("check : " + check);
		if(check == 0) {
			int viewRs = boardAskDao.updateView(num);
			Cookie newCookie = new Cookie("cookie" + num, "#" + num );
			newCookie.setMaxAge(60*60*24);
			response.addCookie(newCookie);
		}

		
		BoardAskDataBean ask = boardAskDao.getAsk(num);
		
		request.setAttribute("ask", ask);
		request.setAttribute("num", num);
		
		
		
		List<AskReplyDataBean> list= boardAskDao.getReplys(num);
		request.setAttribute("replys", list);
		return new ModelAndView("main/askContent");
	}
	
	@RequestMapping(value = "APC", method = RequestMethod.POST)
	@ResponseBody
	public String askPasswdCheck(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		String passwd = (request.getParameter("passwd"));
		int num =Integer.parseInt(request.getParameter("num")) ;
		
		
		String cp = boardAskDao.checkPasswd(num);
//		System.out.println("check passwd on ask : "+ cp);
		if(cp.equals(passwd) ) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "modiAsk", method= RequestMethod.POST)
	@ResponseBody
	public String modiAsk(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("num", request.getParameter("num"));
		map.put("title", request.getParameter("title"));
		map.put("contents", request.getParameter("contents"));
		
		int rs = boardAskDao.updateAsk(map);
		
		return String.valueOf(rs);
		
	}
	
	
	
	@RequestMapping(value = "reply", method= RequestMethod.POST)
	@ResponseBody
	public AskReplyDataBean reply(HttpServletRequest request) throws Exception {
		AskReplyDataBean ar = new AskReplyDataBean();
		int num = Integer.parseInt(request.getParameter("num"));
		int rnum = 0;
		if(boardAskDao.getMaxRNum(num) != null) {
			rnum = boardAskDao.getMaxRNum(num);
		}
		ar.setRnum(rnum+1);
		ar.setNum(num);
		ar.setReply(request.getParameter("reply"));
		ar.setId(request.getParameter("id")); 
		ar.setBad(0);
		ar.setGood(0);
		ar.setrDate(new Timestamp(System.currentTimeMillis() ));
		ar.setrState(0);
		
		
		
		int rs = boardAskDao.insertReply(ar);
		
//		List<AskReplyDataBean> replys = boardAskDao.getReplys(Integer.parseInt(request.getParameter("num")));
		AskReplyDataBean reply = boardAskDao.getReply(Integer.parseInt(request.getParameter("num")));
		
		return reply;
		
	}
	//대댓글
	@RequestMapping(value = "ddr", method= RequestMethod.POST)
	@ResponseBody
	public AskReplyDataBean ddReply(HttpServletRequest request) throws Exception {
		HttpSession s = request.getSession();
		String id = (String)s.getAttribute("memId");
		AskReplyDataBean ar = new AskReplyDataBean();
		int num = Integer.parseInt(request.getParameter("num"));
		int rnum = Integer.valueOf(request.getParameter("rnum"));
		String reply = request.getParameter("reply");
		ar.setRnum(rnum);
		ar.setNum(num);
		ar.setReply(reply);
		ar.setId(id); 
		ar.setBad(0);
		ar.setGood(0);
		ar.setrDate(new Timestamp(System.currentTimeMillis() ));
		ar.setrState(-2);
		
		
		
		int rs = boardAskDao.insertReply(ar);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rnum",rnum);
		map.put("num", num);
		
//		List<AskReplyDataBean> replys = boardAskDao.getReplys(Integer.parseInt(request.getParameter("num")));
		AskReplyDataBean ddr = boardAskDao.getDDReply(map);
		
		return ddr;
		
	}
	
	@RequestMapping(value = "goodBad", method = RequestMethod.POST)
	@ResponseBody
	public int goodBadFunc(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		 
		Object gb = JSONObject.stringToValue(request.getParameter("gb"));
		Map<String,Map<String,Integer>> map = new HashMap<String, Map<String,Integer>>();
		ObjectMapper mapper = new ObjectMapper();
		map = mapper.readValue(gb.toString(), new TypeReference<HashMap<String, Map<String,Integer	>>>() {} );
		
		for ( String key : map.keySet()) {
//			System.out.println("key :" +  key +  ", good : " + map.get(key).get("good") + " , bad : " + map.get(key).get("bad") + ",num : " + map.get(key).get("num"));
				Map<String, Integer> map1 = new HashMap<String, Integer>(); 
				map1.put("num", map.get(key).get("num"));
				map1.put("rnum", Integer.parseInt(key));
				map1.put("good",map.get(key).get("good"));
				map1.put("bad",map.get(key).get("bad"));
				int udateGoodBad = boardAskDao.updateGB(map1);
//				System.out.println(udateGoodBad + " << update result");
			}
//		System.out.println();
		return 1; 
	}
	
//	
//	@Resource
//	private MemberDao memberDao;
	@Resource
	private MessageDao messageDao;
	@Resource
	private FrDao frDao;
	
	@RequestMapping(value = "reqFrAsk" , method = RequestMethod.POST)
	@ResponseBody
	public String reqFrFromAsk(HttpServletRequest request) throws Exception {
		
//		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String myId = (String)session.getAttribute("memId");
		String frId =request.getParameter("id");
		if(myId.equals(frId)) {
			return "0";
		}
		//친구
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("myId", myId);
		map.put("id",frId);
		int getMaxFrNum = frDao.getMaxFrNum();
		map.put("num",getMaxFrNum+1);
		System.out.println(map.get("num"));
		Integer checkRs = frDao.checkFr(map);
//		System.out.println(checkRs +  " <<  친구 상태 확인 ?? 없으면 아직 친구가 아닌거지");
		if(checkRs != null) {
			if(checkRs == 0) {
				return "1";
			}else if(checkRs == 1) {
				return "2";
			}else if(checkRs == 2 ) {
				return "3";
			}
		}else {
			//친구 신청 가능
			String title= request.getParameter("title");
			String content = request.getParameter("contents");
			
			
			int msgNum = 0;
			MessageDataBean messageDto = new MessageDataBean();
//			System.out.println(messageDao.getMsgNum()== null ?"getMsgNum() �� null" : "getMsgNum() �� not null"+ messageDao.getMsgNum());
			if(messageDao.getMsgNum() != null) {
				msgNum = messageDao.getMsgNum();
			}
//			System.out.println("msgNum : " + msgNum);
			messageDto.setM_num(msgNum+1);
			messageDto.setM_title(title);
			messageDto.setM_content(content);
			messageDto.setS_mem_id(myId);
			messageDto.setS_mem_del_st(0);
			messageDto.setR_mem_id(frId);
			messageDto.setR_mem_del_st(0);
			messageDto.setM_date(new Timestamp(System.currentTimeMillis() ));
			
			int insertMsgRs = messageDao.insertMsg(messageDto);
			
			int insertFr = frDao.insertFr(map);
			
			return "4";
		}
		return "결과를 알 수없니다. Ask Contnet 로 오세요";
	}
	
	@Resource
	private MemberDao memberDao;
	
	@RequestMapping(value = "delR")
	@ResponseBody
	public String delReply(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String passwd = request.getParameter("passwd");
		int num = Integer.parseInt(request.getParameter("num"));
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		String rD = request.getParameter("rDate");
//		System.out.println("rD >> " + rD);
//		Timestamp rDate = Timestamp.valueOf(rD);
//		System.out.println("rDate >> " + rDate);

		
		String type = request.getParameter("type");
		String reply = request.getParameter("reply");
//		System.out.println("type : >>> " + type);
		Map<String,Object> map = new HashMap<String, Object>();
		int urs = 0;
		int rs = memberDao.check(id, passwd);
//		System.out.println("rs >> " + rs);
		if(rs == 1) {
			map.put("rnum", rnum);
			map.put("num", num);
			map.put("rDate",rD);
			map.put("reply",reply);
			
			if(type.equals("0")) {
				urs = boardAskDao.delReply(map);
//				System.out.println(urs +" <<< in type 0 ");
				urs = 1;
			}else if(type.equals("-2")) {
				urs = boardAskDao.delDReply(map);
//				System.out.println(urs +" <<< in type -2 ");
				urs =2;
				
			}
//			System.out.println("urs succsess : "+ urs);
		}else {
			//실패
			urs = -1;
			return "-1";
		}
//		System.out.println("urs >> " + urs + ", type >> " + type);
		return String.valueOf(urs);
	}
	
	
	
	
}
