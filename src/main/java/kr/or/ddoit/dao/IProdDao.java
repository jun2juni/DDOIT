package kr.or.ddoit.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddoit.vo.ProdVo;

public interface IProdDao {
	public List<Map<String, Object>> prodList(ProdVo prodVo);
	
	public ProdVo prodView(ProdVo prod);

	public List<Map<String, Object>> wishList(int memNo);
	
	public ProdVo prodReceipt(Map<String,Object> map);
	
	public int wishOff(ProdVo prodVo);

	public int wishOn(ProdVo prodVo);
	
	public int orderAdd(Map<String, Object> map);
	
	public int getOrderNo(Map<String, Object> map);
	
	public void totalPoint(Map<String,Object> map);
	
	public List<Map<String, Object>> myGoodsList(int memNo);
	
}
