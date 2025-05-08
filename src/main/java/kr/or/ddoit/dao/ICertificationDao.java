package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.vo.CertificationVo;

public interface ICertificationDao {
	public List<CertificationVo> certifiList(); 
	public CertificationVo certifiWeek(CertificationVo certifiVo);
	//public Map<String, Object> calendarDay(CalendarVo certifi);
	//받아올 값이 있다면 파라미터 타입이 필요하고, void로 하면 return 값이 필요없다.
	public int certifiInsert(CertificationVo certifiVo);
	
	public int certifiUpdate(CertificationVo certifiVo);
	public int certifiDelete(CertificationVo certifiVo);
	
	
	
	
}
