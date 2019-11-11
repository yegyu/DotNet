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

	@RequestMapping("/myFrSur")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("memId");
		List<String> frid = frDao.getRealFrBtn(id);
		/////////////// ģ�� �ֱ� ���� �ǵ�
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
		
//		for(Map.Entry<String, List<LibDataBean>> el : frPartBoard.entrySet()) {
//			
//			System.out.println(el.getValue().get(0).getThumb_path() + " " + el.getKey());
//		}
		return new ModelAndView("user/myFrSur");
	}

}
