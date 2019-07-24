package handler.user;

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

import dncommons.SqlMapClient;
import handler.CommandHandler;
import survey.SurveyDao;
import survey.SurveyPartDataBean;
import survey.TwoDataBean;
@Controller
public class SurveyResultViewHandler implements CommandHandler {
	@Resource
	private SurveyDao surveyDao;
	@RequestMapping("/surveyResultView.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//경로 확인 정확히 해라!!
//		"C:\\ExpertJava\\Java2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BoardEx\\save"
		String path = request.getSession().getServletContext().getRealPath("/save"); 
		String s_num = (String) request.getParameter("s_num");
		String id =  (String)request.getSession().getAttribute("memId");
		request.setAttribute("s_num", s_num);
		
		// List for countChoice columns(q_num, cho_num, c_name)
		String q[] = new String[] {"1","2","3","4","5"};
		String cho[] = new String[] {"1","2"};
		//조회수 카운트
		int hits = 0;
		hits = surveyDao.countHits(s_num);
		request.setAttribute("hits", hits);
		//참여수 카운트
		int parts = 0;
		parts = surveyDao.countParts(s_num);
		request.setAttribute("parts", parts);
		//제목 출력
		String subject = "";
		subject = surveyDao.getTitle(s_num);
		request.setAttribute("subject", subject);
		
		TwoDataBean two = SqlMapClient.getSession().selectOne("Survey.getTwo", s_num);
		
		// 질문 
		List<String> qList = new ArrayList<String>();
		qList.add(two.getQ1());
		qList.add(two.getQ2());
		qList.add(two.getQ3());
		qList.add(two.getQ4());
		qList.add(two.getQ5());
		
		int size = 0;
		for(int i = 0; i < 5; i++) {
			if(qList.get(i) != null) {
				size++;
			}
		}
		System.out.println("size : " + size);
		
		//이미지
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
		
		//mybatis 에 넘길 map
		Map<String, Object> map = new HashMap<String, Object>();
		// 질문번호, 선택번호 담긴 map을 저장하는 List
		List<Map<String, Object>> cList = new ArrayList<Map<String, Object>>();

		int cnt = 0;
		for(int i=1; i <=qList.size(); i++) {
			for(int j=1; j<3; j++) {
				// 질문번호, 선택번호를 저장하는 map
				Map<String, Object> chomap = new HashMap<String, Object>();
				chomap.put("q_num", i);
				chomap.put("cho_num", j);
				cList.add(chomap);
				cnt++;
			}
		}
		System.out.println("cList : " + cList);
		map.put("s_num", s_num);
		map.put("cList", cList);
		map.put("id", id);
		map.put("size", size);
		
		List<Integer> countList = new ArrayList<Integer>();
		countList = surveyDao.countList(map);
		
		// 실제 회원이 선택한 보기번호를 가져오는 List
		List<String> selList = new ArrayList<String>();
		selList = surveyDao.selected(map);
		System.out.println("selList : " + selList);
		System.out.println("chomap :" + cList);
		//질문 개수 -> ,, count 만기(ArrayList or List) param=int
		//1. s_num = key value / Map( q_num, cho_num, c_name ) /
		request.setAttribute( "qList", qList );
		request.setAttribute( "iList", iList );
		request.setAttribute( "map1", map);
		request.setAttribute( "countList", countList );
		request.setAttribute("selList", selList);
		request.setAttribute("size", size);
		return new ModelAndView("user/surveyResultView");
	}

}
