package com.jdk2010.base.security.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jdk2010.base.security.securityuser.model.SecurityUser;

public class LoginFilter implements Filter {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    public LoginFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        SecurityUser securityUser = (SecurityUser) req.getSession().getAttribute("securityUser");
        req.setAttribute("contextpath", req.getContextPath());
        if (!(ifFilter(req))) {
            chain.doFilter(request, response);
            return;
        }
        if (securityUser == null) {
            res.sendRedirect(req.getContextPath() + "/login.htm");
        } else {
            chain.doFilter(request, response);
        }

    }

    public void init(FilterConfig fConfig) throws ServletException {
    }

    // 静态资源不做过滤
    public static final String[] IGNORE_SUFFIX = { ".png", ".jpg", ".jpeg", ".gif", ".css", ".js", ".html", "swf",
            "login.htm", "" };

    /**
     * 是否过滤请求
     * 
     * @param request
     * @return
     */
    private boolean ifFilter(HttpServletRequest request) {
        String uri = request.getRequestURI().toLowerCase();
        for (String suffix : IGNORE_SUFFIX) {
            if (uri.endsWith(suffix))
                return false;
        }
        return true;
    }
}
