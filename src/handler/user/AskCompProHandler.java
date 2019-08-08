package handler.user;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import user.CompanyDataBean;

@Controller
public class AskCompProHandler implements CommandHandler {

	@RequestMapping("/askCompPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	int a_num = Integer.parseInt(request.getParameter("a_num"));
	int result = 0;
	String co_email = request.getParameter("co_email");
	String a_name = request.getParameter("a_name");
	String co_content = request.getParameter("co_content");
	String co_type = request.getParameter("co_type");
	String co_code = request.getParameter("co_code");
	String w_date =request.getParameter("w_date");
	String email1 = co_email.split("")[0];
	String email2 = co_email.split("")[1];
	
	CompanyDataBean coDto = new CompanyDataBean();
	coDto.setA_num(1);
	coDto.setCo_email(co_email);
	coDto.setA_name(a_name);
	coDto.setCo_content(co_content);
	coDto.setCo_type(co_type);
	coDto.setCo_code(co_code);
	coDto.setW_date(new Timestamp(System.currentTimeMillis()));
	
	request.setAttribute("a_num", a_num);
	request.setAttribute("co_email", email1);
	request.setAttribute("co_email", email2);
	request.setAttribute("a_name", a_name);
	request.setAttribute("co_content", co_content);
	request.setAttribute("co_type", co_type);
	request.setAttribute("co_code", co_code);
	request.setAttribute("w_date", w_date);
	request.setAttribute("result", result);
	
		return new ModelAndView("company/askCompPro");
	}
}
