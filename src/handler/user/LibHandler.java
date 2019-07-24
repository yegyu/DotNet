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
public class LibHandler  implements CommandHandler{
	
	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("lib")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		List<LibDataBean> lib = memberDao.getLib(id);
		
		request.setAttribute("lib", lib);
		
		
		
		return new ModelAndView("user/lib");
	}

}
