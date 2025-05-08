package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IPostService;
import kr.or.ddoit.service.PostService;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.PostVo;

@WebServlet("/debugInsert.do")
public class DebugInsertController extends HttpServlet{
	
	IPostService postService = PostService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 여기서 회원정보 확인 후 없으면 로그인 창이나 메인창으로 이동시키기.
		MemberVo memberVo = (MemberVo)req.getSession().getAttribute("memVo");
		// 
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/debugging/debugInsert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo memberVo = (MemberVo)req.getSession().getAttribute("memVo");
		PostVo postVo = (PostVo)req.getSession().getAttribute("postVo");
		req.setCharacterEncoding("UTF-8");
		String postName = req.getParameter("postName");
		String content = req.getParameter("content");
		content = content.replace("\r\n", "<br>");
		
//		PostVo postVo = new PostVo();
		postVo.setPostName(postName);
		postVo.setContent(content);
		postVo.setMemNo(memberVo.getMemNo());
//		postVo.setBoardNo(1);
		
		int num = postService.postInsert(postVo);
		
		System.out.println(num);
		resp.sendRedirect("debugList.do");
	}

}
