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
public class FriendFeedHandler implements CommandHandler {
	
	@Resource
	MemberDao memberDao;
	
	@Resource
	SurveyDao surveyDao;
	
	@Resource
	FrDao frDao;
	
	@RequestMapping("/friendFeed")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("Friend");
		int gender_type = 0;
		String[] personality = {"�솢�룞�쟻�씤", "諛곕젮�엳�뒗", "�꽱�뒪�엳�뒗", "�넻李곕젰�엳�뒗",
                "�씠�꽦�쟻�씤", "媛먯꽦�쟻�씤", "�룄�쟾�쟻�씤", "�븞�젙�쟻�씤"};
		String[] hobby = {"�궗吏꾩컢湲�", "�뿬�뻾�떎�땲湲�", "梨낆씫湲�", "寃뚯엫",
					"�쓬�븙", "湲곌퀎留뚯�湲�", "�젅���솢�룞", "�슫�룞"};
		String[] forMan = {"泥��닚�븳 �뿬�옄", "嫄닿컯�븳 �뿬�옄", "�룄�룄�븳 �뿬�옄", "�굹�걶 �뿬�옄",
					"�꽮�떆�븳 �뿬�옄", "留ㅻ젰�엳�뒗 �뿬�옄", "媛먯꽦�쟻�씤 �뿬�옄", "�슫�룞�븯�뒗 �뿬�옄"};
		String[] forWomen = {"媛먯꽦�쟻�씤 �궓�옄", "吏��쟻�씤 �궓�옄", "�쑀癒몄엳�뒗 �궓�옄", "�굹�걶 �궓�옄",
				"�빞�닔媛숈� �궓�옄", "留ㅻ젰�엳�뒗 �궓�옄", "�꽱�뒪�엳�뒗 �궓�옄", "�슫�룞�븯�뒗 �궓�옄"};
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
		
		return new ModelAndView("/user/friendFeed");
	}

}
