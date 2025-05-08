package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddoit.service.IPostService;
import kr.or.ddoit.service.PostService;
import kr.or.ddoit.vo.MemberVo;
import kr.or.ddoit.vo.PaginationVo;
import kr.or.ddoit.vo.PostVo;
import kr.or.ddoit.vo.ProdVo;

@WebServlet("/debugList.do")
public class DebugListController extends HttpServlet{
	IPostService postService = PostService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		// 기존 세션 제거
		session.removeAttribute("postVo");
		// 여기부터 세션
			// 회원정보
		MemberVo memberVo = new MemberVo();
		memberVo.setMemNo(10);
		memberVo.setMemId("student");
		memberVo.setMemNickname("student닉네임");
		
		session.setAttribute("memVo", memberVo);
			// post 세션 (현재 게시판 위치)
		PostVo postVo = new PostVo();
		postVo.setBoardNo(3); // 세션에서 받아온다. BOARD_NO 게시판 이동시 세션을 저장한다. 이동시 파라미터로 게시판정보 넘기게끔 하자.
		session.setAttribute("postVo", postVo);
		// 여기까지 세션
		
		PaginationVo<PostVo> pagingVo = new PaginationVo<PostVo>();
		PostVo searchBoard = new PostVo();
		// option(select태그)에 해당하는 value(option태그)를 가져옴.
		String option = req.getParameter("option");
		if(option != null) {
			// 검색 키워드를 가져온다.
			String search = req.getParameter("search");
			// option에 해당하는 것으로 검색키워드 저장
			if(option.equals("postName")) searchBoard.setPostName(search);
			if(option.equals("content")) searchBoard.setContent(search);
			if(option.equals("memNickname")) searchBoard.setMemNickname(search);
		}
		// option에 따라 검색 키워드가 저장된 vo를 pagingVo의 searchVo필드에 저장.
		pagingVo.setSearchVo(searchBoard);
		
		// pageNO가 정해지지 않았다면 1, 정해졌다면 요청의 파라미터를 가져옴.
		int pageNo =1;
		String pageNoStr = req.getParameter("pageNo");
		if(pageNoStr !=null) {
			pageNo = Integer.parseInt(pageNoStr);
		}
		
		// 현재 페이지번호와 현재 페이지의 첫번째 게시글과 마지막 게시글을 vo에 저장한다.
		pagingVo.setPageNo(pageNo);
		System.out.println("pagingVo : " + pagingVo);
		
		// 게시판 리스트는 pagingVo로 db에서 가져온다.
		List<PostVo> boardList = postService.postList(pagingVo);
		System.out.println("boardList : " + boardList);
		pagingVo.setDataList(boardList);
		
		int total = postService.totalCount(pagingVo);
		pagingVo.setTotalPage(total);
		req.setAttribute("pagingVo", pagingVo);
		
		String ajaxHeader = req.getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);

		if (isAjax) {
			// AJAX 요청일 경우
			req.getRequestDispatcher("/WEB-INF/view/debugging/debugList.jsp").forward(req, resp);
		} else {
			// 일반 요청일 경우 메인 레이아웃 사용
			req.setAttribute("mainContent", "/WEB-INF/view/debugging/debugList.jsp");
			req.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(req, resp);
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
