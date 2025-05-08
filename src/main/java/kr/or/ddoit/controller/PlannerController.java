package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IPlannerService;
import kr.or.ddoit.service.PlannerServiceImpl;
@WebServlet("/planner.do")
public class PlannerController extends HttpServlet{
	
	IPlannerService planService = PlannerServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("학습플래너 doGet요청");
		// AJAX 요청인지 확인
        String ajaxHeader = req.getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);

        if (isAjax) {
            // AJAX 요청일 경우 플래너 페이지만 반환
            req.getRequestDispatcher("/WEB-INF/view/planner/plannerMain.jsp").forward(req, resp);
        } else {
            // 일반 요청일 경우 메인 레이아웃 사용
            req.setAttribute("mainContent", "/WEB-INF/view/planner/plannerMain.jsp");
            req.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(req, resp);
        }
        
        
        //memberNo를 받아와야함
        
        //해당학생의 과목리스트들을 가져와야됨
        
        
        
        
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("학습플래너 doPost요청");
		
		
		
		
		
		
		String subjectTitle = req.getParameter("title");
		
	}
	
	
	
	
}
