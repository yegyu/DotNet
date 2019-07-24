package handler.main;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;

@Controller
public class SignupProHandler implements CommandHandler{

	
	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("/signupPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		String passwd = request.getParameter("passwd");
		int gender = Integer.parseInt(request.getParameter("gender"));
		int age = Integer.parseInt(request.getParameter("age"));
		String email= request.getParameter("email");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String location = address.split(" ")[0];
		
		int zipcode = Integer.parseInt(request.getParameter("zipcode"));
		
		MemberDataBean memberDto = new MemberDataBean();
		memberDto.setId(id);
		memberDto.setPasswd(passwd);
		memberDto.setGender(gender);
		memberDto.setAge(age);
		memberDto.setEmail(email);
		memberDto.setZipcode(zipcode);
		memberDto.setAddress(address);
		memberDto.setAddressDetail(addressDetail);
		memberDto.setLocation(location);
		memberDto.setPoint(0);
		memberDto.setUser_state(0);
		
		memberDto.setSignup_date(new Timestamp(System.currentTimeMillis()));
		int result = memberDao.insertMember(memberDto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("main/signupPro");
	}
}
