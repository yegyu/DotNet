package handler.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class FeedSurHandler implements CommandHandler {

	@RequestMapping("/feedSur")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int feed_type = Integer.parseInt(request.getParameter("feed_type"));
		String folder_name = null;
		String title = null;
		String[] personality = {"활동적인", "배려있는", "센스있는", "통찰력있는",
		                        "이성적인", "감성적인", "도전적인", "안정적인"};
		String[] hobby = {"사진찍기", "여행다니기", "책읽기", "게임",
							"음악", "기계만지기", "레저활동", "운동"};
		String[] forMan = {"청순한 여자", "건강한 여자", "도도한 여자", "나쁜 여자",
							"섹시한 여자", "매력있는 여자", "감성적인 여자", "운동하는 여자"};
		String[] forWomen = {"감성적인 남자", "지적인 남자", "유머있는 남자", "나쁜 남자",
								"야수같은 남자", "매력있는 남자", "센스있는 남자", "운동하는 남자"};
		String[] content = new String[8];
		
		switch(feed_type) {
		case 1 : folder_name = "feed_personality"; title = "당신과 가장 비슷한 성격을 골라주세요!";
				content = personality; break;
		case 2 : folder_name = "feed_hobby"; title = "당신의 취미는 무엇인가요? "; 
				content = hobby; break;
		case 3 : folder_name = "feed_forMan"; title = "당신의 이상형은?";
				content = forMan; break;
		case 4 : folder_name = "feed_forWomen"; title = "당신의 이상형은?";
				content = forWomen; break;
		}
		
		request.setAttribute("title", title);
		request.setAttribute("folder_name", folder_name);
		request.setAttribute("content", content);
		request.setAttribute("feed_type", feed_type);
		
		return new ModelAndView("/user/feedSur");
	}

}
