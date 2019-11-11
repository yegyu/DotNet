package handler.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import handler.CommandHandler;
import main.BoardDao;
import main.MemberDao;
import user.GoodsDataBean;

@Controller
public class GoodsHandler implements CommandHandler{
	
	@Resource
	private MemberDao memberDao;
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("goods" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		int point = memberDao.getPoint(id);
		
		request.setAttribute("point", point);
		
		List<GoodsDataBean> goodslist = memberDao.getGoods();
		request.setAttribute("goodslist", goodslist);
		
		return new ModelAndView("user/goods");
	}
	
	
	@RequestMapping(value = "pay", method = RequestMethod.POST )
	@ResponseBody
	public String pay(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String json = request.getParameter("goods");
//		System.out.println(json);
		Map<String, Object> map = new TreeMap<String, Object>();

		ObjectMapper mapper = new ObjectMapper();
		map = mapper.readValue(json,new TypeReference<Map<String,Object>>(){});
//		for(Map.Entry<String, Object> el : map.entrySet()) {
//			System.out.println(el.getKey() + " " + el.getValue().toString());
//				map.remove(el.getKey());
//		}
		Map<String,Object> rmap = new TreeMap<String, Object>();
//		System.out.println(map);
		Integer maplen = (Integer) map.get("clen"); 
		Integer tnum = 0;
		int rs=0;
		rmap.put("mem_id",id);
		rmap.put("point",map.get("myPo"));
		for(int i = 0 ; i  < maplen ; i++ ) {
			if(Integer.parseInt(map.get("g_cnt"+i).toString()) != 0) {
				
			rmap.put("g_num",map.get("g_num"+i));
			rmap.put("g_cnt",map.get("g_cnt"+i));
			
			tnum = memberDao.getMaxTNum();
			if(tnum == null) tnum = 0;
			rmap.put("t_num", tnum+1);
			
			rs = memberDao.insertGoodsTrade(rmap);
			}
		}
		if(rs == 1) {
			 memberDao.updatePoint(rmap);
		}
		
		return "�궘�젣 �엫臾� �셿�닔";
	}

}
