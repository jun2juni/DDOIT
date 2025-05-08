package kr.or.ddoit.service;

import java.util.List;

import kr.or.ddoit.dao.INoticeDao;
import kr.or.ddoit.dao.NoticeDaoImpl;
import kr.or.ddoit.vo.NoticeVo;
import kr.or.ddoit.vo.ProdVo;

public class NoticeServiceImpl implements INoticeService {
	
	private static NoticeServiceImpl instance;

	private NoticeServiceImpl() {

	}

	public static NoticeServiceImpl getInstance() {
		if (instance == null) {
			instance = new NoticeServiceImpl();
		}

		return instance;
	}
	INoticeDao noticeDao = NoticeDaoImpl.getInstance();

	@Override
	public List<NoticeVo> noticeList() {
		// TODO Auto-generated method stub
		return noticeDao.noticeList();
	}

	@Override
	public int noticeInsert(NoticeVo vo) {
		// TODO Auto-generated method stub
		return noticeDao.noticeInsert(vo);
	}

	@Override
	public NoticeVo noticeDetail(NoticeVo vo) {
		// TODO Auto-generated method stub
		return noticeDao.noticeDetail(vo);
	}

	@Override
	public void noticeDelete(int boardNo) {
		// TODO Auto-generated method stub
		noticeDao.noticeDelete(boardNo);
	}

	@Override
	public int noticeUpdate(NoticeVo vo) {
		// TODO Auto-generated method stub
		return noticeDao.noticeUpdate(vo);
	}

	@Override
	public List<NoticeVo> getNoticesByType(String boardType) {
		// TODO Auto-generated method stub
		return noticeDao.getNoticesByType(boardType);
	}
	

}

