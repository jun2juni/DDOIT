package kr.or.ddoit.service;

import java.util.List;

import kr.or.ddoit.dao.CertificationDaoImpl;
import kr.or.ddoit.dao.ICertificationDao;
import kr.or.ddoit.vo.CertificationVo;

public class CertificationServiceImpl implements ICertificationService{
	
	ICertificationDao certifiDao = CertificationDaoImpl.getInstance();
	
	/*Singleton 싱글톤 : 새로 만들지 않고 기존의 인스턴스를 가져와 활용*/
	private static CertificationServiceImpl instance;

	private CertificationServiceImpl() {

	}

	public static CertificationServiceImpl getInstance() {

		if (instance == null) {

			instance = new CertificationServiceImpl();

		}

		return instance;

	}
	

	
	@Override
	public List<CertificationVo> certifiList() {
		return certifiDao.certifiList();
	}

	@Override
	public CertificationVo certifiWeek(CertificationVo certifiVo) {
		return certifiDao.certifiWeek(certifiVo);
	}

	@Override
	public int certifiInsert(CertificationVo certifiVo) {
		return certifiDao.certifiInsert(certifiVo);
	}

	@Override
	public int certifiUpdate(CertificationVo certifiVo) {
		return certifiDao.certifiUpdate(certifiVo);
	}

	@Override
	public int certifiDelete(CertificationVo certifiVo) {
		return certifiDao.certifiDelete(certifiVo);
	}

	/*
	 * @Override public Map<String, Object> calendarDay(CalendarVo calendar) { //
	 * TODO Auto-generated method stub return calendarDao.calendarDay(calendar); }
	 */
	
}
