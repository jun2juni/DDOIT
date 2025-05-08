package kr.or.ddoit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddoit.service.IMemberService;
import kr.or.ddoit.service.MemberServiceImpl;
import kr.or.ddoit.vo.MemberVo;

@WebServlet("/login.do")
public class LoginController extends HttpServlet{

	IMemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("login.do get 요청(로그인페이지출력)");
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/login/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("login.do post 요청(로그요청)");
		
		String id = req.getParameter("memId");
		String pw = req.getParameter("memPassword");
		System.out.println("id : "+id+", pw : "+pw);
		
		MemberVo member = new MemberVo();
		member.setMemId(id);
		member.setMemPassword(pw);
		
		member = memberService.login(member);
		
		System.out.println("member : "+ member );
		if(member == null) {
			// 로그인 실패
			//System.out.println("로그인실패하였습니다.");
			PrintWriter out = resp.getWriter();
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("text/html; charset=utf-8");
			out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
			out.println("history.go(-1); </script>"); 
			out.close();
			//return "redirect:login"; 
			resp.sendRedirect(req.getContextPath()+"/login.do");
		}
		else {
			// 로그인 성공 
			// 세션에 등록 이름은 member
			//System.out.println("로그인성공");
			HttpSession session = req.getSession();
			session.setAttribute("member", member);
			resp.sendRedirect(req.getContextPath()+"/index.do");
		}
		
	}
	
}
