package user;

import java.util.List;

import dncommons.SqlMapClient;

public class CompanyDBBean implements CompDao {
	@Override
	public int insertQuestion(CompanyDataBean companyDto) {
		return SqlMapClient.getSession().insert("User.insertQuestion" , companyDto);
	}
	@Override
	public List<CompanyDataBean> getQuestions(CompanyDataBean compDto) {
		return SqlMapClient.getSession().selectList("User.getQuestions", compDto );
	}
}
