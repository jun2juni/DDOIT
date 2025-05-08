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
import kr.or.ddoit.vo.PostVo;

@WebServlet("/debugUpdate.do")
public class DebugUpdateController extends HttpServlet{
	IPostService postService = PostService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession(false);
//		String postNoStr = (String)session.getAttribute("postNo");
//		int postNo = Integer.parseInt(postNoStr);
		PostVo postVo= (PostVo)req.getSession().getAttribute("postVo");
		String content = postVo.getContent();
		content = content.replace("<br>", "\n");
		postVo.setContent(content);
		System.out.println(content);
		req.setAttribute("postVo", postVo);
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/debugging/debugUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		PostVo postVo= (PostVo)req.getSession().getAttribute("postVo");
		System.out.println("update postVo : " + postVo);
		String postName = req.getParameter("postName");
		String content = req.getParameter("content");
		content = content.replace("\r\n", "<br>");
		
		postVo.setPostName(postName);
		postVo.setContent(content);
		
		int num = postService.postUpdate(postVo);
		
		resp.sendRedirect("debugList.do");
	}
}
