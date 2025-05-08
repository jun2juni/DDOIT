package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.INoticeService;
import kr.or.ddoit.service.NoticeServiceImpl;

@WebServlet("/noticeDelete.do")
public class NoticeDeleteController extends HttpServlet{
	
	INoticeService noticeService = NoticeServiceImpl.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] boardNos = req.getParameterValues("boardNo");
        
        if (boardNos != null) {
            for (String boardNoStr : boardNos) {
                try {
                    int boardNo = Integer.parseInt(boardNoStr);
                    noticeService.noticeDelete(boardNo);
                } catch (NumberFormatException e) {
                    // 잘못된 번호 처리
                    e.printStackTrace();
                }
            }
        
		        resp.sendRedirect(req.getContextPath() + "/noticeList.do");
	}
	
	}
}
