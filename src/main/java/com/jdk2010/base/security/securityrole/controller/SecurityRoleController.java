package com.jdk2010.base.security.securityrole.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.menu.model.SecurityMenu;
import com.jdk2010.base.security.menu.service.ISecurityMenuService;
import com.jdk2010.base.security.securityrole.model.SecurityRole;
import com.jdk2010.base.security.securityrole.service.ISecurityRoleService;
import com.jdk2010.base.security.securityrolemenu.model.SecurityRoleMenu;
import com.jdk2010.base.security.securityrolemenu.service.ISecurityRoleMenuService;
import com.jdk2010.base.security.securityuserrole.model.SecurityUserRole;
import com.jdk2010.base.security.securityuserrole.service.ISecurityUserRoleService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.framework.util.StringUtil;

@Controller
@RequestMapping(value = "/securityrole")
public class SecurityRoleController extends BaseController {

    @Resource
    ISecurityRoleService securityRoleService;

    @Resource
    ISecurityRoleMenuService securityRoleMenuService;

    @Resource
    ISecurityMenuService securityMenuService;

    @Resource
    ISecurityUserRoleService securityUserRoleService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DbKit dbKit = new DbKit("select * from security_role  where 1=1 ");
        String searchSQL = "";
        String orderSQL = "";
        dbKit.append(orderSQL);
        Page pageList = securityRoleService.queryForPageList(dbKit, getPage(), SecurityRole.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/base/security/securityrole/securityrole";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/base/security/securityrole/securityrole_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityRole securityRole = getModel(SecurityRole.class);
        Integer roleId = securityRoleService.save(securityRole);
        String menuIds = getPara("menuIds");

        Map<String, Object> menuMap = new HashMap<String, Object>();

        for (int i = 0; i < menuIds.split(",").length; i++) {
            String menuIdStr = menuIds.split(",")[i];
            if (!StringUtil.isBlank(menuIdStr)) {
                menuMap.put(menuIdStr, menuIdStr);
                SecurityMenu menu = securityMenuService.findById(menuIdStr, SecurityMenu.class);
                String parentId = menu.getParentId();
                menuMap.put(parentId, parentId);
            }
        }

        for (String key : menuMap.keySet()) {
            SecurityRoleMenu roleMenu = new SecurityRoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(Integer.parseInt(key));
            securityRoleMenuService.save(roleMenu);
        }

        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer id = getParaToInt("id");
        SecurityRole securityRole = securityRoleService.findById(id, SecurityRole.class);
        setAttr("securityRole", securityRole);
        String menuIds = "";
        String menuNames = "";
        List<SecurityRoleMenu> roleMenuList = securityRoleMenuService.getSecurityRoleMenuByRoleId(id);
        for (int i = 0; i < roleMenuList.size(); i++) {
            SecurityRoleMenu securityRoleMenu = roleMenuList.get(i);
            SecurityMenu menu = securityMenuService.findById(securityRoleMenu.getMenuId(), SecurityMenu.class);
            menuIds = menuIds + "," + securityRoleMenu.getMenuId();
            if (menu != null) {
                menuNames = menuNames + "," + menu.getName();
            }
        }
        if (menuNames.length() > 0) {
            menuIds = menuIds + ",";
            menuNames = menuNames.substring(1);
        }
        setAttr("menuIds", menuIds);
        setAttr("menuNames", menuNames);
        return "/com/jdk2010/base/security/securityrole/securityrole_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityRole securityRole = getModel(SecurityRole.class);
        Integer roleId = securityRole.getId();
        securityRoleService.update(securityRole);
        securityRoleMenuService.deleteSecurityRoleMenuByRoleId(roleId);
        String menuIds = getPara("menuIds");
        Map<String, Object> menuMap = new HashMap<String, Object>();
        for (int i = 0; i < menuIds.split(",").length; i++) {
            String menuIdStr = menuIds.split(",")[i];
            if (!StringUtil.isBlank(menuIdStr)) {
                menuMap.put(menuIdStr, menuIdStr);
                SecurityMenu menu = securityMenuService.findById(menuIdStr, SecurityMenu.class);
                if (menu != null) {
                    String parentId = menu.getParentId();
                    menuMap.put(parentId, parentId);
                }
            }
        }
        for (String key : menuMap.keySet()) {
            SecurityRoleMenu roleMenu = new SecurityRoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(Integer.parseInt(key));
            securityRoleMenuService.save(roleMenu);
        }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        String status = Constants.SUCCESS;
        String message = "";
        String[] idStrs = ids.toString().split(",");
        for (int i = 0; i < idStrs.length; i++) {
            List<SecurityUserRole> userRoleList = securityUserRoleService.getSecurityUserRoleByRoleId(Integer
                    .parseInt(idStrs[i]));
            if (userRoleList.size() > 0) {
                SecurityRole role = securityRoleService.findById(idStrs[i], SecurityRole.class);
                status = Constants.ERROR;
                message = role.getCode() + "已绑定用户,请先删除所有绑定该角色的用户!";
                break;
            } else {
                securityRoleService.deleteByID(idStrs[i], SecurityRole.class);
            }
        }

        ReturnData returnData = new ReturnData(status, message);
        renderJson(response,returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityRole securityRole = securityRoleService.findById(id, SecurityRole.class);
        setAttr("securityRole", securityRole);
        return "/com/jdk2010/base/security/securityrole/securityrole_view";
    }

    @RequestMapping("/select")
    public String select(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Map<String, Object>> roleList = securityRoleService
                .queryForList("select * from security_role where status=1 ");
        setAttr("roleList", roleList);
        String roleIds = getPara("roleIds");
        if (roleIds != null) {
            setAttr("roleIds", roleIds);
        }
        return "/com/jdk2010/base/security/securityrole/select";
    }

    @RequestMapping("/check")
    public void check(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String code = getPara("securityRole.code");
        boolean isExist = securityRoleService.isExistRoleCode(code);
        Map<String, Object> returnMap = new HashMap<String, Object>();
        if (isExist) {
            returnMap.put("error", "编码已存在，请重新输入");
        } else {
            returnMap.put("ok", "恭喜您，该编码可以使用");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", returnMap);
        renderJson(response,map);
    }

}
