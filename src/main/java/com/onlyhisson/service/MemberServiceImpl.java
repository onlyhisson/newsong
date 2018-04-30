package com.onlyhisson.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlyhisson.DAO.MemberDAO;
import com.onlyhisson.DTO.MemberVO;
import com.onlyhisson.common.MailHandler;
import com.onlyhisson.common.TempKey;
import com.onlyhisson.common.UserInfoSession;

@Service
public class MemberServiceImpl implements MemberService {
	
	String hostEmail = "newsong0405@gmail.com";

	@Autowired
	private MemberDAO dao;

	@Inject
	Provider<UserInfoSession> provider;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	public List<MemberVO> selectMembers() throws Exception {
		return dao.selectMembers();
	}

	@Override
	public MemberVO selectMember(String str) throws Exception{
		return dao.selectMember(str);
	}
	
	@Override
	public int insertMember(HashMap<String, Object> params) throws Exception {
		dao.insertMember(params);
		createAuthKey(params);
		return 1;
	}
	
	@Override
	public int updateMember(HashMap<String, Object> params) throws Exception {
		return dao.updateMember(params);
	}
	
	@Override
	public int login(String str) throws Exception {
		
		MemberVO member = dao.selectMember(str);
		
		/* session scope bean */
		UserInfoSession sessionUser = provider.get();
		sessionUser.setEmail(member.getEmail());
		sessionUser.setName(member.getName());
		sessionUser.setAge(member.getAge());
		sessionUser.setAcc_lv(member.getAcc_lv());
		
		return 1;
	}
	
	/* 회원 인증 확인 */
	@Transactional
	@Override
	public int authMember(HashMap<String, Object> params) throws Exception {
		/* 인증 확인 */
		dao.authMember(params);
		
		/* 사용자 권한 획득 & 인증키 삭제 */
		params.put("auth_code", null);
		params.put("acc_lv", "팀원");
		
		dao.putMemberAccLv(params);
		
		return 1;
	}
	
	/* 비밀번호 분실시 초기화 후 재발송 */
	@Override
	public int resetPassword(HashMap<String, Object> params) throws Exception {
		sendChangedPassword(params);
		
		return 1;
	}
	
	/* 회원인증 확인 메일 보내기 */
	public void createAuthKey(HashMap<String, Object> params) throws Exception {
		String userEmail = params.get("email").toString();
		String requestUrl = params.get("url").toString();
		String fromUrl = requestUrl.substring(0, requestUrl.indexOf("/newsong"));
		String key = new TempKey().getKey(50, false); // 인증키 생성
		
		params.put("auth_code", key);
		dao.createAuthKey(params);

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("NEWSONG J 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h3>메일인증</h3>")
				.append("<a href='"+ fromUrl + "/newsong/confirmAuthKey.do?user_email=").append(userEmail)
				.append("&key=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom(hostEmail, "NEWSONG J 관리자");
		sendMail.setTo(userEmail);
		sendMail.send();
	}
	
	/* 초기화된 비밀번호 이메일 전송 */
	public void sendChangedPassword(HashMap<String, Object> params) throws Exception {
		String userEmail = params.get("email").toString();
		String key = new TempKey().getKey(10, false); // 인증키 생성
		
		params.put("pw", key);
		dao.resetPassword(params);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("NEWSONG J 비밀번호 재발송");
		sendMail.setText(new StringBuffer().append("<h3>새 비밀번호</h3>").append(key).toString());
		sendMail.setFrom(hostEmail, "NEWSONG J 관리자");
		sendMail.setTo(userEmail);
		sendMail.send();
	}
	
}
