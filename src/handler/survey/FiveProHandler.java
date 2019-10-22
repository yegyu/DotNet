package handler.survey;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.CommandHandler;
import main.BoardDataBean;
import survey.SurveyDao;

@Controller
public class FiveProHandler implements CommandHandler {

	@Resource
	private SurveyDao surveyDao;
	
	@RequestMapping("/fivePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		int isAdmin = (Integer) session.getAttribute("isAdmin");
		
		// "C:\Users\Playdata\Desktop\dotnet\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\DotNetEx\save"
		String path = request.getSession().getServletContext().getRealPath("/save"); 

		File file = new File( path );
		if(!file.exists()) {
			file.mkdir();
		}
		
		MultipartRequest multi = 
				new MultipartRequest(request, path, 1024 * 1024 * 50, "utf-8", new DefaultFileRenamePolicy());
		
		Iterator<String> e = (Iterator<String>) multi.getParameterNames();
		Map<String, Object> info = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> qList = new ArrayList<Map<String, Object>>();
		List<String> contentList = new ArrayList<String>();
		List<String> nameList = new ArrayList<String>();
		
		while(e.hasNext()) {
			String name = e.next();
			if(name.startsWith("Q")) {
				if(!(multi.getParameter(name)).equals("")) {
					nameList.add(name);
				}
			} else {
				info.put(name, multi.getParameter(name));	
			}
			
		}
		nameList.sort(null);
		for(int i=0; i < nameList.size(); i++) {
			contentList.add(multi.getParameter(nameList.get(i)));
		}
		
		info.put("upload1",multi.getFilesystemName("upload1"));

		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setB_tp_num(isAdmin);
		boardDto.setCt_num(Integer.parseInt(multi.getParameter("cate_num")));
		boardDto.setS_tp_num(Integer.parseInt((String)info.get("s_tp_num")));
		boardDto.setSubject((String)info.get("subject"));
		boardDto.setWriter((String)session.getAttribute("memId"));
		boardDto.setThumb_path((String)info.get("upload1"));
		boardDto.setPoint(Integer.parseInt((String)info.get("point")));
		boardDto.setHits(0);
		boardDto.setPartnum(0);
		boardDto.setS_date(new Timestamp( System.currentTimeMillis() ));
		
		surveyDao.insertSurvey(boardDto);
		
//		System.out.println("info : " + info);
		
		int cnt=0;
		
		for(int i = 0; i < contentList.size()/6; i++) {
			Map<String, Object> qmap = new LinkedHashMap<String, Object>();
			qmap.put("qContent", contentList.get(cnt++));
			qmap.put("s1Content", contentList.get(cnt++)); 
			qmap.put("s2Content", contentList.get(cnt++)); 
			qmap.put("s3Content", contentList.get(cnt++)); 
			qmap.put("s4Content", contentList.get(cnt++));
			qmap.put("s5Content", contentList.get(cnt++));
			
			qList.add(qmap);
//			System.out.println("qList : " + qList);
		}
		
		map.put("qList", qList);
		map.put("s_num", boardDto.getS_num());
		System.out.println(boardDto.getS_num());
//		System.out.println("map : " + map);
		int fResult = surveyDao.insertFive(map);
		
//		System.out.println("fResult : " + fResult);
		
		request.setAttribute("info", info);
		
		return new ModelAndView("/survey/fivePro");
	}
}
