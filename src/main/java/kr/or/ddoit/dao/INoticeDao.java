package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.vo.NoticeVo;

public interface INoticeDao {
	public List<NoticeVo> noticeList();
	
	public int noticeInsert(NoticeVo vo);
	
	public NoticeVo noticeDetail(NoticeVo vo);
	
	public void noticeDelete(int boardNo);
	
	public int noticeUpdate(NoticeVo vo);
	
	List<NoticeVo> getNoticesByType(String boardType);
	
}