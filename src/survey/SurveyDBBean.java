package survey;

import java.util.List;
import java.util.Map;

import admin.DnSSelDB;
import dncommons.SqlMapClient;
import main.BoardDataBean;

public class SurveyDBBean implements SurveyDao{
//	보기별 선택수
//	@Override
//	public List<Integer> countList(Map<String, Object> map1) {
//		return SqlMapClient.getSession().selectList("Survey.countList", map1);
//	}
	
	
	//검색용
	@Override
	public List<SurveyDataBean> getSearchSursSub(String search) {
		return SqlMapClient.getSession().selectList("Survey.getSearchSursSub", search);
	}
	
	// 메인게시판정렬 용
	@Override
	public List<SurveyDataBean> getSurs() {
		return SqlMapClient.getSession().selectList("Survey.getSurveys");
	}
	@Override
	public List<SurveyDataBean> getSursView() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursView");
	}
	@Override
	public List<SurveyDataBean> getSursHit() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursHit");
	}
	@Override
	public List<SurveyDataBean> getSursPoint() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursPoint");
	}
	
	// 보조게시판 정렬 용
	@Override
	public List<SurveyDataBean> getSurs2() {
		return SqlMapClient.getSession().selectList("Survey.getSurveys2");
	}
	@Override
	public List<SurveyDataBean> getSursView2() {
		return SqlMapClient.getSession().selectList("Survey.getSursView2");
	}
	@Override
	public List<SurveyDataBean> getSursHit2() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursHit2");
	}
	@Override
	public List<SurveyDataBean> getSursPoint2() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursPoint2");
	}
	//오늘의 
	@Override
	public List<SurveyDataBean> getTodaySurs() {
		return SqlMapClient.getSession().selectList("Survey.getTodaySurs");
	}
	
	@Override
	public List<SurveyDataBean> getTodaySurs2() {
		return SqlMapClient.getSession().selectList("Survey.getTodaySurs2");
	}
	
	@Override
	public int getCountAll() {
		return SqlMapClient.getSession().selectOne("Survey.getCountAll");
	}
	
	@Override
	public int insertTwo(TwoDataBean two) {
		return SqlMapClient.getSession().insert("Survey.insertTwo", two);
	}
	
	@Override
	public int insertSurvey(BoardDataBean boardDto) {
		return SqlMapClient.getSession().insert("Survey.insertSurvey", boardDto);
	}
	
	@Override
	public List<BoardDataBean> getSurveys() {
		return SqlMapClient.getSession().selectList("Survey.getSurveys");
	}
	
	@Override
	public TwoDataBean getTwo(String s_num) {
		return SqlMapClient.getSession().selectOne("Survey.getTwo", s_num);
	}
	
	@Override
	public int addHits(String s_num) {
		return SqlMapClient.getSession().update("Survey.addHits", s_num);
	}
	
	@Override
	public int insertPart(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertPart", map);
	}
	
	@Override
	public int insertSel(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertSel", map);
	}
	
	@Override
	public BoardDataBean getSurvey(String s_num) {
		return SqlMapClient.getSession().selectOne("Survey.getSurvey", s_num);
	}
	
	@Override
	public int updatePoint(Map<String, Object> map) {
		return SqlMapClient.getSession().update("Survey.updatePoint", map);
	}
	
	@Override
	public int addPart(String s_num) {
		return SqlMapClient.getSession().update("Survey.addPart", s_num);
	}
	
	@Override
	public int getPartPoint(Map<String, Object> map) {
		return SqlMapClient.getSession().update("Survey.getPartPoint", map);
	}
	
	@Override
	public int getMyPoint(String id) {
		return SqlMapClient.getSession().update("Survey.getMyPoint", id);
	}
	
	@Override
	public int checkWriter(String id) {
		return SqlMapClient.getSession().selectOne("Survey.checkWriter", id);
	}
	
	@Override
	public int checkPart(String id) {
		return SqlMapClient.getSession().selectOne("Survey.checkPart", id);
	}
	
	@Override
	public List<String> getPartS_num(String id) {
		return SqlMapClient.getSession().selectList("Survey.getPartS_num", id);
	}
	
	@Override
	public int insertEight(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertEight", map);
	}
	
	@Override
	public List<EightDataBean> getEights(String s_num) {
		return SqlMapClient.getSession().selectList("Survey.getEights", s_num);
	}
	
	@Override
	public int insertFive(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertFive", map);
	}
	
	@Override
	public List<FiveDataBean> getFives(String s_num) {
		return SqlMapClient.getSession().selectList("Survey.getFives", s_num);
	}
	
	@Override
	public List<String> selected(Map<String, Object> map) {
		return SqlMapClient.getSession().selectList("Survey.selected", map);
	}
	
	@Override
	public int insertTemp(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertTemp", map);
	}
	
	@Override
	public List<String> selectedTemp(Map<String, Object> map) {
		return SqlMapClient.getSession().selectList("Survey.selectedTemp", map);
	}
	
	@Override
	public List<Integer> countList(Map<String, Object> map1) {
		return SqlMapClient.getSession().selectList("Survey.countList", map1);
	}

	@Override
	public int countHits(String s_num) {
		return SqlMapClient.getSession().selectOne("Survey.countHits", s_num);
	}

	@Override
	public int countParts(String s_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Survey.countParts", s_num);
	}

	@Override
	public String getTitle(String s_num) {
		return SqlMapClient.getSession().selectOne("Survey.getTitle", s_num);
	}
	
	@Override
	public int insertFeed(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertFeed", map);
	}
	
	@Override
	public List<Integer> getMyFeed(Map<String, Object> map) {
		return SqlMapClient.getSession().selectList("Survey.getMyFeed", map);
	}
	
	@Override
	public List<String> selectCount(Map<String, Object> map) {
		return SqlMapClient.getSession().selectList("Survey.selectCount", map);
	}
	
	@Override
	public DnSSelDB getLastSel() {
		return SqlMapClient.getSession().selectOne("Survey.getLastSel");
	}
}
