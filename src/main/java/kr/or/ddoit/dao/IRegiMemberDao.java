package kr.or.ddoit.dao;

import kr.or.ddoit.vo.MemberVo;

public interface IRegiMemberDao {
	
	//회원 등록
	public int insertMember(MemberVo memVo);
	// 아이디 중복체크
	public boolean idDuplicationCheck(String memId);
	// 닉네임 중복체크
	public boolean nickNameDuplicationCheck(String memNickname);
}
