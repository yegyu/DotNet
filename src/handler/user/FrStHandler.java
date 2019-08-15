package handler.user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import user.FrDao;

@Controller
public class FrStHandler implements CommandHandler{
	@Resource
	private FrDao frDao;
	
	
	@RequestMapping("frSt")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		//<!-- 		//친구 응답할  사람의 친구창에 상대방 사진에 수락, 및 차단 버튼 2개 넣기 -->
		List<String> getAccBtnId = frDao.getAccBtnId(id);
		
		List<String> getWatiBtnId = frDao.getWatiBtnId(id);
		
		
		request.setAttribute("waitId", getWatiBtnId);
		request.setAttribute("accId", getAccBtnId);
		return new ModelAndView("user/frSt");
	}

}
