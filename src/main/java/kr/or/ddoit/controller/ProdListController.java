package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddoit.service.IProdService;
import kr.or.ddoit.service.ProdServiceImpl;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ProdVo;

@WebServlet("/prodList.do")
public class ProdListController extends HttpServlet {

	IProdService prodService = ProdServiceImpl.getInstace();

	// 상품 리스트 (전체, 상품품목별) 조회
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// session객체 생성
		HttpSession session = req.getSession();
		// session에 꺼내온 값을 memberVo에 담기
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memberNo = member.getMemNo();

		ProdVo prodVo = new ProdVo();
		prodVo.setMemNo(memberNo);

		List<Map<String, Object>> prodList = null;
		// 네비에서 상품타입 클릭 시 해당 prodType 가져오기
		String prodTypeClick = req.getParameter("prodTypeClick");
		
		// prodType이 null일 시 전체 상품 조회
		if (prodTypeClick == null) {
			prodList = prodService.prodList(prodVo);
		}
		
		// prodType이 null이 아닐 시 해당 타입 조회
		else if (prodTypeClick != null) {
			// prodVo productType에 클릭한 prodType값 넣음
			prodVo.setProductType(Integer.parseInt(prodTypeClick));
			prodList = prodService.prodList(prodVo);
			
		}

//		// req에 prodList를 List에 담아서 jsp로 보냄
		req.setAttribute("prodList", prodList);
		// req에 session을 vo에 담아서 jsp로 보냄
		req.setAttribute("member", member);
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/prod/prodList.jsp").forward(req, resp);
	}
}
