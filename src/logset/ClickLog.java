package logset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ClickLog {


	
		
	@RequestMapping(value = "clickLog" , method = RequestMethod.POST)
	public String clickLogFunc(HttpServletRequest request) {
		
		Logger logger2 = LoggerFactory.getLogger("SURVEY_LOG");
		
		String cnt = request.getParameter("cnt");
		String s_num = request.getParameter("s_num");
		String type= request.getParameter("type");
		String noMem = request.getParameter("id");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String surveyTime = request.getParameter("surveyTime");
		String q_len = request.getParameter("q_len");
		if(id != null) {
			logger2.info("id:"+id +",s_num:"+s_num+ ",click:"+cnt  +",type:" + type + ",surveyTime:" + surveyTime + ",q_len:" + q_len);
			
		}else {
			logger2.info("id:"+noMem +",s_num:"+s_num+ ",click:"+cnt  +",type:" + type + ",surveyTime:" + surveyTime + ",q_len:" + q_len);
		}
		
		return "1";
	}

}
