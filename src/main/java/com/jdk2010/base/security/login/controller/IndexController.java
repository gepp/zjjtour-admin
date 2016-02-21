package com.jdk2010.base.security.login.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.base.security.securityuser.service.ISecurityUserService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.CookieUtil;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.FileUtil;
import com.jdk2010.framework.util.OsInfoUtil;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.member.membercomplain.model.MemberComplain;
import com.jdk2010.system.systemadv.model.SystemAdv;
import com.jdk2010.system.systemadv.service.ISystemAdvService;

//import com.jdk2010.framework.util.OsInfoUtil;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    ISecurityUserService securityUserService;

    @Resource
    ISecurityNewsService securityNewsService;

    @Resource
    DalClient dalClient;
    
    @Resource
    ISystemAdvService systemAdvService;

    @RequestMapping("/")
    public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/main";
    }

    @RequestMapping("/main")
    public String main(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/main";
    }

    @RequestMapping("/loginout")
    public String out(HttpServletRequest request, HttpServletResponse response) throws Exception {
        removeSessionAttr("securityUser");
        CookieUtil.deleteCookie(request, response, "username");
        CookieUtil.deleteCookie(request, response, "md5Password");
        return REDIRECT + "/login.htm";
    }

    @RequestMapping("/top")
    public String top(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/top";
    }

    @RequestMapping("/getMenu")
    public void getMenu(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityUser securityUser = getSessionAttr("securityUser");
        // 组装菜单
        String menuStr = "";
        String contextpath = request.getContextPath();
        Map<Object, Object> userMenuMap = securityUserService.getUserMenu(securityUser);
        for (Object obj : userMenuMap.keySet()) {
            Map<String, Object> parentMap = (Map<String, Object>) obj;
            menuStr = menuStr + "<dd><div class=\"title\"><span><img src=\"" + contextpath + "/res/images/leftico01.png"
                    + "\" /></span>" + parentMap.get("name") + "</div><ul class=\"menuson\">";
            List<Map<String, Object>> list = (List<Map<String, Object>>) userMenuMap.get(obj);
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> secondMap = (Map<String, Object>) list.get(i);
                if (secondMap.get("type").equals("0")) {
                    menuStr = menuStr + "<li><cite></cite><a href=\"" + contextpath + "" + secondMap.get("url")
                            + "\" target=\"rightFrame\">" + secondMap.get("name") + "</a><i></i></li>";
                } else if (secondMap.get("type").equals("1")) {
                    if (secondMap.get("column_type").equals("1")) {
                        menuStr = menuStr + "<li><cite></cite><a href=\"" + contextpath + "/securitynews/list.htm?id="
                                + secondMap.get("id") + "\" target=\"rightFrame\">" + secondMap.get("name")
                                + "</a><i></i></li>";

                    } else if (secondMap.get("column_type").equals("2")) {
                        menuStr = menuStr + "<li><cite></cite><a href=\"" + contextpath
                                + "/securitynews/modifyDetail.htm?menuId=" + secondMap.get("id")
                                + "\" target=\"rightFrame\">" + secondMap.get("name") + "</a><i></i></li>";

                    } else {
                        menuStr = menuStr + "<li><cite></cite>" + secondMap.get("name") + "<i></i></li>";

                    }

                }
            }
            menuStr = menuStr + "</ul></dd>";
        }
        setSessionAttr("menuStr", menuStr);
        renderText(response, menuStr);
    }

    @RequestMapping("/defaultMain")
    public String defaultMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityUser securityUser = getSessionAttr("securityUser");
        if (securityUser == null) {
            return REDIRECT + "/login.htm";
        } else {
            setAttr("jdkVersion", OsInfoUtil.getJdkVersion());
            setAttr("jdkHome", OsInfoUtil.getJdkHome());
            setAttr("osName", OsInfoUtil.getOsName());

            DbKit dbKit = new DbKit(
                    "select t.*,a.name as menuName from security_news t left join security_menu a on t.menu_id=a.id   where  t.review_status=0");
            String searchSQL = "";
            String orderSQL = " order by t.ctime desc limit 0,7";
            dbKit.append(orderSQL);
            List<SecurityNews> newsList = securityNewsService.queryForList(dbKit, SecurityNews.class);
            setAttr("newsList", newsList);

            dbKit = new DbKit(
                    "select t.*,a.realname as replayName,b.realname as reviewName from member_complain t inner join security_user a on t.replay_userid=a.id   inner join security_user b on t.review_userid=b.id    where 1=1 and t.replay_status=0 order by t.complain_time desc limit 0,7");
            List<MemberComplain> memberComplainReplayList = dalClient.queryForObjectList(dbKit, MemberComplain.class);
            setAttr("memberComplainReplayList", memberComplainReplayList);

            dbKit = new DbKit(
                    "select t.*,a.realname as replayName,b.realname as reviewName from member_complain t inner join security_user a on t.replay_userid=a.id   inner join security_user b on t.review_userid=b.id    where 1=1 and t.replay_status=1 and t.review_status=0 order by t.complain_time desc limit 0,7");
            List<MemberComplain> memberComplainReviewList = dalClient.queryForObjectList(dbKit, MemberComplain.class);
            setAttr("memberComplainReviewList", memberComplainReviewList);

            return "/defaultMain";
        }

    }

    @RequestMapping("/footer")
    public String footer(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/footer";
    }

    @RequestMapping("/tech")
    public String tech(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/tech";
    }

    @RequestMapping("/passwordModify")
    public String passwordModify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/base/security/securityuser/password_modify";
    }

    @RequestMapping("/toIndexSetting")
    public String toIndexSetting(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> indexsettingMap = dalClient.queryForObject("select * from system_indexsetting ");
        setAttr("indexsettingMap", indexsettingMap);
        DbKit dbKit = new DbKit("select * from system_adv  where 1=1 order by orderlist asc");
        String orderSQL = "";
        dbKit.append(orderSQL);
        Page pageList = systemAdvService.queryForPageList(dbKit, getPage(), SystemAdv.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/system/indexSetting";
    }

    @RequestMapping("/indexSettingModify")
    public String indexSettingModify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer id = getParaToInt("id");
        Map<String, Object> indexsettingMap = dalClient.queryForObject("select * from system_indexsetting  where id="
                + id);
        setAttr("indexsettingMap", indexsettingMap);
        return "/com/jdk2010/system/indexSetting_modify";
    }

    @RequestMapping("/indexSettingSaving")
    public void indexSettingSaving(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer id = getParaToInt("id");
        String title = getPara("title");
        String style_type = getPara("style_type");
        String sql = "update system_indexsetting set title='" + title + "',style_type='" + style_type + "' where id="
                + id;
        dalClient.update(sql);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
    @RequestMapping("/genIndex")
    public void genIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	//9静态生成首页
		InputStream in = null;
	    BufferedReader reader = null;
	    String url="http://localhost:8080/zjjtour/dtIndex.htm";
	    try
	    {
	      in = new URL(url).openStream();
	      reader = new BufferedReader(
	        new InputStreamReader(in,"utf-8"));
	      StringBuilder sb = new StringBuilder();
	      sb.append("<%@ page language=\"java\" contentType=\"text/html; charset=utf-8\" pageEncoding=\"utf-8\"%>");
	      String line;
	      while ((line = reader.readLine()) != null)
	      {
	        sb.append(line);
	      }
	      String path="";
	      WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();  
	      ServletContext servletContext = webApplicationContext.getServletContext();  
	      
	      String serverInfo=servletContext.getServerInfo();
	     System.out.println(" servletContext.getContextPath();"+ servletContext.getRealPath("/"));
	     System.out.println(OsInfoUtil.getOsName());
 	      if(OsInfoUtil.getOsName().indexOf("Win")>-1){
	    	   path="E:\\coding\\项目\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\zjjtour\\WEB-INF\\jsp\\index.jsp";
	      }else{
	    	  path="/usr/local/tomcat/apache-tomcat-7.0.62/webapps/ROOT/WEB-INF/jspindex.jsp";
	      }
	     
		 FileUtil.write(path,sb.toString());
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	    	
	    }
    	
    	
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    

}
