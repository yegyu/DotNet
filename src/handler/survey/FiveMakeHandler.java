package handler.survey;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminCategoryBean;
import admin.AdminDao;
import handler.CommandHandler;

@Controller
public class FiveMakeHandler implements CommandHandler {

	@Resource
	AdminDao adminDao;
	
	@RequestMapping("/fiveMake")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<AdminCategoryBean> categorys = adminDao.getCategorys();
		
		request.setAttribute("categorys", categorys);
		
		return new ModelAndView("/survey/fiveMake");
	}

}
