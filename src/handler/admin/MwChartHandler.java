package handler.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminDao;
import admin.CntMemDB;
import admin.DnSSelDB;
import handler.CommandHandler;

@Controller
public class MwChartHandler implements CommandHandler {

	@Resource
	private AdminDao adminDao;

	@RequestMapping(value = "mwChart")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Integer> getS_numList = adminDao.getS_numList(2);
		int s_num = getS_numList.get(0);
		int q_len = adminDao.getQlen(s_num);
		int q_num = 1;
		String[] strForData = {"gender=1", "gender=2", 
				"age=10", "age=20", "age=30", "age=40", "age=50", "age=60", "age=70"};
		
		List<Integer> dataForAll = new ArrayList<Integer>();
		Map<String,Object> mapForAll = new HashMap<String, Object>();
		mapForAll.put("s_num", s_num);
		mapForAll.put("q_len", q_len);
		mapForAll.put("q_num", q_num);
		mapForAll.put("strForData", strForData);
		
		dataForAll = adminDao.getDataForAll(mapForAll);		// 해당 설문의 전체 참여 정보를 불러온다. 
															// [해당설문참여 남, 여, 10 ~ 70대] 순으로 List로 저장
		
		request.setAttribute("q_len", q_len);
		request.setAttribute("getS_numList", getS_numList);
		request.setAttribute("dataForAll", dataForAll);
		
		List<Integer> dataForEachQ = new ArrayList<Integer>();
		dataForEachQ = adminDao.getDataForEachQ(mapForAll);	// 해당 설문 해당 질문의 참여 정보를 불러온다.
															//    보기1번        보기2번
															// [ 전체선택수, 전체선택수
															//   남자선택수, 남자선택수
															//   여자선택수, 여자선택수			전체,성별,연령 순. 홀수 index는 보기1번, 짝수 index는 보기2번
															//   10대선택수, 10대선택수
															//   		~
															//   70대선택수, 70대선택수
															
		request.setAttribute("dataForEachQ", dataForEachQ);

		return new ModelAndView("admin/mwChart");
	}

	@RequestMapping(value = "changeData", method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> dataChange(HttpServletRequest request) throws JSONException {
		
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		int q_len = adminDao.getQlen(s_num);
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String[] strForData = {"gender=1", "gender=2", 
				"age=10", "age=20", "age=30", "age=40", "age=50", "age=60", "age=70"};
		System.out.println("들어왔다. q_num : " + q_num + " s_num : " + s_num);
		List<Integer> dataForAll = new ArrayList<Integer>();
		Map<String,Object> mapForAll = new HashMap<String, Object>();
		mapForAll.put("s_num", s_num);
		mapForAll.put("q_len", q_len);
		mapForAll.put("q_num", q_num);
		mapForAll.put("strForData", strForData);
		
		dataForAll = adminDao.getDataForAll(mapForAll);		// 해당 설문의 전체 참여 정보를 불러온다. 
															// [해당설문참여 남, 여, 10 ~ 70대] 순으로 List로 저장
		
		List<Integer> dataForEachQ = new ArrayList<Integer>();
		dataForEachQ = adminDao.getDataForEachQ(mapForAll);	// 해당 설문 해당 질문의 참여 정보를 불러온다.
															//    보기1번        보기2번
															// [ 전체선택수, 전체선택수
															//   남자선택수, 남자선택수
															//   여자선택수, 여자선택수			전체,성별,연령 순. 홀수 index는 보기1번, 짝수 index는 보기2번
															//   10대선택수, 10대선택수
															//   		~
															//   70대선택수, 70대선택수
															
		// ajax로 넘겨줄 데이터 map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dataForEachQ", dataForEachQ);
		map.put("dataForAll", dataForAll);
		return map;
	}
}
