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

@WebServlet("/noticeList.do")
public class NoticeListController extends HttpServlet {

    INoticeService noticeService = NoticeServiceImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // boardType 파라미터 가져오기
        String boardType = req.getParameter("boardType");
        
        List<NoticeVo> noticeList;
        
        

        // boardType 값이 null 또는 빈 값이면 모든 공지사항을 가져오고, 아니면 해당 boardType에 맞는 목록을 가져옵니다.
        if (boardType == null || boardType.isEmpty()) {
            noticeList = noticeService.noticeList(); // 전체 공지사항
        } else {
            noticeList = noticeService.getNoticesByType(boardType); // 특정 boardType에 맞는 공지사항
        }

        // noticeList를 요청 속성에 저장하여 JSP로 전달
        req.setAttribute("noticeList", noticeList);
        req.setAttribute("boardType", boardType); // 선택된 boardType 값도 전달

        // JSP 페이지로 포워딩
        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/notice/noticeList.jsp").forward(req, resp);
    }
}
