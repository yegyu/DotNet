package handler.user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import user.MessageDao;
import user.MessageDataBean;

@Controller
public class ReceiveMailHandler implements CommandHandler{
	
	private int myReceiveCnt=0;
	
	@RequestMapping("/alarm")
	@ResponseBody
	public int alarm(HttpServletRequest request) {
		int alarm= 0;
//		HttpSession session = request.getSession();
//		
//		String myId = (String) session.getAttribute("memId");
//		int newCnt = messageDao.myReceiveCnt(myId);
//		
//		if(myReceiveCnt < newCnt) {
//			alarm = 	
//			session.setAttribute("alarm", alarm);
//		}
		
		return alarm;
	}
	
	@Resource
	private MessageDao messageDao;
	
	@RequestMapping("/receiveMail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String myId = (String) session.getAttribute("memId");
		myReceiveCnt = messageDao.myReceiveCnt(myId);
//		System.out.println("myReceiveCnt" + myReceiveCnt);
		request.setAttribute("myReceiveCnt", myReceiveCnt);
		
		List<MessageDataBean> recevieMsgs = messageDao.getReceiveMsgs(myId);
		if (recevieMsgs.isEmpty()) {
//			System.out.println("recevieMsgs is  []" );
			
		}else {
//			System.out.println("recevieMsgs : " + recevieMsgs);
			for (MessageDataBean el : recevieMsgs) {
				
//				System.out.print(" " + el.getS_mem_id());
				request.setAttribute("recevieMsgs", recevieMsgs);
			}
		}
		
		
		
	
		return new ModelAndView("user/receiveMail");
	}

}
