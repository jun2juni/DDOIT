package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class ProdVo {
	private int productNo;
	private String productName;
	private int productType;
	private int price;
	private String description;
	private String productImage;
	private String prodStatus;
	private String regDate;
	private String updateDate;
	
	
	// p.상품번호 = w.상품번호 / w.회원번호 = m.회원번호
	private int wishCheck;
	private int memNo;
	// 상품 구매 수량
	private int qty;
	// 주문번호
	private int orderNo;
	// 상품 소유
	private int own;

}
