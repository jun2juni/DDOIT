package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class AchievementCompletionVo {

	// 업적 달성
	private int completionNo;
	private int memNo;
	private int achievementNo;
	private String completionDate;
	private String isCompleted;

}
