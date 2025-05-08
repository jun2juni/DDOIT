package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.PlannerVo;

public class PlannerDaoImpl extends MybatisDao implements IPlannerDao{
	/*Singleton 싱글톤 : 새로 만들지 않고 기존의 인스턴스를 가져와 활용*/
	private static PlannerDaoImpl instance;

	private PlannerDaoImpl() {

	}

	public static PlannerDaoImpl getInstance() {

		if (instance == null) {

			instance = new PlannerDaoImpl();

		}

		return instance;

	}


	@Override
	public List<PlannerVo> planList(PlannerVo planVo) {
		// TODO Auto-generated method stub
		return selectList("paln.planList");
	}

	
}
