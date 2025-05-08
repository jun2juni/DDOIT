package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.INoticeService;
import kr.or.ddoit.service.NoticeServiceImpl;
import kr.or.ddoit.vo.NoticeVo;

@WebServlet("/noticeDetail.do")
public class NoticeDetail extends HttpServlet {

	INoticeService noticeService = NoticeServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String boardNoStr = req.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNoStr);

		NoticeVo vo = new NoticeVo();
		vo.setBoardNo(boardNo);

		NoticeVo noticeDetail = noticeService.noticeDetail(vo);
		req.setAttribute("notice", noticeDetail);
		req.setAttribute("boardNo", boardNo);

		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/notice/noticeDetail.jsp").forward(req, resp);
	}

}
