package main;


import java.util.List;
import java.util.Map;

import dncommons.SqlMapClient;
import main.MemberDataBean;
import user.CommentDataBean;
import user.GoodsDataBean;
import user.GoodsStDataBean;
import user.LibDataBean;
import user.PointDataBean;

public class MemberDBBean implements MemberDao{
	@Override
	public List<MemberDataBean> searchMems(String id) {
		return SqlMapClient.getSession().selectList("Main.searchMems",id);
	}
	@Override
	public int updateUserSt(Map<String,Object> map) {
		return SqlMapClient.getSession().update("Main.updateUserSt", map);
	}
	
	@Override
	public List<MemberDataBean> getMembers() {
		return SqlMapClient.getSession().selectList("Main.getMembers");
	}
	
	@Override
	public List<GoodsStDataBean> getGoodsStAll() {
		return SqlMapClient.getSession().selectList("Main.getGoodsStAll");
	}
	@Override
	public List<LibDataBean> getMyTest(String id) {
		return SqlMapClient.getSession().selectList("Main.getMyTest",id);
	}
	@Override
	public List<LibDataBean> getLib(String id) {
		return SqlMapClient.getSession().selectList("Main.getLib",id);
	}
	@Override
	public List<GoodsStDataBean> getGoodsSt(String id) {
		return SqlMapClient.getSession().selectList("Main.getGoodsSt", id);
	}	
	@Override
	public int updatePoint(Map<String, Object> map) {
		return SqlMapClient.getSession().update("Main.updatePoint", map);
	}
	@Override
	public int insertGoodsTrade(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Main.insertGoodsTrade", map);
	}
	@Override
	public Integer getMaxG_num() {
		return SqlMapClient.getSession().selectOne("Main.getMaxG_num");
	}
	@Override
	public int insertGood(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Main.insertGood",map);
	}
	@Override
	public int delGood(String g_name) {
		return SqlMapClient.getSession().delete("Main.delGood", g_name);
	}
	@Override
	public Integer getMaxTNum() {
		
		return SqlMapClient.getSession().selectOne("Main.getMaxTNum");
	}
	@Override
	public List<GoodsDataBean> getGoods() {
		return SqlMapClient.getSession().selectList("Main.getGoods");
	}
	@Override
	public List<PointDataBean> getPoList(String id) {
		return SqlMapClient.getSession().selectList("Main.getPoList", id);
	}
	@Override
	public int getPoint(String id) {
		return SqlMapClient.getSession().selectOne("Main.getPoint",id);
	}
	@Override
	public int check(String id, String passwd) {
		int result = checkId(id);

		if (result == 1) { // 아이디 있다.
			MemberDataBean memberDto = getMember(id);
			System.out.println(memberDto.getId());
			if (!passwd.equals(memberDto.getPasswd())) {
				result = -1;
			}
		}
		return result;
	}
	
	@Override
	public int checkId(String id) {
		
		return SqlMapClient.getSession().selectOne("Main.checkId", id);
	}
	@Override
	public MemberDataBean getMember(String id) {
		return SqlMapClient.getSession().selectOne("Main.getMember",id);
	}
	@Override
	public int insertMember(MemberDataBean memberDto) {
		return SqlMapClient.getSession().insert("Main.insertMember", memberDto);
	}
	@Override
	public int updateMember(MemberDataBean memberDto) {
		return SqlMapClient.getSession().update("Main.updateMember", memberDto);
	}
	@Override
	public List<CommentDataBean> getComm(int s_num) {
		return SqlMapClient.getSession().selectList("Main.getComm", s_num);
	}
	
	@Override
	public int insertComm(CommentDataBean comm) {
		return SqlMapClient.getSession().insert("Main.insertComm", comm);
	}
}
