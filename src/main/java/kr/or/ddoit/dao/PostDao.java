package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.CommentsVo;
import kr.or.ddoit.vo.PaginationVo;
import kr.or.ddoit.vo.PostVo;
import kr.or.ddoit.vo.ReplyVo;

public class PostDao extends MybatisDao implements IPostDao{
	/*Singleton*/
	private static PostDao instance;

	private PostDao() {

	}

	public static PostDao getInstance() {

		if (instance == null) {

			instance = new PostDao();

		}

		return instance;

	}

	@Override
	public List<PostVo> postList(PaginationVo<PostVo> pageVo) {
		return selectList("post.postList", pageVo);
	}

	@Override
	public int totalCount(PaginationVo<PostVo> pageVo) {
		return selectOne("post.totalCount", pageVo);
	}

	@Override
	public PostVo postDetail(PostVo postVO) {
		return selectOne("post.postDetail", postVO);
	}

	@Override
	public int postInsert(PostVo postVO) {
		return insert("post.postInsert", postVO);
	}

	@Override
	public int postDelete(PostVo postVO) {
		return 0;
	}

	@Override
	public int postUpdate(PostVo postVO) {
		return update("post.postUpdate", postVO);
	}

	
	
	
	@Override
	public List<CommentsVo> comments(PostVo postVo) {
		return selectList("post.comments", postVo);
	}

	@Override
	public List<ReplyVo> replyList(PostVo postVo) {
		return selectList("post.replyList", postVo);
	}

	@Override
	public ReplyVo accepted(PostVo postVo) {
		return selectOne("post.accepted", postVo);
	}

	@Override
	public int commentInsert(CommentsVo commentsVo) {
		return insert("post.commentInsert", commentsVo);
	}

	@Override
	public int commentUpdate(CommentsVo commentsVo) {
		return update("post.commentUpdate", commentsVo);
	}

	@Override
	public int commentDelete(CommentsVo commentsVo) {
		return update("post.commentDelete", commentsVo);
	}

	
	@Override
	public int postDelete(ReplyVo replyVo) {
		return update("post.postDelete", replyVo);
	}

	@Override
	public int superDeleteReply(ReplyVo replyVo) {
		return update("post.superDeleteReply", replyVo);
	}

	@Override
	public int superDeleteComments(ReplyVo replyVo) {
		return update("post.superDeleteReply", replyVo);
	}

	

}
