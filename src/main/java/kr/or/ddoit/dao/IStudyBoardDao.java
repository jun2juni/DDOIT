package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.vo.StudyBoardVo;

public interface IStudyBoardDao {
    
	public List<StudyBoardVo> studyBoardList();
    
    public int studyBoardInsert(StudyBoardVo vo);
    
    public StudyBoardVo studyBoardDetail(StudyBoardVo vo);
    
    public void studyBoardDelete(int boardNo);
    
    public int studyBoardUpdate(StudyBoardVo vo);
  
    List<StudyBoardVo> getStudyBoardsByType(String boardType);
    
}
