package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class CertificationVo {
	private int certificationNo;
	private String certificationName;
	private String institution;
//	private String examDate;
//	private String examTime;
	private String registrationStartDate;
//	private String registrationStartTime;
	private String registrationEndDate;
//	private String registrationEndTime;
//	private String createdAt;
	private String calendarBackgroundcolor;
	
	/*
	 * private int calendarNo; private String calendarTitle; private String
	 * calendarMemo; private String calendarStart; private String calendarEnd;
	 */
}
