package com.onlyhisson.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onlyhisson.DTO.PrayListVO;
import com.onlyhisson.DTO.ReligionChVO;

@Repository
public class ReligionChDAOImpl implements ReligionChDAO{
	
	@Autowired
	private SqlSession sqlSession;

	private static final String Namespace = "com.onlyhisson.mappers.religionChMapper";
	
	@Override
	public int insertReCh(ReligionChVO rech) throws Exception {
		return sqlSession.insert(Namespace + ".insertReligionCh", rech);
	}
	
	@Override
	public List<ReligionChVO> selectReChList(String str) throws Exception{
		
		return sqlSession.selectList(Namespace + ".selectOneReCh1", str);
	}
	
	@Override
	public int selectReChList(ReligionChVO rech) throws Exception{
		return sqlSession.selectOne(Namespace + ".selectOneReCh2", rech);
	}
	
	@Override
	public int deleteReCh2(ReligionChVO rech) throws Exception {
		return sqlSession.delete(Namespace + ".deleteReCh2", rech);
	}
	
	@Override
	public int insertPrayList(PrayListVO pl) throws Exception {
		return sqlSession.insert(Namespace + ".insertPrayList", pl);
	}
	
	@Override
	public int selectPrayListOne(PrayListVO pl) throws Exception {
		return sqlSession.selectOne(Namespace + ".selectPrayListOne", pl);
	}
	
	@Override 
	public int updatePrayListOne(PrayListVO pl) throws Exception {
		return sqlSession.update(Namespace + ".updatePrayListOne", pl);
	}
	
	@Override
	public List<PrayListVO> selectPrayList(String str) throws Exception {
		
		return sqlSession.selectList(Namespace + ".selectPrayList", str);
	}
}
