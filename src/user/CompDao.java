package user;

import java.util.List;

import user.CompanyDataBean;

//query는 user.xml에서 통합운용
public interface CompDao {
	
	public int insertQuestion(CompanyDataBean companyDto);
	List<CompanyDataBean> getQuestions(CompanyDataBean companyDto);
}
