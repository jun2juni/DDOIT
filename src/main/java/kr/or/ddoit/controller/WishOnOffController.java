package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IProdService;
import kr.or.ddoit.service.ProdServiceImpl;
import kr.or.ddoit.vo.ProdVo;

// 위시 버튼 클릭 시 on off
@WebServlet("/wishonoff.do")
public class WishOnOffController extends HttpServlet {

	IProdService prodService = ProdServiceImpl.getInstace();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 파라미터 가져오기
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		boolean isWish = Boolean.parseBoolean(request.getParameter("isWish")); // 현재 상태 (true: 위시 등록 상태)

		// ProdVo 생성
		ProdVo prodVo = new ProdVo();
		prodVo.setMemNo(memNo);
		prodVo.setProductNo(productNo);

		// 서비스 호출
		int result = 0;
		if (isWish) {
			result = prodService.wishOff(prodVo); // 기존 위시리스트 삭제
		} else {
			result = prodService.wishOn(prodVo); // 위시리스트에 추가
		}

		// 결과 반환
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().write("{\"success\": " + (result > 0) + "}");
	}

}
