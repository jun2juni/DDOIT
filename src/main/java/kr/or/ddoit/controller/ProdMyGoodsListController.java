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

@WebServlet("/myGoodsList.do")
// 구매상품 리스트
public class ProdMyGoodsListController extends HttpServlet {

	IProdService prodService = ProdServiceImpl.getInstace();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
//		int prodNo = (int) session.getAttribute("prodNo"); // 이게 왜 있더라..
		
		List<Map<String, Object>> myGoodsList = prodService.myGoodsList(member.getMemNo());

		req.setAttribute("myGoodsList", myGoodsList);
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/prod/myGoodsList.jsp").forward(req, resp);
	}

}
