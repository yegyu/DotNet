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
public class MainNavHandler implements CommandHandler {

	@Resource
	private MemberDao memberDao;

	@Resource
	private SurveyDao surveyDao;

	@RequestMapping("/mainNav")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("memId");
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

	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		int result = memberDao.check(id, passwd);
		int userSt = memberDao.checkSt(id);
		if(userSt == 1) {
			return "block";
		}
		if (result == 1) {
			if (id.equals("admin")) { // 愿�由ъ옄�씤吏� �솗�씤
				session.setAttribute("isAdmin", 1);
			} else {
				session.setAttribute("isAdmin", 2);
			}
			session.setAttribute("memId", id);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> s_numList = new ArrayList<String>(); 
		int pResult = surveyDao.checkPart(id);
		if (pResult != 0) { 
			s_numList = surveyDao.getPartS_num(id);
			map.put("id", id);
			map.put("s_numList", s_numList);
			surveyDao.getPartPoint(map);
		}
		int wResult = surveyDao.checkWriter(id);
		if (wResult != 0) { 
			surveyDao.getMyPoint(id);
		}

		return String.valueOf(result);

	}
}
