package kr.or.ddoit.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IStudyBoardService;
import kr.or.ddoit.service.StudyBoardServiceImpl;

@WebServlet("/studyBoardDelete.do")
public class StudyBoardDeleteController extends HttpServlet {
    
    IStudyBoardService studyBoardService = StudyBoardServiceImpl.getInstance();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String boardNoStr = req.getParameter("boardNo");
        if (boardNoStr != null) {
            int boardNo = Integer.parseInt(boardNoStr);
            studyBoardService.studyBoardDelete(boardNo);
            resp.sendRedirect(req.getContextPath() + "/studyBoardList.do");
        }
    }
}
