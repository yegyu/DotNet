package handler.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ClickLog {

	Logger logger = LoggerFactory.getLogger(ClickLog.class);
		
	@RequestMapping(value = "clickLog" , method = RequestMethod.POST)
	public String clickLogFunc(HttpServletRequest request) {
		
		String cnt = request.getParameter("cnt");
		String s_num = request.getParameter("s_num");
		String type= request.getParameter("type");
		String noMem = request.getParameter("id");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		if(id != null) {
			logger.info("id :"+id +",s_num :"+s_num+ ",click:"+cnt  +",type:" + type);
			
		}else {
			logger.info("id :"+noMem +",s_num :"+s_num+ ",click:"+cnt  +",type:" + type);
		}
		
		
		return "1";
	}

}
