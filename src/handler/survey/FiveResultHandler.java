package handler.survey;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import survey.EightDataBean;
import survey.FiveDataBean;
import survey.SurveyDao;
@Controller
public class FiveResultHandler implements CommandHandler {

	@Resource
	SurveyDao surveyDao;
	
	@Resource
	MemberDao memberDao;
	
	@RequestMapping("/fiveResult")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String s_num = (String) request.getParameter("s_num");
		int point = Integer.parseInt((String) request.getParameter("point"));
		Enumeration<String> e = request.getParameterNames();
		String id = null;
		
		if(session.getAttribute("memId") != null) {
			id = (String)session.getAttribute("memId");
		} else {
			id = request.getParameter("name");
		}
		
		List<Integer> choList = new ArrayList<Integer>();
		
		while (e.hasMoreElements()){
		    String name = (String)e.nextElement();
		    if(name.startsWith("q")) { 
			    choList.add(Integer.parseInt(request.getParameter(name)));
		    }
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("s_num", s_num);
		map.put("point", point);
		
		List<Map<String, Object>> choiceList = new ArrayList<Map<String, Object>>();
		
		List<FiveDataBean> fiveList = new ArrayList<FiveDataBean>();
		fiveList = surveyDao.getFives(s_num);
		List<String> resultList = new ArrayList<String>();

		for(int i = 0; i < choList.size(); i++) {
			Map<String, Object> choicemap = new HashMap<String, Object>();
			choicemap.put("q_num", i+1);
			choicemap.put("cho_num", choList.get(i));
			choiceList.add(choicemap);
			
			resultList.add(fiveList.get(i).getQ_content());
			
			switch(choList.get(i)) {
			case 1 : resultList.add(fiveList.get(i).getSel1_content()); break;
			case 2 : resultList.add(fiveList.get(i).getSel2_content()); break;
			case 3 : resultList.add(fiveList.get(i).getSel3_content()); break;
			case 4 : resultList.add(fiveList.get(i).getSel4_content()); break;
			case 5 : resultList.add(fiveList.get(i).getSel5_content()); break;
			}
		}
		
		
		map.put("choiceList", choiceList);
		
		if(session.getAttribute("memId") != null) {
			surveyDao.addPart(s_num);
			
			surveyDao.insertPart(map);
			
			MemberDataBean memberDto = memberDao.getMember(id);
			map.put("member",memberDto);
			surveyDao.insertSel(map);
			
			surveyDao.updatePoint(map);
		} else {	
			surveyDao.insertTemp(map);
		}
		
		request.setAttribute("choiceList", choiceList);
		request.setAttribute("resultList", resultList);
		request.setAttribute("info", map);

		return new ModelAndView("/survey/fiveResult");
	}

}
