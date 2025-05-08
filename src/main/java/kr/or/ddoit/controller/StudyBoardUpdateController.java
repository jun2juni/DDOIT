package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IStudyBoardService;
import kr.or.ddoit.service.StudyBoardServiceImpl;
import kr.or.ddoit.vo.StudyBoardVo;

@WebServlet("/studyBoardUpdate.do")
public class StudyBoardUpdateController extends HttpServlet {
    
    IStudyBoardService studyBoardService = StudyBoardServiceImpl.getInstance();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String boardNoStr = req.getParameter("boardNo");
        int boardNo = Integer.parseInt(boardNoStr);
        
        StudyBoardVo vo = new StudyBoardVo();
        vo.setBoardNo(boardNo);
        StudyBoardVo studyBoardDetail = studyBoardService.studyBoardDetail(vo);
        
        req.setAttribute("studyBoard", studyBoardDetail);
        
        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/studyboard/studyBoardUpdate.jsp").forward(req, resp);     
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String boardNoStr = req.getParameter("boardNo");
        String boardName = req.getParameter("boardName");
        String boardType = req.getParameter("boardType");
        String boardStatus = req.getParameter("boardStatus");
        
        int boardNo = Integer.parseInt(boardNoStr);

        StudyBoardVo vo = new StudyBoardVo();
        vo.setBoardNo(boardNo);
        vo.setBoardName(boardName);
        vo.setBoardType(boardType);
        vo.setBoardStatus(boardStatus);
        
        studyBoardService.studyBoardUpdate(vo);
        resp.sendRedirect(req.getContextPath() + "/studyBoardList.do");
    }
}