package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IProfileService;
import kr.or.ddoit.service.ProfileServiceImpl;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ProfileVo;

@WebServlet("/profileEdit.do")
public class ProfileEditController extends HttpServlet{
	
	IProfileService profileService = ProfileServiceImpl.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		MemberVo member = (MemberVo) session.getAttribute("member");
		
		MemberVo member = new MemberVo();
		member.setMemNo(31);
		
		ProfileVo profile = new ProfileVo();
		
		System.out.println("post 호출");
		String editNickname = req.getParameter("nickname");
		System.out.println("수정된 닉네임>> " + editNickname);
		String editIntroduction = req.getParameter("introduction");
		System.out.println("수정된 소개>> " + editIntroduction);
		
		member.setMemNickname(editNickname);
		profile.setIntroduction(editIntroduction);;
		profile.setMemNo(member.getMemNo());
		
		// 닉네임 변경 (memberT)
		profileService.nicknameEdit(member);
		
		// 소개, 사진, 배경 경로 변경 (profileT)
		profileService.profileEdit(profile);
	
	}
}
