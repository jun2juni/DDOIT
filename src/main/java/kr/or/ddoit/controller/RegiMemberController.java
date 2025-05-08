package kr.or.ddoit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IRegiMemberService;
import kr.or.ddoit.service.RegiMemberServiceImpl;
import kr.or.ddoit.vo.MemberVo;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

/**
 * Servlet implementation class RegiMemberController
 */
@WebServlet("/regimember.do")
public class RegiMemberController extends HttpServlet {
	private IRegiMemberService regiService = RegiMemberServiceImpl.getInstance();
	private Gson gson = new Gson();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/view/regimem/regimeber.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		Map<String, String> respmsg = new HashMap<String, String>();

		if ("idCheck".equals(request.getParameter("action"))) {
		    if (regiService.idDuplicationCheck(request.getParameter("memId"))) {
		        respmsg.put("status", "false");
		        respmsg.put("msg", "이미 사용중인 아이디입니다.");
		    } else {
		        respmsg.put("status", "true");
		        respmsg.put("msg", "사용 가능한 아이디입니다.");
		    }
		} else if ("nickNameCheck".equals(request.getParameter("action"))) {
		    if (regiService.nickNameDuplicationCheck(request.getParameter("memNickname"))) {
		        respmsg.put("status", "false");
		        respmsg.put("msg", "이미 사용중인 닉네임입니다.");
		    } else {
		        respmsg.put("status", "true");
		        respmsg.put("msg", "사용 가능한 닉네임입니다.");
		    }
		}else if ("register".equals(request.getParameter("action"))) {
			try {
				MemberVo memberVo = new MemberVo();
				memberVo.setMemId(request.getParameter("memId"));
				memberVo.setMemPassword(request.getParameter("memPassword"));
				memberVo.setMemName(request.getParameter("memName"));
				memberVo.setMemNickname(request.getParameter("memNickname"));
				memberVo.setMemEmail(request.getParameter("memEmail"));
				memberVo.setMemPhone(request.getParameter("memPhone"));

				int regiresult = regiService.insertMember(memberVo);
				

				if (regiresult > 0) {
					respmsg.put("status", "true");
					respmsg.put("msg", "회원가입 완료");
				} else {
					respmsg.put("status", "false");
					respmsg.put("msg", "회원가입 실패");
				}
			} catch (Exception e) {
				System.out.println("예외 발생: " + e.getMessage());
				respmsg.put("status", "false");
				respmsg.put("msg", "회원가입 처리 중 오류가 발생했습니다");
			}
		}

		String json = gson.toJson(respmsg);
		response.getWriter().write(json);
	}
}
