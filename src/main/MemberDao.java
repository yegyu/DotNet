package main;

import java.util.List;
import java.util.Map;

import user.CommentDataBean;
import user.GoodsDataBean;
import user.GoodsStDataBean;
import user.LibDataBean;
import user.PointDataBean;

public interface MemberDao {
	public int checkId(String id);
	public int checkSt(String id);
	public int check(String id, String passwd);
	public MemberDataBean getMember(String id);
	public int insertMember(MemberDataBean memberDto);
	public int updateMember( MemberDataBean memberDto );
	
	public int getPoint(String id);
	public List<PointDataBean> getPoList(String id);
	public List<GoodsDataBean> getGoods();
	public Integer getMaxTNum();
	public int insertGoodsTrade(Map<String,Object> map);
	public int updatePoint(Map<String,Object> map);
	
	public List<GoodsStDataBean> getGoodsStAll();
	public Integer getMaxG_num();
	public int insertGood(Map<String, Object> map);
	public int delGood(String g_name);
	
	public List<GoodsStDataBean> getGoodsSt(String id);
	
	public List<LibDataBean> getLib(String id);
	public List<LibDataBean> getMyTest(String id);
	
	public List<MemberDataBean> getMembers();
	
	public int updateUserSt(Map<String,Object> map);
	
	public List<CommentDataBean> getComm(int s_num); 
	public int insertComm(CommentDataBean comm);
	
	public List<MemberDataBean> searchMems(String id);
}
