package handler.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.HttpComponentsAsyncClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import handler.CommandHandler;
import main.MemberDBBean;
import main.MemberDao;
import main.MemberDataBean;
import survey.SurveyDataBean;
import user.FrDBBean;
import user.FrDao;

@Controller
public class MyFrHandler implements CommandHandler{

	@Resource
	private MemberDao MemberDao;
	
	@Resource
	private FrDao frDao;
	
	@RequestMapping(value = "/frBtn" ,method = RequestMethod.POST ,produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> frManage(HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		String myId = (String)session.getAttribute("memId");
		int rs = 0;
		int maxFrNum = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
//		String id = null;
		String fr = request.getParameter("fr");
		
		System.out.println("fr : " + fr);
		
		ObjectMapper mapper = new ObjectMapper();
		map = mapper.readValue(fr, new TypeReference<Map<String,Object>>(){});
		map.put("myId", myId);
		
			System.out.println(map);
	
//		id = map.get("id");
//		System.out.println(map.get("btn") == "accBtn" ? "수락 버튼":"차단 버튼");
		if(map.get("btn").equals("accBtn")) {
			map.remove("btn");
			rs = frDao.updateForAccFr(map);
			
		}else if(map.get("btn").equals("rejBtn")){
//			rejBtn
			map.remove("btn");
//			System.out.println("in else map: "+map);
			rs = frDao.updateForRejFr(map);
			
		}else if(map.get("btn").equals("reqBtn")){
			maxFrNum = frDao.getMaxFrNum();
			map.put("num", maxFrNum + 1);
			rs = frDao.insertFr(map);
		}
//		System.out.println(rs == 1? "update 완료":"update 실패");
		
		
		return map;
		
	}
	
	@RequestMapping("/myFr")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FrDBBean frDao = new FrDBBean();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		List<MemberDataBean> getFr = frDao.getFr(id);
		
		List<String> getAccBtnId = frDao.getAccBtnId(id);
		List<String> getWatiBtnId = frDao.getWatiBtnId(id);
		List<String> getRealFrBtn = frDao.getRealFrBtn(id);
		String []emo ={"fr1.gif", "fr2.gif", "fr3.gif"};
		
//		System.out.println("내게 친구 신청한 사람들 아이디");
//		for(String el : getAccBtnId) {
//			System.out.print(el + " ");
//		}System.out.println();
//		System.out.println("내가 친구 신청한 아이디");
//		for(String el : getWatiBtnId) {
//			System.out.println(el + " ");
//		}System.out.println();
//		System.out.println("순수 내 친구들 ");
//		for(String el : getRealFrBtn) {
//			System.out.print(el + " ");
//		}System.out.println();

		
		
		//친구 요청 0 ,친구 됨 1,  <-- 친구 페이지    ,,,,,,             차단 2 <--추천페이지
		MemberDataBean myFrArr[][] = MyFrHandler.frgrid(getFr);
//		for(MemberDataBean el : getMembers) {
//			System.out.print(el.getId() + " ");
//		}
		request.setAttribute("getAccBtnId", getAccBtnId);
		request.setAttribute("getWatiBtnId",getWatiBtnId);
		request.setAttribute("getRealFrBtn",getRealFrBtn);
		request.setAttribute("emo", emo);
		request.setAttribute("myFrArr", myFrArr);
		
		
		return new ModelAndView("user/myFr");
	}
	
	
	
	
	public static MemberDataBean[][] frgrid(List<MemberDataBean> getMembers){
		MemberDataBean arr[][];
		//													한행에 몇개 보일지 
		arr = new MemberDataBean[getMembers.size() / 3 + 1][5];
		int c = 0;
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[0].length; j++) {
				if (c <= getMembers.size() - 1) {
					arr[i][j] = getMembers.get(c);

				} else {
					arr[i][j] = null;
				}
				c++;
			}
		}
		
		return arr;
	}
}
