package com.onlyhisson.controllers;

import java.util.HashMap;
import java.util.Iterator;

import javax.inject.Inject;
import javax.inject.Provider;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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

	@Inject
	private JavaMailSender mailSender;

	/* 로그인 승인 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String submitLogin(MemberVO member, Model model) throws Exception {
		/*
		 * public String submitLogin(@RequestParam(value = "id", required = true) String
		 * id,
		 * 
		 * @RequestParam(value = "password", required = true) String password) throws
		 * Exception {
		 */
		MemberVO userInfo;

		/* 해당 이메일 값으로 DB 데이터 호출 가능 여부 */
		try {
			userInfo = service.selectMember(member.getEmail());
		} catch (Exception e) {
			model.addAttribute("errorMsg", "DB connection error.");
			return "error/error";
		}

		/* 로그인 아이디값 유무 판별 */
		if (CommonUtil.isEmpty(userInfo) || !member.getPw().equals(userInfo.getPw())) {
			model.addAttribute("indexPopMsg", "입력하신 이메일이 존재하지 않거나 비밀번호가 일치하지 않습니다.");
			return "index";
		}

		if (member.getPw().equals(userInfo.getPw())) {
			/* 회원가입은 완료 했으나 이메일 인증을 완료하지 않은 경우 */
			if(CommonUtil.isEmpty(userInfo.getAcc_lv())) {
				model.addAttribute("indexPopMsg", "이메일 인증 후 로그인 하세요.");
				return "index";
			}
				
			service.login(member.getEmail());
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

	/* 회원 가입 데이터 입력 */
	@RequestMapping(value = "/permitJoin.do", method = RequestMethod.POST)
	public String permitJoin(@RequestParam HashMap<String, Object> params, HttpServletRequest request, Model model) {

		String memberBirth = params.get("year").toString() 
				+ params.get("month").toString()
				+ params.get("day").toString();
		
		params.put("url", request.getRequestURL().toString());
		params.put("age", memberBirth);
		
		/* 누락된 정보 입력시 */
		Iterator<String> keys = params.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			if (params.get(key) == null || "".equals(params.get(key))) {
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
			if (service.selectMember(params.get("email").toString()) != null) {
				model.addAttribute("indexPopMsg", "아이디 중복");
				return "index";
			}
			/* 데이터 입력 */
			service.insertMember(params);
			/* 성공 여부 팝업 노출 */
			model.addAttribute("indexPopMsg", "회원가입 완료");
		} catch (Exception e) {
			model.addAttribute("indexPopMsg", "회원가입 실패");
		}
		return "index";
	}

	/* 회원 정보 수정 페이지 */
	@RequestMapping(value = "/profile-update.do", method = RequestMethod.GET)
	public String registerPage(Model model) throws Exception {
		return "menu/profile_update";
	}

	/* 회원 정보 수정 submit */
	@RequestMapping(value = "/profileChange.do", method = RequestMethod.POST)
	public String profileChange(@RequestParam HashMap<String, Object> params) throws Exception {

		/* session scope bean */
		UserInfoSession sessionUser = provider.get();
		String userEmail = sessionUser.getEmail();

		String memberBirth = params.get("year").toString() + params.get("month").toString()
				+ params.get("day").toString();
		params.put("age", memberBirth);

		/* 데이터 update */
		if (service.selectMember(userEmail) == null) {
			return "error/error";
		}
		service.updateMember(params);

		/* change session userinfo */
		service.login(userEmail);

		return "redirect:religionCh.do";
	}
	
	/* 이매일 인증 */
	@RequestMapping(value="/confirmAuthKey.do", method = RequestMethod.GET)
	public String confirmAuthKey(@RequestParam HashMap<String, Object> params, Model model) throws Exception {
		/* 
		 * 인증키 확인 완료하면 
		 * 인증 컬럼 값 제거 후 권한에 값을 채운 후
		 * 로그인 상태로 전환 
		 */
		
		params.put("email", params.get("user_email").toString());
		params.put("auth_code", params.get("key").toString());
		
		if(service.authMember(params) > 0)
			model.addAttribute("indexPopMsg", "이메일 인증 완료.");
		else
			model.addAttribute("indexPopMsg", "이메일 인증 실패");
		
		return "index";
	}
	
	/* 비밀번호 분실시 이동 페이지 */
	@RequestMapping(value="/forgotPassword.do", method = RequestMethod.GET)
	public String forgotPassword() throws Exception {
		return "menu/forgot-password";
	}

	/* 비밀번호 분실시 메일 보내기 */
	@RequestMapping(value="/resetPassword.do", method = RequestMethod.POST)
	public String resetPassword(@RequestParam HashMap<String, Object> params, Model model) throws Exception {
		MemberVO user = service.selectMember(params.get("email").toString());
		
		if(!CommonUtil.isEmpty(user))
			service.resetPassword(params);
		model.addAttribute("indexPopMsg", "임의 변경된 비밀번호 이메일 발송 완료.");

		return "index";
	}
}
