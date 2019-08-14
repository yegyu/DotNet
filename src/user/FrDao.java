package user;

import java.util.List;
import java.util.Map;

import main.MemberDataBean;

public interface FrDao {
	//my fr
	public List<MemberDataBean> getFr(String id);
	//my recom fr
	public List<MemberDataBean> getRecomFr(Map<String,Object> map);

	//移쒓뎄 �슂泥��븳 �궗�엺�쓽 移쒓뎄李쎌뿉 �긽��諛� �궗吏꾩뿉 �슂泥� ��湲� 踰꾪듉 
	public List<String> getWatiBtnId(String id);
	
	//移쒓뎄 �쓳�떟�븷  �궗�엺�쓽 移쒓뎄李쎌뿉 �긽��諛� �궗吏꾩뿉 �닔�씫, 諛� 李⑤떒 踰꾪듉 2媛� �꽔湲�
	public List<String> getAccBtnId(String id);
//	public Integer getReqSt() 
	//state 1 -> �꽌濡� 移쒓뎄 �씤 �긽�깭
	public List<String> getRealFrBtn(String id);
	
	public int updateForAccFr(Map<String,Object> map);
	public int updateForRejFr(Map<String,Object> map);
	public int insertFr(Map<String,Object> map);
	
	public int getMaxFrNum();
	
	public Integer checkFr(Map<String,Object> map);
}
