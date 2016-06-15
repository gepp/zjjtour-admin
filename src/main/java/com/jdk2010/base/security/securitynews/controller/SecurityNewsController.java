package com.jdk2010.base.security.securitynews.controller;

import java.math.BigDecimal;
import java.util.Date;
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
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.DateUtil;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.framework.util.StringUtil;

@Controller
@RequestMapping(value = "/securitynews")
public class SecurityNewsController extends BaseController {

	@Resource
	ISecurityNewsService securityNewsService;

	@Resource
	ISecurityMenuService securityMenuService;

	@Resource
	DalClient dalClient;

	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> indexsettingMap = dalClient
				.queryForObject("select * from system_indexsetting ");
		setAttr("indexsettingMap", indexsettingMap);
		String id = getPara("id");
		setAttr("id", id);
		Integer parentId = dalClient.queryColumn(
				"select parent_id from security_menu where id ='"
						+ getPara("id") + "'", "parent_id");
		setAttr("parentId", parentId);
		SecurityMenu menu = securityMenuService
				.findById(id, SecurityMenu.class);
		setAttr("menu", menu);
		String bq_id=getPara("bq_id");
		String sql = "select t.*,a.realname,b.realname as reviewName from security_news t left join security_user a on t.userid=a.id   left join security_user b on t.review_userid=b.id where 1=1 and t.menu_id="
				+ id + "";
		if(StringUtil.isNotBlank(bq_id)){
			sql=sql+" and t.id in(select news_id from bq_news where bq_id="+bq_id+")";
		}else{
			bq_id="";
		}
		setAttr("bq_id", bq_id);
		if (StringUtil.isNotBlank(getPara("news_type"))) {
			sql = sql + " and t.news_type='" + getPara("news_type") + "'";
		}
		setAttr("news_type", getPara("news_type"));
		DbKit dbKit = new DbKit(sql);
		String searchSQL = "";
		String orderSQL = " order by t.orderlist asc";
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

		Map<String, List<Map<String, Object>>> linkedMenuNameList = securityMenuService
				.getBqList();

		List<Map<String, Object>> bqList = linkedMenuNameList.get(menu
				.getName());

		setAttr("bqList", bqList);
		
