package kr.or.ddoit.dao;

import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.util.MybatisDao;

public class MemberDaoImpl extends MybatisDao implements IMemberDao{
	// 싱글톤패턴 : 객체를 매번 필요한곳에서 만드는것이 아니고
	// 필요한사람이 빌려가는것( 객체는 자기자신이 만든다.) get메소드를 이용해서 필요한 사람이 가져가는것
	// 한개의 서비스 다오를 자기자신이 생성한 객체를 여러명이서 공유하여 사용하는것
	private static MemberDaoImpl instance;
	
	
	private MemberDaoImpl() {
		
	}



	public static MemberDaoImpl getInstance() {
		if (instance == null) instance = new MemberDaoImpl();
		return instance;
	}


	
	public MemberVo login(MemberVo member) {
		return selectOne("login",member);
	}
	
	
	public MemberVo getMember(MemberVo member) {
		return selectOne("getMember",member);
	}



	@Override
	public MemberVo loginIdFind(MemberVo member) {
		return selectOne("loginIdFind",member);
	}



	@Override
	public MemberVo loginPassFind(MemberVo member) {
		return selectOne("loginPassFind",member);
	}



	@Override
	public int updateMember(MemberVo member) {
		// TODO Auto-generated method stub
		return update("memebr.noticeUpdate", member);
	}
}
