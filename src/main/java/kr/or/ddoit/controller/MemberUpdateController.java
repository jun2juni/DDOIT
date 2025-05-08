package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IMemberService;
import kr.or.ddoit.service.MemberServiceImpl;
import kr.or.ddoit.vo.MemberVo;

@WebServlet("/memberUpdate.do")
public class MemberUpdateController extends HttpServlet {
    
    IMemberService memberService = MemberServiceImpl.getInstance();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/member/memberUpdate.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 파라미터 받기
        String memNoStr = req.getParameter("memNo");
        String memPassword = req.getParameter("memPassword");
        String memNickname = req.getParameter("memNickname");
        String memEmail = req.getParameter("memEmail");
        String memPhone = req.getParameter("memPhone");
        
        // VO 객체에 설정
        int memNo = Integer.parseInt(memNoStr);
        MemberVo vo = new MemberVo();
        vo.setMemNo(memNo);
        vo.setMemPassword(memPassword);
        vo.setMemNickname(memNickname);
        vo.setMemEmail(memEmail);
        vo.setMemPhone(memPhone);
        
        // 서비스 호출
        memberService.updateMember(vo);
        
        // 업데이트 후 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/memberList.do");
    }
}
