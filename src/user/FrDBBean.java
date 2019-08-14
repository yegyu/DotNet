package user;

import java.util.List;
import java.util.Map;

import dncommons.SqlMapClient;
import main.MemberDataBean;

public class FrDBBean implements FrDao{

	@Override
	public Integer checkFr(Map<String, Object> map) {
		return SqlMapClient.getSession().selectOne("checkFr", map);
	}
	@Override
	public int getMaxFrNum() {
		return SqlMapClient.getSession().selectOne("getMaxFrNum");
	}
	@Override
	public int insertFr(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("insertFr",map);
	}
	@Override
	public int updateForAccFr(Map<String,Object> map) {
		return SqlMapClient.getSession().update("Fr.updateForAccFr",map);
	}
	@Override
	public int updateForRejFr(Map<String,Object> map) {
		return SqlMapClient.getSession().update("Fr.updateForRejFr",map);
	}
	@Override
	public List<MemberDataBean> getRecomFr(Map<String, Object> map) {
		return SqlMapClient.getSession().selectList("Fr.getRecomFr", map);
	}
	@Override
	public List<MemberDataBean> getFr(String id) {
		return SqlMapClient.getSession().selectList("Fr.getFr",id);
	}
	
	@Override
	public List<String> getAccBtnId(String id) {
		return SqlMapClient.getSession().selectList("getAccBtnId", id);
	}
	public List<String> getWatiBtnId(String id) {
		return SqlMapClient.getSession().selectList("getWatiBtnId", id);
	};
	@Override
	public List<String> getRealFrBtn(String id) {
		return SqlMapClient.getSession().selectList("getRealFrBtn", id);
	}
}
