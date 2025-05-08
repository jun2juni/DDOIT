package kr.or.ddoit.service;

import java.util.List;

import kr.or.ddoit.dao.IPlannerDao;
import kr.or.ddoit.dao.PlannerDaoImpl;
import kr.or.ddoit.vo.PlannerVo;

public class PlannerServiceImpl implements IPlannerService{
	
	IPlannerDao planDao = PlannerDaoImpl.getInstance();
	
	/*Singleton 싱글톤 : 새로 만들지 않고 기존의 인스턴스를 가져와 활용*/
	private static PlannerServiceImpl instance;

	private PlannerServiceImpl() {

	}

	public static PlannerServiceImpl getInstance() {

		if (instance == null) {

			instance = new PlannerServiceImpl();

		}

		return instance;

	}

	@Override
	public List<PlannerVo> planList(PlannerVo planVo) {
		// TODO Auto-generated method stub
		return planDao.planList(planVo);
	}

	
}
