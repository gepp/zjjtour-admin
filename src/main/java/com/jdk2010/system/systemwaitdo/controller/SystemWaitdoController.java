package com.jdk2010.system.systemwaitdo.controller;

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
import com.jdk2010.system.systemwaitdo.model.SystemWaitdo;
import com.jdk2010.system.systemwaitdo.service.ISystemWaitdoService;

@Controller
@RequestMapping(value = "/systemwaitdo")
public class SystemWaitdoController extends BaseController {

	@Resource
	ISystemWaitdoService systemWaitdoService;

	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DbKit dbKit = new DbKit("select t.*,a.menu_id as parentId from system_waitdo t left join  security_news a on t.target_id=a.id  where 1=1");
		String searchSQL = "";
		String orderSQL = "";
		dbKit.append(orderSQL);
		Page pageList = systemWaitdoService.queryForPageList(dbKit, getPage(),
				SystemWaitdo.class);
		setAttr("pageList", pageList);
		return "/com/jdk2010/system/systemwaitdo/systemwaitdo";
	}

	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return "/com/jdk2010/system/systemwaitdo/systemwaitdo_add";
	}

	@RequestMapping("/addaction")
	public void addaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SystemWaitdo systemWaitdo = getModel(SystemWaitdo.class);
		systemWaitdoService.save(systemWaitdo);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response,returnData);
	}

	@RequestMapping("/modify")
	public String modify(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = getPara("id");
		SystemWaitdo systemWaitdo = systemWaitdoService.findById(id,
				SystemWaitdo.class);
		setAttr("systemWaitdo", systemWaitdo);
		return "/com/jdk2010/system/systemwaitdo/systemwaitdo_modify";
	}

	@RequestMapping("/modifyaction")
	public void modifyaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SystemWaitdo systemWaitdo = getModel(SystemWaitdo.class);
		systemWaitdoService.update(systemWaitdo);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response,returnData);
	}

	@RequestMapping("/delete")
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String ids = getPara("ids");
		systemWaitdoService.deleteByIDS(ids, SystemWaitdo.class);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response,returnData);
	}

	@RequestMapping("/view")
	public String view(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = getPara("id");
		SystemWaitdo systemWaitdo = systemWaitdoService.findById(id,
				SystemWaitdo.class);
		setAttr("systemWaitdo", systemWaitdo);
		return "/com/jdk2010/system/systemwaitdo/systemwaitdo_view";
	}

}
