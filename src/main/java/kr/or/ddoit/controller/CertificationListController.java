package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.CertificationServiceImpl;
import kr.or.ddoit.service.ICertificationService;
import kr.or.ddoit.vo.CertificationVo;
@WebServlet("/certifiList.do")
public class CertificationListController extends HttpServlet{
	ICertificationService certifiService  =  CertificationServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CertificationVo> certifiList= certifiService.certifiList();
		
		req.setAttribute("certifiList", certifiList);
		
		System.out.println(certifiList);
		
		System.out.println("자격증일정리스트출력 doGet 요청");
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/certification/certification.jsp").forward(req, resp);
		
	}
}
