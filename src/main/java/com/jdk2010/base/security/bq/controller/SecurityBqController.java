package com.jdk2010.base.security.bq.controller;

import java.awt.MenuItem;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.menu.model.SecurityMenu;
import com.jdk2010.base.security.menu.service.ISecurityMenuService;
import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.framework.util.StringUtil;

@Controller
@RequestMapping(value = "/bq")
public class SecurityBqController extends BaseController {

	@Resource
	ISecurityMenuService securityMenuService;

	@Resource
	DalClient dalClient;

	@Resource
	ISecurityNewsService securityNewsService;

	@RequestMapping("/listBq")
	public String listBq(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 1 代表栏目 2代表线路
		Map<String, List<Map<String, Object>>> linkedMenuNameList = securityMenuService
				.getBqList();

		setAttr("linkedMenuNameList", linkedMenuNameList);

		List<Map<String, Object>> finalList = new ArrayList<Map<String, Object>>();
		for (String key : linkedMenuNameList.keySet()) {
			Map<String, Object> mapKey = new HashMap<String, Object>();
			mapKey.put("lanmuName", key);
			mapKey.put("type", "1");
			finalList.add(mapKey);
			for (Map<String, Object> map : linkedMenuNameList.get(key)) {
				map.put("type", "0");
				finalList.add(map);
			}
		}

		setAttr("finalList", finalList);
		return "/com/jdk2010/base/security/bq/bq";
	}

	@RequestMapping("/bqadd")
	public String bqadd(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		List<SecurityMenu> firstMenuList = dalClient
				.queryForObjectList(
						"select * from security_menu where type='2' and parent_id='0' and status=1 ",
						SecurityMenu.class);
		setAttr("firstMenuList", firstMenuList);

		List<Map<String, Object>> menuList = securityMenuService
				.getMenuListByParentIdColumn("0", "1");
		setAttr("menuList", menuList);

		return "/com/jdk2010/base/security/bq/bq_add";
	}

	@RequestMapping("/bqaddaction")
	public void bqaddaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityMenu securityMenu = getModel(SecurityMenu.class);
		securityMenu.setType("2");
		if (securityMenu.getParentId().equals("0")) {
			securityMenu.setImg("/res/images/leftico01.png");
		}
		securityMenu.setColumnType("1");
		securityMenuService.save(securityMenu);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/bqmodify")
	public String bqmodify(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = getPara("id");
		SecurityMenu securityMenu = securityMenuService.findById(id,
				SecurityMenu.class);

		List<SecurityMenu> firstMenuList = dalClient
				.queryForObjectList(
						"select * from security_menu where type='2' and parent_id='0' and status=1 and id!="
								+ id, SecurityMenu.class);
		setAttr("firstMenuList", firstMenuList);

		List<Map<String, Object>> menuList = securityMenuService
				.getMenuListByParentIdColumn("0", "1");
		setAttr("menuList", menuList);

		setAttr("securityMenu", securityMenu);
		return "/com/jdk2010/base/security/bq/bq_modify";
	}

	@RequestMapping("/bqmodifyaction")
	public void bqmodifyaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityMenu securityMenu = getModel(SecurityMenu.class);
		securityMenuService.update(securityMenu);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/bqdelete")
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String ids = getPara("ids");
		securityMenuService.deleteByIDS(ids, SecurityMenu.class);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/bqNewsdelete")
	public void bqNewsdelete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String ids = getPara("ids");
		String bq_id = getPara("id");
		for (int i = 0; i < ids.split(",").length; i++) {
			dalClient.update("delete from bq_news where bq_id=" + bq_id
					+ " and news_id=" + ids.split(",")[i]);
		}
		securityMenuService.deleteByIDS(ids, SecurityMenu.class);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/bqselect")
	public String bqselect(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String searchSQL = "";
		String bgId = getPara("bgId");
		String bannerId = getPara("bannerId");
		setAttr("bgId", bgId);
		DbKit dbKit = new DbKit(
				"select t.*,a.realname from security_news t left join security_user a on t.userid=a.id  where 1=1 and menu_id="
						+ bannerId);
		String orderSQL = " order by t.ctime desc";
		String title = getPara("title");
		if (title != null && !"".equals(title)) {
			searchSQL = searchSQL + " and t.title LIKE :title";
			if (request.getMethod().equals("get")) {
				title = StringUtil.transCharset(title, "ISO8859-1", "UTF-8");
			}
			setAttr("title", title);
			dbKit.append(searchSQL);
			dbKit.put("title", "%" + title + "%");
		}
		String reviewStatus = getPara("reviewStatus");
		if (reviewStatus != null
				&& (reviewStatus.equals("1") || reviewStatus.equals("2"))) {
			searchSQL = searchSQL + " and t.review_status =" + reviewStatus;
			dbKit.append(searchSQL);
			setAttr("reviewStatus", reviewStatus);
		}
		dbKit.append(orderSQL);
		System.out.println(dbKit.getSql());
		Page pageList = securityNewsService.queryForPageList(dbKit, getPage(),
				SecurityNews.class);
		setAttr("pageList", pageList);
		setAttr("bannerId", bannerId);
		return "/com/jdk2010/base/security/bq/newsselect";
	}

	@RequestMapping("/listnews")
	public String listnews(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Map<String, Object> indexsettingMap = dalClient
				.queryForObject("select * from system_indexsetting ");
		setAttr("indexsettingMap", indexsettingMap);
		String menuId = getPara("menuId");
		SecurityMenu menu = securityMenuService.findById(menuId,
				SecurityMenu.class);
		setAttr("menu", menu);
		String sql = "select t.*,a.realname from security_news t ,security_user a where  t.userid=a.id  and t.id in (select news_id from bq_news where bq_id="
				+ menuId + ")";
		DbKit dbKit = new DbKit(sql);
		String searchSQL = "";
		String orderSQL = " order by t.ctime desc";
		String title = getPara("title");
		if (title != null && !"".equals(title)) {
			searchSQL = searchSQL + " and t.title LIKE :title";
			if (request.getMethod().equals("get")) {
				title = StringUtil.transCharset(title, "ISO8859-1", "UTF-8");
			}
			setAttr("title", title);
			dbKit.append(searchSQL);
			dbKit.put("title", "%" + title + "%");
		}
		dbKit.append(orderSQL);
		System.out.println(dbKit.getSql());
		Page pageList = securityNewsService.queryForPageList(dbKit, getPage(),
				SecurityNews.class);
		setAttr("pageList", pageList);
		return "/com/jdk2010/base/security/bq/news/securitynews";
	}

	@RequestMapping("/submitCheck")
	public void submitCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String ids = getPara("ids");
		String bqId = getPara("bqId");
		for (int i = 0; i < ids.split(",").length; i++) {
			dalClient.update("delete from  bq_news where  bq_id=" + bqId
					+ " and news_id=" + ids.split(",")[i] + "");
			dalClient.update("insert into bq_news(bq_id,news_id) values("
					+ bqId + "," + ids.split(",")[i] + ")");
		}
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

}
