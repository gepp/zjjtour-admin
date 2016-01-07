package com.jdk2010.base.security.securityorganization.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securityorganization.model.SecurityOrganization;
import com.jdk2010.base.security.securityorganization.service.ISecurityOrganizationService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.ReturnData;

@Controller
@RequestMapping(value = "/securityorganization")
public class SecurityOrganizationController extends BaseController {

    @Resource
    ISecurityOrganizationService securityOrganizationService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Map<String, Object>> organizationList = securityOrganizationService.getOrganizationListByParentId("0");
        setAttr("organizationList", organizationList);
        return "/com/jdk2010/base/security/securityorganization/securityorganization";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/base/security/securityorganization/securityorganization_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityOrganization securityOrganization = getModel(SecurityOrganization.class);
        if(securityOrganization.getParentId()==null){
            securityOrganization.setParentId("0");
        }
        securityOrganizationService.save(securityOrganization);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityOrganization securityOrganization = securityOrganizationService
                .findById(id, SecurityOrganization.class);
        setAttr("securityOrganization", securityOrganization);

        SecurityOrganization parentSecurityOrganization = (securityOrganizationService.findById(
                securityOrganization.getParentId(), SecurityOrganization.class));
        if (parentSecurityOrganization != null) {
            setAttr("parentName", parentSecurityOrganization.getName());
        } else {
            setAttr("parentName", "");
        }
        return "/com/jdk2010/base/security/securityorganization/securityorganization_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityOrganization securityOrganization = getModel(SecurityOrganization.class);
        securityOrganizationService.update(securityOrganization);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        securityOrganizationService.deleteByIDS(ids, SecurityOrganization.class);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityOrganization securityOrganization = securityOrganizationService
                .findById(id, SecurityOrganization.class);
        SecurityOrganization parentSecurityOrganization = (securityOrganizationService.findById(
                securityOrganization.getParentId(), SecurityOrganization.class));
        if (parentSecurityOrganization != null) {
            setAttr("parentName", parentSecurityOrganization.getName());
        } else {
            setAttr("parentName", "");
        }
        setAttr("securityOrganization", securityOrganization);
        return "/com/jdk2010/base/security/securityorganization/securityorganization_view";
    }

    @RequestMapping("/select")
    public String select(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Map<String, Object>> organizationList = securityOrganizationService.getOrganizationListByParentId("0");
        setAttr("organizationList", organizationList);
        return "/com/jdk2010/base/security/securityorganization/select";
    }

}
