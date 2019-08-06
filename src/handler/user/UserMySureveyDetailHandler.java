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
import main.BoardDao;
import main.BoardDataBean;
import survey.SurveyDao;
import survey.SurveyPartDataBean;
import survey.TwoDataBean;
@Controller
public class UserMySureveyDetailHandler implements CommandHandler {
	@Resource
	private SurveyDao surveyDao;
	@RequestMapping("/userMySurveyDetail.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//경로 확인 정확히 해라!!
//		"C:\\ExpertJava\\Java2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BoardEx\\save"
		String path = request.getSession().getServletContext().getRealPath("/save"); 
		String s_num = (String) request.getParameter("s_num");
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
		
		
//		System.out.println("조회수"+hits);
		TwoDataBean two = SqlMapClient.getSession().selectOne("Survey.getTwo", s_num);
//		System.out.println("s_num : " + s_num);
		// 질문 개수
		List<String> qList = new ArrayList<String>();
		qList.add(two.getQ1());
		qList.add(two.getQ2());
		qList.add(two.getQ3());
		qList.add(two.getQ4());
		qList.add(two.getQ5());
		qList.size();
		
		//이미지 개수(링크 저장 경로)
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
		

		Map<String, Object> map1 = new HashMap<String, Object>();
		List<Map<String, Object>> cList = new ArrayList<Map<String, Object>>();
		int cnt = 0;
		for(int i=1; i <= qList.size(); i++) {
			for(int j=1; j<3; j++) {
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("q_num", i);
				map2.put("cho_num", j);
				cList.add(map2);
				cnt++;
			}
		}
		map1.put("s_num", s_num);
		map1.put("cList", cList);
//		System.out.println("번호 : "+s_num);
		
		List<Integer> test1 = new ArrayList<Integer>();
		test1 = surveyDao.countList(map1);
		
//		System.out.println("cList : " + cList);
//		System.out.println("LIst 결과 : " + test1);

		//질문 개수 -> ,, count 만들기(ArrayList or List) param=int
		//1. s_num = key value / Map( q_num, cho_num, c_name ) /
		request.setAttribute( "qList", qList );
		request.setAttribute( "iList", iList );
		request.setAttribute( "map1", map1 );
		request.setAttribute( "test1", test1 );
		return new ModelAndView("user/userMySurveyDetail");
	}

}
