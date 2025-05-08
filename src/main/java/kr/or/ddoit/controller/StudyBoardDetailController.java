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

@WebServlet("/studyBoardDetail.do")
public class StudyBoardDetailController extends HttpServlet {

    IStudyBoardService studyBoardService = StudyBoardServiceImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String boardNoStr = req.getParameter("boardNo");
        int boardNo = Integer.parseInt(boardNoStr);

        StudyBoardVo vo = new StudyBoardVo();
        vo.setBoardNo(boardNo);

        StudyBoardVo studyBoardDetail = studyBoardService.studyBoardDetail(vo);
        req.setAttribute("studyBoard", studyBoardDetail);
        req.setAttribute("boardNo", boardNo);

        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/studyboard/studyBoardDetail.jsp").forward(req, resp);
    }
}
