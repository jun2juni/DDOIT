package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.StudyBoardVo;

public class StudyBoardDaoImpl extends MybatisDao implements IStudyBoardDao {
    
    private static StudyBoardDaoImpl instance;

    private StudyBoardDaoImpl() {
    }

    public static StudyBoardDaoImpl getInstance() {
        if (instance == null) {
            instance = new StudyBoardDaoImpl();
        }
        return instance;
    }

    @Override
    public List<StudyBoardVo> studyBoardList() {
        return selectList("studyBoard.studyBoardList");
    }

    @Override
    public int studyBoardInsert(StudyBoardVo vo) {
        return update("studyBoard.studyBoardInsert", vo);
    }

    @Override
    public StudyBoardVo studyBoardDetail(StudyBoardVo vo) {
        return selectOne("studyBoard.studyBoardDetail", vo);
    }

    @Override
    public void studyBoardDelete(int boardNo) {
        selectOne("studyBoard.studyBoardDelete", boardNo);
    }

    @Override
    public int studyBoardUpdate(StudyBoardVo vo) {
        return update("studyBoard.studyBoardUpdate", vo);
    }

    @Override
    public List<StudyBoardVo> getStudyBoardsByType(String boardType) {
        return selectList("studyBoard.studyBoardType", boardType);
    }
}
