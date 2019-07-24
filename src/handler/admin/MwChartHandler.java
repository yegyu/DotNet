package handler.admin;

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

		// 2 5 8
		List<Integer> getS_numList = adminDao.getS_numList(2);
		int s_num = getS_numList.get(0);
//				System.out.println(s_num + "<-- snum");
		request.setAttribute("getS_numList", getS_numList);

		request.setAttribute("s_num", s_num);
		List<DnSSelDB> sSellist = adminDao.getSSel(s_num);
		int qlen = adminDao.getQlen(s_num);
		request.setAttribute("qlen", qlen);
		int slen = 2; // 야자택일 2 오지선다 5 팔문팔답 4
		request.setAttribute("slen", slen);
//		System.out.println("qlen : " + qlen);
//				System.out.println(sSellist.size() + "<- sSellist ," + sSellist.size() / qlen + "<- sSellit / qlen");

		// q_num x sel_num
		int[][][] mwArr = new int[2][qlen][slen];
		// 1. 여자와 남자르 뷴류, 2.q_num 에 따라 1 ,2 카운트

		// 남자 여자
		for (int i = 0; i < 2; i++) {
			// 질문마다
			for (int j = 0; j < qlen; j++) {
				// 선택값
				for (int k = 0; k < slen; k++) {

					for (int idx = 0; idx < sSellist.size(); idx++) {

						if (sSellist.get(idx).getGender() == i) {
							// [0][][]
							if (sSellist.get(idx).getQ_num() == j + 1) {
								// [0][0][]
								if (sSellist.get(idx).getSel_num() == k + 1) {
									mwArr[i][j][k]++;
								}
							}
						}
					}
				}
			}
		}

		JSONArray jmwArr = new JSONArray();
		for (int i = 0; i < mwArr.length; i++) {

			for (int j = 0; j < mwArr[0].length; j++) {

//				System.out.print("q" + (j + 1) + " ");
				for (int k = 0; k < mwArr[0][0].length; k++) {
//					System.out.print(mwArr[i][j][k] + " ");

					JSONObject jcm = new JSONObject();
					jcm.put("label", "q" + (j + 1));
					jcm.put("y", mwArr[i][j][k]);
					jmwArr.put(jcm);

				}
//				System.out.println();
			}
//			System.out.println();
		}
//		System.out.println("그냥 jmwArr : " + jmwArr);

		request.setAttribute("jmwArr", jmwArr);

		// 시간 나면 함수로 더티 더티
		// 나이대
		int[][][] ageArr = new int[7][qlen][slen];
		// 1. 10-70 뷴류, 2.q_num 에 따라 1 ,2 카운트

		// 10 , 20 ..., 70
		for (int i = 0; i < 7; i++) {
			// 질문마다
			for (int j = 0; j < qlen; j++) {
				// 선택값
				for (int k = 0; k < slen; k++) {

					for (int idx = 0; idx < sSellist.size(); idx++) {

						if (sSellist.get(idx).getAge()/10== i+1) {
							// [0][][]
							if (sSellist.get(idx).getQ_num() == j + 1) {
								// [0][0][]
								if (sSellist.get(idx).getSel_num() == k + 1) {
									ageArr[i][j][k]++;
								}
							}
						}
					}
				}
			}
		}
		// 더티 더티
		JSONArray jageArr = new JSONArray();
		for (int i = 0; i < ageArr.length; i++) {

			for (int j = 0; j < ageArr[0].length; j++) {

//				System.out.print("ageq" + (j + 1) + " ");
				for (int k = 0; k < ageArr[0][0].length; k++) {
//					System.out.print(ageArr[i][j][k] + " ");

					JSONObject jcm = new JSONObject();
					jcm.put("label", "q" + (j + 1));
					jcm.put("y", ageArr[i][j][k]);
					jageArr.put(jcm);

				}
//				System.out.println();
			}
//			System.out.println();
		}
