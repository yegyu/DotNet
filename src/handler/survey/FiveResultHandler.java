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
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		
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
		
		// 질문에 대한 답모아놓기
		List<Integer> choList = new ArrayList<Integer>();
		
		while (e.hasMoreElements()){
		    String name = (String)e.nextElement();
		    if(name.startsWith("q")) { // 넘어온 데이터 중 먼저 선택정보만 받음
			    choList.add(Integer.parseInt(request.getParameter(name)));
		    }
		}
		
		// mybatis로 넘기기 위한 map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("s_num", s_num);
		map.put("point", point);
		
		// 질문번호, 그 답을 map으로 저장한 List
		List<Map<String, Object>> choiceList = new ArrayList<Map<String, Object>>();
		
		// 결과페이지를 위한 databean
		List<FiveDataBean> fiveList = new ArrayList<FiveDataBean>();
		fiveList = surveyDao.getFives(s_num);
		// 질문, 선택 content만 모아놓는 리스트
		List<String> resultList = new ArrayList<String>();
				
		for(int i = 0; i < choList.size(); i++) {
			Map<String, Object> choicemap = new HashMap<String, Object>();
			// 질문번호와 그에 대한 답 mapping
			choicemap.put("q_num", i+1);
			choicemap.put("cho_num", choList.get(i));
			choiceList.add(choicemap);
			
			// 결과페이지를 위한 리스트
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
		
		// 로그인 하지 않았을 시에는 아무런 정보를 저장하지 않음
		if(session.getAttribute("memId") != null) {
			// 참여수 증가
			surveyDao.addPart(s_num);
			
			// dn_s_part에 정보저장
			surveyDao.insertPart(map);
			
			// dn_s_sel에 정보저장
			MemberDataBean memberDto = memberDao.getMember(id);
			map.put("member",memberDto);
			surveyDao.insertSel(map);
			
			// 설문 참여 포인트 획득
			surveyDao.updatePoint(map);
		} else {	// 회원이 아닐 경우
			// dn_s_sel_temp에 정보저장
			surveyDao.insertTemp(map);
		}
		
		request.setAttribute("choiceList", choiceList);
		request.setAttribute("resultList", resultList);
		request.setAttribute("info", map);

		return new ModelAndView("/survey/fiveResult");
	}

}
