package com.onlyhisson.DAO;

import java.util.List;

import com.onlyhisson.DTO.PrayListVO;
import com.onlyhisson.DTO.ReligionChVO;

public interface ReligionChDAO {
	public int insertReCh(ReligionChVO rech) throws Exception;
	public List<ReligionChVO> selectReChList(String str) throws Exception;
	public int selectReChList(ReligionChVO rech) throws Exception;
	public int deleteReCh2(ReligionChVO rech) throws Exception;
	public int insertPrayList(PrayListVO pl) throws Exception;
	public int selectPrayListOne(PrayListVO pl) throws Exception;
	public int updatePrayListOne(PrayListVO pl) throws Exception;
	public List<PrayListVO> selectPrayList(String str) throws Exception;
}
