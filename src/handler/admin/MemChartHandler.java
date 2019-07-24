package handler.admin;

import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminDao;
import admin.CntMemDB;
import admin.DnSSelDB;
import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;

@RestController
public class MemChartHandler implements CommandHandler {

//	@Resource
//	private MemberDao memberDao;
	@Resource
	private AdminDao adminDao;

	@RequestMapping(value = { "/memChart" }, produces = "application/json;UTF-8")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//전체 회원수 관련
		List<CntMemDB> cm = adminDao.getCntMemByDate();

		JSONArray jcmArr = new JSONArray();
		for (int i = 0; i < cm.size(); i++) {
			JSONObject jcm = new JSONObject();
			jcm.put("x", cm.get(i).getD());
			jcm.put("y", cm.get(i).getCnt());
			jcmArr.put(jcm);
		}
		request.setAttribute("memInfo", jcmArr);
		
//		cm=null;
		
		//전체 회원 수에서 남,여 구분만
		// 0 : 여자 , 1: 남자
		List<CntMemDB> wL = adminDao.getCntMWByDate(0); 
		List<CntMemDB> mL = adminDao.getCntMWByDate(1); 
		
		JSONArray jmArr = new JSONArray();
		JSONArray jwArr = new JSONArray();

		for(int i = 0 ; i < mL.size(); i++) {
			JSONObject jm = new JSONObject();
			jm.put("x", mL.get(i).getD());
			jm.put("y", mL.get(i).getCnt());
			jmArr.put(jm);
		
		}
		for(int i = 0 ; i < wL.size(); i++) {
			JSONObject jw = new JSONObject();
			jw.put("x", wL.get(i).getD());
			jw.put("y", wL.get(i).getCnt());
			jwArr.put(jw);
		}
		request.setAttribute("mInfo", jmArr);
		request.setAttribute("wInfo", jwArr);
		
		List<CntMemDB> ll = adminDao.getCntLoc();
		JSONArray jlArr = new JSONArray();
		for(int i = 0 ; i < ll.size(); i++) {
			JSONObject jm = new JSONObject();
			jm.put("label", ll.get(i).getLocation());
			jm.put("y", ll.get(i).getCnt());
			jlArr.put(jm);
		}
		request.setAttribute("jlArr", jlArr);
		
		
		
		
//		System.out.println("jcmArr for loop start!!");
//		for(int i = 0 ; i < jcmArr.length() ; i++) {
//			System.out.print(jcmArr.get(i));
//		}
		

		return new ModelAndView("admin/memChart");
	}

	
}
