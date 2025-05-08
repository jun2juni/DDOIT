package kr.or.ddoit.controller;

import java.io.IOException;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddoit.service.IPostService;
import kr.or.ddoit.service.PostService;
import kr.or.ddoit.vo.CommentsVo;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ReplyVo;

@WebServlet("/debugReplyInsert.do")
public class DebugReplyInsertController extends HttpServlet{
	IPostService postService = PostService.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("debugReplyInsert.do post요청");
		String data = StreamData.dataChange(req);
		JSONObject jsonObject = new JSONObject(data);
		String reqStr = jsonObject.getString("reqStr");
		HttpSession session = req.getSession(false);
		MemberVo memVo = (MemberVo)session.getAttribute("memVo");
		int memNo = memVo.getMemNo();
		
		CommentsVo commentVo = new CommentsVo();
		int result = 0;
		if(reqStr.equals("insert")) {
			int postNo = jsonObject.getInt("postNo");
			int replyNo = jsonObject.getInt("replyNo");
			commentVo.setPostNo(postNo);
			if(replyNo !=0 ) {
				// db에 0넣으면 부모키 없다고 에러남.
				commentVo.setReplyNo(replyNo);
			}
			String content = jsonObject.getString("content");
			commentVo.setMemNo(memNo);
			commentVo.setContent(content);
//		System.out.println("======================================================commentVo :" + commentVo);
			result = postService.commentInsert(commentVo);
		}else if(reqStr.equals("update")) {
			int commentNo = jsonObject.getInt("commentNo");
			commentVo.setCommentNo(commentNo);
			String content = jsonObject.getString("content");
			commentVo.setContent(content);
			result = postService.commentUpdate(commentVo);
		}else if(reqStr.equals("delete")) {
			int commentNo = jsonObject.getInt("commentNo");
			commentVo.setCommentNo(commentNo);
			
			result = postService.commentDelete(commentVo);
		}
		
		
		
		JSONObject jsonResponse = new JSONObject();
		if(result > 0){
			jsonResponse.put("status", "success");
			jsonResponse.put("message", "댓글이 성공적으로 저장되었습니다.");
			}else{
				jsonResponse.put("status", "error");
				jsonResponse.put("message", "댓글 저장에 실패했습니다.");
			}
		// 응답 설정
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(jsonResponse.toString());
	}
}
