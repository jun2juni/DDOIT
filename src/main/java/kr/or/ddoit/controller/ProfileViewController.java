package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IProfileService;
import kr.or.ddoit.service.ProfileServiceImpl;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ProfileVo;

@WebServlet("/profileView.do")
public class ProfileViewController extends HttpServlet{
	
		IProfileService profileService = ProfileServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		MemberVo member = (MemberVo) session.getAttribute("member");
		MemberVo member = new MemberVo();
		member.setMemNo(31);
		member.setMemNickname("당근주스");
		
		// 내 프로필 조회
		ProfileVo profile = profileService.profileView(member.getMemNo());
		System.out.println("프로필 >> " + profile);
		System.out.println("회원 정보 >> " + member);
		
		req.setAttribute("member", member);
		req.setAttribute("profile", profile);
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/profile/profileView.jsp").forward(req, resp);
	}

}
