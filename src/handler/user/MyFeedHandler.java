package handler.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;
import survey.SurveyDao;
import user.FrDao;

@Controller
public class MyFeedHandler implements CommandHandler {

	@Resource
	MemberDao memberDao;
	
	@Resource
	SurveyDao surveyDao;
	
	@Resource
	FrDao frDao;
	
	@RequestMapping("/myFeed")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memId");
		int gender_type = 0;
		
		
		String[] personality = {"활동적인", "배려있는", "센스있는", "통찰력있는",
                "이성적인", "감성적인", "도전적인", "안정적인"};
		String[] hobby = {"사진찍기", "여행다니기", "책읽기", "게임",
					"음악", "기계만지기", "레저활동", "운동"};
		String[] forMan = {"청순한여자", "건강한여자", "도도한여자", "나쁜여자",
					"섹시한여자", "매력있는여자", "감성적인여자", "운동하는여자"};
		String[] forWomen = {"감성적인남자", "지적인남자", "유머있는남자", "나쁜남자",
				"야수같은남자", "매력있는남자", "센스있는남자", "운동하는남자"};
		String[] folder_name = new String[3];
		
		MemberDataBean memberDto = memberDao.getMember(id);
		List<Integer> feed_type = new ArrayList<Integer>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> selectList = new ArrayList<Integer>();
		List<String> friendList = new ArrayList<String>();
		
		folder_name[0] = "feed_personality";
		folder_name[1] = "feed_hobby";
		feed_type.add(1);
		feed_type.add(2);
		if(memberDto.getGender() == 1) {
			gender_type = 3;
			folder_name[2] = "feed_forMan";
			map.put("sexual", forMan);
			feed_type.add(3);
		} else if(memberDto.getGender() == 2) {
			gender_type = 4;
			folder_name[2] = "feed_forWomen";
			map.put("sexual", forWomen);
			feed_type.add(4);
		}
		
		
		
		map.put("id", id);
		map.put("feed_type", feed_type);

		selectList = surveyDao.getMyFeed(map);
		friendList = frDao.getRealFrBtn(id);
		
		
		map.put("selectList", selectList);
		map.put("friendList", friendList);
		map.put("gender_type", gender_type);
		map.put("personality", personality);
		map.put("hobby", hobby);
		map.put("folder_name", folder_name);
//		System.out.println("map : " + map);
		request.setAttribute("map", map);
		
		return new ModelAndView("/user/myFeed");
	}

}
