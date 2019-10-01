package handler.user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import user.CompDao;
import user.CompanyDataBean;
import user.MessageDataBean;
@Controller
public class AskCompBoardHandler implements CommandHandler {
	@Resource
	private CompDao compDao;
	@RequestMapping("askCompBoard.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//declarations
		CompanyDataBean companyDto = new CompanyDataBean();
		String a_num = null;
		List<CompanyDataBean> getQuestions = compDao.getQuestions(companyDto);
		
		//Attributes 
		request.setAttribute("getQuestions", getQuestions);
		request.setAttribute("a_num", a_num);
		
		//check
		System.out.println("getQ : " + getQuestions);
		
		return new ModelAndView("company/askCompBoard");
	}

}
