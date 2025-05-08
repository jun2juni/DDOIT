package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.vo.CommentsVo;
import kr.or.ddoit.vo.PaginationVo;
import kr.or.ddoit.vo.PostVo;
import kr.or.ddoit.vo.ReplyVo;

public interface IPostDao {
	
public List<PostVo> postList(PaginationVo<PostVo> pageVo);
	
	public int totalCount(PaginationVo<PostVo> pageVo);
	
	public PostVo postDetail(PostVo postVo);
	
	public int postInsert(PostVo postVo);
	
	public int postDelete(PostVo postVo);
	
	public int postUpdate(PostVo postVo);
	
	public int commentInsert(CommentsVo commentsVo);
	
	public int commentUpdate(CommentsVo commentsVo);
	
	public int commentDelete(CommentsVo commentsVo);
	
	
	public int postDelete(ReplyVo replyVo);
	
	public int superDeleteReply(ReplyVo replyVo);
	
	public int superDeleteComments(ReplyVo replyVo);

	
	public List<CommentsVo> comments(PostVo postVo);
	public List<ReplyVo> replyList(PostVo postVo);
	public ReplyVo accepted(PostVo postVo);
}
