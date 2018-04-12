package com.onlyhisson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlyhisson.DAO.ReligionChDAO;
import com.onlyhisson.DTO.PrayListVO;
import com.onlyhisson.DTO.ReligionChVO;

@Service
public class ReligionChServiceImpl implements ReligionChService {

	@Autowired
	private ReligionChDAO dao;

	@Override
	public int insertReCh(ReligionChVO rech) throws Exception {
		return dao.insertReCh(rech);
	}

	@Override
	public List<ReligionChVO> selectReChList(String str) throws Exception {
		return dao.selectReChList(str);
	}

	@Override
	public int selectReChList(ReligionChVO rech) throws Exception {
		return dao.selectReChList(rech);
	}
	
	@Override
	public int deleteReCh2(ReligionChVO rech) throws Exception {
		return dao.deleteReCh2(rech);
	}
	
	@Override
	public int insertPrayList(PrayListVO pl) throws Exception {
		return dao.insertPrayList(pl);
	}
	
	@Override
	public int selectPrayListOne(PrayListVO pl) throws Exception {
		return dao.selectPrayListOne(pl);
	}
	
	@Override
	public int updatePrayListOne(PrayListVO pl) throws Exception {
		return dao.updatePrayListOne(pl);
	}
	
	@Override
	public List<PrayListVO> selectPrayList(String str) throws Exception {
		return dao.selectPrayList(str);
	}
}