//		System.out.println("그냥 jageArr : " + jageArr);

		request.setAttribute("jageArr", jageArr);

		return new ModelAndView("admin/mwChart");
	}

	@RequestMapping(value = "mw", method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> tp2chart(HttpServletRequest request) throws JSONException {

		System.out.println("양자택일 ajax 들어옴");
		List<Integer> getS_numList = adminDao.getS_numList(2);
		int s_num = getS_numList.get(0);

		if (request.getParameter("data") != null) {
			s_num = Integer.parseInt(request.getParameter("data"));
			System.out.println("in if s_num(ajax) : " + s_num);
		}

		List<CntMemDB> cm = adminDao.getCntMemByDate();

		JSONArray jcmArr = new JSONArray();
		for (int i = 0; i < cm.size(); i++) {
			JSONObject jcm = new JSONObject();
			jcm.put("x", cm.get(i).getD());
			jcm.put("y", cm.get(i).getCnt());
			jcmArr.put(jcm);
		}

		List<DnSSelDB> sSellist = adminDao.getSSel(s_num);
		int qlen = adminDao.getQlen(s_num);
		int slen = 2; // 야자택일 2 오지선다 5 팔문팔답 4
//		System.out.println("qlen : " + qlen);
//		if (qlen != 0)
//			System.out.println(sSellist.size() + "<- sSellist ," + sSellist.size() / qlen + "<- sSellit / qlen");

		// q_num x sel_num
		int[][][] mwArr = new int[2][qlen][slen];
		// 1. 여자와 남자르 뷴류, 2.q_num 에 따라 1 ,2 카운트

		// 남자 여자

		for (int i = 0; i < 2; i++) {
			// 질문마다
			for (int j = 0; j < qlen; j++) {
				// 선택값
				for (int k = 0; k < slen; k++) {

					for (int idx = 0; idx < sSellist.size(); idx++) {

						if (sSellist.get(idx).getGender() == i) {
							// [0][][]
							if (sSellist.get(idx).getQ_num() == j + 1) {
								// [0][0][]
								if (sSellist.get(idx).getSel_num() == k + 1) {
									mwArr[i][j][k]++;
								}
							}
						}
					}
				}
			}
		}

		JSONArray jmwArr = new JSONArray();
		for (int i = 0; i < mwArr.length; i++) {

			for (int j = 0; j < mwArr[0].length; j++) {

//				System.out.print("q" + (j + 1) + " ");
				for (int k = 0; k < mwArr[0][0].length; k++) {
//					System.out.print(mwArr[i][j][k] + " ");

					JSONObject jcm = new JSONObject();
					jcm.put("label", "q" + (j + 1));
					jcm.put("y", mwArr[i][j][k]);
					jmwArr.put(jcm);

				}
//				System.out.println();
			}
//			System.out.println();
		}

		// 나이대
		int[][][] ageArr = new int[7][qlen][slen];
		// 1. 10-70 뷴류, 2.q_num 에 따라 1 ,2 카운트

		// 남자 여자
		for (int i = 0; i < 7; i++) {
			// 질문마다
			for (int j = 0; j < qlen; j++) {
				// 선택값
				for (int k = 0; k < slen; k++) {

					for (int idx = 0; idx < sSellist.size(); idx++) {

						if (sSellist.get(idx).getAge()/10== i+1) {
							// [0][][]
							if (sSellist.get(idx).getQ_num() == j + 1) {
								// [0][0][]
								if (sSellist.get(idx).getSel_num() == k + 1) {
									ageArr[i][j][k]++;
								}
							}
						}
					}
				}
			}
		}
		// 더티 더티
		JSONArray jageArr = new JSONArray();
		for (int i = 0; i < ageArr.length; i++) {

			for (int j = 0; j < ageArr[0].length; j++) {

//				System.out.print("ageq" + (j + 1) + " ");
				for (int k = 0; k < ageArr[0][0].length; k++) {
//					System.out.print(ageArr[i][j][k] + " ");

					JSONObject jcm = new JSONObject();
					jcm.put("label", "q" + (j + 1));
					jcm.put("y", ageArr[i][j][k]);
					jageArr.put(jcm);

				}
//				System.out.println();
			}
//			System.out.println();
		}


		Map<String, Object> map = new HashMap<String, Object>();

		map.put("jmwArr", jmwArr.toString());
		map.put("getS_numList", getS_numList);
		map.put("s_num", s_num);
		map.put("qlen in ajax", qlen);
		map.put("slen", slen);
		map.put("jageArr",jageArr.toString());

		return map;
	}
}
