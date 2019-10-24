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

	@RequestMapping(value = "CheckAdmin" ,produces = "application/json;UTF-8")
	@ResponseBody
	public List<DnSSelDB> checkAdmin(HttpServletRequest request) {
		List<DnSSelDB> uncheckedlist = null;
		int type = Integer.valueOf(request.getParameter("type"));
//		System.out.println("type"  + type);
		int rs = 0;
		if(type == 2) {
//			rs = adminDao.twoCheckAdmin();
			uncheckedlist = adminDao.getTwoSSelAllNotChecked();
		}else {
//			rs = adminDao.fiveCheckAdmin();
			uncheckedlist = adminDao.getFiveSSelAllNotChecked();
		}
		
		return uncheckedlist;
	}
	@RequestMapping(value = "updateCheckAdmin" ,produces = "application/json;UTF-8")
	@ResponseBody
	public void checkAdminUpdate(HttpServletRequest request) {
//		List<DnSSelDB> uncheckedlist = null;
		int type = Integer.valueOf(request.getParameter("type"));
//		System.out.println("type"  + type);
//		int rs = 0;
		if(type == 2) {
			adminDao.twoCheckAdmin();
//			uncheckedlist = adminDao.getTwoSSelAllNotChecked();
		}else {
			adminDao.fiveCheckAdmin();
//			uncheckedlist = adminDao.getFiveSSelAllNotChecked();
		}
		
//		return uncheckedlist;
	}
	
	
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
		
		
		request.setAttribute("q_len", q_len);
		request.setAttribute("getS_numList", getS_numList);
		
		List<Integer> dataForEachQ = new ArrayList<Integer>();
		

		dataForAll = adminDao.getDataForAll(mapForAll);		// 占쎈퉸占쎈뼣 占쎄퐬�눧紐꾩벥 占쎌읈筌ｏ옙 筌〓챷肉� 占쎌젟癰귣�占쏙옙 �겫�뜄�쑎占쎌궔占쎈뼄. 
															// [占쎈퉸占쎈뼣占쎄퐬�눧紐꾧강占쎈연 占쎄텚, 占쎈연, 10 ~ 70占쏙옙] 占쎈떄占쎌몵嚥∽옙 List嚥∽옙 占쏙옙占쎌삢
		dataForEachQ = adminDao.getTwoDataForEachQ(mapForAll);	// 占쎈퉸占쎈뼣 占쎄퐬�눧占� 占쎈퉸占쎈뼣 筌욌뜄揆占쎌벥 筌〓챷肉� 占쎌젟癰귣�占쏙옙 �겫�뜄�쑎占쎌궔占쎈뼄.
															//    癰귣떯由�1甕곤옙        癰귣떯由�2甕곤옙
															// [ 占쎌읈筌ｋ똻苑묕옙源�占쎈땾, 占쎌읈筌ｋ똻苑묕옙源�占쎈땾
															//   占쎄텚占쎌쁽占쎄퐨占쎄문占쎈땾, 占쎄텚占쎌쁽占쎄퐨占쎄문占쎈땾
															//   占쎈연占쎌쁽占쎄퐨占쎄문占쎈땾, 占쎈연占쎌쁽占쎄퐨占쎄문占쎈땾			占쎌읈筌ｏ옙,占쎄쉐癰귨옙,占쎈염占쎌죯 占쎈떄. 占쏙옙占쎈땾 index占쎈뮉 癰귣떯由�1甕곤옙, 筌욎빘�땾 index占쎈뮉 癰귣떯由�2甕곤옙
															//   10占쏙옙占쎄퐨占쎄문占쎈땾, 10占쏙옙占쎄퐨占쎄문占쎈땾
															//   		~
															//   70占쏙옙占쎄퐨占쎄문占쎈땾, 70占쏙옙占쎄퐨占쎄문占쎈땾
															
		request.setAttribute("dataForAll", dataForAll);
		request.setAttribute("dataForEachQ", dataForEachQ);
		
		//1.modal 창에 보내줘야 할 값들을 보낸다.
		//아직 관리자가 확인하지 않은 값들 , checkAdmin == null 인 것 , 
		//만약없으면 alert 로 현재 정보가 최시이라고 알려준다.
		List<DnSSelDB> allList = adminDao.getTwoSSelAllNotChecked();
		request.setAttribute("getTwoSSelAllNotChecked", allList);
		for(DnSSelDB el : allList) {
			System.out.println(el.getCheckAdmin());
		}
		
		//2.최신화 버튼을 누른다. 1에서 전달한 값들을 모달창에 보인다. clear
		
		//3.닫기를 누르면 checkAdmin == 1 로 된다. 그리고 새로고침을 하고 그래프를 최신화 한다. clear
		
		

		
		
		return new ModelAndView("admin/mwChart");
	}

	@RequestMapping(value = "changeDataTwo", method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> dataChangeTwo(HttpServletRequest request) throws JSONException {
		
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		int q_len = adminDao.getQlen(s_num);
		Map<String, Object> map = new HashMap<String, Object>();
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String[] strForData = {"gender=1", "gender=2", 
				"age=10", "age=20", "age=30", "age=40", "age=50", "age=60", "age=70"};

		List<Integer> dataForAll = new ArrayList<Integer>();
		Map<String,Object> mapForAll = new HashMap<String, Object>();
		mapForAll.put("s_num", s_num);
		mapForAll.put("q_len", q_len);
		mapForAll.put("q_num", q_num);
		mapForAll.put("strForData", strForData);
		
		
		List<Integer> dataForEachQ = new ArrayList<Integer>();
		dataForAll = adminDao.getDataForAll(mapForAll);		// 占쎈퉸占쎈뼣 占쎄퐬�눧紐꾩벥 占쎌읈筌ｏ옙 筌〓챷肉� 占쎌젟癰귣�占쏙옙 �겫�뜄�쑎占쎌궔占쎈뼄. 
															// [占쎈퉸占쎈뼣占쎄퐬�눧紐꾧강占쎈연 占쎄텚, 占쎈연, 10 ~ 70占쏙옙] 占쎈떄占쎌몵嚥∽옙 List嚥∽옙 占쏙옙占쎌삢
		dataForEachQ = adminDao.getTwoDataForEachQ(mapForAll);	// 占쎈퉸占쎈뼣 占쎄퐬�눧占� 占쎈퉸占쎈뼣 筌욌뜄揆占쎌벥 筌〓챷肉� 占쎌젟癰귣�占쏙옙 �겫�뜄�쑎占쎌궔占쎈뼄.
															//    癰귣떯由�1甕곤옙        癰귣떯由�2甕곤옙
															// [ 占쎌읈筌ｋ똻苑묕옙源�占쎈땾, 占쎌읈筌ｋ똻苑묕옙源�占쎈땾
															//   占쎄텚占쎌쁽占쎄퐨占쎄문占쎈땾, 占쎄텚占쎌쁽占쎄퐨占쎄문占쎈땾
															//   占쎈연占쎌쁽占쎄퐨占쎄문占쎈땾, 占쎈연占쎌쁽占쎄퐨占쎄문占쎈땾			占쎌읈筌ｏ옙,占쎄쉐癰귨옙,占쎈염占쎌죯 占쎈떄. 占쏙옙占쎈땾 index占쎈뮉 癰귣떯由�1甕곤옙, 筌욎빘�땾 index占쎈뮉 癰귣떯由�2甕곤옙
															//   10占쏙옙占쎄퐨占쎄문占쎈땾, 10占쏙옙占쎄퐨占쎄문占쎈땾
															//   		~
															//   70占쏙옙占쎄퐨占쎄문占쎈땾, 70占쏙옙占쎄퐨占쎄문占쎈땾
															
		// ajax嚥∽옙 占쎄퐜野꺿뫁夷� 占쎈쑓占쎌뵠占쎄숲 map
		map.put("dataForEachQ", dataForEachQ);
		map.put("dataForAll", dataForAll);
		map.put("q_len", q_len);	
		return map;
	}
}
