package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class AchievementVo {
	
	// 업적
	private int achievementNo;
	private String title;
	private String iconPath;
	private String description;
	private String createdDate;
}
