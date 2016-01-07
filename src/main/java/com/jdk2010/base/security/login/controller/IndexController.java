package com.jdk2010.base.security.login.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.base.security.securityuser.service.ISecurityUserService;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.CookieUtil;
import com.jdk2010.framework.util.OsInfoUtil;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    ISecurityUserService securityUserService;
    
    @Resource
    ISecurityNewsService securityNewsService;

    @RequestMapping("/")
    public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/main";
    }

    @RequestMapping("/main")
    public String main(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/main";
    }

    @RequestMapping("/loginout")
    public String out(HttpServletRequest request, HttpServletResponse response) throws Exception {
        removeSessionAttr("securityUser");
        CookieUtil.deleteCookie(request, response, "username");
        CookieUtil.deleteCookie(request, response, "md5Password");
        return REDIRECT + "/login.htm";
    }

    @RequestMapping("/top")
    public String top(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/top";
    }

    @RequestMapping("/getMenu")
    public void getMenu(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityUser securityUser = getSessionAttr("securityUser");
        // 组装菜单
        String menuStr = "";
        String contextpath = request.getContextPath();
        Map<Object, Object> userMenuMap = securityUserService.getUserMenu(securityUser);
        for (Object obj : userMenuMap.keySet()) {
            Map<String, Object> parentMap = (Map<String, Object>) obj;
            menuStr = menuStr + "<dd><div class=\"title\"><span><img src=\"" + contextpath + parentMap.get("img")
                    + "\" /></span>" + parentMap.get("name") + "</div><ul class=\"menuson\">";
            List<Map<String, Object>> list = (List<Map<String, Object>>) userMenuMap.get(obj);
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> secondMap = (Map<String, Object>) list.get(i);
                menuStr = menuStr + "<li><cite></cite><a href=\"" + contextpath + "" + secondMap.get("url")
                        + "\" target=\"rightFrame\">" + secondMap.get("name") + "</a><i></i></li>";
            }
            menuStr = menuStr + "</ul></dd>";
        }
        setSessionAttr("menuStr", menuStr);
        renderText(response, menuStr);
    }

    @RequestMapping("/defaultMain")
    public String defaultMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityUser securityUser = getSessionAttr("securityUser");
        if(securityUser==null){
            return REDIRECT+"/login.htm";
        }
        else{
            setAttr("jdkVersion", OsInfoUtil.getJdkVersion());
            setAttr("jdkHome", OsInfoUtil.getJdkHome());
            setAttr("osName", OsInfoUtil.getOsName());
            List<SecurityNews> newsList=securityNewsService.getTop7News();
            setAttr("newsList", newsList);
            return "/defaultMain";
        }
        
    }

    @RequestMapping("/footer")
    public String footer(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/footer";
    }

    @RequestMapping("/tech")
    public String tech(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/tech";
    }
    
    @RequestMapping("/passwordModify")
    public String passwordModify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/base/security/securityuser/password_modify";
    }

}
