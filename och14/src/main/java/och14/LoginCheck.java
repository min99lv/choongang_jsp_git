package och14;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


/**
 * Servlet Filter implementation class LoginCheck
 */
@WebFilter("/sub2/*")
public class LoginCheck extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("loginCheck dofilter...");
		// pass the request along the filter chain
		//chain.doFilter(request, response);
		
		// request 객체에 형변환을 시켜줌 -> 세션을 가져오기위해서.
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// session 도출 방법 -> 세션 생성
		HttpSession session = httpServletRequest.getSession();
		System.out.println("LoginCheck doFilter");
		// 세션을 이중체크 한다 혹시나....!!!!
		if (session == null || session.equals("")) {
			httpServletResponse.sendRedirect("../login.jsp");
		}
		System.out.println("dofiltter session != null");
		String id = (String)session.getAttribute("id");
		
		
		System.out.println("dofiltter session id -> "+ id);
		
		if(id == null || id.equals("")) {
			httpServletResponse.sendRedirect("../login.jsp");
		}
		
		// chain으로 가라 -> 사슬처럼 연결된 것 do filter의 sub2에 또 다른 체인있다면 체인을 넘겨준다.
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
