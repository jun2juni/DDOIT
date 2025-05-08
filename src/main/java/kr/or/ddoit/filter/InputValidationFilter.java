package kr.or.ddoit.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

// 입력 검증 필터
// 회원가입, 게시글 작성 등 입력데이터가 유효한지 검증
public class InputValidationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		// 사전 필터
		req.getParameter("memId");
		req.getParameter("memId");
		req.getParameter("memId");
		
		
		
		chain.doFilter(req, resp);
	}
}
