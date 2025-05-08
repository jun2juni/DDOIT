package kr.or.ddoit.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.MemberVo;

public class RegiMemberDaoImpl extends MybatisDao implements IRegiMemberDao{
	// 싱글톤
	private static RegiMemberDaoImpl instance;

	private RegiMemberDaoImpl() {
	}

	public static RegiMemberDaoImpl getInstance() {
		if (instance == null) {
			synchronized (RegiMemberDaoImpl.class) {
				if (instance == null) {
					instance = new RegiMemberDaoImpl();
				}
			}
		}
		return instance;
	}
	
	// 회원 등록
	@Override
	public int insertMember(MemberVo memVo) {
		//회우언 등록 성공하면 1반환 아니면 0
		return insert("member.insertMember", memVo);
	}
	
	
	// 중복 체크
	@Override
	public boolean idDuplicationCheck(String memId) {
			
		int result = selectOne("member.idDuplicationCheck", memId);
		
		if(result != 0) {
			// 아이디 중복되면 트루반환
			return true;
		}
		
		return false;
	}
	
	// 중복 체크
		@Override
		public boolean nickNameDuplicationCheck(String memNickname) {
				
			int result = selectOne("member.nickNameDuplicationCheck", memNickname);
			
			if(result != 0) {
				// 닉네임 중복되면 트루반환
				return true;
			}
			
			return false;
		}
	
	
	
}
