package handler.main;

import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import survey.SurveyDao;

@Controller
public class MainNavHandler implements CommandHandler{

	@Resource
	private MemberDao memberDao;
	
	@Resource
	private SurveyDao surveyDao;
	@RequestMapping("/mainNav")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("memId");
		request.setAttribute("id", id);
//		
		
		return new ModelAndView("pinned/mainNav");
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.POST)
	@ResponseBody
	public void logoutFunc(HttpServletRequest re) {
		HttpSession session = re.getSession();
		session.removeAttribute("memId");
		session.removeAttribute("isAdmin");
	}
	
	
	@RequestMapping(value = "login",method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		// �븘�씠�뵒, 鍮꾨�踰덊샇 �솗�씤
			int result = memberDao.check(id,passwd);
			if(result == 1) {
				if(id.equals("admin")) {	// 愿�由ъ옄�씤吏� �솗�씤
					session.setAttribute("isAdmin", 1);
				} else {
					session.setAttribute("isAdmin", 2);
				}
				// �꽭�뀡�뿉 id異붽�
				session.setAttribute("memId", id );
			}
			// �룷�씤�듃 �쉷�뱷�쓣 �쐞�븳 蹂��닔�뱾
			Map<String, Object> map = new HashMap<String, Object>();	// myBatis�뿉 �꽆湲� map
			List<String> s_numList = new ArrayList<String>();	// 李몄뿬�븳 �꽕臾� 紐⑸줉
			
			// 濡쒓렇�씤 �맆 �븣 �룷�씤�듃 媛깆떊
			// 李몄뿬�븳 �꽕臾몄씠 �엳�뒗吏� �솗�씤
			int pResult = surveyDao.checkPart(id);
//				System.out.println("李몄뿬�븳 �꽕臾몄뿬遺� : " + pResult);
			if(pResult != 0) {	// 李몄뿬�븳 �꽕臾몄씠 �엳�떎
				// 李몄뿬�븳 �꽕臾몄쓽 紐⑸줉�쓣 諛쏆븘�삩�떎
				s_numList = surveyDao.getPartS_num(id);
				// �븘�슂�븳 媛믪쓣 map�뿉 �꽔怨�
				map.put("id", id);
				map.put("s_numList", s_numList);
				surveyDao.getPartPoint(map);
			}
				// �옉�꽦�븳 �꽕臾몄씠 �엳�뒗吏� �솗�씤
			int wResult = surveyDao.checkWriter(id);			
//				System.out.println("�옉�꽦�븳 �꽕臾몄뿬遺� : " + wResult);
			if(wResult != 0) {	// �옉�꽦�븳 �꽕臾몄씠 �엳�떎
				surveyDao.getMyPoint(id);
			}
			
			return String.valueOf(result);
				
				
				
	}
}
