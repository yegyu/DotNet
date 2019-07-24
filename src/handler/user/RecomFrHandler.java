package handler.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDBBean;
import main.MemberDao;
import main.MemberDataBean;
import user.FrDao;

@Controller
public class RecomFrHandler implements CommandHandler {

//	@Resource
//	private MemberDao memberDao;
	
	@Resource
	private FrDao frDao;
	
	
	@RequestMapping("recomFr")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		map.put("age", 10);
		map.put("id",id);
		
		
		//우선 같은 나이대로 추천한다고 침 Map 에 넣어라 나이를 임의로
		List<MemberDataBean> getMembers = frDao.getRecomFr(map);
//		for(MemberDataBean el : getMembers) {
//			System.out.print(" 추천 친구 id : " + el.getId());
//		}System.out.println();
		String []emo ={"fr1.gif", "fr2.gif", "fr3.gif"};
		request.setAttribute("emo", emo);
		
		
		
		MemberDataBean twoDArr[][] = MyFrHandler.frgrid(getMembers);
//		for(MemberDataBean el : getMembers) {
//			System.out.print(el.getId() + " ");
//		}
		request.setAttribute("twoDArr", twoDArr);
		return new ModelAndView("user/recomFr");
	}

}
