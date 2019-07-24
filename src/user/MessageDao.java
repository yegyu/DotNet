package user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MessageDao {

	public Integer getMsgNum();
	public int mySendCnt(String id);
	public int myReceiveCnt(String id);
	public int getMemNum(String id);
	public int insertMsg(MessageDataBean messageDto);
	public List<MessageDataBean> getSendMsgs(String id);
	public List<MessageDataBean> getReceiveMsgs(String id);
	
	//시간 나면 mybatis update foreach 로 해보기
	public int updateSDelSt(Integer m_num);
	public int updateRDelSt(Integer m_num);
}
