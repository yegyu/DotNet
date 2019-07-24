package handler.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.BoardDao;
import main.BoardDataBean;
import survey.SurveyDao;
@Controller
public class userRecentSurveyHandler implements CommandHandler {
	@Resource
	private SurveyDao surveyDao;
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/userRecentSurvey")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
//		int pageSize = 5;
//		int pageBlock = 3;
	
		int cnt = 0;				//	글개수
		int start = 0;				//	시작 rownum
		int end = 0;				//	끝 rownum
	
		cnt = surveyDao.getCountAll();
				
		request.setAttribute( "cnt", cnt );
		request.setAttribute( "start", start );
		request.setAttribute( "end", end );
		
		if( cnt != 0 ) {
//			Map<String, Integer> map = new HashMap<String, Integer>();
//			map.put("start", start);
//			map.put("end", end);
			List<BoardDataBean> surveys 
				= boardDao.getSurveys();
			request.setAttribute( "surveys", surveys );
		}
		
		return new ModelAndView("user/userRecentSurvey");
	}

}
