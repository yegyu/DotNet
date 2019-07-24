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
import main.BoardDao;
import main.MemberDao;
import user.GoodsStDataBean;
import user.PointDataBean;

@Controller
public class RecPoHandler implements CommandHandler{
	
	@Resource
	private MemberDao memberDao;
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/recPo")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		int point = memberDao.getPoint(id);
		
		request.setAttribute("point", point);
		
		List<PointDataBean> getPoList = memberDao.getPoList(id);
		request.setAttribute("getPoList", getPoList);
		
		List<GoodsStDataBean> getStList = memberDao.getGoodsSt(id);
		request.setAttribute("stList", getStList);
		
		
		
		
		return new ModelAndView("user/recPo");
	}
	
}
