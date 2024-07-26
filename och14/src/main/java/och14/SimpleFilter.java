package och14;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

//@WebFilter("/sub1/*")  // init만 
public class SimpleFilter implements Filter {
	// 서버 프로그램이 올라가면서 단한번 실행된다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("SimpleFilter init...");
		Filter.super.init(filterConfig);
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			System.out.println("Filter 시작...");
			// 또 다른 Filter 수행
			chain.doFilter(request, response); // 다른 필터를 부름 -> logincheckfileter로...go
			System.out.println("Filter 끝..");
	}

}
