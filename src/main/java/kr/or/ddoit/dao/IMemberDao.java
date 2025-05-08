package kr.or.ddoit.dao;

import kr.or.ddoit.vo.MemberVo;

public interface IMemberDao {
	public MemberVo login(MemberVo member);
	public MemberVo getMember(MemberVo member);
	public MemberVo loginIdFind(MemberVo member);
	public MemberVo loginPassFind(MemberVo member);
	public int updateMember(MemberVo member);
}
