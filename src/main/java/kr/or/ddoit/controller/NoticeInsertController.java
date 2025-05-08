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

@WebServlet("/noticeInsert.do")
public class NoticeInsertController extends HttpServlet {

    INoticeService noticeService = NoticeServiceImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 공지사항 등록 페이지로 포워딩
        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/notice/noticeInsert.jsp").forward(req, resp);
    }
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	try {
            String boardName = req.getParameter("boardName");
            String boardType = req.getParameter("boardType");
            String boardStatus = req.getParameter("boardStatus");
            String createdDate = req.getParameter("createdDate");
            String adminMemberNoStr = req.getParameter("adminMemberNo");
            String parentBoardNoStr = req.getParameter("parentBoardNo");

            int adminMemberNo = Integer.parseInt(adminMemberNoStr);
            int parentBoardNo = parentBoardNoStr != null ? Integer.parseInt(parentBoardNoStr) : 0;

            NoticeVo vo = new NoticeVo();
            vo.setBoardName(boardName);
            vo.setBoardType(boardType);
            vo.setBoardStatus(boardStatus);
            vo.setCreatedDate(createdDate);
            vo.setAdminMemberNo(adminMemberNo);
            vo.setParentBoardNo(parentBoardNo);

            noticeService.noticeInsert(vo);
            resp.sendRedirect(req.getContextPath() + "/noticeList.do");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/error.jsp");
    	        
    	        

        }
    }
}
