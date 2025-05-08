package kr.or.ddoit.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberVo {
	private int memNo;
	private String memName;
	private String memId;
	private String memPassword;
	private String memNickname;
	private String memEmail;
	private String memPhone;
	private String courseName;
	private int points;
	private int memType;
	private LocalDateTime memJoinDate;
	private String completionStatus;
	private LocalDateTime courseSdate;
	private LocalDateTime courseEdate;
	private String memStatus;
}
