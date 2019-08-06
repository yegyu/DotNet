package handler.survey;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
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
public class EightProHandler implements CommandHandler {

	@Resource
	private SurveyDao surveyDao;
	
	@RequestMapping("/eightPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		int isAdmin = (Integer) session.getAttribute("isAdmin");
		
		// 이미지 저장될 경로
		// "C:\Users\Playdata\Desktop\dotnet\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\DotNetEx\save"
		String path = request.getSession().getServletContext().getRealPath("/save"); 

		// 지정된 경로에 파일이 없으면 생성
		File file = new File( path );
		if(!file.exists()) {
			file.mkdir();
		}
		
		// 지정된 파일에 이미지 저장
		MultipartRequest multi = 
				new MultipartRequest(request, path, 1024 * 1024 * 50, "utf-8", new DefaultFileRenamePolicy());
		
		Iterator<String> e = (Iterator<String>) multi.getParameterNames();
		// 설문 정보를 받는 map - subject, thumbnail_img name, point, s_type_number
		Map<String, Object> info = new HashMap<String, Object>();
		// mybatis 넘길 map
		Map<String, Object> map = new HashMap<String, Object>();
		// map에 담기위한 List(질문, 보기내용 들어가있음)
		List<Map<String, Object>> qList = new ArrayList<Map<String, Object>>();
		// 질문, 보기 내용을 담는 List
		List<String> contentList = new ArrayList<String>();
		// parameter 이름 정렬용 List
		List<String> nameList = new ArrayList<String>();
		
		// 받은 parameter들 나눠서 넣기
		while(e.hasNext()) {
			String name = e.next();
			if(name.startsWith("Q")) {
				if(!(multi.getParameter(name)).equals("")) {
					nameList.add(name);
				}
			} else {
				info.put(name, multi.getParameter(name));	// 질문 외의 정보들
			}
			
		}
		// 이름  순으로 질문,보기 내용 담기
		nameList.sort(null);
		for(int i=0; i < nameList.size(); i++) {
			contentList.add(multi.getParameter(nameList.get(i)));
		}
//		System.out.println("contentList : " + contentList);
		
		// 이미지 경로 넣기
		info.put("upload1",multi.getFilesystemName("upload1"));

		// dn_board에 넣기
		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setB_tp_num(isAdmin);
		boardDto.setCt_num(1);
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
		
		// dn_s_eight에 넣기
		int cnt=0;
		
		for(int i = 0; i < contentList.size()/5; i++) {
			Map<String, Object> qmap = new LinkedHashMap<String, Object>();
			qmap.put("qContent", contentList.get(cnt++));
			qmap.put("s1Content", contentList.get(cnt++)); 
			qmap.put("s2Content", contentList.get(cnt++)); 
			qmap.put("s3Content", contentList.get(cnt++)); 
			qmap.put("s4Content", contentList.get(cnt++));
			
			qList.add(qmap);
//			System.out.println("qList : " + qList);
		}
		
		map.put("qList", qList);
		map.put("s_num", boardDto.getS_num());
//		System.out.println("map : " + map);
		int eResult = surveyDao.insertEight(map);
		
//		System.out.println("eResult : " + eResult);
		
		request.setAttribute("info", info);
		
		return new ModelAndView("/survey/eightPro");
	}

}
