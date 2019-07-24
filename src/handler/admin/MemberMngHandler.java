package handler.admin;

import java.io.IOException;
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

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;

@Controller
public class MemberMngHandler implements CommandHandler{
	
	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("memberMng")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<MemberDataBean> memList = memberDao.getMembers();
		request.setAttribute("memList", memList);
		
		return new ModelAndView("admin/memberMng");
	}

	
	@RequestMapping(value = "stopMem",method = RequestMethod.POST)
	@ResponseBody
	public String stopMem(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		System.out.println("stopMem ajax");
		String json = request.getParameter("json");
		
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		map = mapper.readValue(json,new com.fasterxml.jackson.core.type.TypeReference<Map<String,Object>>(){});
		
		
		int rs = memberDao.updateUserSt(map);
		System.out.println("user state update 성공?? " + rs);
		
		return "stop 성공";
	}
	@RequestMapping(value = "recoverMem",method = RequestMethod.POST)
	@ResponseBody
	public String recoverMem(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		System.out.println("recoverMem ajax");
		String json = request.getParameter("json");
		
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		map = mapper.readValue(json,new com.fasterxml.jackson.core.type.TypeReference<Map<String,Object>>(){});
		
		int rs = memberDao.updateUserSt(map);
		System.out.println("user state update 성공?? " + rs);
		
		return "recover 성공";
	}
}
