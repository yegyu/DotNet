package handler.user;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import user.MessageDBBean;

@Controller 
public class DeleteMailHandler {
	
	@Resource
	private MessageDBBean messageDao;

	@RequestMapping(value = "/deleteMail" , method = RequestMethod.POST ,produces = "application/json;UTF-8")//
	@ResponseBody
	public Map<String, String> forDel(HttpServletRequest request) throws Exception {
		HttpSession sesssion = request.getSession();
		
		String id = (String) sesssion.getAttribute("memId");
		Map<String, String> map = new TreeMap<String, String>();
		ArrayList<String> s = new ArrayList<String>();
		ArrayList<String> r = new ArrayList<String>();
		
		String json = request.getParameter("val");
		System.out.println(json);
		
		ObjectMapper mapper = new ObjectMapper();
		map = mapper.readValue(json,new com.fasterxml.jackson.core.type.TypeReference<Map<String,String>>(){});
//		String temp = null;
//		Iterator<String> iter = map.keySet().iterator();
//		while(iter.hasNext() ) {
//			temp = iter.next();
//			System.out.println(temp + "  " + map.get(temp));
//		}
		for(String key : map.keySet()) {
			if(key.contains("s")) {
				s.add(map.get(key));
			}else {
				r.add(map.get(key));
			}
		}
		
		for(int i = 0 ; i < s.size(); i++) {
//			HashMap<String, String> smap = new HashMap<String, String>();
//			smap.put("id",id);
//			smap.put("m_num", s.get(i));
			int rs=messageDao.updateSDelSt(Integer.valueOf(s.get(i) ));
			System.out.println("result update s_del_st");
			System.out.print(rs + " ");
		}
		for(int j = 0 ; j < r.size(); j++) {
			int rr = messageDao.updateRDelSt(Integer.valueOf(r.get(j)));
			System.out.println("result update r_del_st");
			System.out.print(rr + " ");
		}
//		
		System.out.println("map :" + map);
		System.out.println("s : " + s);
		System.out.println("r : " + r);
		
		
		return map;
	}
}
