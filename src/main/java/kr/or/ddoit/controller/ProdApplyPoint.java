package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/applyPoint.do")
public class ProdApplyPoint extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// 포인트 적용 시의 서블릿
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 입력값 가져오기
		String pointStr = request.getParameter("point");
		String priceStr = request.getParameter("price");
		int point = Integer.parseInt(pointStr);
		int price = Integer.parseInt(priceStr);

		// 포인트가 상품 가격을 초과하면 에러 반환
		if (point > price) {
			response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 상태 코드 설정
            response.getWriter().write("{\"error\": \"사용할 포인트가 상품 금액을 초과할 수 없습니다.\"}");
            return;
		}

		// 최종 결제 금액 계산
		int finalPrice = price - point;

		// JSON 형식으로 응답
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"finalPrice\": " + finalPrice + "}");
	}

}
