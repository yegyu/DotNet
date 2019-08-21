package handler.survey;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.BoardDataBean;
import survey.EightDataBean;
import survey.SurveyDao;

@Controller
public class EightSurHandler implements CommandHandler{
	@Resource
	SurveyDao surveyDao;
	
	@RequestMapping("/eightSur")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String s_num = request.getParameter("s_num");
		
		EightDataBean eight = new EightDataBean();
		List<EightDataBean> eightList = new ArrayList<EightDataBean>();
		
		surveyDao.addHits(s_num);
		
		eightList = surveyDao.getEights(s_num);
		
		BoardDataBean boardDto = surveyDao.getSurvey(s_num);
		
		
		request.setAttribute("boardDto", boardDto);
		request.setAttribute("s_num", s_num);
		request.setAttribute("eightList", eightList);
		
		return new ModelAndView("/survey/eightSur");
	}
}
