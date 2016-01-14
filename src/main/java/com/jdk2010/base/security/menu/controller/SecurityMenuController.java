package com.jdk2010.base.security.menu.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.menu.model.SecurityMenu;
import com.jdk2010.base.security.menu.service.ISecurityMenuService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.ReturnData;

@Controller
@RequestMapping(value = "/securitymenu")
public class SecurityMenuController extends BaseController {

    @Resource
    ISecurityMenuService securityMenuService;

    @Resource
    DalClient dalClient;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	//1 代表栏目 2代表标签
        List<Map<String, Object>> menuList = securityMenuService.getMenuListByParentIdColumn("0","1");
        setAttr("menuList", menuList);
        return "/com/jdk2010/base/security/menu/menu";
    }
    
    
    @RequestMapping("/listSearch")
    public String listSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	//1 代表栏目 2代表标签
        List<Map<String, Object>> menuList = securityMenuService.getMenuListByParentIdColumn("0","1");
        setAttr("menuList", menuList);
        return "/com/jdk2010/base/security/menu/menuSearch";
    }
    
    @RequestMapping("/updateSearch")
    public void updateSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id=getPara("id");
        String canSearch=getPara("canSearch");
        SecurityMenu securityMenu = securityMenuService.findById(id, SecurityMenu.class);
        securityMenu.setCanSearch(canSearch);
        securityMenuService.update(securityMenu);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<SecurityMenu> firstMenuList = dalClient.queryForObjectList(
                "select * from security_menu where type='1' and parent_id='0' and status=1 ", SecurityMenu.class);
        setAttr("firstMenuList", firstMenuList);
        return "/com/jdk2010/base/security/menu/menu_add";
    }
    
    

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityMenu securityMenu = getModel(SecurityMenu.class);
        securityMenu.setType("1");
        if(securityMenu.getParentId().equals("0")){
            securityMenu.setImg("/res/images/leftico01.png");
        }
        securityMenuService.save(securityMenu);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityMenu securityMenu = securityMenuService.findById(id, SecurityMenu.class);

        List<SecurityMenu> firstMenuList = dalClient.queryForObjectList(
                "select * from security_menu where type='1' and parent_id='0' and status=1 and id!="+id, SecurityMenu.class);
        setAttr("firstMenuList", firstMenuList);
        setAttr("securityMenu", securityMenu);
        return "/com/jdk2010/base/security/menu/menu_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityMenu securityMenu = getModel(SecurityMenu.class);
        securityMenuService.update(securityMenu);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        securityMenuService.deleteByIDS(ids, SecurityMenu.class);
        dalClient.update("delete from security_menu where parent_id="+ids);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityMenu securityMenu = securityMenuService.findById(id, SecurityMenu.class);
        setAttr("securityMenu", securityMenu);
        return "/com/jdk2010/base/security/menu/menu_view";
    }

    @RequestMapping("/select")
    public String select(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Map<String, Object>> menuList = securityMenuService.getMenuListByParentId("0");
        setAttr("menuList", menuList);
        String menuIds = getPara("menuIds");
        if (menuIds != null) {
            setAttr("menuIds", menuIds);
        }
        return "/com/jdk2010/base/security/menu/select";
    }

}