		return "/com/jdk2010/base/security/securitynews/securitynews";
	}

	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String menuId = getPara("menuId");
		String news_type = getPara("news_type");
		setAttr("news_type", news_type);
		SecurityMenu menu = securityMenuService.findById(menuId,
				SecurityMenu.class);
		setAttr("menu", menu);

		Map<String, List<Map<String, Object>>> linkedMenuNameList = securityMenuService
				.getBqList();

		List<Map<String, Object>> bqList = linkedMenuNameList.get(menu
				.getName());

		setAttr("bqList", bqList);

		return "/com/jdk2010/base/security/securitynews/securitynews_add";
	}

	@RequestMapping("/addaction")
	public void addaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityNews securityNews = getModel(SecurityNews.class);
		SecurityUser user = getSessionAttr("securityUser");
		String indexStatus = getPara("indexStatus");
		if (indexStatus != null) {
			securityNews.setIndexStatus("1");
		} else {
			securityNews.setIndexStatus("0");
		}
		securityNews.setGoodUrl(getPara("securityNews.goodUrl"));
		securityNews.setPrice(new BigDecimal(getPara("securityNews.price")));
		String topStatus = getPara("topStatus");
		if (topStatus != null) {
			securityNews.setTopStatus("1");
		} else {
			securityNews.setTopStatus("0");
		}
		String jumpType = getPara("jumpType");

		if (jumpType != null) {
			securityNews.setJumpType("1");
		} else {
			securityNews.setJumpType("0");
		}
		String maodianStatus = getPara("maodianStatus");

		if (maodianStatus != null) {
			securityNews.setMaodianStatus("1");
		} else {
			securityNews.setMaodianStatus("0");
		}
		securityNews.setMenuId(getParaToInt("menuId"));
		securityNews.setUserid(user.getId());
		securityNews.setCtime(new Date());
		securityNews.setStatus(0);
		if (getPara("review_status") != null
				&& !getPara("review_status").equals("")) {
			securityNews.setReviewStatus("1");
		} else {
			securityNews.setReviewStatus("0");
		}
		if (!StringUtil.isBlank(getPara("news_type"))) {
			securityNews.setNewsType(getPara("news_type"));
		} else {
			securityNews.setNewsType("ARTICLE");
		}

		Integer news_id = securityNewsService.save(securityNews);

		String bq_id = getPara("bq_id");

		dalClient.update("insert into bq_news(bq_id,news_id) values (" + bq_id
				+ "," + news_id + ")");

		String[] maodianName = getParaValues("maodianName");
		String[] maodianContent = getParaValues("maodianContent");
		if (maodianName != null && maodianContent != null) {
			for (int i = 0; i < maodianName.length; i++) {
				String maodianNameInsert = maodianName[i];
				String maodianContentInsert = maodianContent[i];
				if (StringUtil.isNotBlank(maodianNameInsert)
						&& StringUtil.isNotBlank(maodianContentInsert)) {
					Integer orderlist = i + 1;
					String sql = "insert into news_maodian (news_id,orderlist,maodian_name,maodian_content) values(:news_id,:orderlist,:maodian_name,:maodian_content)";
					DbKit kit = new DbKit(sql);
					kit.put("news_id", news_id);
					kit.put("orderlist", orderlist);
					kit.put("maodian_name", maodianNameInsert);
					kit.put("maodian_content", maodianContentInsert);
					dalClient.update(kit);
				}
			}
		}
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/modify")
	public String modify(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = getPara("id");
		SecurityNews securityNews = securityNewsService.findById(id,
				SecurityNews.class);
		setAttr("securityNews", securityNews);

		String news_type = getPara("news_type");
		setAttr("news_type", news_type);

		Integer menuId = securityNews.getMenuId();
		SecurityMenu menu = securityMenuService.findById(menuId,
				SecurityMenu.class);
		setAttr("menu", menu);
		List<Map<String, Object>> maodianList = dalClient
				.queryForObjectList("select * from news_maodian where news_id ="
						+ id + " order by orderlist asc");
		setAttr("maodianList", maodianList);

		Map<String, List<Map<String, Object>>> linkedMenuNameList = securityMenuService
				.getBqList();

		List<Map<String, Object>> bqList = linkedMenuNameList.get(menu
				.getName());

		setAttr("bqList", bqList);

		Integer bq_id = dalClient.queryColumn(
				"select bq_id from bq_news where news_id="
						+ securityNews.getId(), "bq_id");
		setAttr("old_bq_id", bq_id);

		return "/com/jdk2010/base/security/securitynews/securitynews_modify";
	}

	@RequestMapping("/modifyaction")
	public void modifyaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityNews securityNews = getModel(SecurityNews.class);
		String indexStatus = getPara("indexStatus");
		if (indexStatus != null) {
			securityNews.setIndexStatus("1");
		} else {
			securityNews.setIndexStatus("0");
		}

		String bq_id = getPara("bq_id");
		dalClient.update("delete from bq_news where news_id="
				+ securityNews.getId());
		dalClient.update("insert into bq_news(bq_id,news_id) values (" + bq_id
				+ "," + securityNews.getId() + ")");

		String topStatus = getPara("topStatus");
		if (topStatus != null) {
			securityNews.setTopStatus("1");
		} else {
			securityNews.setTopStatus("0");
		}
		String jumpType = getPara("jumpType");

		if (jumpType != null) {
			securityNews.setJumpType("1");
		} else {
			securityNews.setJumpType("0");
		}
		securityNews.setGoodUrl(getPara("securityNews.goodUrl"));
		securityNews.setPrice(new BigDecimal(getPara("securityNews.price")));
		securityNews
				.setAbstractContent(getPara("securityNews.abstractContent"));
		securityNews.setContent(getPara("securityNews.content"));
		securityNews.setQuanjingUrl(getPara("securityNews.quanjingUrl"));
		String maodianStatus = getPara("maodianStatus");
		if (maodianStatus != null) {
			securityNews.setMaodianStatus("1");
		} else {
			securityNews.setMaodianStatus("0");
		}
		if (getPara("review_status") != null
				&& !getPara("review_status").equals("")) {
			securityNews.setReviewStatus("1");
		} else {
			securityNews.setReviewStatus("0");
		}
		securityNewsService.update(securityNews);

		String[] maodianName = getParaValues("maodianName");
		String[] maodianContent = getParaValues("maodianContent");
		if (maodianName != null && maodianContent != null) {
			dalClient.update("delete from news_maodian where news_id="
					+ securityNews.getId());
			for (int i = 0; i < maodianName.length; i++) {
				String maodianNameInsert = maodianName[i];
				String maodianContentInsert = maodianContent[i];
				if (StringUtil.isNotBlank(maodianNameInsert)
						&& StringUtil.isNotBlank(maodianContentInsert)) {

					Integer news_id = securityNews.getId();
					Integer orderlist = i + 1;

					String sql = "insert into news_maodian (news_id,orderlist,maodian_name,maodian_content) values(:news_id,:orderlist,:maodian_name,:maodian_content)";
					DbKit kit = new DbKit(sql);
					kit.put("news_id", news_id);
					kit.put("orderlist", orderlist);
					kit.put("maodian_name", maodianNameInsert);
					kit.put("maodian_content", maodianContentInsert);
					dalClient.update(kit);
				}
			}
		}

		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/delete")
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String ids = getPara("ids");
		securityNewsService.deleteByIDS(ids, SecurityNews.class);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/updateOrderlist")
	public void updateOrderlist(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String orderlist_ids = getPara("orderlist_ids");
		for (String s : orderlist_ids.split("~")) {
			if (StringUtil.isNotBlank(s)) {
				String id = s.split("-")[0];
				String value = s.split("-")[1];
				dalClient.update("update security_news set orderlist=" + value
						+ " where id=" + id);
			}
		}
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/view")
	public String view(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = getPara("id");
		SecurityNews securityNews = securityNewsService.findById(id,
				SecurityNews.class);
		setAttr("securityNews", securityNews);
		return "/com/jdk2010/base/security/securitynews/securitynews_view";
	}

	@RequestMapping("/modifyDetail")
	public String modifyDetail(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String menuId = getPara("menuId");
		SecurityMenu securityMenu = securityMenuService.findById(menuId,
				SecurityMenu.class);

		SecurityNews securityNews = securityNewsService.queryForObject(
				"select * from security_news where menu_id=" + menuId + "",
				SecurityNews.class);
		setAttr("securityNews", securityNews);
		setAttr("menuId", menuId);
		return "/com/jdk2010/base/security/securitynews/securitynews_modifydetail";
	}

	@RequestMapping("/modifydetailaction")
	public void modifydetailaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityNews securityNews = getModel(SecurityNews.class);
		String indexStatus = getPara("indexStatus");
		if (indexStatus != null) {
			securityNews.setIndexStatus("1");
		} else {
			securityNews.setIndexStatus("0");
		}
		securityNews.setNewsType("ARTICLE");
		String topStatus = getPara("topStatus");
		if (topStatus != null) {
			securityNews.setTopStatus("1");
		} else {
			securityNews.setTopStatus("0");
		}
		String jumpType = getPara("jumpType");

		if (jumpType != null) {
			securityNews.setJumpType("1");
		} else {
			securityNews.setJumpType("0");
		}
		if (securityNews.getId() != null) {
			securityNewsService.update(securityNews);
		} else {
			securityNewsService.save(securityNews);
		}
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/updateStatus")
	public void updateStatus(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String ids = getPara("ids");
		String reason = getPara("reason");
		String review_status = getPara("reviewStatus");

		SecurityUser securityUser = getSessionAttr("securityUser");
		Integer review_userid = securityUser.getId();
		String review_time = DateUtil.getNowTime();

		for (int i = 0; i < ids.split(",").length; i++) {
			if (!StringUtil.isBlank(ids.split(",")[i])) {
				dalClient.update("update security_news set review_userid="
						+ review_userid + ", review_status=" + review_status
						+ ",review_reason='" + reason + "',review_time='"
						+ review_time + "' where id=" + ids.split(",")[i]);
			}
		}
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/toCheck")
	public String toCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String ids = getPara("ids");
		String type = getPara("type");
		setAttr("bannerMenuId", getPara("bannerMenuId"));
		setAttr("type", type);
		setAttr("ids", ids);
		setAttr("id", getPara("id"));
		String jumpType = getPara("jumpType");
		setAttr("jumpType", jumpType);
		Integer parentId = dalClient.queryColumn(
				"select parent_id from security_menu where id ='"
						+ getPara("id") + "'", "parent_id");
		setAttr("parentId", parentId);
		return "/com/jdk2010/base/security/securitynews/toCheck";
	}

	@RequestMapping("/listWaitShenhe")
	public String listWaitShenhe(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> indexsettingMap = dalClient
				.queryForObject("select * from system_indexsetting ");
		setAttr("indexsettingMap", indexsettingMap);
		DbKit dbKit = new DbKit(
				"select t.*,a.name as menuName from security_news t left join security_menu a on t.menu_id=a.id   where  t.review_status=0");
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
		Page pageList = securityNewsService.queryForPageList(dbKit, getPage(),
				SecurityNews.class);
		setAttr("pageList", pageList);
		return "/com/jdk2010/base/security/securitynews/securitynews_wait_check";
	}

	@RequestMapping("/listWaitHuifu")
	public String listWaitHuifu(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		DbKit dbKit = new DbKit(
				"select t.*,a.realname,b.realname as reviewName from security_news t left join security_user a on t.userid=a.id   left join security_user b on t.review_userid=b.id where 1=1 ");
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
		return "/com/jdk2010/base/security/securitynews/securitynews";
	}

	@RequestMapping("/toViedoList")
	public String toViedoList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String bannerMenuId = getPara("bannerMenuId");
		setAttr("bannerMenuId", bannerMenuId);
		DbKit dbKit = new DbKit(
				"select t.*,a.realname,b.realname as reviewName from security_news t left join security_user a on t.userid=a.id   left join security_user b on t.review_userid=b.id where 1=1 and t.news_type='VIDEO' and menu_id="
						+ bannerMenuId);
		String searchSQL = "";
		String orderSQL = " order by t.orderlist asc";
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
		Page pageList = securityNewsService.queryForPageList(dbKit, getPage(),
				SecurityNews.class);
		setAttr("pageList", pageList);
		return "/com/jdk2010/base/security/video/securitynews";
	}

	@RequestMapping("/addVideo")
	public String addVideo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		setAttr("bannerMenuId", getPara("bannerMenuId"));
		return "/com/jdk2010/base/security/video/securitynews_add";
	}

	@RequestMapping("/addVideoaction")
	public void addVideoaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityNews securityNews = getModel(SecurityNews.class);
		Integer bannerMenuId = getParaToInt("bannerMenuId");
		SecurityUser user = getSessionAttr("securityUser");
		String indexStatus = getPara("indexStatus");
		if (indexStatus != null) {
			securityNews.setIndexStatus("1");
		} else {
			securityNews.setIndexStatus("0");
		}

		String topStatus = getPara("topStatus");
		if (topStatus != null) {
			securityNews.setTopStatus("1");
		} else {
			securityNews.setTopStatus("0");
		}
		String jumpType = getPara("jumpType");

		if (jumpType != null) {
			securityNews.setJumpType("1");
		} else {
			securityNews.setJumpType("0");
		}

		String outStatus = getPara("outStatus");
		if (outStatus != null) {
			securityNews.setOutStatus("1");
		} else {
			securityNews.setOutStatus("0");
		}
		securityNews.setMenuId(getParaToInt("menuId"));
		securityNews.setUserid(user.getId());
		securityNews.setCtime(new Date());
		securityNews.setStatus(0);
		securityNews.setReviewStatus("0");
		securityNews.setNewsType("VIDEO");
		securityNews.setMenuId(bannerMenuId);
		securityNewsService.save(securityNews);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/modifyVideo")
	public String modifyVideo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String bannerMenuId = getPara("bannerMenuId");
		setAttr("bannerMenuId", bannerMenuId);
		String id = getPara("id");
		SecurityNews securityNews = securityNewsService.findById(id,
				SecurityNews.class);
		setAttr("securityNews", securityNews);

		Map<String, List<Map<String, Object>>> linkedMenuNameList = securityMenuService
				.getBqList();

		SecurityMenu menu = securityMenuService.findById(bannerMenuId,
				SecurityMenu.class);
		setAttr("menu", menu);
		List<Map<String, Object>> bqList = linkedMenuNameList.get(menu
				.getName());
		setAttr("bqList", bqList);
		Integer bq_id = dalClient.queryColumn(
				"select bq_id from bq_news where news_id="
						+ securityNews.getId(), "bq_id");
		setAttr("old_bq_id", bq_id);

		return "/com/jdk2010/base/security/video/securitynews_modify";
	}

	@RequestMapping("/modifyVideoaction")
	public void modifyVideoaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityNews securityNews = getModel(SecurityNews.class);
		String indexStatus = getPara("indexStatus");
		if (indexStatus != null) {
			securityNews.setIndexStatus("1");
		} else {
			securityNews.setIndexStatus("0");
		}

		String topStatus = getPara("topStatus");
		if (topStatus != null) {
			securityNews.setTopStatus("1");
		} else {
			securityNews.setTopStatus("0");
		}
		String jumpType = getPara("jumpType");

		if (jumpType != null) {
			securityNews.setJumpType("1");
		} else {
			securityNews.setJumpType("0");
		}
		String outStatus = getPara("outStatus");
		if (outStatus != null) {
			securityNews.setOutStatus("1");
		} else {
			securityNews.setOutStatus("0");
		}
		String bq_id = getPara("bq_id");
		dalClient.update("delete from bq_news where news_id="
				+ securityNews.getId());
		dalClient.update("insert into bq_news(bq_id,news_id) values (" + bq_id
				+ "," + securityNews.getId() + ")");

		securityNewsService.update(securityNews);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

	@RequestMapping("/toChengxin")
	public String toChengxin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		SecurityNews securityNews = securityNewsService.queryForObject(
				"select * from security_news where  menu_id=1080",
				SecurityNews.class);
		setAttr("securityNews", securityNews);

		return "/com/jdk2010/base/security/securitynews/chengxin_modify";
	}

	@RequestMapping("/chengxinmodifyaction")
	public void chengxinmodifyaction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SecurityNews securityNews = getModel(SecurityNews.class);

		securityNewsService.update(securityNews);
		ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
		renderJson(response, returnData);
	}

}
