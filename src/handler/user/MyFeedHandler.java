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
		
		
		// 피드에 표시하기 위한 변수들
		String[] personality = {"활동적인", "배려있는", "센스있는", "통찰력있는",
                "이성적인", "감성적인", "도전적인", "안정적인"};
		String[] hobby = {"사진찍기", "여행다니기", "책읽기", "게임",
					"음악", "기계만지기", "레저활동", "운동"};
		String[] forMan = {"청순한 여자", "건강한 여자", "도도한 여자", "나쁜 여자",
					"섹시한 여자", "매력있는 여자", "감성적인 여자", "운동하는 여자"};
		String[] forWomen = {"감성적인 남자", "지적인 남자", "유머있는 남자", "나쁜 남자",
				"야수같은 남자", "매력있는 남자", "센스있는 남자", "운동하는 남자"};
		String[] folder_name = new String[3];
		
		// 내 피드 정보 불러오기용 변수들
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
