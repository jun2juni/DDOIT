package kr.or.ddoit.vo;

import java.util.List;

import lombok.Data;

@Data
public class PaginationVo<T> {
	// 현재 페이지
	private int currentPage;
	// 현재 페이지에서 시작 게시글
	private int startNo;
	// 현재 페이지에서 마지막 게시글
	private int endNo;
	
	// 한 페이지에 나오는 게시글 수
	private int blockSize = 10;
	// 하나의 페이지에 나오는 페이지 수
	private int pageSize = 5;
	
	// 예시 < 1 2 3 4 5>
	// 하나의 페이지에 나오는 첫번째 페이지 // 예시에서 1
	private int startPage;
	// 하나의 페이지에 나오는 마지막 페이지 // 예시에서 5
	private int endPage;
	// 전체 페이지
	private int totalPage;
	
	// postVo를 받아오는 List
	private List<T> dataList;
	// 검색옵션을 받는다.
	private T searchVo;
	
	public PaginationVo() {
	}
	public PaginationVo(int blockSize) {
		this.blockSize = blockSize;
	}
	
	
	public void setTotalPage(int total) {
		// 전체 글 개수를 매개값으로 받는다.
//		this.totalPage = total/blockSize; // 밑에가 맞지 않나?
		this.totalPage = (int)(Math.ceil(total*1.0/blockSize));
	}
	
	// 현재 페이지와 현재 페이지의 첫번째 게시글과 마지막 게시글을 설정한다.
	public void setPageNo(int currentPage) {
		this.currentPage = currentPage;
		startNo = 1+(currentPage-1)*blockSize;
		endNo = currentPage*blockSize;
		// 11 ~20 2페이지  
		
		// 121 12 페이지 
		// start = 1*10+1  end = 1*10+10 
		endPage = (currentPage+pageSize-1)/pageSize*pageSize;
		startPage = endPage - pageSize + 1;
		
	}
}
