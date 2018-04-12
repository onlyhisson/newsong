package com.onlyhisson.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlyhisson.DAO.MemberDAO;
import com.onlyhisson.DTO.MemberVO;
import com.onlyhisson.common.UserInfoSession;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Inject
	Provider<UserInfoSession> provider;
	
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
		return dao.insertMember(params);
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

}
