package com.onlyhisson.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onlyhisson.DTO.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String Namespace = "com.onlyhisson.mappers.memberMapper";

	@Override
	public List<MemberVO> selectMembers() throws Exception {
		return sqlSession.selectList(Namespace + ".selectMembers");
	}

	@Override
	public MemberVO selectMember(String str) throws Exception {
		return sqlSession.selectOne(Namespace + ".selectMember", str);
	}

	@Override
	public int insertMember(HashMap<String, Object> params) throws Exception {
		return sqlSession.insert(Namespace + ".insertMember", params);
	}
	
	@Override
	public int updateMember(HashMap<String, Object> params) throws Exception {
		return sqlSession.update(Namespace + ".updateMember", params);
	}
	
	@Override
	public int createAuthKey(HashMap<String, Object> params) throws Exception {
		return sqlSession.update(Namespace + ".putAuthKey", params);
	}
	
	@Override
	public int authMember(HashMap<String, Object> params) throws Exception {
		return sqlSession.selectOne(Namespace + ".authMember", params);
	}
	
	@Override
	public int putMemberAccLv(HashMap<String, Object> params) throws Exception {
		return sqlSession.update(Namespace + ".putAccLv", params);
	}
	
	@Override 
	public int resetPassword(HashMap<String, Object> params) throws Exception {
		return sqlSession.update(Namespace + ".resetPassword", params);
	}
}
