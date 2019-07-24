package handler.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminDao;
import handler.CommandHandler;
import user.GoodsStDataBean;

@Controller
public class AdminPayHisHandler implements CommandHandler{
	@Resource
	private AdminDao adminDao;
	
	@RequestMapping("adminPayHistory")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<GoodsStDataBean> his = adminDao.getPayHistory();
		request.setAttribute("his", his);
		
		return new ModelAndView("admin/adminPayHistory");
	}

}
