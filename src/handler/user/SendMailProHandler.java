package handler.user;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDBBean;
import main.MemberDao;
import user.MessageDBBean;
import user.MessageDao;
import user.MessageDataBean;

@Controller
public class SendMailProHandler implements CommandHandler{
	@Resource
	private MemberDao memberDao;
	@Resource 
	private MessageDao messageDao;
	
	@RequestMapping("/sendMailPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String myId = (String)session.getAttribute("memId");
		String frId =request.getParameter("frId");
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		MemberDBBean memberDao = new MemberDBBean();
		int checkId = memberDao.checkId(frId);
//		System.out.println("chechId rs : " + checkId );
		if(checkId != 1) {
			request.setAttribute("checkId", checkId);
			return new ModelAndView("user/sendMailPro");
		}
		MessageDBBean messageDao = new MessageDBBean();
		
//		int sMemNum = messageDao.getMemNum(myId);
//		int rMemNum = messageDao.getMemNum(frId);
		
		int msgNum = 0;
		MessageDataBean messageDto = new MessageDataBean();
//		System.out.println(messageDao.getMsgNum()== null ?"getMsgNum() 은 null" : "getMsgNum() 은 not null"+ messageDao.getMsgNum());
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
//		System.out.println("insertMssgResult : " + insertMsgRs);
		request.setAttribute("insertMsgRs", insertMsgRs);
		
		return new ModelAndView("user/sendMailPro");
	}
	

}
