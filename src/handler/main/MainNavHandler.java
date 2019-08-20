package handler.main;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import survey.SurveyDao;

@Controller
public class MainNavHandler implements CommandHandler {

	@Resource
	private MemberDao memberDao;

	@Resource
	private SurveyDao surveyDao;

	@RequestMapping("/mainNav")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("memId");
		request.setAttribute("id", id);
//		

		return new ModelAndView("pinned/mainNav");
	}

	
}
