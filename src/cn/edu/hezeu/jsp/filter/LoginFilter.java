package cn.edu.hezeu.jsp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) 
				throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) servletRequest;
		HttpServletResponse resp = (HttpServletResponse) servletResponse;
		HttpSession session = req.getSession();
		String path = req.getRequestURI();
		
		//下面的用""注释掉了,没有用
		String contextPath = "req.getServletContext().getContextPath()";
		if (path.endsWith("/")) {
			resp.sendRedirect(contextPath + "/index");
		} else if (path.indexOf("/login.jsp") > -1 ||path.indexOf("css") > -1 
				|| path.endsWith("css") || path.endsWith("js") || path.indexOf("/images") > -1 
				|| path.indexOf("index") > -1
				|| path.indexOf("/ajax") > -1 || path.indexOf("/userManager") > -1 
				|| path.indexOf("/tag") > -1 || path.indexOf("/register") > -1) {
			filterChain.doFilter(req, resp);
			return;
		} else {
			Object sessionValue = session.getAttribute("loginSign");
			if (sessionValue == null || "".equals(sessionValue)) {
				resp.sendRedirect("login.jsp");
			} else {
				filterChain.doFilter(req, resp);
			}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}
}