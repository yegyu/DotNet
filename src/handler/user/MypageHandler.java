package handler.user;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.BoardDataBean;
import main.MemberDao;
import main.MemberDataBean;
import user.FrDao;
import user.LibDataBean;
import user.MessageDao;
import user.MessageDataBean;

@Controller
public class MypageHandler implements CommandHandler{

	@Resource
	private MessageDao messageDao;
	
	@Resource
	private MemberDao memberDao;
	
	
	@Resource 
	private FrDao frDao;
	
	@RequestMapping("/mypage")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//-------------  회원 - 관리자 나눔
		String id = (String) request.getSession().getAttribute( "memId" );
		memberDao.getMember(id);
		int point = memberDao.getPoint(id);
		request.setAttribute("point", point);
		request.setAttribute("memId", id);
		//--------------------------
		List<String> frid = frDao.getRealFrBtn(id);
		///////////////친구 최근 설문 피드
		Map<String,List<LibDataBean>> frPartBoard = new HashMap<String, List<LibDataBean>>(); 
		for(String el : frid) {
			List<LibDataBean> list = memberDao.getLib(el);  
//			for(LibDataBean l : list) {
//				System.out.println(el +" ; "  + l.getThumb_path());
//			}System.out.println();
			if(list.size() > 6) {
				frPartBoard.put(el, list.subList(0, 6));
			}else {
				frPartBoard.put(el, list);
			}
		}
		///////////////////////////
		request.setAttribute("frLib", frPartBoard);
		if(id.equals("admin")) {
			
		}
		
		return new ModelAndView("user/mypage");
	}
//	
	
	@RequestMapping(value = "sendMail", method = RequestMethod.POST)
	@ResponseBody
	public String sendMailFunc(HttpServletRequest request) throws UnsupportedEncodingException {
		
		
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String myId = (String)session.getAttribute("memId");
		String frId =request.getParameter("frId");
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		int checkId = memberDao.checkId(frId);
//		System.out.println("chechId rs : " + checkId );
		if(checkId != 1) {
			request.setAttribute("checkId", checkId);
			return "-1";
		}
		
//		int sMemNum = messageDao.getMemNum(myId);
//		int rMemNum = messageDao.getMemNum(frId);
		
		int msgNum = 0;
		MessageDataBean messageDto = new MessageDataBean();
//		System.out.println(messageDao.getMsgNum()== null ?"getMsgNum() �� null" : "getMsgNum() �� not null"+ messageDao.getMsgNum());
		if(messageDao.getMsgNum() != null) {
			msgNum = messageDao.getMsgNum();
		}
//		System.out.println("msgNum : " + msgNum);
		messageDto.setM_num(msgNum+1);
		messageDto.setM_title(title);
		messageDto.setM_content(content);
		messageDto.setS_mem_id(myId);
		messageDto.setS_mem_del_st(0);
		messageDto.setR_mem_id(frId);
		messageDto.setR_mem_del_st(0);
		messageDto.setM_date(new Timestamp(System.currentTimeMillis() ));
		
		int insertMsgRs = messageDao.insertMsg(messageDto);
		if(insertMsgRs == 1 ) {
			return "1";
		}else {
			return "0";
		}
	}
}
