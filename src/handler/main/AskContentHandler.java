package handler.main;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.AskReplyDataBean;
import main.BoardAskDao;
import main.BoardAskDataBean;

@Controller
public class AskContentHandler implements CommandHandler{

	@Resource
	private BoardAskDao boardAskDao;
	
	@RequestMapping("askContent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		
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
		
		HttpSession sess = request.getSession();
		String id = (String)sess.getAttribute("memId");
		request.setAttribute("id",id);
		
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
	public AskReplyDataBean reply(HttpServletRequest request) {
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
	
	
	
}
