package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class CommentsVo {
	private int commentNo;
	private int postNo;
	private int memNo;
	private int replyNo;
	private String content;
	private String createdDate;
	private String status;
	
	// nickName
	private String memNickname;
}
