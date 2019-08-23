package handler.user;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import user.CommentDataBean;

@Controller
public class CommentHandler implements CommandHandler{
	
	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("delComm")
	@ResponseBody
	public int delComFunc(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession sess = request.getSession();
		String id = (String)sess.getAttribute("memId");
		String content =  request.getParameter("content");
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content", content);
		map.put("mem_id",id);
		map.put("s_num",s_num);
		
		
		int rs = memberDao.delComm(map);
		return rs;
	}
	
	
	@RequestMapping("comment")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		request.setAttribute("s_num", s_num);
		
		HttpSession sess = request.getSession();
		String id = (String)sess.getAttribute("memId");
		List<CommentDataBean> getComm=null;
		if(memberDao.getComm(s_num) != null) {
			getComm  = memberDao.getComm(s_num);
//			System.out.println(getComm.get(0).getMem_id());
			request.setAttribute("getComm", getComm);
		}else {
//			System.out.println("getComm �� null �엯�땲�떎.");
		}
//		System.out.println("s_num : " + s_num + ", id : " + id	);
		return new ModelAndView("user/comment");
	}

	@RequestMapping(value = "comm" ,method = RequestMethod.POST)
	@ResponseBody
	public List<CommentDataBean> com(HttpServletRequest request){
//		System.out.println("comment ajax �뱾�뼱�샂");
		HttpSession sess = request.getSession();
		String id = (String)sess.getAttribute("memId");
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		String content = request.getParameter("content");
//		System.out.println("id : "+ id + ", s_num : " + s_num + ", content : "+ content);
		CommentDataBean comm = new CommentDataBean();
		
		comm.setS_num(s_num);
		comm.setContent(content);
		comm.setDt(new Timestamp(System.currentTimeMillis()));
		comm.setMem_id(id);
		comm.setState(0);
		
		int rs= memberDao.insertComm(comm);
		
		List<CommentDataBean> commList = memberDao.getComm(s_num);
		
		return commList; 
	}
}
