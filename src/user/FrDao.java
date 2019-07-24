package user;

import java.util.List;
import java.util.Map;

import main.MemberDataBean;

public interface FrDao {
	//my fr
	public List<MemberDataBean> getFr(String id);
	//my recom fr
	public List<MemberDataBean> getRecomFr(Map<String,Object> map);

	//친구 요청한 사람의 친구창에 상대방 사진에 요청 대기 버튼 
	public List<String> getWatiBtnId(String id);
	
	//친구 응답할  사람의 친구창에 상대방 사진에 수락, 및 차단 버튼 2개 넣기
	public List<String> getAccBtnId(String id);
//	public Integer getReqSt() 
	//state 1 -> 서로 친구 인 상태
	public List<String> getRealFrBtn(String id);
	
	public int updateForAccFr(Map<String,Object> map);
	public int updateForRejFr(Map<String,Object> map);
	public int insertFr(Map<String,Object> map);
	
	public int getMaxFrNum();
}
