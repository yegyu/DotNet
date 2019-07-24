package handler.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class SurHandler implements CommandHandler {

	@RequestMapping("/sur")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String s_num = request.getParameter("s_num");
		String s_tp_num = request.getParameter("s_tp_num");
		
		request.setAttribute("s_num", s_num);
		request.setAttribute("s_tp_num", s_tp_num);
		
		return new ModelAndView("/survey/sur");
	}

}
