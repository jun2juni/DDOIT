package kr.or.ddoit.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IStudyBoardService;
import kr.or.ddoit.service.StudyBoardServiceImpl;
import kr.or.ddoit.vo.StudyBoardVo;

@WebServlet("/studyBoardList.do")
public class StudyBoardListController extends HttpServlet {

    IStudyBoardService studyBoardService = StudyBoardServiceImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        List<StudyBoardVo> studyBoardList = studyBoardService.studyBoardList();
        req.setAttribute("studyBoardList", studyBoardList);
        
        // JSP 페이지로 포워딩
        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/studyboard/studyBoard.jsp").forward(req, resp);
    }
}