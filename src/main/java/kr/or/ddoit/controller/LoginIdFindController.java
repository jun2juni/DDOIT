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
@WebServlet("/loginIdFind.do")
public class LoginIdFindController extends HttpServlet{
	
	IMemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("아이디찾기 doGet요청");
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/login/loginIdFind.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("아이디찾기 doPost요청");
		String name = req.getParameter("memName");
		//String phone = req.getParameter("memPhone");
		String email = req.getParameter("memEmail");
		System.out.println("name : "+name+", email"+ email);
		
		MemberVo member = new MemberVo();
		member.setMemName(name);
		//member.setMemPhone(phone);
		member.setMemEmail(email);
		
		member= memberService.loginIdFind(member);
		System.out.println("member :" +member);
		
		
		if(member == null) {
			// 아이디찾기 실패
			System.out.println("아이디찾기 실패");
			resp.sendRedirect(req.getContextPath()+"/loginIdFind.do");
		}
		else {
			//아이디찾기 성공
			// 세션에 등록 이름은 member
			System.out.println("아이디찾기 성공");
//			HttpSession session = req.getSession();
//			session.setAttribute("member", member);
			req.setAttribute("member", member);

			ServletContext ctx = req.getServletContext();
			ctx.getRequestDispatcher("/WEB-INF/view/login/loginIdFind.jsp").forward(req, resp);
		}
		
	
		//resp.sendRedirect(req.getContextPath()+"/loginIdFind.do");
		
		/*
		 * ServletContext ctx = req.getServletContext();
		 * ctx.getRequestDispatcher("/WEB-INF/view/login/loginIdFind.jsp").forward(req,
		 * resp);
		 */
		
	}
	
	
	
	
	
}
