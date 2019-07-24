package handler.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminDao;
import handler.CommandHandler;
import main.MemberDao;
import user.GoodsStDataBean;

@Controller
public class AdminPoMngHandler implements CommandHandler{
	@Resource
	private AdminDao adminDao;
	@Resource
	private MemberDao memberDao;
	@RequestMapping("adminPoMng")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<GoodsStDataBean> memPoPay = memberDao.getGoodsStAll();
		request.setAttribute("memPoPay", memPoPay);
		return new ModelAndView("admin/adminPoMng");
	}
	
	
	@RequestMapping(value = "adminPay" , method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Integer adminPay(HttpServletRequest request	) {
		System.out.println("adminPay 들어옴");
		int t_num = Integer.parseInt(request.getParameter("t_num"));
		int updateTST = adminDao.updateTST(t_num);
		System.out.println("update tst 결과 : " + updateTST);
		System.out.println(t_num);
		
		
		return t_num;
	}

}
