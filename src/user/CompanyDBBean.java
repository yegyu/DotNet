package user;

import java.util.List;

import dncommons.SqlMapClient;
import main.MemberDataBean;

public class CompanyDBBean implements CompDao {
	@Override
	public int insertQuestion(CompanyDataBean companyDto) {
		return SqlMapClient.getSession().insert("User.insertQuestion" , companyDto);
	}
	@Override
	public List<CompanyDataBean> getQuestions(CompanyDataBean compDto) {
		return SqlMapClient.getSession().selectList("User.getQuestions", compDto );
	}
	@Override
	public CompanyDataBean checkCo(String co_name) {
		return SqlMapClient.getSession().selectOne("User.checkCo", co_name);
	} 
}
