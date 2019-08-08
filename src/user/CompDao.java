package user;

import user.CompanyDataBean;

//query는 user.xml에서 통합운용
public interface CompDao {
	public int insertQuestion(CompanyDataBean compDto);
}
