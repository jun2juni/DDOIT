package kr.or.ddoit.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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

@WebServlet("/pay.do")
public class KakaopayPayController extends HttpServlet {
	private static final String SECRET_KEY = "DEV58B9EF98EC7527F568463B877599D4978B9AE";

	// prodService 객체 생성
	IProdService prodService = ProdServiceImpl.getInstace();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		// member 테이블 point 업데이트 시 필요한 파라미터 session에서 꺼냄
		HttpSession session = req.getSession();
		int usedPoint = (int) session.getAttribute("point");
		int prodNo = (int) session.getAttribute("prodNo");
		String prodName = (String) session.getAttribute("prodName");
		int finalPrice = (int) session.getAttribute("finalPrice");

		MemberVo member = (MemberVo) session.getAttribute("member");
		int memNo = member.getMemNo();
		int ownedPoint = member.getPoints();
		int totalPoint = ownedPoint - usedPoint;
		
		ProdVo prodVo = new ProdVo();
		prodVo.setMemNo(memNo);
		prodVo.setProductNo(prodNo);
		
		
		// map에 파라미터 담기 memNo, point
		Map<String, Object> map = new HashMap();
		map.put("memNo", memNo);
		map.put("point", totalPoint);
		
		// wishList 삭제 
		prodService.wishOff(prodVo);
		// 포인트 수정 쿼리 실행
		prodService.totalPoint(map);
		

		String tid = (String) session.getAttribute("tid");
		String cid = (String) session.getAttribute("cid");
		String partner_order_id = (String) session.getAttribute("partner_order_id");
		String partner_user_id = (String) session.getAttribute("partner_user_id");
		String pg_token = req.getParameter("pg_token");

		System.out.println("tid>>>" + tid);
		System.out.println("cid>>" + cid);

		try {
			URL url = new URL("https://open-api.kakaopay.com/online/v1/payment/approve");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "SECRET_KEY " + SECRET_KEY);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoInput(true);
			conn.setDoOutput(true);

			Map<String, String> params = new HashMap<>();
			params.put("cid", cid);
			params.put("tid", tid);
			params.put("partner_order_id", partner_order_id);
			params.put("partner_user_id", partner_user_id);
			params.put("pg_token", pg_token);

			StringBuilder sb = new StringBuilder();
			sb.append("{");
			for (Map.Entry<String, String> entry : params.entrySet()) {
				sb.append("\"").append(entry.getKey()).append("\":\"").append(entry.getValue()).append("\",");
			}
			sb.setLength(sb.length() - 1);
			sb.append("}");

			OutputStream out = conn.getOutputStream();
			out.write(sb.toString().getBytes());
			out.flush();
			out.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String response = in.readLine();

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(response);

			res.getWriter().println("결제: " + obj.toJSONString());
			in.close();
			
			res.sendRedirect("myGoodsList.do");
			
//			out.flush();

		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println("Error: " + e.getMessage());
		}
	}
}
