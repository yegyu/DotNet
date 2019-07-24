package main;

import java.util.List;

import dncommons.SqlMapClient;

public class BoardDBBean implements BoardDao {
	@Override
	public List<BoardDataBean> getSurveys() {
		
		return SqlMapClient.getSession().selectList("Main.getSurveys");
	}
}
