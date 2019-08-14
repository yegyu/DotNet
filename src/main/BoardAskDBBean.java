package main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import dncommons.SqlMapClient;
import main.BoardAskDataBean;

public class BoardAskDBBean implements BoardAskDao{

	@Override
	public int updateView(int num) {
		return SqlMapClient.getSession().update("updateView", num);
	}
	@Override
	public BoardAskDataBean getAskForLoad(Map<String, Integer> map) {
		return SqlMapClient.getSession().selectOne("getAskForLoad", map);
	}
	@Override
	public List<BoardAskDataBean> loadAsks(Map<String, Integer> map) {
		return SqlMapClient.getSession().selectList("loadAsks", map);
	}
	@Override
	public Integer getMaxRNum(int num) {
		return SqlMapClient.getSession().selectOne("getMaxRNum", num);
	}
	
	@Override
	public AskReplyDataBean getReply(int num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("getReply", num);
	}
	
	@Override
	public List<AskReplyDataBean> getReplys(int num) {
		return SqlMapClient.getSession().selectList("getReplys", num);
	}
	@Override
	public int insertReply(AskReplyDataBean ar) {
		return SqlMapClient.getSession().insert("insertReply", ar);
	}

	@Override
	public int updateAsk(Map<String, Object> map) {
		return SqlMapClient.getSession().update("updateAsk", map);
	}
	@Override
	public String checkPasswd(int num) {
		return SqlMapClient.getSession().selectOne("checkPasswd", num);
	}
	@Override
	public BoardAskDataBean getAsk(int num) {
		return SqlMapClient.getSession().selectOne("getAsk", num);
	}
	@Override
	public int insertAsk(BoardAskDataBean ask) {
		return SqlMapClient.getSession().insert("insertAsk", ask);
	}
	@Override
	public Integer getMaxNum() {
		return SqlMapClient.getSession().selectOne("getMaxNum");
	}
	@Override
	public Integer getCount() {
		return SqlMapClient.getSession().selectOne("getCount");
	}
	@Override
	public List<BoardAskDataBean> getAsks() {
		return SqlMapClient.getSession().selectList("getAsks");
	}
	
}
//public int getCount() {
//	return SqlMapClient.getSession().selectOne("Mb.getCount");
//}
//public int getCountByWriter(String searchContent) {
//	return SqlMapClient.getSession().selectOne("Mb.getCountByWriter",searchContent);
//}
//public int getCountByContent(String searchContent) {
//	return SqlMapClient.getSession().selectOne("Mb.getCountByContent",searchContent);
//}
//
////articlse 
//public List<BoardAskDataBean> getArticles(Map<String, Object> map) {
//	
//	return SqlMapClient.getSession().selectList("Mb.getArticles",map);
//}
//public List<BoardAskDataBean> getArticlesByWriter(Map<String, Object> map){
//	return SqlMapClient.getSession().selectList("Mb.getArticlesByWriter",map);
//}
//public List<BoardAskDataBean> getArticlesByContent(Map<String, Object> map){
//	return SqlMapClient.getSession().selectList("Mb.getArticlesByContent",map);
//}
//
//public BoardAskDataBean getArticle(int num) {
//
//	return SqlMapClient.getSession().selectOne("Mb.getArticle",num);
//}
//
//public void addCount(int num) {
//	SqlMapClient.getSession().update("Mb.addCount", num);
//}
//
//
//public int insertArticle(BoardAskDataBean boardDto) {
//	
//	
//	// ref re_step re_level
//	// 제목글 10 0 0
//	// ㄴ 답글 10 2 1
//	// ㄴ 재답글 10 3 2
//	// ㄴ 답글 10 1 1
//
//	// ref re_step re_level
//	// 제목글 10 0 0
//	// ㄴ 답글 10 1 1
//	// ㄴ 답글 10 2 1
//	// ㄴ 재답글 10 3 2
//
//	int num = boardDto.getNum(); // 제목글 / 답변글
//	int ref = boardDto.getRef();
//	int re_step = boardDto.getRe_step();
//	int re_level = boardDto.getRe_level();
//	String sql = null;
//	if (num == 0) {
//		// 제목글
//		int count = getCount();
//		if (count != 0) {
//			// 글이 있는 경우
//			ref = (Integer)SqlMapClient.getSession().selectOne("Mb.selectMax");
//			ref = ref + 1; // 그룹화아이디 = 글번호 최대값 + 1
//		} else {
//			// 글이 없는 경우
//			ref = 1;
//		}
//		re_step = 0;
//		re_level = 0;
//	} else {
//		// 답변글
//		SqlMapClient.getSession().update("Mb.updateRefRestep",boardDto );
//		
//		re_step++;
//		re_level++;
//	}
//	boardDto.setRef(ref);
//	boardDto.setRe_step(re_step);
//	boardDto.setRe_level(re_level);
//
//	
//	return SqlMapClient.getSession().insert("Mb.insertContent", boardDto);
//
//}
//
//public int check(int num, String passwd) {
//
//	int result = 0;
//	BoardAskDataBean boardDto = getArticle(num);
//	if (passwd.equals(boardDto.getPasswd())) {
//		result = 1;
//	} else {
//		result = 0;
//	}
//
//	return result;
//}
//
//public int deleteArticle(int num) {
//	int result = 0;
//
//	BoardAskDataBean boardDto = getArticle(num);
//
//	int count = SqlMapClient.getSession().selectOne("Mb.deleteCount",boardDto); 
//
//	if (count != 0) {
//		// 답글이 있다
//		result = -1;
//	} else {
//		// 답글이 없다
//		SqlMapClient.getSession().update("Mb.deleteUpdate", boardDto);
//
//		SqlMapClient.getSession().update("Mb.delete",num);
//		result = 1;
//	}
//	return result;
//}
//
//public int updateArticle(BoardAskDataBean boardDto) {
//	return SqlMapClient.getSession().update("Mb.updateArticle", boardDto);
//}