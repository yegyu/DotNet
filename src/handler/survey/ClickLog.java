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


	public Logger logger2 = LoggerFactory.getLogger("SURVEY_LOG");
		
	@RequestMapping(value = "clickLog" , method = RequestMethod.POST)
	public String clickLogFunc(HttpServletRequest request) {
		
		String cnt = request.getParameter("cnt");
		String s_num = request.getParameter("s_num");
		String type= request.getParameter("type");
		String noMem = request.getParameter("id");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String surveyTime = request.getParameter("surveyTime");
		if(id != null) {
			logger2.info("id:"+id +",s_num:"+s_num+ ",click:"+cnt  +",type:" + type + ",surveyTime:" + surveyTime);
			
		}else {
			logger2.info("id:"+noMem +",s_num:"+s_num+ ",click:"+cnt  +",type:" + type + ",surveyTime:" + surveyTime);
		}
		
		
		return "1";
	}

}
