package kr.or.ddoit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddoit.vo.MemberVo;

@WebServlet("/tlogin.do")
public class TestLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h2>테스트 로그인</h2>");
		out.println("<form action='tlogin.do' method='post'>");
		out.println("<select name='memType'>");
		out.println("<option value='1'>일반회원</option>");
		out.println("<option value='2'>학생회원</option>");
		out.println("<option value='3'>관리자</option>");
		out.println("</select>");
		out.println("<input type='submit' value='로그인'>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int memType = Integer.parseInt(request.getParameter("memType"));

		MemberVo memberVo = new MemberVo();

		if (memType == 1) {
			memberVo.setMemNo(9);
			memberVo.setMemName("일반회원");
		} else if (memType == 2) {
			memberVo.setMemNo(10);
			memberVo.setMemName("학생회원");
		} else if (memType == 3) {
			memberVo.setMemNo(11);
			memberVo.setMemName("관리자");
		} else {
			response.getWriter().println("오류");
		}
		session.setAttribute("loginMem", memberVo);

		response.sendRedirect(request.getContextPath() + "/index.do");
	}
}
