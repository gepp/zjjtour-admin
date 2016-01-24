package com.jdk2010.system.systemadv.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.system.systemadv.model.SystemAdv;
import com.jdk2010.system.systemadv.service.ISystemAdvService;

@Controller
@RequestMapping(value = "/systemadv")
public class SystemAdvController extends BaseController {

    @Resource
    ISystemAdvService systemAdvService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DbKit dbKit = new DbKit("select * from system_adv  where 1=1 ");
        String searchSQL = "";
        String orderSQL = "";
        dbKit.append(orderSQL);
        Page pageList = systemAdvService.queryForPageList(dbKit, getPage(), SystemAdv.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/system/systemadv/systemadv";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/system/systemadv/systemadv_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SystemAdv systemAdv = getModel(SystemAdv.class);
        systemAdvService.save(systemAdv);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SystemAdv systemAdv = systemAdvService.findById(id, SystemAdv.class);
        setAttr("systemAdv", systemAdv);
        return "/com/jdk2010/system/systemadv/systemadv_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SystemAdv systemAdv = getModel(SystemAdv.class);
        systemAdvService.update(systemAdv);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        systemAdvService.deleteByIDS(ids, SystemAdv.class);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SystemAdv systemAdv = systemAdvService.findById(id, SystemAdv.class);
        setAttr("systemAdv", systemAdv);
        return "/com/jdk2010/system/systemadv/systemadv_view";
    }

}
