package handler.survey;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import survey.EightDataBean;
import survey.SurveyDao;

@Controller
public class EightMatchHandler implements CommandHandler {

	@Resource
	private SurveyDao surveyDao;
	
	@RequestMapping("/eightMatch")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String s_num = request.getParameter("s_num");
		String name = request.getParameter("friend");
		String isMem = request.getParameter("isMem");
		
		List<EightDataBean> eightList = new ArrayList<EightDataBean>();
		List<String> selectList = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		eightList = surveyDao.getEights(s_num);
		
		map.put("s_num", s_num);
		map.put("size", eightList.size());
		map.put("id", name);
		if(isMem.equals("1")) {	//회원이 로그인 상태에서 보낸경우
			selectList = surveyDao.selected(map);
		} else { // 비회원이 보낸경우
			selectList = surveyDao.selectedTemp(map);
		}
		
		request.setAttribute("selectList", selectList);
		request.setAttribute("eightList", eightList);
		
		
		return new ModelAndView("/survey/eightMatch");
	}

}
