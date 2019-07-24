package survey;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import main.BoardDataBean;

public interface SurveyDao {
	public List<SurveyDataBean> getSurs();
	public List<SurveyDataBean> getSursView();
	public List<SurveyDataBean> getSursHit();
	public List<SurveyDataBean> getSursPoint();
	public List<SurveyDataBean> getTodaySurs();
	public List<SurveyDataBean> getSearchSursSub(String search);
	
	public List<SurveyDataBean> getSurs2();
	public List<SurveyDataBean> getSursView2();
	public List<SurveyDataBean> getSursHit2();
	public List<SurveyDataBean> getSursPoint2();
	public List<SurveyDataBean> getTodaySurs2();
	
	public int insertTwo(TwoDataBean two);
	public int insertSurvey(BoardDataBean boardDto);
	public List<BoardDataBean> getSurveys();
	public int getCountAll();
	public TwoDataBean getTwo(String s_num);
	public int addHits(String s_num);
	public int insertPart(Map<String, Object> map);
	public int insertSel(Map<String, Object> map);
	public BoardDataBean getSurvey(String s_num);
	public int updatePoint(Map<String, Object> map);
	public int addPart(String s_num);
	public int getPartPoint(Map<String, Object> map);
	public int getMyPoint(String id);
	public int checkWriter(String id);
	public int checkPart(String id);
	public List<String> getPartS_num(String id);
	
	public int insertEight(Map<String, Object> map);
	public List<EightDataBean> getEights(String s_num);
	public int insertFive(Map<String, Object> map);
	public List<FiveDataBean> getFives(String s_num);
	
	public List<String> selected(Map<String, Object> map);	// 설문참여중 마지막 선택정보들 가져오기
	public int insertTemp(Map<String, Object> map);
	public List<String> selectedTemp(Map<String, Object> map);

	public List<Integer> countList(Map<String, Object> map1);    
    public int countHits(String s_num);
    public int countParts(String s_num);
    public String getTitle(String s_num);//surveyDao (edited)
    
    public int insertFeed(Map<String, Object> map);
    public List<Integer> getMyFeed(Map<String, Object> map);
    
    public List<String> selectCount(Map<String,Object> map);
}
