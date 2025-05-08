package kr.or.ddoit.service;

import kr.or.ddoit.dao.MemberDaoImpl;
import kr.or.ddoit.vo.MemberVo;

public class MemberServiceImpl implements IMemberService{
	
	/*Singleton 싱글톤 : 새로 만들지 않고 기존의 인스턴스를 가져와 활용*/
	//MemberServiceImpl객체를 가져오기위해 만들었다.
	private static MemberServiceImpl instance;
	//생성자
	private MemberServiceImpl() {

	}

	public static MemberServiceImpl getInstance() {

		if (instance == null) {

			instance = new MemberServiceImpl();

		}

		return instance;

	}
	
	//dao메소드를 호출하기 위해서 dao객체가 필요하다.
	MemberDaoImpl  memberDao = MemberDaoImpl.getInstance();
	
	public MemberVo login(MemberVo member) {
		return memberDao.login(member);
	}
	public MemberVo getMember(MemberVo member) {
		return memberDao.getMember(member);
	}

	@Override
	public MemberVo loginIdFind(MemberVo member) {
		return memberDao.loginIdFind(member);
	}

	@Override
	public MemberVo loginPassFind(MemberVo member) {
		return memberDao.loginPassFind(member);
	}

	@Override
	public int updateMember(MemberVo member) {
		// TODO Auto-generated method stub
		return memberDao.update("memebr.noticeUpdate", member);
	}
}
