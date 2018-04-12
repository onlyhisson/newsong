package com.onlyhisson.controllers;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import javax.inject.Inject;
import javax.inject.Provider;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlyhisson.DTO.MemberVO;
import com.onlyhisson.common.CommonUtil;
import com.onlyhisson.common.UserInfoSession;
import com.onlyhisson.service.MemberService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MemberService service;
	
	@Inject
	Provider<UserInfoSession> provider;
	
	/* 로그인 승인 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String submitLogin(MemberVO member, Model model) throws Exception {
		/*
		 * public String submitLogin(@RequestParam(value = "id", required = true) String id,
		 * @RequestParam(value = "password", required = true) String password) throws Exception {
		 */
		logger.info("login");

		MemberVO userInfo;
		try {
			userInfo = service.selectMember(member.getEmail());
		} catch (Exception e) {
			/* web.xml 에서 에러페이지 설정 해놔서 아래 코드 삭제 가능할듯 */
			model.addAttribute("errorMsg", "DB connection error.");
			return "error/error";
		}

		/* 로그인 아이디값 유무 판별 */
		if (CommonUtil.isEmpty(userInfo)) {
			model.addAttribute("errorMsg", "입력하신 이메일이 존재하지 않거나 비밀번호가 일치하지 않습니다.");
			return "error/error";
		}

		if (member.getPw().equals(userInfo.getPw())) {
			service.login(member.getEmail());
			//sessionValuesShow(session);

			return "redirect:religionCh.do";
		}

		return "error/error";
	}

	/* 로그 아웃 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) throws Exception {
		logger.info("login_out");
		session.invalidate();

		return "index";
	}

	/* 회원 가입 */
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() throws Exception {

		logger.info("join");

		return "join";
	}

	/* 회원 가입 데이터 입력 */
	@RequestMapping(value = "permitJoin.do", method = RequestMethod.POST)
	public String permitJoin(@RequestParam HashMap<String, Object> params, Model model) {

		logger.info("permit join");
		
		String memberBirth = params.get("year").toString()
							+ params.get("month").toString() 
							+ params.get("day").toString();
		params.put("age", memberBirth);
		
		/* 누락된 정보 입력시 */
		Iterator<String> keys = params.keySet().iterator();
		while(keys.hasNext()) {
			String key = (String)keys.next();
			if(params.get(key) == null || "".equals(params.get(key))) {
				model.addAttribute("errorMsg", key + "을(를) 입력하세요.");
				return "error/error";
			}
		}

		/* 패스워드 체크 오류시 */
		if (!params.get("password").equals(params.get("pw_ch"))) {
			model.addAttribute("errorMsg", "비밀번호를 다시 입력해주세요.");
			return "error/error";
		}
		
		try {
			/* 가입 이메일 주소 중복시 */
			if(service.selectMember(params.get("email").toString()) != null) {
				model.addAttribute("errorMsg", "아이디 중복");
				return "error/error";
			}
			/* 데이터 입력 */
			service.insertMember(params);
		} catch (DuplicateKeyException dke) {
			model.addAttribute("errorMsg", "offend against data integrity");
			return "error/error";
		} catch (Exception e) {
		}

		return "index";
	}
	
	/* 회원 정보 수정 페이지 */
	@RequestMapping(value = "/profile-update.do", method = RequestMethod.GET)
	public String registerPage(Model model) throws Exception {
		logger.info("profile update page");
		
		return "menu/profile_update";
	}

	/* 회원 정보 수정 submit */
	@RequestMapping(value = "/profileChange.do", method = RequestMethod.POST)
	public String profileChange(@RequestParam HashMap<String, Object> params) throws Exception {
		
		/* session scope bean */
		UserInfoSession sessionUser = provider.get();
		String userEmail = sessionUser.getEmail();
		
		String memberBirth = params.get("year").toString()
							+ params.get("month").toString() 
							+ params.get("day").toString();
		params.put("age", memberBirth);
		
		/* 데이터 update */
		// if(service.selectMember(params.get("email").toString()) != null)
		if(service.selectMember(userEmail) == null) {
			return "error/error";
		}
		service.updateMember(params);
		
		/* change session userinfo */
		service.login(userEmail);
		
		return "redirect:religionCh.do";
	}
	
	
	// session 객체 키 값 출력
	public void sessionValuesShow(HttpSession session) {
		Enumeration<?> enumSession = session.getAttributeNames();
		while (enumSession.hasMoreElements()) {
			String name = (String) enumSession.nextElement();
			System.out.println("[[[session]]] " + name + " : " + session.getAttribute(name));
		}
	}
	
	/* 에러페이지 이동 처리 */
	public String moveErrorPage(String str) {
		return "";
	}
}
