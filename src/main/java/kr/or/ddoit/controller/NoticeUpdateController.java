package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.INoticeService;
import kr.or.ddoit.service.NoticeServiceImpl;
import kr.or.ddoit.vo.NoticeVo;

@WebServlet("/noticeUpdate.do")
public class NoticeUpdateController extends HttpServlet{
	
	INoticeService noticeService = NoticeServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardNoStr = req.getParameter("boardNo");
	    int boardNo = Integer.parseInt(boardNoStr);
	    
	    NoticeVo vo = new NoticeVo();
	    vo.setBoardNo(boardNo);
	    NoticeVo noticeDetail = noticeService.noticeDetail(vo);
	    
	    req.setAttribute("notice", noticeDetail);
	    
	    ServletContext ctx = req.getServletContext();
	    ctx.getRequestDispatcher("/WEB-INF/view/notice/noticeUpdate.jsp").forward(req, resp);   	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String boardNoStr = req.getParameter("boardNo");
	    String boardName = req.getParameter("boardName");
	    String boardType = req.getParameter("boardType");
	    String boardStatus = req.getParameter("boardStatus");
	    
	    int boardNo = Integer.parseInt(boardNoStr);

	    NoticeVo vo = new NoticeVo();
	    vo.setBoardNo(boardNo);
	    vo.setBoardName(boardName);
	    vo.setBoardType(boardType);
	    vo.setBoardStatus(boardStatus);
	    
	    noticeService.noticeUpdate(vo);
	    resp.sendRedirect(req.getContextPath() + "/noticeList.do");
	}
	
}
