package handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import user.CompDao;
import user.CompanyDataBean;
@Controller
public class AskCompHandler implements CommandHandler {

	@Resource
	private CompDao compDao;
	@RequestMapping("/askComp.do")
	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		return new ModelAndView("company/askComp");
	}
	
	@RequestMapping(value = "/user/checkCo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> coCheck(@RequestParam("co_name") String co_name) {
		CompanyDataBean compDto = compDao.checkCo(co_name);
		Map<String, Object> map = new HashMap<String, Object>();
		if(  compDto != null ) {
			map.put("dto", compDto);
			return map;
		}else {
			map.put("dto", "null");
			return map;
		}
	}
}


