package kr.or.ddoit.controller;

import java.io.IOException;

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
@WebServlet("/loginPassFind.do")
public class LoginPassFindController extends HttpServlet{
	
	IMemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("비밀번호 찾기 doget요청");
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/login/loginPassFind.jsp").forward(req, resp);
	
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("비밀번호 찾기 dopost요청");
		String name = req.getParameter("memName");
		String id = req.getParameter("memId");
		//String phone = req.getParameter("memPhone");
		String email = req.getParameter("memEmail");
	
		System.out.println("name : "+name+ "id : "+id+", email"+ email);
		
		MemberVo member = new MemberVo();
		member.setMemName(name);
		member.setMemId(id);
		//member.setMemPhone(phone);
		member.setMemEmail(email);
		
		member= memberService.loginPassFind(member);
		System.out.println("member: "+member);
		
		if(member == null) {
			// 비밀번호찾기 실패
			System.out.println("비밀번호찾기 실패");
			resp.sendRedirect(req.getContextPath()+"/loginPassFind.do");
		}
		else {
			//아이디찾기 성공
			// 세션에 등록 이름은 member
			System.out.println("비밀번호찾기 성공");
			
			req.setAttribute("member", member);
			ServletContext ctx = req.getServletContext();
			ctx.getRequestDispatcher("/WEB-INF/view/login/loginPassFind.jsp").forward(req, resp);
		}
		
		
		
	}
}
