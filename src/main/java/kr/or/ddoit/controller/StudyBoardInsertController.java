package kr.or.ddoit.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import kr.or.ddoit.service.IStudyBoardService;
import kr.or.ddoit.service.StudyBoardServiceImpl;
import kr.or.ddoit.vo.StudyBoardVo;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB (메모리 임계값)
	    maxFileSize = 1024 * 1024 * 10,      // 10MB (개별 파일 크기 제한)
	    maxRequestSize = 1024 * 1024 * 50    // 50MB (전체 요청 크기 제한)
)

@WebServlet("/studyBoardInsert.do")
public class StudyBoardInsertController extends HttpServlet {
	IStudyBoardService studyBoardService = StudyBoardServiceImpl.getInstance();
	
	
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/studyboard/studyBoardInsert.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        	
        	// 업로드 경로 설정
            String uploadPath = req.getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);

            // 경로가 없으면 디렉토리 생성
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
        	
        	Collection<Part> parts = req.getParts();
            for (Part part : parts) {
                if (part.getName().equals("files") && part.getSize() > 0) {
                    String fileName = part.getSubmittedFileName();
                    String uploadPath1 = req.getServletContext().getRealPath("/uploads");
                    part.write(uploadPath1 + "/" + fileName);
                }
            }
            
            
            String boardName = req.getParameter("boardName");
            String boardType = req.getParameter("boardType");
            String boardStatus = req.getParameter("boardStatus");
            String createdDate = req.getParameter("createdDate");
            String adminMemberNoStr = req.getParameter("adminMemberNo");
            String parentBoardNoStr = req.getParameter("parentBoardNo");

            int adminMemberNo = adminMemberNoStr != null ? Integer.parseInt(adminMemberNoStr) : 0;
            int parentBoardNo = parentBoardNoStr != null ? Integer.parseInt(parentBoardNoStr) : 0;

            StudyBoardVo vo = new StudyBoardVo();
            vo.setBoardName(boardName);
            vo.setBoardType(boardType);
            vo.setBoardStatus(boardStatus);
            vo.setCreatedDate(createdDate);
            vo.setAdminMemberNo(adminMemberNo);
            vo.setParentBoardNo(parentBoardNo);

            studyBoardService.studyBoardInsert(vo);
            resp.sendRedirect(req.getContextPath() + "/studyBoardList.do");
        
    }
}
