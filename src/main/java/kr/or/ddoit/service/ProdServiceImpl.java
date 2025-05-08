package kr.or.ddoit.service;
import java.util.List;
import java.util.Map;

import kr.or.ddoit.dao.IProdDao;
import kr.or.ddoit.dao.ProdDaoImpl;
import kr.or.ddoit.vo.ProdVo;

public class ProdServiceImpl implements IProdService {

	private static ProdServiceImpl instance;

	private ProdServiceImpl() {

	}

	public static ProdServiceImpl getInstace() {
		if (instance == null)
			instance = new ProdServiceImpl();
		return instance;
	}

	IProdDao prodDao = ProdDaoImpl.getInstace();
	
	@Override
	public List<Map<String, Object>> prodList(ProdVo prodVo) {
		return prodDao.prodList(prodVo);
	}

	@Override
	public ProdVo prodView(ProdVo prod) {
		return prodDao.prodView(prod);
	}

	@Override
	public List<Map<String, Object>> wishList(int memNo) {
		return prodDao.wishList(memNo);
	}

	@Override
	public ProdVo prodReceipt(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return prodDao.prodReceipt(map);
	}

	@Override
	public int wishOn(ProdVo prodVo) {
		return prodDao.wishOn(prodVo);
	}
	
	@Override
	public int wishOff(ProdVo prodVo) {
		return prodDao.wishOff(prodVo);
	}

	@Override
	public int orderAdd(Map<String, Object> map) {
		return prodDao.orderAdd(map);
	}

	@Override
	public int getOrderNo(Map<String, Object> map) {
		return prodDao.getOrderNo(map);
	}

	@Override
	public void totalPoint(Map<String, Object> map) {
		prodDao.totalPoint(map);
	}

	@Override
	public List<Map<String, Object>> myGoodsList(int memNo) {
		return prodDao.myGoodsList(memNo);
	}

}
