package handler.user;

import java.sql.Timestamp;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import user.CompDao;
import user.CompanyDataBean;

@Controller
public class AskCompProHandler implements CommandHandler {
	@Resource
	private CompDao compDao;
	@RequestMapping("/askCompPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		CompanyDataBean companyDto = new CompanyDataBean();	
	
	


	int a_num = 0;
	String co_email = request.getParameter("co_email");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String a_name = request.getParameter("a_name");
	String co_name = request.getParameter("co_name");
	String co_title = request.getParameter("co_title");
	String co_content = request.getParameter("co_content");
	String co_type = request.getParameter("co_type");
	
	int co_read = 0;
	String w_date =request.getParameter("w_date");
	
	// email split
	if( ! email1.equals( "" ) ) {
		if( email2.equals( "0" ) ) {
			// 吏곸젒�엯�젰
			co_email = email1;
		} else {
			// �꽑�깮�엯�젰
			co_email = email1 + "@" + email2;
		}
	}
	
//	 email1 = co_email.split("")[0];
//	 email2 = co_email.split("")[1];
	int dupCd = 0;
	int len = 0;
	Random rand = new Random();
	int  co_code = 0; //�궃�닔媛� ���옣�맆 蹂��닔
    
    for(int i=0;i<len;i++) {
        
        //0~9 난수 생성
        int ran = rand.nextInt(10);
        
        if(dupCd==1) {
            // 중복되는 숫자를 검색/배제
       	 co_code += ran;
        }
        else if(dupCd==2) {
            // 
            if(!(co_code==(ran))) {
                //
           	 co_code += ran;
            }else {
                //
                i-=1;
            }
        }
    }
	companyDto.setA_num(a_num);
    companyDto.setCo_email(co_email);
    companyDto.setA_name(a_name);
    companyDto.setCo_name(co_name);
    companyDto.setCo_title(co_title);
	companyDto.setCo_content(co_content);
	companyDto.setCo_type(co_type);
	companyDto.setCo_code(co_code);
	companyDto.setCo_read(2);
	companyDto.setW_date(null);
//	companyDto.setW_date(new Timestamp(System.currentTimeMillis()));
	
	request.setAttribute("a_num", a_num);
	request.setAttribute("co_email",co_email);
	request.setAttribute("co_name", co_name);
	request.setAttribute("a_name", a_name);
	request.setAttribute("co_content", co_title);
	request.setAttribute("co_content", co_content);
	request.setAttribute("co_type", co_type);
//	request.setAttribute("co_code", co_code);
//	request.setAttribute("co_read", co_read);
//	request.setAttribute("w_date", w_date);
//	request.setAttribute("co_email", email2);

	
	int result = compDao.insertQuestion(companyDto);
	request.setAttribute("result", result);
	
	
		return new ModelAndView("company/askCompPro");
	}
}
