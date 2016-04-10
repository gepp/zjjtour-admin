package com.jdk2010.base.security.securityuser.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securityorganization.model.SecurityOrganization;
import com.jdk2010.base.security.securityorganization.service.ISecurityOrganizationService;
import com.jdk2010.base.security.securityrole.model.SecurityRole;
import com.jdk2010.base.security.securityrole.service.ISecurityRoleService;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.base.security.securityuser.service.ISecurityUserService;
import com.jdk2010.base.security.securityuserrole.model.SecurityUserRole;
import com.jdk2010.base.security.securityuserrole.service.ISecurityUserRoleService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.MD5Utils;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.framework.util.StringUtil;

@Controller
@RequestMapping(value = "/securityuser")
public class SecurityUserController extends BaseController {

    @Resource
    ISecurityUserService securityUserService;

    @Resource
    ISecurityUserRoleService securityUserRoleService;

    @Resource
    ISecurityRoleService securityRoleService;

    @Resource
    ISecurityOrganizationService securityOrganizationService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DbKit dbKit = new DbKit(
                "select t.*,a.name as organization_name from security_user t left join security_organization a on t.organization_id=a.id where 1=1  ");
        String searchSQL = "";
        String orderSQL = "";
        dbKit.append(orderSQL);
        Page pageList = securityUserService.queryForPageList(dbKit, getPage(), SecurityUser.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/base/security/securityuser/securityuser";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/base/security/securityuser/securityuser_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityUser securityUser = getModel(SecurityUser.class);
        Integer organizationId = getParaToInt("organizationId");
        securityUser.setOrganizationId(organizationId);
        securityUser.setCtime(new Date());
        securityUser.setUserpwd(MD5Utils.md5(getPara("userpwd")));
        Integer userId = securityUserService.save(securityUser);
        String roleIds = getPara("roleIds");
        for (int i = 0; i < roleIds.split(",").length; i++) {
            SecurityUserRole userRole = new SecurityUserRole();
            String roleId = roleIds.split(",")[i];
            if (!StringUtil.isBlank(roleId)) {
                userRole.setUserId(userId);
                userRole.setRoleId(Integer.parseInt(roleId));
                securityUserRoleService.save(userRole);
            }
        }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityUser securityUser = securityUserService.findById(id, SecurityUser.class);
        setAttr("securityUser", securityUser);

        Integer organizationId = securityUser.getOrganizationId();

        SecurityOrganization organization = securityOrganizationService.findById(organizationId,
                SecurityOrganization.class);
        if (organization != null) {
            setAttr("organizationId", organization.getId());
            setAttr("organizationName", organization.getName());
        }
        String roleIds = "";
        String roleNames = "";
        List<SecurityUserRole> userRoleList = securityUserRoleService.getSecurityUserRoleByUserId(Integer.parseInt(id));
        for (int i = 0; i < userRoleList.size(); i++) {
            SecurityUserRole userRole = userRoleList.get(i);
            SecurityRole role = securityRoleService.findById(userRole.getRoleId(), SecurityRole.class);
            roleIds = roleIds + "," + userRole.getRoleId();
            if (role != null) {
                roleNames = roleNames + "," + role.getName();
            }
        }
        if (roleNames.length() > 0) {
            roleIds = roleIds + ",";
            roleNames = roleNames.substring(1);
        }
        setAttr("roleIds", roleIds);
        setAttr("roleNames", roleNames);

        return "/com/jdk2010/base/security/securityuser/securityuser_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityUser securityUser = getModel(SecurityUser.class);
        SecurityUser oldSecurityUser = securityUserService.findById(securityUser.getId(), SecurityUser.class);

        Integer organizationId = getParaToInt("organizationId");
        securityUser.setOrganizationId(organizationId);
        securityUserService.update(securityUser);

        Integer userId = securityUser.getId();
        securityUserRoleService.deleteSecurityUserRoleByUserId(userId);
        String roleIds = getPara("roleIds");

        for (int i = 0; i < roleIds.split(",").length; i++) {
            SecurityUserRole userRole = new SecurityUserRole();
            String roleId = roleIds.split(",")[i];
            if (!StringUtil.isBlank(roleId)) {
                userRole.setUserId(userId);
                userRole.setRoleId(Integer.parseInt(roleId));
                securityUserRoleService.save(userRole);
            }
        }

        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        String status = Constants.SUCCESS;
        String message = "";
        String[] idStrs = ids.toString().split(",");
        for (int i = 0; i < idStrs.length; i++) {
            SecurityUser user = securityUserService.findById(idStrs[i], SecurityUser.class);
            if (user.getUsername().equals("system")) {
                status = Constants.ERROR;
                message = "系统管理员system不允许删除！";
                break;
            }
            securityUserService.deleteByID(idStrs[i], SecurityUser.class);
            securityUserRoleService.deleteSecurityUserRoleByUserId(Integer.parseInt(idStrs[i]));
        }
        ReturnData returnData = new ReturnData(status, message);
        renderJson(response, returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityUser securityUser = securityUserService.findById(id, SecurityUser.class);
        setAttr("securityUser", securityUser);
        Integer organizationId = securityUser.getOrganizationId();
        SecurityOrganization organization = securityOrganizationService.findById(organizationId,
                SecurityOrganization.class);
        if (organization != null) {
            setAttr("organizationId", organization.getId());
            setAttr("organizationName", organization.getName());
        }
        return "/com/jdk2010/base/security/securityuser/securityuser_view";
    }

    @RequestMapping("/check")
    public void check(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String code = getPara("securityUser.username");
        boolean isExist = securityUserService.isExistUsername(code);
        Map<String, Object> returnMap = new HashMap<String, Object>();
        if (isExist) {
            returnMap.put("error", "登录用户名已存在，请重新输入");
        } else {
            returnMap.put("ok", "恭喜您，该登录用户名可以使用");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", returnMap);
        renderJson(response, map);
    }

    @RequestMapping("/resetPwd")
    public void resetPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String flag = Constants.SUCCESS;
        String reason = "";
        String id = getPara("id");
        SecurityUser securityUser = securityUserService.findById(id, SecurityUser.class);
        securityUser.setUserpwd("96e79218965eb72c92a549dd5a330112");
        securityOrganizationService.update(securityUser);
        ReturnData returnData = new ReturnData(flag, reason);
        renderJson(response, returnData);
    }

    @RequestMapping("/modifyPwd")
    public void modifyPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityUser securityUser = getSessionAttr("securityUser");
        String flag = Constants.SUCCESS;
        String reason = "";
        String userpwd = getPara("userpwd");
        userpwd = MD5Utils.md5(userpwd);
        if (!securityUser.getUserpwd().equalsIgnoreCase(userpwd)) {
            flag = Constants.ERROR;
            reason = "原密码不正确!";
        } else {
            String userpwd1 = getPara("userpwd1");
            userpwd1 = MD5Utils.md5(userpwd1);
            if ("de88e3e4ab202d87754078cbb2df6063".equalsIgnoreCase(userpwd1)) {
                flag = Constants.ERROR;
                reason = "密码与系统初始化密码一致,请修改!";
            } else {
                securityUser.setUserpwd(userpwd1);
                securityOrganizationService.update(securityUser);
            }
        }
        ReturnData returnData = new ReturnData(flag, reason);
        renderJson(response, returnData);
    }

}
