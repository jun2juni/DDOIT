package kr.or.ddoit.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 로그인 필터
@WebFilter("/*")
public class LoginCheckFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		String requestURI = httpRequest.getRequestURI();
		
		 
		
		// 인증이 필요없는 경로들
        String[] allowedPaths = {
            "/login.jsp",
            "/login.do",
            "/css/",
            "/js/",
            "/resources/",
            "/images/",
            "/fonts/",
            ".ico",
            "/regimember.do",
            "/regimeber.jsp",
            "/certification.do",
            "/certification.jsp",
            "/planner.do",
            "/plannerMain.jsp",
            "/certifiUpdate.do",
            "/certifiDelete.do",
            "/loginIdFind.do",
            "/loginPassFind.do",
            "/loginPassFind.jsp",
            "/loginIdFind.jsp"
            
        };
		
		// 필터 제외되어야 하는 페이지
        for(String allowedPath : allowedPaths) {
            if(requestURI.contains(allowedPath)) {
                chain.doFilter(request, response);
                return;
            }
        }

		// 로그인 안되어 있다면
        // 세션에 member로 저장되어있음
		if (session == null || session.getAttribute("member") == null) {
			// 테스트중 다시 index.do 보내야됨
			if(requestURI.endsWith("/index.do")) {
	            httpResponse.sendRedirect(httpRequest.getContextPath() + "/loign.do");
	            return;
	        }
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.do");
			return;
		}

		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
}
