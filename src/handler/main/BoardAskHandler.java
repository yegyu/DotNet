package handler.main;

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
import main.BoardAskDao;
import main.BoardAskDataBean;

@Controller
public class BoardAskHandler implements CommandHandler{

	@Resource
	private BoardAskDao boardAskDao;
	
	@RequestMapping(value = "boardAsk")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		request.setCharacterEncoding("utf-8");
//		String id = (String)request.getSession().getAttribute("memId");
//		request.setAttribute("id", id);
		
		
		
		//MainHandler 에서 보냄
//		List<BoardAskDataBean> getAsks = boardAskDao.getAsks();
		
		return new ModelAndView("main/boardAsk");
	}
	
	@RequestMapping(value = "boardAskAjax", method = RequestMethod.POST)
	@ResponseBody
	public BoardAskDataBean askAjax(HttpServletRequest request){
//		System.out.println("Ask ajax 들어옴");
		HttpSession sess= request.getSession();
		BoardAskDataBean getAsk = new BoardAskDataBean();
		Integer num = boardAskDao.getMaxNum();
		if(num == null) {
			num = 0;
		}
		String id = (String)sess.getAttribute("memId");
		if(id == null) {
			id=request.getParameter("id");
			//비회원
			getAsk.setaState(1);
		}else {
			//회원
			getAsk.setaState(0);
		}
		getAsk.setNum(num+1);
		getAsk.setId(id);
		getAsk.setTitle(request.getParameter("title"));
		getAsk.setContents(request.getParameter("contents"));
//		System.out.println("passwd : " + request.getParameter("passwd"));
		getAsk.setPasswd(request.getParameter("passwd"));
		getAsk.setaDate(new Timestamp(System.currentTimeMillis() ));
		getAsk.setViews(0);
		if(request.getParameter("secret").equals("true") ) {
			//비밀
			getAsk.setSecret(1);
		}else {
			//안 비밀
			getAsk.setSecret(0);
		}
		
		int rs = boardAskDao.insertAsk(getAsk);
//		System.out.println("insert rs : " + rs);
		
//		List<BoardAskDataBean> board = boardAskDao.getAsks();
		return getAsk;
	}
	
	@RequestMapping(value = "loadAsks",method = RequestMethod.POST)
	@ResponseBody
	public List<BoardAskDataBean> load(HttpServletRequest request){
		
		int low = Integer.parseInt(request.getParameter("rn"));
		int high = low + 10;
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("low",low);
		map.put("high",high);
//		System.out.println(map);
		List<BoardAskDataBean> data = boardAskDao.loadAsks(map);
//		for(BoardAskDataBean el : data) {
//			System.out.println(el.getNum());
//		}
		return data;
	}
//	@RequestMapping(value = "loadAsks",method = RequestMethod.POST)
//	@ResponseBody
//	public BoardAskDataBean load(HttpServletRequest request){
//		
//		int low = Integer.parseInt(request.getParameter("rn"));
//		int high = low + 1;
//		Map<String,Integer> map = new HashMap<String, Integer>();
//		map.put("low",low);
//		map.put("high",high);
//		System.out.println(map);
//		BoardAskDataBean data = boardAskDao.getAskForLoad(map);
////		for(BoardAskDataBean el : data) {
////			System.out.println(el.getNum());
////		}
//		return data;
//	}
	
	@RequestMapping(value = "secretPass", method = RequestMethod.POST)
	@ResponseBody
	public Boolean secretPassFunc(HttpServletRequest request) {
		String passwd = request.getParameter("secPasswd");
		int num = Integer.parseInt(request.getParameter("num"));
		
		String check = boardAskDao.checkPasswd(num);
		
		if(check.equals(passwd)) {
//			System.out.println("비밀번호 같음  real passwd : " + check);
			return true;
		}else {
//			System.out.println("비번 다름  real passwd : " + check);
			return false;
		}
		
		
	}
}
