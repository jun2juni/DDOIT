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

// 위시리스트 조회
@WebServlet("/wishList.do")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WishListController() {
	}

	IProdService prodService = ProdServiceImpl.getInstace();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// session객체 생성
		HttpSession session = req.getSession();
		// session에 꺼내온 값을 memberVo에 담기
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memNo = member.getMemNo();
		
		List<Map<String, Object>> wishList = prodService.wishList(memNo);
		req.setAttribute("wishList", wishList);

		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/prod/wishList.jsp").forward(req, resp);
	}

}
