package kr.or.ddoit.service;

import kr.or.ddoit.dao.IProfileDao;
import kr.or.ddoit.dao.ProfileDaoImpl;
import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ProfileVo;

public class ProfileServiceImpl extends MybatisDao implements IProfileService {
	/* Singleton */
	private static ProfileServiceImpl instance;

	private ProfileServiceImpl() {

	}

	public static ProfileServiceImpl getInstance() {

		if (instance == null) {

			instance = new ProfileServiceImpl();
		}
		return instance;
	}
	
	IProfileDao profileDao = ProfileDaoImpl.getInstance();

	// 프로필 조회
	@Override
	public ProfileVo profileView(int memNo) {
		return profileDao.profileView(memNo);
	}

	// 프로필 수정
	@Override
	public void profileEdit(ProfileVo profileVo) {
		 profileDao.profileEdit(profileVo);
	}

	// 닉네임수정
	@Override
	public void nicknameEdit(MemberVo nickname) {
		profileDao.nicknameEdit(nickname);
	}

}
