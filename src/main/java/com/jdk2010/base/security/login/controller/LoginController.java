package com.jdk2010.base.security.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.menu.service.ISecurityMenuService;
import com.jdk2010.base.security.securityrolemenu.service.ISecurityRoleMenuService;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.base.security.securityuser.service.ISecurityUserService;
import com.jdk2010.base.security.securityuserrole.service.ISecurityUserRoleService;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.cache.support.ehcache.EhCacheCacheManager;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.CookieUtil;
import com.jdk2010.framework.util.MD5Utils;
import com.octo.captcha.service.image.ImageCaptchaService;

@Controller
@RequestMapping(value = "/")
public class LoginController extends BaseController {

    @Resource
    ISecurityUserService securityUserService;

    @Resource
    ISecurityMenuService securityMenuService;

    @Resource
    ISecurityUserRoleService securityUserRoleService;

    @Resource
    ISecurityRoleMenuService securityRoleMenuService;

    @Resource
    private ImageCaptchaService imageCaptchaService;

    @Resource
    EhCacheCacheManager ehCacheCacheManager;

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/login")
    public String in(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = CookieUtil.getCookieValue(request, response, "username");
        String md5Password = CookieUtil.getCookieValue(request, response, "md5Password");
        if (!"".equals(username) && !"".equals(md5Password)) {
            request.setAttribute("username", username);
            request.setAttribute("md5Password", md5Password);
            return FORWARD + "autoLogin.htm";
        } else {
            return "/login";
        }

    }

    @RequestMapping("/doLogin")
    public void inAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = getPara("username");
        String password = getPara("password");
        String rememberMe = getPara("rememberMe");
        Integer failTime = (Integer) ehCacheCacheManager.getEhCache("metaCache").get(username + "failTime");

        if (failTime == null) {
            failTime = 0;
            ehCacheCacheManager.getEhCache("metaCache").put(username + "failTime", 0, 60 * 30); // 30分钟过期设置
        }

        String captcha = getPara("captcha");
        Boolean isResponseCorrect = imageCaptchaService.validateResponseForID(request.getSession().getId(), captcha);
        request.getSession().invalidate(); // 清空session
        if (request.getCookies() != null) {
            Cookie cookie = request.getCookies()[0]; // 获取cookie
            cookie.setMaxAge(0); // 让cookie过期
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String flag = "T";
        String reason = "";

        if (failTime > 3) {
            flag = "F";
            reason = "密码错误超过3次，请您半小时以后再登录！";
        } else {
            if (isResponseCorrect) {
                SecurityUser securityUser = securityUserService.login(username, password);
                if (securityUser == null) {
                    flag = "F";
                    reason = "用户名或密码错误";
                    ehCacheCacheManager.getEhCache("metaCache").put(username + "failTime", failTime + 1, 60 * 30); // 30分钟过期设置
                } else {
                    if ("true".equals(rememberMe)) {
                        CookieUtil.addCookie(request, response, "username", username, 60 * 60);
                        CookieUtil.addCookie(request, response, "md5Password", password, 60 * 60);
                    }
                    setSessionAttr("securityUser", securityUser);
                    String menuStr = securityUserService.getUserMenuStr(securityUser);
                    setSessionAttr("menuStr", menuStr);
                }
            } else {
                flag = "F";
                reason = "验证码错误";
            }
        }
        resultMap.put("flag", flag);
        resultMap.put("reason", reason);
        renderJson(response, resultMap);
    }

    @RequestMapping("/autoLogin")
    public String autoLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = getAttrForStr("username");
        String md5Password = getAttrForStr("md5Password");
        request.getSession().invalidate(); // 清空session
        if (request.getCookies() != null) {
            Cookie cookie = request.getCookies()[0]; // 获取cookie
            cookie.setMaxAge(0); // 让cookie过期
        }
        SecurityUser securityUser = securityUserService.login(username, md5Password);

        if (securityUser == null) {
            CookieUtil.deleteCookie(request, response, "username");
            CookieUtil.deleteCookie(request, response, "md5Password");
            return "/login";
        } else {
            setSessionAttr("securityUser", securityUser);
            setSessionAttr("securityUser", securityUser);
            String menuStr = securityUserService.getUserMenuStr(securityUser);
            setSessionAttr("menuStr", menuStr);
            return REDIRECT + "main.htm";
        }

    }

}
