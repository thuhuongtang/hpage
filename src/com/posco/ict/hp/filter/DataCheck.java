package com.posco.ict.hp.filter;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.posdata.glue.util.log.PosLog;
import com.posdata.glue.util.log.PosLogFactory;

public class DataCheck implements Filter {
	protected PosLog            log ;
    protected String            charset;
    
    public DataCheck() {
    	this.log = PosLogFactory.getLogger(super.getClass());
	}
    
    @Override
	public void init(FilterConfig config) throws ServletException {
		this.charset = config.getInitParameter("CharSet");
        this.charset = ((charset != null) ? charset : "utf-8");
        
        log.logInfo("Init charset : " + this.charset);
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filterChain) throws IOException, ServletException {
		
		this.log.logInfo("DataCheck Filter is started");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		request.setCharacterEncoding(this.charset);
		// Locale
		Locale locale = Locale.US;
		String lang=request.getParameter("lang")==null?"en":request.getParameter("lang");
		if("kr".equals(lang)) {
			locale=Locale.KOREA;
		} else if("vn".equals(lang)) {
			locale=new Locale("vn","VN");
		}
		request.setAttribute("locale", locale);

		String uri = request.getRequestURI();
		if(request.getParameter("ServiceName") == null && (uri.indexOf("actDtl.do") > 0 || uri.indexOf("newsDtl.do") > 0)) {
			String newUri = uri.replaceAll("Dtl", "");
			response.sendRedirect(newUri);
		} else {
			filterChain.doFilter(new DataCheckWrapper(request), response);
		}
	}
	
	@Override
	public void destroy() {
		this.charset = null;
        this.log = null ;
        this.log.logInfo("DataCheck Filter is destroyed");
	}
}
