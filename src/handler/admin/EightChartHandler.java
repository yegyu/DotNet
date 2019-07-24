package handler.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminDao;
import admin.DnSSelDB;
import handler.CommandHandler;

@Controller
public class EightChartHandler implements CommandHandler{
	
	@Resource
	private AdminDao adminDao;
	@RequestMapping("eightChart")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Integer> getS_numList = adminDao.getS_numList(8);
		request.setAttribute("getS_numList", getS_numList);
		
		int s_num = getS_numList.get(0);
		request.setAttribute("s_num", s_num);
		
		List<DnSSelDB> esSellist = adminDao.getSSel(s_num);
		
		
		
		
		return new ModelAndView("admin/eightChart");
	}
	
	

}
