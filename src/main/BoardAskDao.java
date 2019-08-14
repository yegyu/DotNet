package main;

import java.util.List;
import java.util.Map;

import main.BoardAskDataBean;

public interface BoardAskDao {
	
	public Integer getCount();
	public Integer getMaxNum();
	public List<BoardAskDataBean> getAsks();
	public BoardAskDataBean getAskForLoad(Map<String,Integer> map);
	public List<BoardAskDataBean> loadAsks(Map<String,Integer> map);
	public BoardAskDataBean getAsk(int num);
	public int insertAsk(BoardAskDataBean ask);
	public String checkPasswd(int num);
	public int updateAsk(Map<String,Object> map);
	
	public int insertReply(AskReplyDataBean ar);
	public List<AskReplyDataBean> getReplys(int num);
	public AskReplyDataBean getReply(int num);
	public Integer getMaxRNum(int num);
	
	
	
	public int updateView(int num);
	public int updateGB(Map<String,Integer> map);
	
	
	


}
//public Integer getCount();
//public int insertArticle( BoardAskDataBean boardDto );
//public List<BoardAskDataBean> getArticles(Map<String, Object> map);
//public BoardAskDataBean getArticle( int num );
//public void addCount( int num );
//public int check( int num, String passwd );
//public int deleteArticle( int num );
//public int updateArticle( BoardAskDataBean boardDto );
//
//public int getCountByWriter(String searchContent);
//public int getCountByContent(String searchContent);
//
//public List<BoardAskDataBean> getArticlesByWriter(Map<String, Object> map);
//public List<BoardAskDataBean> getArticlesByContent(Map<String, Object> map);