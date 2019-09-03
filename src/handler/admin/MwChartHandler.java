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
		
		
		request.setAttribute("q_len", q_len);
		request.setAttribute("getS_numList", getS_numList);
		
		List<Integer> dataForEachQ = new ArrayList<Integer>();
		

		dataForAll = adminDao.getDataForAll(mapForAll);		// �빐�떦 �꽕臾몄쓽 �쟾泥� 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎. 
															// [�빐�떦�꽕臾몄갭�뿬 �궓, �뿬, 10 ~ 70��] �닚�쑝濡� List濡� ���옣
		dataForEachQ = adminDao.getTwoDataForEachQ(mapForAll);	// �빐�떦 �꽕臾� �빐�떦 吏덈Ц�쓽 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎.
															//    蹂닿린1踰�        蹂닿린2踰�
															// [ �쟾泥댁꽑�깮�닔, �쟾泥댁꽑�깮�닔
															//   �궓�옄�꽑�깮�닔, �궓�옄�꽑�깮�닔
															//   �뿬�옄�꽑�깮�닔, �뿬�옄�꽑�깮�닔			�쟾泥�,�꽦蹂�,�뿰�졊 �닚. ���닔 index�뒗 蹂닿린1踰�, 吏앹닔 index�뒗 蹂닿린2踰�
															//   10���꽑�깮�닔, 10���꽑�깮�닔
															//   		~
															//   70���꽑�깮�닔, 70���꽑�깮�닔
															
		request.setAttribute("dataForAll", dataForAll);
		request.setAttribute("dataForEachQ", dataForEachQ);

		
		
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
		dataForAll = adminDao.getDataForAll(mapForAll);		// �빐�떦 �꽕臾몄쓽 �쟾泥� 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎. 
															// [�빐�떦�꽕臾몄갭�뿬 �궓, �뿬, 10 ~ 70��] �닚�쑝濡� List濡� ���옣
		dataForEachQ = adminDao.getTwoDataForEachQ(mapForAll);	// �빐�떦 �꽕臾� �빐�떦 吏덈Ц�쓽 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎.
															//    蹂닿린1踰�        蹂닿린2踰�
															// [ �쟾泥댁꽑�깮�닔, �쟾泥댁꽑�깮�닔
															//   �궓�옄�꽑�깮�닔, �궓�옄�꽑�깮�닔
															//   �뿬�옄�꽑�깮�닔, �뿬�옄�꽑�깮�닔			�쟾泥�,�꽦蹂�,�뿰�졊 �닚. ���닔 index�뒗 蹂닿린1踰�, 吏앹닔 index�뒗 蹂닿린2踰�
															//   10���꽑�깮�닔, 10���꽑�깮�닔
															//   		~
															//   70���꽑�깮�닔, 70���꽑�깮�닔
															
		// ajax濡� �꽆寃⑥쨪 �뜲�씠�꽣 map
		map.put("dataForEachQ", dataForEachQ);
		map.put("dataForAll", dataForAll);
		map.put("q_len", q_len);	
		return map;
	}
}
