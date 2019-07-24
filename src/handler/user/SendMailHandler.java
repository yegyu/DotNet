package handler.user;

import java.sql.Date;
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
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDBBean;
import main.MemberDao;
import user.MessageDBBean;
import user.MessageDao;
import user.MessageDataBean;

@Controller
public class SendMailHandler implements CommandHandler {
	@Resource
	private MemberDao memberDao;
	@Resource
	private MessageDao messageDao;

	@RequestMapping("/sendMail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String myId = (String) session.getAttribute("memId");
//		System.out.println("myId : " + myId);
//		
//		
		Integer mySendCnt = messageDao.mySendCnt(myId);
//		System.out.println("mySendCnt : " + mySendCnt);
		request.setAttribute("mySendCnt", mySendCnt);
//		
		List<MessageDataBean> getmsgs = messageDao.getSendMsgs(myId);
//		System.out.println("getSendMsgs.isEmpty() : "+ getmsgs.isEmpty());
		
		if (getmsgs.isEmpty()) {
//			System.out.println("getSendMsg is  []" );
			
		}else {
//			System.out.println("getSendMsgs : " + getmsgs);
			for (MessageDataBean el : getmsgs) {
				
//				System.out.print(" " + el.getR_mem_id());
				request.setAttribute("getSendMsgs", getmsgs);
			}
		}
//		System.out.println(" if 문 아래");

		return new ModelAndView("user/sendMail");
	}

}
