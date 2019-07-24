package handler.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class SurveyMakeSelectHandler implements CommandHandler {

	@RequestMapping("/surveyMakeSelect")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String isAdmin = request.getParameter("isAdmin");
		
		request.setAttribute("isAdmin", isAdmin);
		return new ModelAndView("/survey/surveyMakeSelect");
	}

}
