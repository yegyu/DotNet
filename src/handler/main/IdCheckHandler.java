package handler.main;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;


@Controller
public class IdCheckHandler implements CommandHandler{

	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("/idCheck")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");

		int result = memberDao.checkId(id);
		
		request.setAttribute("id", id);
		request.setAttribute("result", result);
		return new ModelAndView("/main/idCheck");
	}
	
}
