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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.DnSSelDB;
import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;
import survey.SurveyDao;
import survey.TwoDataBean;
@Controller
public class UploadResultHandler implements CommandHandler {

	@Resource
	MemberDao memberDao;
	
	@Resource
	SurveyDao surveyDao;
	
	@RequestMapping("/uploadResult")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String s_num = (String) request.getParameter("s_num");
		int point = Integer.parseInt((String) request.getParameter("point"));
		Enumeration<String> e = request.getParameterNames();
		String id = null;
		Logger logger = LoggerFactory.getLogger("SURVEY_ADD");
		DnSSelDB selDto = new DnSSelDB();
		
		if(session.getAttribute("memId") != null) {
			id = (String)session.getAttribute("memId");
		} else {
			id = request.getParameter("name");
		}

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
		
		List<Integer> choList = new ArrayList<Integer>();
		
		List<String> resultList = new ArrayList<String>();
		
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
		int index = 0;
		for(int i = 0; i < choList.size(); i++) {
			Map<String, Object> choicemap = new HashMap<String, Object>();
			choicemap.put("q_num", i+1);
			choicemap.put("cho_num", choList.get(i));
		
			choiceList.add(choicemap);
			
			resultList.add(qList.get(i));
			switch(choList.get(i)) {
				case 1 : resultList.add(iList.get(index)); break;
				case 2 : resultList.add(iList.get(index+1)); break;
			}
			index += 2;
		}
		
		map.put("choiceList", choiceList);
		
		if(session.getAttribute("memId")!=null) {
			surveyDao.addPart(s_num);
			
			surveyDao.insertPart(map);
			
			MemberDataBean memberDto = memberDao.getMember(id);
			map.put("member",memberDto);
			surveyDao.insertSel(map);
			
			selDto = surveyDao.getLastSel();
			logger.info("gender:" + selDto.getGender() + ",age:" + selDto.getAge() + ",sel_id:" + selDto.getSel_id());
			
			surveyDao.updatePoint(map);
		} else {	
			surveyDao.insertTemp(map);
		}
		
		request.setAttribute("info", map);
		request.setAttribute("choiceList", choiceList);
		request.setAttribute("resultList", resultList);
		
		return new ModelAndView("/survey/uploadResult");
	}

}
