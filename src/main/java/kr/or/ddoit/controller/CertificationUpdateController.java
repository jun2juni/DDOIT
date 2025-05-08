package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.CertificationServiceImpl;
import kr.or.ddoit.service.ICertificationService;
import kr.or.ddoit.vo.CertificationVo;
@WebServlet("/certifiUpdate.do")
public class CertificationUpdateController extends HttpServlet{
	ICertificationService certifiService = CertificationServiceImpl.getInstance();
	
	
	/*
	 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { //List<CertificationVo>
	 * certifiList= certifiService.certifiList();
	 * 
	 * System.out.println("자격증일정수정 doGet실행"); ServletContext ctx =
	 * req.getServletContext();
	 * ctx.getRequestDispatcher("/WEB-INF/view/certification/certification.jsp").
	 * forward(req, resp); }
	 */
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("자격증일정수정 doPost실행");
		
		String certificationNoStr = req.getParameter("certificationNo");
		int certificationNo = Integer.parseInt(certificationNoStr);
		String certificationName = req.getParameter("certificationName");
		String institution= req.getParameter("groupId");
		String registrationStartDate = req.getParameter("registrationStartDate");
		String registrationEndDate = req.getParameter("registrationEndDate");
		String calendarBackgroundcolor = req.getParameter("calendarBackgroundcolor");
		
		System.out.println("No :"+certificationNo);
		
		CertificationVo vo = new CertificationVo(); 
		
		vo.setCertificationNo(certificationNo);
		vo.setCertificationName(certificationName);
		vo.setInstitution(institution);
		vo.setRegistrationStartDate(registrationStartDate);
		vo.setRegistrationEndDate(registrationEndDate);
		vo.setCalendarBackgroundcolor(calendarBackgroundcolor);
		
		System.out.println("vo: "+vo);
		int certifiUpdate = certifiService.certifiUpdate(vo);
		
		System.out.println(certifiUpdate+" 개 수정되었습니다.");
		certifiService.certifiUpdate(vo);
		
		
		JSONObject jsonObj = new JSONObject();
		//obj.put("sucess", true);
		JSONArray jsonArray  =new JSONArray();
		
		jsonObj.put("id" , certificationNo);
		jsonObj.put("title" , certificationName);
		jsonObj.put("groupId" , institution);
		jsonObj.put("start" , registrationStartDate);
		jsonObj.put("end", registrationEndDate);
		jsonObj.put("color", calendarBackgroundcolor);
		
		
		System.out.println("jsonObj :"+jsonObj);
		resp.setContentType("application/x-json; charset=utf-8");
		resp.getWriter().print(jsonObj);
		
	}
	
	
	
}
