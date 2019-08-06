package handler.main;


import java.util.ArrayList;
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
import main.MemberDBBean;
import main.MemberDao;
import survey.SurveyDao;

@Controller
public class LoginProHandler implements CommandHandler{

	@Resource
	private MemberDao memberDao;
	
	@Resource
	private SurveyDao surveyDao;
	
	@RequestMapping("/loginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		// 아이디, 비밀번호 확인
		int result = memberDao.check(id,passwd);
		
		// 맞으면
		if(result == 1) {
			if(id.equals("admin")) {	// 관리자인지 확인
				session.setAttribute("isAdmin", 1);
			} else {
				session.setAttribute("isAdmin", 2);
			}
			// 세션에 id추가
			session.setAttribute("memId", id );
		}
		
		// 포인트 획득을 위한 변수들
		Map<String, Object> map = new HashMap<String, Object>();	// myBatis에 넘길 map
		List<String> s_numList = new ArrayList<String>();	// 참여한 설문 목록
		
		// 로그인 될 때 포인트 갱신
		// 참여한 설문이 있는지 확인
		int pResult = surveyDao.checkPart(id);
//		System.out.println("참여한 설문여부 : " + pResult);
		if(pResult != 0) {	// 참여한 설문이 있다
			// 참여한 설문의 목록을 받아온다
			s_numList = surveyDao.getPartS_num(id);
			// 필요한 값을 map에 넣고
			map.put("id", id);
			map.put("s_numList", s_numList);
			surveyDao.getPartPoint(map);
//			System.out.println("참여설문 포인트획득여부 : " + surveyDao.getPartPoint(map));
		}
		// 작성한 설문이 있는지 확인
		int wResult = surveyDao.checkWriter(id);			
//		System.out.println("작성한 설문여부 : " + wResult);
		if(wResult != 0) {	// 작성한 설문이 있다
			surveyDao.getMyPoint(id);
//			System.out.println("작성설문 포인트여부 : " + surveyDao.getMyPoint(id));
		}
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		return new ModelAndView("/main/loginPro");
		
	}
}
