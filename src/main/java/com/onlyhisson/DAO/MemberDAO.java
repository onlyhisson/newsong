package com.onlyhisson.DAO;

import java.util.HashMap;
import java.util.List;

import com.onlyhisson.DTO.MemberVO;

public interface MemberDAO {

	public List<MemberVO> selectMembers() throws Exception;
	public MemberVO selectMember(String str) throws Exception;
	public int insertMember(HashMap<String, Object> params) throws Exception;
	public int updateMember(HashMap<String, Object> params) throws Exception;
	public int createAuthKey(HashMap<String, Object> params) throws Exception;
	public int authMember(HashMap<String, Object> params) throws Exception;
	public int putMemberAccLv(HashMap<String, Object> params) throws Exception;
	public int resetPassword(HashMap<String, Object> params) throws Exception;
	
}
