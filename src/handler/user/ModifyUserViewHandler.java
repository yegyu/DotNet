package handler.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDataBean;
import main.MemberDao;

@Controller
public class ModifyUserViewHandler implements CommandHandler {

	@Resource
	private MemberDao memberDao;
	
	@RequestMapping( "/modifyUserView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );
		
		int result = memberDao.check( id, passwd );
		
		request.setAttribute( "result", result );
		if( result == 1 ) {
			MemberDataBean memberDto = memberDao.getMember( id );
			request.setAttribute( "memberDto", memberDto );
		}
		
		return new ModelAndView( "user/modifyUserView" );
	}

}







