package kr.or.ddoit.service;

import java.util.List;

import kr.or.ddoit.vo.PlannerVo;

public interface IPlannerService {
	public List<PlannerVo> planList(PlannerVo planVo);
}
