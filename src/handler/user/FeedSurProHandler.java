package handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import survey.SurveyDao;

@Controller
public class FeedSurProHandler implements CommandHandler {

	@Resource
	SurveyDao surveyDao;
	
	@RequestMapping("/feedSurPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memId");
		int feed_type = Integer.parseInt(request.getParameter("feed_type"));
		int cho_num = Integer.parseInt(request.getParameter("card"));
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id",id);
		map.put("feed_type", feed_type);
		map.put("cho_num", cho_num);
		
		int result = surveyDao.insertFeed(map);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("/user/feedSurPro");
	}

}
