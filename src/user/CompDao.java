package user;

import java.util.List;

import user.CompanyDataBean;

//query�뒗 user.xml�뿉�꽌 �넻�빀�슫�슜
public interface CompDao {
	
	public int insertQuestion(CompanyDataBean companyDto);
	List<CompanyDataBean> getQuestions(CompanyDataBean companyDto);
	public CompanyDataBean checkCo(String co_name);
}
