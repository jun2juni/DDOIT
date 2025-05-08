package kr.or.ddoit.dao;

import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ProfileVo;

public class ProfileDaoImpl extends MybatisDao implements IProfileDao {
	/* Singleton */
	private static ProfileDaoImpl instance;

	private ProfileDaoImpl() {

	}

	public static ProfileDaoImpl getInstance() {

		if (instance == null) {

			instance = new ProfileDaoImpl();

		}

		return instance;

	}

	// 프로필 조회
	@Override
	public ProfileVo profileView(int memNo) {
		return selectOne("profile.profileView", memNo);
	}

	// 닉네임 수정
	@Override
	public void nicknameEdit(MemberVo nickname) {
		update("profile.nicknameEdit", nickname);
	}

	// 프로필 수정
	@Override
	public void profileEdit(ProfileVo profile) {
		update("profile.profileEdit", profile);
	}

}
