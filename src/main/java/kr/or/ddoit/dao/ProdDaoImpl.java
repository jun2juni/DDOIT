package kr.or.ddoit.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import kr.or.ddoit.util.MybatisDao;
import kr.or.ddoit.vo.ProdVo;

public class ProdDaoImpl extends MybatisDao implements IProdDao{
	
	private static ProdDaoImpl instance;

	private ProdDaoImpl() {

	}

	public static ProdDaoImpl getInstace() {
		if (instance == null)
			instance = new ProdDaoImpl();
		return instance;
	}

	@Override
	public List<Map<String, Object>> prodList(ProdVo prodVo) {
		return selectList("prod.prodList", prodVo);
	}
	
	@Override
	public ProdVo prodView(ProdVo prod) {
		return selectOne("prod.prodView", prod);
	}

	@Override
	public List<Map<String, Object>> wishList(int memNo) {
		return selectList("prod.wishList", memNo);
	}

	@Override
	public ProdVo prodReceipt(Map<String,Object> map) {
		return selectOne("prod.receipt", map);
	}

	@Override
	public int wishOn(ProdVo prodVo) {
		return update("prod.wishon", prodVo);
	}
	
	@Override
	public int wishOff(ProdVo prodVo) {
		return update("prod.wishoff", prodVo);	
	}

	@Override
	public int orderAdd(Map<String, Object> map) {
		return update("prod.orderAdd", map);
	}
	
	public int getOrderNo(Map<String, Object> map) {
		return selectOne("prod.getOrderNo", map);
	}

	@Override
	public void totalPoint(Map<String, Object> map) {
		update("prod.totalPoint", map);
	}

	@Override
	public List<Map<String, Object>> myGoodsList(int memNo) {
		return selectList("prod.myGoodsList", memNo);
	}


}
