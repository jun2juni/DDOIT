package kr.or.ddoit.dao;

import java.util.List;



import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.CertificationVo;

public class CertificationDaoImpl extends MybatisDao implements ICertificationDao{

	/*Singleton 싱글톤 : 새로 만들지 않고 기존의 인스턴스를 가져와 활용*/
	private static CertificationDaoImpl instance;

	private CertificationDaoImpl() {

	}

	public static CertificationDaoImpl getInstance() {

		if (instance == null) {

			instance = new CertificationDaoImpl();

		}

		return instance;

	}

	
	@Override
	public List<CertificationVo> certifiList() {
		List<CertificationVo> certifiList = null;
		//calendarList = SqlSession.selectList("Calendar.calendarList");
		
		// TODO Auto-generated method stub
		return selectList("certifi.certifiList");
	}

	@Override
	public CertificationVo certifiWeek(CertificationVo certifiVo) {
		// TODO Auto-generated method stub
		return selectOne("certifi.certifiWeek",certifiVo);
	}

	@Override
	public int certifiInsert(CertificationVo certifiVo) {
		// TODO Auto-generated method stub
		return insert("certifi.certifiInsert",certifiVo);
	}

	@Override
	public int certifiUpdate(CertificationVo certifiVo) {
		// TODO Auto-generated method stub
		return update("certifi.certifiUpdate",certifiVo);
	}

	@Override
	public int certifiDelete(CertificationVo certifiVo) {
		// TODO Auto-generated method stub
		return update("certifi.certifiDelete",certifiVo);
	}

	/*
	 * @Override public Map<String, Object> calendarDay(CalendarVo calendarVo) { //
	 * TODO Auto-generated method stub return selectOne("calendar.calendarDay"); }
	 */
	
}
