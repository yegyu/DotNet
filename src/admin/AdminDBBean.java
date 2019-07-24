package admin;

import java.util.List;
import java.util.Map;

import dncommons.SqlMapClient;
import user.GoodsStDataBean;

public class AdminDBBean implements AdminDao{

	@Override
	public List<CntMemDB> getCntLoc() {
		return SqlMapClient.getSession().selectList("Admin.getCntLoc");
	}
	@Override
	public List<Integer> getS_numList(int st) {
		return SqlMapClient.getSession().selectList("Admin.getS_numList",st);
	}
	@Override
	public int getQlen(int s_num) {
		return SqlMapClient.getSession().selectOne("Admin.getQlen", s_num);
	}
	@Override
	public List<DnSSelDB> getSSel(int s_num) {
		return SqlMapClient.getSession().selectList("Admin.getSSel", s_num);
	}
	@Override
	public List<CntMemDB> getCntMemByDate() {
		return SqlMapClient.getSession().selectList("Admin.getCntMemByDate");
	}
	@Override
	public List<CntMemDB> getCntMWByDate(int gender) {
		return SqlMapClient.getSession().selectList("Admin.getCntMWByDate", gender);
	}
	@Override
	public List<GoodsStDataBean> getPayHistory() {
		return SqlMapClient.getSession().selectList("Admin.getPayHistory");
	}
	@Override
	public int updateTST(int t_num) {
		return SqlMapClient.getSession().update("Admin.updateTST", t_num);
	}
	
	// 아성형님
	public List<AdminMemberBean> getMembers( Map<String, Integer> map ) {		
		return SqlMapClient.getSession().selectList( "Admin.getMembers", map );
	}	
	public List<AdminSurveyBean> getSurvey( Map<String, Integer> map ) {		
		return SqlMapClient.getSession().selectList( "Admin.getSurvey", map );
	}	
	public List<AdminSurveyBean> getMemberSurveys( Map<String, String> map2 ) {		
		return SqlMapClient.getSession().selectList( "Admin.getMemberSurveys", map2 );
	}	
	public List<AdminSurveyBean> getSurveys( Map<String, Integer> map ) {		
		return SqlMapClient.getSession().selectList( "Admin.getSurveys", map );
	}	
	public List<AdminSurveyBean> getSurveys1( Map<String, Integer> map1 ) {		
		return SqlMapClient.getSession().selectList( "Admin.getSurveys1", map1 );
	}	
	public List<AdminCategoryBean> getCategorys() {		
		return SqlMapClient.getSession().selectList( "Admin.getCategorys");
	}	
	public int getCnt() {
		return SqlMapClient.getSession().selectOne( "Admin.getCnt" );
	}
	public int getCatCnt() {
		return SqlMapClient.getSession().selectOne( "Admin.getCatCnt" );
	}
	public int getSvyCnt2() {
		return SqlMapClient.getSession().selectOne( "Admin.getSvyCnt" );
	}
	public int getSvyCnt() {
		return SqlMapClient.getSession().selectOne( "Admin.getSvyCnt" );
	}
	public int updateUserState(AdminMemberBean adminDto) {
		return SqlMapClient.getSession().update( "Admin.updateUserState", adminDto );
	}	
	public int updateBoardType(AdminSurveyBean adminSvy) {
		return SqlMapClient.getSession().update( "Admin.updateBoardType", adminSvy );
	}
	public AdminMemberBean getMember( int num ) {
		return SqlMapClient.getSession().selectOne( "Admin.getMember", num );
	}
	public int insertCategory( AdminCategoryBean adminCat ) {			
		return SqlMapClient.getSession().insert( "Admin.insertCategory", adminCat );
	}		
	public int deleteCategory(String category_name) {	
		return SqlMapClient.getSession().delete( "Admin.deleteCategory", category_name );
	}
}
