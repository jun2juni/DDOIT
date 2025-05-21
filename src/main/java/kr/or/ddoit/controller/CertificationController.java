package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

@WebServlet("/certification.do")
public class CertificationController extends HttpServlet {
	ICertificationService certifiService = CertificationServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CertificationVo> certifiList= certifiService.certifiList();
		/*
		 * //CertificationVo certifiVo = new CertificationVo();
		 * 
		 * //String certificationNoStr = req.getParameter("certificationNo"); //int
		 * certificationNo = Integer.parseInt(certificationNoStr);
		 * 
		 * String certificationName = req.getParameter("certificationName"); //String
		 * calendarMemo = req.getParameter("calendarMemo"); String registrationStartDate
		 * = req.getParameter("registrationStartDate"); String registrationEndDate =
		 * req.getParameter("registrationEndDate"); String calendarBackgroundcolor =
		 * req.getParameter("calendarBackgroundcolor");
		 * 
		 * System.out.println("Name:"+certificationName);
		 * System.out.println("Start:"+registrationStartDate);
		 * System.out.println("End:"+registrationEndDate);
		 * System.out.println("Color:"+calendarBackgroundcolor); //list에 vo를 담았다.
		 * //certifiList.add(certifiVo);
		 */		
		
		
		req.setAttribute("certifiList", certifiList);
		
		System.out.println(certifiList);
		
		System.out.println("자격증일정 doGet 요청");
		
		
		String ajaxHeader = req.getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);

		if (isAjax) {
			// AJAX 요청일 경우
			ServletContext ctx = req.getServletContext();
			ctx.getRequestDispatcher("/WEB-INF/view/certification/certification.jsp").forward(req, resp);
		} else {
			// 일반 요청일 경우 메인 레이아웃 사용
			req.setAttribute("mainContent", "/WEB-INF/view/certification/certification.jsp");
			req.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("자격증일정 doPost 요청");
		
		String certificationName = req.getParameter("certificationName");
		//String calendarMemo = req.getParameter("calendarMemo");
		String institution= req.getParameter("groupId");
		String registrationStartDate = req.getParameter("registrationStartDate");
		String registrationEndDate = req.getParameter("registrationEndDate");
		String calendarBackgroundcolor = req.getParameter("calendarBackgroundcolor");

		System.out.println("Name:"+certificationName);
		System.out.println("institution:"+institution);
		System.out.println("Start:"+registrationStartDate);
		System.out.println("End:"+registrationEndDate);
		System.out.println("Color:"+calendarBackgroundcolor);
		
		//vo에 담아서 보내줘야 한다.
		CertificationVo vo = new CertificationVo();
		
		vo.setCertificationName(certificationName);
		vo.setInstitution(institution);
		vo.setRegistrationStartDate(registrationStartDate);
		vo.setRegistrationEndDate(registrationEndDate);
		vo.setCalendarBackgroundcolor(calendarBackgroundcolor);
		
		
		certifiService.certifiInsert(vo);
		// 인서트 후 리스트 가져오기
		
		//certifiService.certifiMonth(vo);
		
		// 리스트 ajax로 다시 보내주기
		//json으로 보내라.....

		//List<CertificationVo> certifiList = new List
	
		// json 타입으로 보내주기 
		JSONObject jsonObj = new JSONObject();

		
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
