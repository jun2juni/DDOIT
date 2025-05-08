package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
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
import kr.or.ddoit.vo.PostVo;
import kr.or.ddoit.vo.ReplyVo;

@WebServlet("/debugDetail.do")
public class DebugDetailController extends HttpServlet{
	IPostService postService = PostService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("debugDetail.do get요청 ");////
		HttpSession session = req.getSession(false);
		MemberVo memVo = (MemberVo)session.getAttribute("memVo");
		
//		postVo 꺼내기 (boardNo 정보 갖고 있음 boardNo = 3)
		PostVo postVo = (PostVo)session.getAttribute("postVo"); 
		System.out.println(postVo);////
		String postNoStr = req.getParameter("postNo");
		int postNo = Integer.parseInt(postNoStr);
		System.out.println(postNo);////
		
//		postVo에 postNo 저장
		postVo.setPostNo(postNo); //
		System.out.println("postVo : " + postVo);////
		
		postVo = postService.postDetail(postVo);
		System.out.println("postVo : " + postVo);////
		List<CommentsVo> comments = postService.comments(postVo);
		System.out.println("comments : " + comments);////
		List<ReplyVo> replyList = postService.replyList(postVo);
		System.out.println("reply : " + replyList);////
		ReplyVo accepted = postService.accepted(postVo);
		System.out.println("accepted : " + accepted);////
		
		postVo.setComments(comments);
		postVo.setReplyList(replyList);
		postVo.setAccepted(accepted);
		// 세션에 post정보 저장
		System.out.println("detail postVo : " + postVo);////
		session.setAttribute("postVo", postVo);
		
		req.setAttribute("postVo", postVo);
		// memVo에는 현재 접속중인 사용자 정보가 들어있고 이것으로 사용자와 작성자가 같은지 비교한다.
		req.setAttribute("memVo", memVo);
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/debugging/debugDetail.jsp").forward(req, resp);
	}
	
}
