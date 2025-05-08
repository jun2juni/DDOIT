package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class AchievementConditionVo {

	// 업적 조건
	private int conditionNo;
	private int achievementNo;
	private String conditionType;
	private int targetCount;
	private String createdDate;

}
