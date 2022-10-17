package com.report.global;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.FilterChain;
import java.io.IOException;

public class SetCharacterEncodingFilter implements Filter {
    protected FilterConfig filterConfig;

    protected String encodingName;

    protected boolean enable;

    public SetCharacterEncodingFilter() {
        this.encodingName = "UTF-8";
        this.enable = false;
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        loadConfigParams();
    }

    private void loadConfigParams() {
        // encoding
        this.encodingName = this.filterConfig.getInitParameter("encoding");
        // filter enable flag
        String strIgnoreFlag = this.filterConfig.getInitParameter("enable");
        if (strIgnoreFlag.equalsIgnoreCase("true")) {
            this.enable = true;
        }
        else {
            this.enable = false;
        }
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        if (this.enable) {
            request.setCharacterEncoding(this.encodingName);
            response.setCharacterEncoding(this.encodingName);
        }
//        if (SysGlobals.getSysConfig("website_close").equals("1")) {
//            response.setContentType("text/html; charset=utf-8");
//            response.getWriter().println("<h1>网站维护中，请稍后访问</h1>");
//        }
//        else {
            chain.doFilter(request, response);
//        }
    }

    public void destroy() {
    }
}
