package handler.survey;

import java.util.ArrayList;
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
import survey.SurveyDao;
import survey.TwoDataBean;

@Controller
public class UploadMatchHandler implements CommandHandler {

	@Resource
	SurveyDao surveyDao;
	
	@RequestMapping("/uploadMatch")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String s_num = request.getParameter("s_num");
		String name = request.getParameter("friend");
		String isMem = request.getParameter("isMem");
		String size = request.getParameter("size");
		List<String> selectList = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> resultList = new ArrayList<String>();
		
		TwoDataBean two = surveyDao.getTwo(s_num);
		
		List<String> qList = new ArrayList<String>();
		qList.add(two.getQ1());
		qList.add(two.getQ2());
		qList.add(two.getQ3());
		qList.add(two.getQ4());
		qList.add(two.getQ5());
				
		List<String> iList = new ArrayList<String>();
		iList.add(two.getImgname1());
		iList.add(two.getImgname2());
		iList.add(two.getImgname3());
		iList.add(two.getImgname4());
		iList.add(two.getImgname5());
		iList.add(two.getImgname6());
		iList.add(two.getImgname7());
		iList.add(two.getImgname8());
		iList.add(two.getImgname9());
		iList.add(two.getImgname10());
		
		map.put("s_num", s_num);
		map.put("size", size);
		map.put("id", name);
		if(isMem.equals("1")) {	
			selectList = surveyDao.selected(map);
		} else { 
			selectList = surveyDao.selectedTemp(map);
		}
		
		int index = 0;
		for(int i = 0; i < selectList.size(); i++) {
			Map<String, Object> choicemap = new HashMap<String, Object>();
			resultList.add(qList.get(i));
			switch(selectList.get(i)) {
				case "1" : resultList.add(iList.get(index)); break;
				case "2" : resultList.add(iList.get(index+1)); break;
			}
			index += 2;
		}
		
		request.setAttribute("resultList", resultList);
		request.setAttribute("info", map);
		
		return new ModelAndView("/survey/uploadMatch");
	}

}
