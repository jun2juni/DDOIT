package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.NoticeVo;
import kr.or.ddoit.vo.ProdVo;

public class NoticeDaoImpl extends MybatisDao implements INoticeDao {
	
	private static NoticeDaoImpl instance;

	private NoticeDaoImpl() {

	}

	public static NoticeDaoImpl getInstance() {
		if (instance == null) {
			instance = new NoticeDaoImpl();
		}

		return instance;
	}

	@Override
	public List<NoticeVo> noticeList() {
		// TODO Auto-generated method stub
		return selectList("notice.noticeList");
	}

	@Override
	public int noticeInsert(NoticeVo vo) {
		// TODO Auto-generated method stub
		return update("notice.noticeInsert", vo);
	}

	@Override
	public NoticeVo noticeDetail(NoticeVo vo) {
		// TODO Auto-generated method stub
		return selectOne("notice.noticeDetail", vo);
	}

	@Override
	public void noticeDelete(int boardNo) {
		// TODO Auto-generated method stub
		selectOne("notice.noticeDelete", boardNo);
	}

	@Override
	public int noticeUpdate(NoticeVo vo) {
		// TODO Auto-generated method stub
		return update("notice.noticeUpdate", vo);
	}

	@Override
	public List<NoticeVo> getNoticesByType(String boardType) {
		// TODO Auto-generated method stub
		return selectList("notice.noticeType", boardType);
	}
															

}
