package user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import dncommons.SqlMapClient;


public class MessageDBBean implements MessageDao{
	
	@Override
	public int updateSDelSt(Integer m_num) {
		return SqlMapClient.getSession().update("User.updateSDelSt", m_num);
	}
	@Override
	public int updateRDelSt(Integer m_num) {
		
		return SqlMapClient.getSession().update("User.updateRDelSt",m_num);
	}
	
	@Override
	public int mySendCnt(String id) {
		return SqlMapClient.getSession().selectOne("User.mySendCnt",id);
	}
	@Override
	public int myReceiveCnt(String id) {
		return SqlMapClient.getSession().selectOne("User.myReceiveCnt",id);
	}
	@Override
	public List<MessageDataBean> getSendMsgs(String id) {
		return SqlMapClient.getSession().selectList("User.getSendMsgs",id);
	}
	@Override
	public List<MessageDataBean> getReceiveMsgs(String id) {
		return SqlMapClient.getSession().selectList("User.getReceiveMsgs", id);
	}
	@Override
	public Integer getMsgNum() {
		return SqlMapClient.getSession().selectOne("User.getMsgNum");
	}
	
	@Override//아직 구현 안함 구현하고 지워 ?? memberDao에 넣어야 할것 같음
	public int getMemNum(String id) {
		return SqlMapClient.getSession().selectOne("User.getMemNum",id);
	}
	
	@Override
	public int insertMsg(MessageDataBean messageDto) {
		return SqlMapClient.getSession().insert("User.insertMsg",messageDto);
	}

	
	
	 
	
	
}
