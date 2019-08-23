package handler.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import user.FrDao;
import user.LibDataBean;

@Controller
public class MyFrSurHandler implements CommandHandler {
	@Resource
	private MemberDao memberDao;

	@Resource
	private FrDao frDao;

	@RequestMapping("myFrSur")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("memId");
		List<String> frid = frDao.getRealFrBtn(id);
		/////////////// 친구 최근 설문 피드
		Map<String, List<LibDataBean>> frPartBoard = new HashMap<String, List<LibDataBean>>();
		for (String el : frid) {
			List<LibDataBean> list = memberDao.getLib(el);
			if (list.size() > 6) {
				frPartBoard.put(el, list.subList(0, 6));
			} else {
				frPartBoard.put(el, list);
			}
		}
		request.setAttribute("frLib", frPartBoard);
		return new ModelAndView("user/myFrSur");
	}

}
