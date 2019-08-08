package dncommons;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import admin.AdminDBBean;
import admin.AdminDao;
import main.BoardDBBean;
import main.BoardDao;
import main.MemberDBBean;
import main.MemberDao;
import survey.SurveyDBBean;
import survey.SurveyDao;
import user.CompDao;
import user.FrDBBean;
import user.FrDao;
import user.MessageDBBean;
import user.MessageDao;



@Configuration
public class CreateBean {

	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setPrefix("");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	@Bean
	public MemberDao memberDao() {
		MemberDBBean memberDao = new MemberDBBean();
		return memberDao;
	}
	@Bean
	public SurveyDao surveyDao() {
		SurveyDBBean surveyDao = new SurveyDBBean();
		return surveyDao;
	}
	@Bean
	public BoardDao boardDao() {
		BoardDBBean boardDao = new BoardDBBean();
		return boardDao;
	}
	@Bean
	public MessageDao messageDao() {
		MessageDBBean messageDao = new MessageDBBean();
		return messageDao;
	}
	@Bean 
	public FrDao frDao() {
		FrDBBean frDao = new FrDBBean();
		return frDao;
	}
	@Bean
	public AdminDao adminDao() {
		AdminDBBean adminDao = new AdminDBBean();
		return adminDao;
	}
//	@Bean
//	public CompDao compDao() {
//		AdminDBBean compDao = new AdminDBBean();
//		return CompDao;
//	}
}










