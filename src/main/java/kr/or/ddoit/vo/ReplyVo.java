package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class ReplyVo {
	private int postNo;
	private int boardNo;
	private int memNo;
	private String title;
	private String content;
	private String createdDate;
	private String modifiedDate;
	private String postStatus;
	private int replyNo;
	private int recommend;
	
	// nickName
	private String memNickname;
}
