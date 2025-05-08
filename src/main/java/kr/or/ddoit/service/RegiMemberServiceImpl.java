package kr.or.ddoit.service;

import kr.or.ddoit.dao.RegiMemberDaoImpl;
import kr.or.ddoit.vo.MemberVo;

public class RegiMemberServiceImpl implements IRegiMemberService{
	
	private static RegiMemberServiceImpl instance;

	private RegiMemberServiceImpl() {
	}

	public static RegiMemberServiceImpl getInstance() {
		if (instance == null) {
			synchronized (RegiMemberServiceImpl.class) {
				if (instance == null) {
					instance = new RegiMemberServiceImpl();
				}
			}
		}
		return instance;
	}
	
	private RegiMemberDaoImpl regiMemDao = RegiMemberDaoImpl.getInstance();
	
	@Override
	public int insertMember(MemberVo memVo) {
		
		// id 중복검사 후 등록 -> 로직 어디서 처리?
		
		return regiMemDao.insertMember(memVo);
	}
	
	@Override
	public boolean idDuplicationCheck(String memId) {
		// TODO Auto-generated method stub
		return regiMemDao.idDuplicationCheck(memId);
	}
	
	@Override
	public boolean nickNameDuplicationCheck(String memNickname) {
		// TODO Auto-generated method stub
		return regiMemDao.nickNameDuplicationCheck(memNickname);
	}
}
