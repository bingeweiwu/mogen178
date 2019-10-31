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

public class CharEncodingFilter implements Filter {
	private String charEncoding = null;
	private FilterConfig filterConfig = null;

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		filterConfig.getInitParameter("char");
	}

	public void destroy() {
		this.charEncoding = null;
		this.filterConfig = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (charEncoding == null) {
			charEncoding = "utf-8";
		}
		if (charEncoding != null) {
			((HttpServletRequest) request).setCharacterEncoding(charEncoding);
			((HttpServletResponse) response)
					.setContentType("text/html;charset=" + charEncoding);
		}
		chain.doFilter(request, response);
	}

}
