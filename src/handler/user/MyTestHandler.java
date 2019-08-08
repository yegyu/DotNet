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
import main.MemberDao;
import user.LibDataBean;

@Controller
public class MyTestHandler implements CommandHandler{

	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("mytest")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		List<LibDataBean> lib = memberDao.getMyTest(id);
		request.setAttribute("mytest", lib);
		
		return new ModelAndView("user/mytest");
	}
}
