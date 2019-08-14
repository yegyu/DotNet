package handler.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;

@Controller
public class MypageHandler implements CommandHandler{

	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("/mypage")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDataBean memberDto = new MemberDataBean();
		String id = (String) request.getSession().getAttribute( "memId" );
		memberDao.getMember(id);
		int point = memberDao.getPoint(id);
		request.setAttribute("point", point);
		request.setAttribute("memId", id);
		
		
		return new ModelAndView("user/mypage");
	}
}
