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
		
		
		//�슦�꽑 媛숈� �굹�씠��濡� 異붿쿇�븳�떎怨� 移� Map �뿉 �꽔�뼱�씪 �굹�씠瑜� �엫�쓽濡�
		List<MemberDataBean> recomFr = frDao.getRecomFr(map);
		request.setAttribute("recomFr", recomFr);
//		for(MemberDataBean el : getMembers) {
//			System.out.print(" 추천친구 id : " + el.getId());
//		}System.out.println();
//		String []emo ={"fr1.gif", "fr2.gif", "fr3.gif"};
//		request.setAttribute("emo", emo);
//		
//		
//		MemberDataBean twoDArr[][] = MyFrHandler.frgrid(recomFr);
//		for(MemberDataBean el : getMembers) {
//			System.out.print(el.getId() + " ");
//		}
//		request.setAttribute("twoDArr", twoDArr);
		
		
		
		
		
		return new ModelAndView("user/recomFr");
	}

}
