package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IProdService;
import kr.or.ddoit.service.ProdServiceImpl;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.ProdVo;

// 결제 진행 전 영수증..?
@WebServlet("/receipt.do")
public class ProdReceiptController extends HttpServlet {

	IProdService prodService = ProdServiceImpl.getInstace();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// parameter에서 prodNo 가져온 후 String -> int
		int prodNo = Integer.parseInt(req.getParameter("prodNo"));
		// session에서 "member" 꺼내온 후 MemberVo에 담음
		MemberVo memberVo = (MemberVo) req.getSession().getAttribute("member");
		// memberVo에서 memNo값 꺼냄
		int memNo = memberVo.getMemNo();

		// MemberVo에 담은 session값 req에 담음
		req.setAttribute("member", memberVo);

		// map에 필요한 파라미터 담기 prodNo, memNo
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", prodNo);
		map.put("memNo", memNo);

		// service에 연결하여 쿼리 결과값 가져오기
		ProdVo prod = prodService.prodReceipt(map);
		// req에 결과값 담아서 jsp로 보냄
		req.setAttribute("prod", prod);
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/prod/receipt.jsp").forward(req, resp);

	}

}
