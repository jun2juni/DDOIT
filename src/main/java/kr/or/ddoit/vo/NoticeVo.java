package kr.or.ddoit.vo;



import lombok.Data;

@Data
public class NoticeVo {
	private int boardNo;
	private String boardName;
	private String boardType;
	private String boardStatus;
	private String createdDate;
	private int adminMemberNo;
	private int parentBoardNo;
	private String boardContrnt;
}
