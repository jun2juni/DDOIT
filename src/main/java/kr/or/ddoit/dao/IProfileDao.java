package kr.or.ddoit.dao;

import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ProfileVo;

public interface IProfileDao {
	// 프로필 조회
	public ProfileVo profileView(int memNo);
	
	// 닉네임 수정
	public void nicknameEdit(MemberVo nickname);
	
	// 소개, 사진, 배경 수정
	public void profileEdit(ProfileVo profile);
}
