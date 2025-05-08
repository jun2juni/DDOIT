package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.Map;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.CertificationServiceImpl;
import kr.or.ddoit.service.ICertificationService;
import kr.or.ddoit.vo.CertificationVo;

@WebServlet("/certifiDelete.do")
public class CertificationDeleteController extends HttpServlet{
	ICertificationService certifiService = CertificationServiceImpl.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("자격증일정삭제 doPost 요청");
		String certificationNoStr = req.getParameter("certificationNo");
		//이건 왜 가져온거죠???
		//Map param = req.getParameterMap();
		
		
		int certificationNo = Integer.parseInt(certificationNoStr);
		
		//System.out.println(certificationNo);
		
		CertificationVo vo = new CertificationVo();
		vo.setCertificationNo(certificationNo);
		
		int certifiDelete = certifiService.certifiDelete(vo);
		
		System.out.println(certifiDelete+" 개 삭제되었습니다.");
		
//		resp.sendRedirect(req.getContextPath()+"/certification.do");
		
		certifiService.certifiDelete(vo);
		
		JSONObject obj = new JSONObject();
		obj.put("sucess", true);
		
		resp.setContentType("application/x-json; charset=utf-8");
		resp.getWriter().print(obj);
	}
	
}
