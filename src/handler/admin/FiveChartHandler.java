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
		System.out.println("q_len : " + q_len);
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
		dataForEachQ = adminDao.getFiveDataForEachQ(mapForAll);	// 해당 설문 해당 질문의 참여 정보를 불러온다.
				// index표시		보기1번	보기2번	보기3번	보기4번	보기5번
				// 전체선택수		0		1		2		3		4		
				// 남자선택수		5		6		7		8		9
				// 여자선택수		10		11		12		13		14
				// 10대선택수		15		16		17		18		19
				// 20대선택수  	20		21		22		23		24
				// 30대선택수 		25		26		27		28		29
				// 40대선택수		30		31		32		33		34
				// 50대선택수		35		36		37		38		39
				// 60대선택수  	40		41		42		43		44
				// 70대선택수		45		46		47		48		49
		System.out.println("dataForEachQ" + dataForEachQ);		
		request.setAttribute("dataForEachQ", dataForEachQ);

		return new ModelAndView("admin/fiveChart");
	}

	@RequestMapping(value = "fmw", method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> tp2chart(HttpServletRequest request) throws JSONException {
//		System.out.println("오지 ajax 들어옴");
		Map<String, Object> map = new HashMap<String, Object>();

		List<Integer> getS_numList = adminDao.getS_numList(5);

		int s_num = getS_numList.get(0);

		if (request.getParameter("data") != null) {
			s_num = Integer.parseInt(request.getParameter("data"));
//			System.out.println("in if s_num(ajax) : " + s_num);
		}

		List<DnSSelDB> fsSellist = adminDao.getSSel(s_num);
		int slen = 5;
		int qlen = adminDao.getQlen(s_num);

		int[][][] mwArr = new int[2][qlen][slen];
		// 1. 여자와 남자르 뷴류, 2.q_num 에 따라 1 ,2 카운트

		// 남자 여자
		for (int i = 0; i < 2; i++) {
			// 질문마다
			for (int j = 0; j < qlen; j++) {
				// 선택값
				for (int k = 0; k < slen; k++) {

					for (int idx = 0; idx < fsSellist.size(); idx++) {

						if (fsSellist.get(idx).getGender() == i) {
							// [0][][]
							if (fsSellist.get(idx).getQ_num() == j + 1) {
								// [0][0][]
								if (fsSellist.get(idx).getSel_num() == k + 1) {
									mwArr[i][j][k]++;
								}
							}
						}
					}
				}
			}
		}
		JSONArray jfmwArr = new JSONArray();
		for (int i = 0; i < mwArr.length; i++) {

			for (int j = 0; j < mwArr[0].length; j++) {

//				System.out.print("q" + (j + 1) + " ");
				for (int k = 0; k < mwArr[0][0].length; k++) {
//					System.out.print(mwArr[i][j][k] + " ");

					JSONObject jcm = new JSONObject();
					jcm.put("label", (k + 1) + "번");
					jcm.put("y", mwArr[i][j][k]);
					jfmwArr.put(jcm);

				}
//				System.out.println();
			}
//			System.out.println();
		}
		
		////// age
		///// 나이
		int[][][] ageArr = new int[7][qlen][slen];
		// 1. 10-70 뷴류, 2.q_num 에 따라 1 ,2 카운트

		// 10 , 20 ..., 70
		for (int i = 0; i < 7; i++) {
			// 질문마다
			for (int j = 0; j < qlen; j++) {
				// 선택값
				for (int k = 0; k < slen; k++) {

					for (int idx = 0; idx < fsSellist.size(); idx++) {

						if (fsSellist.get(idx).getAge() / 10 == i + 1) {
							// [0][][]
							if (fsSellist.get(idx).getQ_num() == j + 1) {
								// [0][0][]
								if (fsSellist.get(idx).getSel_num() == k + 1) {
									ageArr[i][j][k]++;
								}
							}
						}
					}
				}
			}
		}
		JSONArray jfageArr = new JSONArray();
		for (int i = 0; i < ageArr.length; i++) {

			for (int j = 0; j < ageArr[0].length; j++) {

//				System.out.print("ageq" + (j + 1) + " ");
				for (int k = 0; k < ageArr[0][0].length; k++) {
//					System.out.print(ageArr[i][j][k] + " ");

					JSONObject jcm = new JSONObject();
					jcm.put("label", "q" + (j + 1) + "_" + (k + 1));
					jcm.put("y", ageArr[i][j][k]);
					jfageArr.put(jcm);

				}
//				System.out.println();
			}
//			System.out.println();
		}

		map.put("jfmwArr", jfmwArr.toString());
		map.put("s_num", s_num);
		map.put("fqlen", qlen);
		map.put("jfageArr",jfageArr.toString());
		return map;
	}
	

}
