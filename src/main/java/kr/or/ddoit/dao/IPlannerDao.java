package kr.or.ddoit.dao;

import java.util.List;

import kr.or.ddoit.vo.PlannerVo;

public interface IPlannerDao {
	public List<PlannerVo> planList(PlannerVo planVo);
	
}
