package com.onlyhisson.controllers;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.onlyhisson.DTO.PrayListVO;
import com.onlyhisson.DTO.ReligionChVO;
import com.onlyhisson.common.UserInfoSession;
import com.onlyhisson.service.ReligionChService;

@Controller
public class ReligionChController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReligionChController.class);
	
	@Autowired
	private ReligionChService service; 
	
	@Inject
	Provider<UserInfoSession> provider;
	
	@RequestMapping(value = "/religionCh.do", method = RequestMethod.GET)
	public String religionCheck(Model model) throws Exception {
		logger.info("religion check page");
		
		/* session scope bean */
		UserInfoSession sessionUser = provider.get();
		String userEmail = sessionUser.getEmail();
		
		/* 이전 데이터 조회 후 view 전달 */
		List<ReligionChVO> religionChList = service.selectReChList(userEmail);
		model.addAttribute("religionChList", religionChList);
		
		return "menu/religion_check";
	}
	
	@RequestMapping(value="/insertReCh.do", method = RequestMethod.POST)
	//public String insertReligionCheck (@RequestParam("pray_list") String prayList, ReligionChVO params) throws Exception {
	public String insertReligionCheck (ReligionChVO params1, PrayListVO params2) throws Exception {
		
		logger.info("insert religion check");	
		
		/* session scope bean */
		UserInfoSession sessionUser = provider.get();
		String userEmail = sessionUser.getEmail();
		params1.setEmail(userEmail);
		params2.setEmail(userEmail);
		
		/* 입력한 파라미터 값 중에서 이메일, 날짜 값이 없을 때 에러 처리 */
		
		/* 예배 경건 생활 체크 */
		/* 복수의 데이터가 입력되지 않는 로직일때 update가 더 나은 방법인가? 복수의 데이터가 존재할 때는 다 삭제하는 방법이 나을 듯 */
		int num1 = service.selectReChList(params1);
		if(num1 > 0)
			service.deleteReCh2(params1);
		service.insertReCh(params1);
		
		/* 기도제목 입력 */
		if(!"".equals(params2.getPray_list())){
			int num2 = service.selectPrayListOne(params2);
			if(num2 > 0)
				service.updatePrayListOne(params2);
			else
				service.insertPrayList(params2);
		}
			
		/* 입력한 날짜가 토요일이 아닐 때 처리 */
		
		return "redirect:/religionCh.do";
	}
	
	/* 사용자 기도제목 목록 */
	@RequestMapping(value = "/prayList.do", method = RequestMethod.GET)
	public String prayListPage(Model model) throws Exception {
		
		logger.info("pray list page");
		
		/* session scope bean */
		UserInfoSession sessionUser = provider.get();
		String userEmail = sessionUser.getEmail();
		
		List<PrayListVO> userPraylist = service.selectPrayList(userEmail);
		model.addAttribute("userPraylist", userPraylist);
		
		return "menu/pray_list";
	}

}
