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
		// 파라미터 가져오기
		HttpSession session = request.getSession();
		String s_num = (String) request.getParameter("s_num");
		int point = Integer.parseInt((String) request.getParameter("point"));
		Enumeration<String> e = request.getParameterNames();
		String id = null;
		
		// 회원인지 아닌지
		if(session.getAttribute("memId") != null) {
			id = (String)session.getAttribute("memId");
		} else {
			id = request.getParameter("name");
		}
		
		// 설문 정보 넘기기
		TwoDataBean two = surveyDao.getTwo(s_num);
		
		// 설문 질문 넘기기
		List<String> qList = new ArrayList<String>();
		qList.add(two.getQ1());
		qList.add(two.getQ2());
		qList.add(two.getQ3());
		qList.add(two.getQ4());
		qList.add(two.getQ5());
				
		// 설문 이미지 경로 넘기기
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
		
		// 질문에 대한 답모아놓기
		List<Integer> choList = new ArrayList<Integer>();
		
		// 결과 페이지를 위한 List
		List<String> resultList = new ArrayList<String>();
		
		while (e.hasMoreElements()){
		    String name = (String)e.nextElement();
		    if(!name.equals("s_num")&&!name.equals("point")) { // 넘어온 데이터 중 s_num, point는 위에서 받으므로 제외
			    choList.add(Integer.parseInt(request.getParameter(name)));
		    }
		}
		
		// mybatis로 넘기기 위한 map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("s_num", s_num);
		map.put("point", point);
		
		List<Map<String, Object>> choiceList = new ArrayList<Map<String, Object>>();
		int index = 0;
		for(int i = 0; i < choList.size(); i++) {
			Map<String, Object> choicemap = new HashMap<String, Object>();
			// 질문번호와 그에 대한 답 mapping
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
		
		// 로그인 하지 않았을 시에는 아무런 정보를 저장하지 않음
		if(id != null) {
			// 참여수 증가
			surveyDao.addPart(s_num);
			
			// dn_s_part에 정보 저장
			surveyDao.insertPart(map);
			
			// dn_s_sel에 정보 저장
			MemberDataBean memberDto = memberDao.getMember(id);
			map.put("member",memberDto);
			surveyDao.insertSel(map);
			
			// 설문 참여 포인트 획득
			surveyDao.updatePoint(map);
		} else {	// 회원이 아닐 경우
			// dn_s_sel_temp에 정보저장
			surveyDao.insertTemp(map);
		}
		
		request.setAttribute("info", map);
		request.setAttribute("choiceList", choiceList);
		request.setAttribute("resultList", resultList);
		
		return new ModelAndView("/survey/uploadResult");
	}

}
