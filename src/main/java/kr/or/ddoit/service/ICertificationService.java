package kr.or.ddoit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddoit.vo.CertificationVo;

public interface ICertificationService {
	public List<CertificationVo> certifiList(); 
	public CertificationVo certifiWeek(CertificationVo certifiVo);
	//public Map<String, Object> calendarDay(CalendarVo certifi);
	public int certifiInsert(CertificationVo certifiVo);
	
	public int certifiUpdate(CertificationVo certifiVo);
	public int certifiDelete(CertificationVo certifiVo);
	
}
