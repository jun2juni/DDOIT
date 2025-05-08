package kr.or.ddoit.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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

@WebServlet("/approval.do")
public class KakaopayApprovalController extends HttpServlet {

	// 서비스 호출
	IProdService prodService = ProdServiceImpl.getInstace();

	private static final String SECRET_KEY = "DEV58B9EF98EC7527F568463B877599D4978B9AE";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		System.out.println("출력1");
		// session에서 member 정보 vo로 가져오기
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");

		// 요청 파라미터 가져오기 prodNo, prodName, finalPrice (price-point)
		int prodNo = Integer.parseInt(req.getParameter("prodNo"));
		String prodName = req.getParameter("prodName");
		int point = Integer.parseInt(req.getParameter("usedPoint")); // for finalPrice
		int price = Integer.parseInt(req.getParameter("price")); // for finalPrice
		int finalPrice = price - point;
		
		System.out.println("출력2");

		// Map에 요청파라미터 담기
		Map<String, Object> map = new HashMap<>();
		map.put("memNo", member.getMemNo());
		map.put("productNo", prodNo);
		map.put("finalPrice", finalPrice);
		
		System.out.println("출력3");

		// ORDER_ITEM 테이블에 추가된 행 개수
		int cnt = prodService.orderAdd(map);
		System.out.println("주문추가 " + cnt + "개 완료");

		// 추가된 주문번호 가져오기
		int orderNo = prodService.getOrderNo(map);
		System.out.println("추가된 주문번호 " + orderNo);
//        int orderNo = orderAdd.getOrderNo();

		String command = req.getParameter("command");
		try {
			URL url = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "SECRET_KEY " + SECRET_KEY);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoInput(true);
			conn.setDoOutput(true);

			Map<String, String> params = new HashMap<>();

			params.put("cid", "TC0ONETIME");
			params.put("partner_order_id", orderNo + "");
			params.put("partner_user_id", member.getMemId());
			params.put("item_name", prodName);
			params.put("quantity", "1");
			params.put("total_amount", finalPrice + "");
			params.put("tax_free_amount", "0");
			params.put("approval_url", "http://localhost:38080/DdoIt/pay.do");
			params.put("cancel_url", "http://localhost:38080/DdoIt/approval.do");
			params.put("fail_url", "http://localhost:38080/DdoIt/approval.do");

			StringBuilder sb = new StringBuilder();
			sb.append("{");
			for (Map.Entry<String, String> entry : params.entrySet()) {
				sb.append("\"").append(entry.getKey()).append("\":\"").append(entry.getValue()).append("\",");
			}
			sb.setLength(sb.length() - 1);
			sb.append("}");

			System.out.println("카카오페이 요청 파라미터 확인 >>> " + sb);

			String conparam = sb.toString();
			OutputStream out = conn.getOutputStream();
			out.write(conparam.getBytes());
			out.flush();
			out.close();

			// 에러확인
//			System.out.println("Response Code: " + conn.getResponseCode());
//			BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//			String line;
//			System.out.println("Connection Response Code: " + conn.getResponseCode());
//			System.out.println("Connection Response Message: " + conn.getResponseMessage());
//			while ((line = errorReader.readLine()) != null) {
//			    System.out.println(line);
//			}

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String successUrl = null; // 준비 성공 시 연결할 url
			String request = in.readLine();

			System.out.println("카카오페이 결제준비 응답 >>>" + request);
			System.out.println("카카오페이 결제준비 응답 >>>" + conn.getResponseCode());
			System.out.println("카카오페이 결제준비 응답 >>>" + conn.getResponseMessage());

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(request);
			
			session.setAttribute("point", point);
			session.setAttribute("prodNo", prodNo);
			session.setAttribute("prodName", prodName);
			session.setAttribute("finalPrice", finalPrice);
			successUrl = (String) obj.get("next_redirect_pc_url");
			session.setAttribute("tid", obj.get("tid"));
			session.setAttribute("cid", params.get("cid"));
			session.setAttribute("partner_order_id", params.get("partner_order_id"));
			session.setAttribute("partner_user_id", params.get("partner_user_id"));

			in.close();
			res.sendRedirect(successUrl);

		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println("Error: " + e.getMessage());
		}

	}
}