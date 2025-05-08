package kr.or.ddoit.service;

import java.util.List;

import kr.or.ddoit.dao.IStudyBoardDao;
import kr.or.ddoit.dao.StudyBoardDaoImpl;
import kr.or.ddoit.vo.StudyBoardVo;

public class StudyBoardServiceImpl implements IStudyBoardService {
    
    private static StudyBoardServiceImpl instance;
    private StudyBoardServiceImpl() {}

    public static StudyBoardServiceImpl getInstance() {
        if (instance == null) {
            instance = new StudyBoardServiceImpl();
        }
        return instance;
    }

    IStudyBoardDao studyBoardDao = StudyBoardDaoImpl.getInstance();

    @Override
    public List<StudyBoardVo> studyBoardList() {
        return studyBoardDao.studyBoardList();
    }

    @Override
    public int studyBoardInsert(StudyBoardVo vo) {
        return studyBoardDao.studyBoardInsert(vo);
    }

    @Override
    public StudyBoardVo studyBoardDetail(StudyBoardVo vo) {
        return studyBoardDao.studyBoardDetail(vo);
    }

    @Override
    public void studyBoardDelete(int boardNo) {
        studyBoardDao.studyBoardDelete(boardNo);
    }

    @Override
    public int studyBoardUpdate(StudyBoardVo vo) {
        return studyBoardDao.studyBoardUpdate(vo);
    }

    @Override
    public List<StudyBoardVo> getStudyBoardsByType(String boardType) {
        return studyBoardDao.getStudyBoardsByType(boardType);
    }
}
