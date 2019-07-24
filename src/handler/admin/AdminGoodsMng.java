package handler.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import user.GoodsDataBean;

@Controller
public class AdminGoodsMng implements CommandHandler{
	
	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("adminGoodsMng")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<GoodsDataBean> GoodsList = memberDao.getGoods();
		request.setAttribute("GoodsList", GoodsList);
		
		return new ModelAndView("admin/adminGoodsMng");
	}
	
	@RequestMapping(value = "addGood", method = RequestMethod.POST)
	@ResponseBody
	public String addGood(HttpServletRequest request) {
		String g_name = request.getParameter("g_name");
		int g_point =Integer.parseInt( request.getParameter("g_point"));
		int maxG_num  = 0;
		if(memberDao.getMaxG_num() != null)
			 maxG_num  = memberDao.getMaxG_num();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("g_num", maxG_num+1);
		map.put("g_name", g_name);
		map.put("g_point", g_point);
		int addrs = memberDao.insertGood(map);
		
		return String.valueOf(addrs);
	}
	@RequestMapping(value = "delGood", method = RequestMethod.POST)
	@ResponseBody
	public String delGood(HttpServletRequest request) {
		String g_name = request.getParameter("g_name");
		
		int addrs = memberDao.delGood(g_name);
		
		return g_name;
	}

}
