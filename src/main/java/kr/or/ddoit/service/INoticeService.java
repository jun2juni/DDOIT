package kr.or.ddoit.service;

import java.util.List;

import kr.or.ddoit.vo.NoticeVo;
import kr.or.ddoit.vo.ProdVo;

public interface INoticeService {
	public List<NoticeVo> noticeList();
	
	public int noticeInsert(NoticeVo vo);
	
	public NoticeVo noticeDetail(NoticeVo vo);
	
	public void noticeDelete(int vo);
	
	public int noticeUpdate(NoticeVo vo);
	
	List<NoticeVo> getNoticesByType(String boardType);
	
}
