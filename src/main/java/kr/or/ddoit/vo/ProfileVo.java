package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class ProfileVo {
	// 프로필
	private int profileNo;
	private int memNo;
	private String introduction;
	private String image;
	private String onlineStatus;
	private String achievementYn;
	private String achievementCondition;
	private String backgroundImage;
	
	// 닉네임
	private String memberNickname;
	// 상품사용여부
	private String userYn;
}
