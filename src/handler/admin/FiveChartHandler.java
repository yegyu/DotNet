package handler.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import admin.DnSSelDB;
import handler.CommandHandler;

@Controller
public class FiveChartHandler implements CommandHandler {

	@Resource
	private AdminDao adminDao;

	@RequestMapping("fiveChart")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Integer> getS_numList = adminDao.getS_numList(5);
		int s_num = getS_numList.get(0);
		int q_len = adminDao.getQlen(s_num);
//		System.out.println("q_len : " + q_len);
		int q_num = 1;
		String[] strForData = {"gender=1", "gender=2", 
				"age=10", "age=20", "age=30", "age=40", "age=50", "age=60", "age=70"};
		
		List<Integer> dataForAll = new ArrayList<Integer>();
		Map<String,Object> mapForAll = new HashMap<String, Object>();
		mapForAll.put("s_num", s_num);
		mapForAll.put("q_len", q_len);
		mapForAll.put("q_num", q_num);
		mapForAll.put("strForData", strForData);
		
		dataForAll = adminDao.getDataForAll(mapForAll);		// �빐�떦 �꽕臾몄쓽 �쟾泥� 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎. 
		// [�빐�떦�꽕臾몄갭�뿬 �궓, �뿬, 10 ~ 70��] �닚�쑝濡� List濡� ���옣

		request.setAttribute("q_len", q_len);
		request.setAttribute("getS_numList", getS_numList);
		request.setAttribute("dataForAll", dataForAll);
		
		List<Integer> dataForEachQ = new ArrayList<Integer>();
		dataForEachQ = adminDao.getFiveDataForEachQ(mapForAll);	// �빐�떦 �꽕臾� �빐�떦 吏덈Ц�쓽 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎.
				// index�몴�떆		蹂닿린1踰�	蹂닿린2踰�	蹂닿린3踰�	蹂닿린4踰�	蹂닿린5踰�
				// �쟾泥댁꽑�깮�닔		0		1		2		3		4		
				// �궓�옄�꽑�깮�닔		5		6		7		8		9
				// �뿬�옄�꽑�깮�닔		10		11		12		13		14
				// 10���꽑�깮�닔		15		16		17		18		19
				// 20���꽑�깮�닔 	 	20		21		22		23		24
				// 30���꽑�깮�닔 		25		26		27		28		29
				// 40���꽑�깮�닔		30		31		32		33		34
				// 50���꽑�깮�닔		35		36		37		38		39
				// 60���꽑�깮�닔 	 	40		41		42		43		44
				// 70���꽑�깮�닔		45		46		47		48		49
//		System.out.println("dataForEachQ" + dataForEachQ);		
		request.setAttribute("dataForEachQ", dataForEachQ);

		List<DnSSelDB> allList = adminDao.getFiveSSelAllNotChecked();
		request.setAttribute("getFiveSSelAllNotChecked", allList);
		
		
		return new ModelAndView("admin/fiveChart");
	}

	@RequestMapping(value = "changeDataFive", method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> dataChangeFive(HttpServletRequest request) throws JSONException {
		
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		int q_len = adminDao.getQlen(s_num);
		String[] strForData = {"gender=1", "gender=2", 
				"age=10", "age=20", "age=30", "age=40", "age=50", "age=60", "age=70"};
		
		List<Integer> dataForAll = new ArrayList<Integer>();
		Map<String,Object> mapForAll = new HashMap<String, Object>();
		mapForAll.put("s_num", s_num);
		mapForAll.put("q_len", q_len);
		mapForAll.put("q_num", q_num);
		mapForAll.put("strForData", strForData);
		
		dataForAll = adminDao.getDataForAll(mapForAll);		// �빐�떦 �꽕臾몄쓽 �쟾泥� 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎. 
		// [�빐�떦�꽕臾몄갭�뿬 �궓, �뿬, 10 ~ 70��] �닚�쑝濡� List濡� ���옣
		
		List<Integer> dataForEachQ = new ArrayList<Integer>();
		dataForEachQ = adminDao.getFiveDataForEachQ(mapForAll);	// �빐�떦 �꽕臾� �빐�떦 吏덈Ц�쓽 李몄뿬 �젙蹂대�� 遺덈윭�삩�떎.
				// index�몴�떆		蹂닿린1踰�	蹂닿린2踰�	蹂닿린3踰�	蹂닿린4踰�	蹂닿린5踰�
				// �쟾泥댁꽑�깮�닔		0		1		2		3		4		
				// �궓�옄�꽑�깮�닔		5		6		7		8		9
				// �뿬�옄�꽑�깮�닔		10		11		12		13		14
				// 10���꽑�깮�닔		15		16		17		18		19
				// 20���꽑�깮�닔 	 	20		21		22		23		24
				// 30���꽑�깮�닔 		25		26		27		28		29
				// 40���꽑�깮�닔		30		31		32		33		34
				// 50���꽑�깮�닔		35		36		37		38		39
				// 60���꽑�깮�닔 	 	40		41		42		43		44
				// 70���꽑�깮�닔		45		46		47		48		49
//		System.out.println("dataForEachQ" + dataForEachQ);		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_len", q_len);
		map.put("dataForAll", dataForAll);
		map.put("dataForEachQ", dataForEachQ);

		return map;
	}
	

}
