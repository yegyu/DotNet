package handler.user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import handler.CommandHandler;
import main.AskReplyDataBean;
import user.FrDao;

@Controller
public class FrWrFeedHandler implements CommandHandler{
	
	@Resource
	private FrDao frDao;
	
	@RequestMapping("frWrFeed")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		List<AskReplyDataBean> get = frDao.getFrWrFeed(id);
		request.setAttribute("getReply", get);
		
		return new ModelAndView("user/frWrFeed");
	}

}
