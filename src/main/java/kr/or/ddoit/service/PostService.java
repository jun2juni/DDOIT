package kr.or.ddoit.service;

import java.util.List;

import kr.or.ddoit.dao.IPostDao;
import kr.or.ddoit.dao.PostDao;
import kr.or.ddoit.vo.CommentsVo;
import kr.or.ddoit.vo.PaginationVo;
import kr.or.ddoit.vo.PostVo;
import kr.or.ddoit.vo.ReplyVo;

public class PostService implements IPostService{
	/*Singleton*/
	private static PostService instance;

	private PostService() {

	}

	public static PostService getInstance() {

		if (instance == null) {

			instance = new PostService();

		}

		return instance;

	}

	IPostDao postDao = PostDao.getInstance();
	
	@Override
	public List<PostVo> postList(PaginationVo<PostVo> pageVo) {
		return postDao.postList(pageVo);
	}

	@Override
	public int totalCount(PaginationVo<PostVo> pageVo) {
		return postDao.totalCount(pageVo);
	}

	@Override
	public PostVo postDetail(PostVo postVO) {
		return postDao.postDetail(postVO);
	}

	@Override
	public int postInsert(PostVo postVO) {
		return postDao.postInsert(postVO);
	}

	@Override
	public int postDelete(PostVo postVO) {
		return 0;
	}

	@Override
	public int postUpdate(PostVo postVO) {
		return postDao.postUpdate(postVO);
	}

	
	
	@Override
	public List<CommentsVo> comments(PostVo postVo) {
		return postDao.comments(postVo);
	}

	@Override
	public List<ReplyVo> replyList(PostVo postVo) {
		return postDao.replyList(postVo);
	}

	@Override
	public ReplyVo accepted(PostVo postVo) {
		return postDao.accepted(postVo);
	}

	@Override
	public int commentInsert(CommentsVo commentsVo) {
		return postDao.commentInsert(commentsVo);
	}

	@Override
	public int commentUpdate(CommentsVo commentsVo) {
		return postDao.commentUpdate(commentsVo);
	}

	@Override
	public int commentDelete(CommentsVo commentsVo) {
		return postDao.commentDelete(commentsVo);
	}

	@Override
	public int postDelete(ReplyVo replyVo) {
		return postDao.postDelete(replyVo);
	}

	@Override
	public int superDeleteReply(ReplyVo replyVo) {
		return postDao.postDelete(replyVo);
	}

	@Override
	public int superDeleteComments(ReplyVo replyVo) {
		return postDao.postDelete(replyVo);
	}

}
