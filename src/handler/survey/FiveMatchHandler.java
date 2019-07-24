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
import survey.FiveDataBean;
import survey.SurveyDao;

@Controller
public class FiveMatchHandler implements CommandHandler {

	@Resource
	SurveyDao surveyDao;
	
	@RequestMapping("/fiveMatch")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// parameter 받기
		String s_num = request.getParameter("s_num");
		String name = request.getParameter("friend");
		String isMem = request.getParameter("isMem");
		
		// 변수생성
		List<FiveDataBean> fiveList = new ArrayList<FiveDataBean>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> selectList = new ArrayList<String>();
		List<String> resultList = new ArrayList<String>();
		
		// 설문번호에 해당하는 질문,보기목록 가져오기
		fiveList = surveyDao.getFives(s_num);
		
		// mybatis에 넘길 map
		map.put("s_num", s_num);
		map.put("id", name);
		map.put("size", fiveList.size());
		
		if(isMem.equals("1")) {	//회원이 로그인 상태에서 보낸경우
			selectList = surveyDao.selected(map);
		} else { // 비회원이 보낸경우
			selectList = surveyDao.selectedTemp(map);
		}
		
		// 선택한 보기의 내용을 담는다
		for(int i=0; i < fiveList.size(); i++) {
			switch(selectList.get(i)) {
			case "1" : resultList.add(fiveList.get(i).getSel1_content()); break;
			case "2" : resultList.add(fiveList.get(i).getSel2_content()); break;
			case "3" : resultList.add(fiveList.get(i).getSel3_content()); break;
			case "4" : resultList.add(fiveList.get(i).getSel4_content()); break;
			case "5" : resultList.add(fiveList.get(i).getSel5_content()); break;
			}
		}
		
		request.setAttribute("fiveList", fiveList);
		request.setAttribute("resultList", resultList);
		
		return new ModelAndView("/survey/fiveMatch");
	}

}
