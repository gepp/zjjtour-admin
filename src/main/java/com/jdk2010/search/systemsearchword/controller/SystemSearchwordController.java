package com.jdk2010.search.systemsearchword.controller;

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
import com.jdk2010.search.systemsearchword.model.SystemSearchword;
import com.jdk2010.search.systemsearchword.service.ISystemSearchwordService;

@Controller
@RequestMapping(value = "/systemsearchword")
public class SystemSearchwordController extends BaseController {

	@Resource
	ISystemSearchwordService systemSearchwordService;

	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DbKit dbKit = new DbKit("select * from system_searchword  where 1=1 ");
		String searchSQL = "";
		String orderSQL = "";
		dbKit.append(orderSQL);
		Page pageList = systemSearchwordService.queryForPageList(dbKit,
				getPage(), SystemSearchword.class);
		setAttr("pageList", pageList);
		return "/com/jdk2010/search/systemsearchword/systemsearchword";
	}

	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return "/com/jdk2010/search/systemsearchword/systemsearchword_add";
	}

	@RequestMapping("/addaction")
	public void addaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SystemSearchword systemSearchword = getModel(SystemSearchword.class);
		systemSearchwordService.save(systemSearchword);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response,returnData);
	}

	@RequestMapping("/modify")
	public String modify(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = getPara("id");
		SystemSearchword systemSearchword = systemSearchwordService.findById(
				id, SystemSearchword.class);
		setAttr("systemSearchword", systemSearchword);
		return "/com/jdk2010/search/systemsearchword/systemsearchword_modify";
	}

	@RequestMapping("/modifyaction")
	public void modifyaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SystemSearchword systemSearchword = getModel(SystemSearchword.class);
		systemSearchwordService.update(systemSearchword);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/delete")
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String ids = getPara("ids");
		systemSearchwordService.deleteByIDS(ids, SystemSearchword.class);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/view")
	public String view(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = getPara("id");
		SystemSearchword systemSearchword = systemSearchwordService.findById(
				id, SystemSearchword.class);
		setAttr("systemSearchword", systemSearchword);
		return "/com/jdk2010/search/systemsearchword/systemsearchword_view";
	}

}
