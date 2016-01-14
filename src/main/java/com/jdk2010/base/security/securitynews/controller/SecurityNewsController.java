package com.jdk2010.base.security.securitynews.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;

@Controller
@RequestMapping(value = "/securitynews")
public class SecurityNewsController extends BaseController {

    @Resource
    ISecurityNewsService securityNewsService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DbKit dbKit = new DbKit("select * from security_news  where 1=1 ");
        String searchSQL = "";
        String orderSQL = "";
        String title = getPara("title");
        if (title != null && !"".equals(title)) {
            searchSQL = searchSQL + " and  title LIKE '%" + title + "%'";
            setAttr("title", title);
            dbKit.append(searchSQL);
        }

        dbKit.append(orderSQL);
        Page pageList = securityNewsService.queryForPageList(dbKit, getPage(), SecurityNews.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/base/security/securitynews/securitynews";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/base/security/securitynews/securitynews_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityNews securityNews = getModel(SecurityNews.class);
        securityNewsService.save(securityNews);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityNews securityNews = securityNewsService.findById(id, SecurityNews.class);
        setAttr("securityNews", securityNews);
        return "/com/jdk2010/base/security/securitynews/securitynews_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityNews securityNews = getModel(SecurityNews.class);
        securityNewsService.update(securityNews);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        securityNewsService.deleteByIDS(ids, SecurityNews.class);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityNews securityNews = securityNewsService.findById(id, SecurityNews.class);
        setAttr("securityNews", securityNews);
        return "/com/jdk2010/base/security/securitynews/securitynews_view";
    }

}
