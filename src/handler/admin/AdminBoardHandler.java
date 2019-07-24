package handler.admin;

import java.util.ArrayList;
import java.util.Date;
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

import admin.AdminCategoryBean;
import admin.AdminDao;
import admin.AdminSurveyBean;
import handler.CommandHandler;
import survey.SurveyDao;
import survey.SurveyDataBean;


@Controller
public class AdminBoardHandler implements CommandHandler {

	@Resource
	private SurveyDao surveyDao;
	
	@Resource
	private AdminDao adminDao;
	
	@RequestMapping(value = "/delBoard", method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> delBoard(HttpServletRequest request) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		int result = 0;
		int b_tp_num = Integer.parseInt(request.getParameter("b_tp_num"));
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		
		AdminSurveyBean adminSvy = new AdminSurveyBean();
		
		adminSvy.setB_tp_num(b_tp_num);
		adminSvy.setS_num(s_num);
		
		result = adminDao.updateBoardType(adminSvy);
		
		map.put("result", result);
		map.put("s_num", s_num);
		
		return map;
	}
	
	@RequestMapping(value = {"/cateAdd"}, method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> adminCate(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String ct_num = request.getParameter("ct_num");
		String ct_name = request.getParameter("ct_name");
		
		AdminCategoryBean adminCat = new AdminCategoryBean();
		adminCat.setCt_num(Integer.parseInt(ct_num));		
		adminCat.setCt_name(ct_name);
		int addresult = adminDao.insertCategory( adminCat );
		
		map.put("addresult", addresult);
		map.put("adminCat", adminCat);
		
		return map;
	}
	@RequestMapping(value = {"/cateDel"}, method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> adminCateDel(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String ct_name = request.getParameter("ct_name");
		
		int delresult = adminDao.deleteCategory(ct_name);

		map.put("delresult", delresult);
		map.put("ct_name", ct_name);
		
		return map;
	}
	@RequestMapping(value = {"/paging", "/search" }, method = RequestMethod.POST, produces = "application/json;UTF-8")
	@ResponseBody
	public Map<String, Object> adminBorad(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String page = request.getParameter("page");
		String page2 = request.getParameter("page2");
		int listSize = 5;
		
		// 메인게시판용
		List<SurveyDataBean> allMainSurveys = surveyDao.getSurs();
		List<List<SurveyDataBean>> mainSurveys = new ArrayList<List<SurveyDataBean>>();
		int mainCnt = allMainSurveys.size();
		
		int index = 0;
		int realSize = mainCnt/listSize == 0 ? 1 : mainCnt%listSize == 0 ? mainCnt/listSize : mainCnt/listSize+1;
		for(int i = 0; i < realSize; i++) {
			List<SurveyDataBean> mainSurPage = new ArrayList<SurveyDataBean>();
			for(int j = 0; j < listSize; j++) {
				if(index < allMainSurveys.size() && allMainSurveys.get(index) != null) {
					mainSurPage.add(allMainSurveys.get(index));
//					System.out.println("index : " + index);
					index++;
				}
			}
			mainSurveys.add(mainSurPage);
		}
		
		// 보조게시판용
		List<SurveyDataBean> allSubSurveys = surveyDao.getSurs2();
		List<List<SurveyDataBean>> subSurveys = new ArrayList<List<SurveyDataBean>>();
		int subCnt = allSubSurveys.size();

		int index2 = 0;
		int realSize2 = subCnt/listSize == 0 ? 1 : subCnt%listSize == 0? subCnt/listSize : subCnt/listSize+1;
		for(int i = 0; i < realSize2; i++) {
			List<SurveyDataBean> subSurPage = new ArrayList<SurveyDataBean>();
			for(int j = 0; j < listSize; j++) {
				if(index2 < allSubSurveys.size() && allSubSurveys.get(index2) != null) {
					subSurPage.add(allSubSurveys.get(index2));
					index2++;
				}
			}
			subSurveys.add(subSurPage);
		}
		
		map.put("pageNum2", page2);
		map.put("subSurveys", subSurveys);
		map.put("pageNum", page);
		map.put("mainSurveys", mainSurveys);
		
		return map;
	}
	
	@RequestMapping("/adminBoard")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {		
				
			int listSize = 5;
			int pageNum = 0;	// 처음 페이지 번호(+1로 계산)
			
			// 메인게시판용
			List<SurveyDataBean> allMainSurveys = surveyDao.getSurs();
			List<List<SurveyDataBean>> mainSurveys = new ArrayList<List<SurveyDataBean>>();
			int mainCnt = allMainSurveys.size();

//			System.out.println("size : " + mainCnt/listSize);
			
			int index = 0;
			int realSize = mainCnt/listSize == 0 ? 1 : mainCnt%listSize == 0 ? mainCnt/listSize : mainCnt/listSize+1;
			for(int i = 0; i < realSize; i++) {
				List<SurveyDataBean> mainSurPage = new ArrayList<SurveyDataBean>();
				for(int j = 0; j < listSize; j++) {
					if(index < allMainSurveys.size() && allMainSurveys.get(index) != null) {
						mainSurPage.add(allMainSurveys.get(index));
//						System.out.println("index : " + index);
						index++;
					}
				}
				mainSurveys.add(mainSurPage);
			}
			
			request.setAttribute( "mainSurveys", mainSurveys);
			request.setAttribute("mainCnt", mainCnt);
			request.setAttribute("realSize", realSize);
			request.setAttribute("pageNum", pageNum);
			
			// 보조게시판용
			List<SurveyDataBean> allSubSurveys = surveyDao.getSurs2();
			List<List<SurveyDataBean>> subSurveys = new ArrayList<List<SurveyDataBean>>();
			int subCnt = allSubSurveys.size();

			int index2 = 0;
			int realSize2 = subCnt/listSize == 0 ? 1 : subCnt%listSize == 0? subCnt/listSize : subCnt/listSize+1;
			for(int i = 0; i < realSize2; i++) {
				List<SurveyDataBean> subSurPage = new ArrayList<SurveyDataBean>();
				for(int j = 0; j < listSize; j++) {
					if(index2 < allSubSurveys.size() && allSubSurveys.get(index2) != null) {
						subSurPage.add(allSubSurveys.get(index2));
						index2++;
					}
				}
				subSurveys.add(subSurPage);
			}
			System.out.println("subSurveys : " + subSurveys );
			request.setAttribute("subSurveys", subSurveys);
			request.setAttribute("subCnt", subCnt);
			request.setAttribute("realSize2", realSize2);
			
			List<AdminCategoryBean> categorys = adminDao.getCategorys();
			request.setAttribute( "categorys", categorys );
		
		
		return new ModelAndView( "admin/adminBoard");
	}

}









