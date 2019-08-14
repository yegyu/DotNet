package admin;

import java.util.List;
import java.util.Map;

import user.GoodsStDataBean;

public interface AdminDao {

	public int updateTST(int t_num);
	public List<GoodsStDataBean> getPayHistory();
	
	
	public List<Integer> getS_numList(int st);
	
	public List<CntMemDB> getCntLoc();
	public List<CntMemDB> getCntMemByDate();
	public List<CntMemDB> getCntMWByDate(int gender);
	public List<DnSSelDB> getSSel(int s_num);
	public int getQlen(int s_num);
	
	// 동근 작업 - 데이터 관리 쪽
	public List<Integer> getDataForAll(Map<String, Object> mapForAll);
	public List<Integer> getTwoDataForEachQ(Map<String, Object> mapForAll);
	public List<Integer> getFiveDataForEachQ(Map<String, Object> mapForAll);
	
	
	// 아성형님
	public int getCnt();
	public int getCatCnt();
	public int getSvyCnt();
	public int getSvyCnt2();
	public int updateUserState( AdminMemberBean adminDto );	
	public List<AdminMemberBean> getMembers( Map<String, Integer> map );	
	public List<AdminSurveyBean> getSurveys( Map<String, Integer> map );
	public List<AdminSurveyBean> getSurveys1( Map<String, Integer> map1 );
	public List<AdminSurveyBean> getMemberSurveys( Map<String, String> map2 );
	public List<AdminCategoryBean> getCategorys();
	public int insertCategory( AdminCategoryBean adminCat );	
	public int deleteCategory( String category_name );
	public AdminMemberBean getMember( int num );
	public int updateBoardType(AdminSurveyBean adminSvy);
 }
