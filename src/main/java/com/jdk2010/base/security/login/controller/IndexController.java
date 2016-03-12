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
import com.jdk2010.framework.util.StringUtil;
import com.jdk2010.member.memberactivity.model.MemberActivity;
import com.jdk2010.member.memberactivity.service.IMemberActivityService;
import com.jdk2010.member.membercomplain.model.MemberComplain;
import com.jdk2010.system.systemadv.model.SystemAdv;
import com.jdk2010.system.systemadv.service.ISystemAdvService;

//import com.jdk2010.framework.util.OsInfoUtil;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    IMemberActivityService memberActivityService;
    
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
        
        List<SecurityNews> rightNewsList=dalClient.queryForObjectList("select * from security_news where id in (select key_id from setting where type=1) ",SecurityNews.class);
        setAttr("rightNewsList", rightNewsList);
        
        List<MemberActivity> rightActivityList=dalClient.queryForObjectList("select * from member_activity where id in (select key_id from setting where type=2) ",MemberActivity.class);
        setAttr("rightActivityList", rightActivityList);
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
        String show_tousu=getPara("show_tousu");
        String index_url=getPara("index_url");
        String sql = "update system_indexsetting set title='" + title + "',style_type='" + style_type + "' ,show_tousu="+show_tousu+",index_url='"+index_url+"' where id="
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
    
    @RequestMapping("/bqselect")
    public String bqselect(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	 DbKit dbKit = new DbKit(
                 "select t.*,a.realname from security_news t left join security_user a on t.userid=a.id  where 1=1 ");
         String searchSQL = "";
         String bgId=getPara("bgId");
         setAttr("bgId", bgId);
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
         String reviewStatus=getPara("reviewStatus");
         if(reviewStatus!=null&&(reviewStatus.equals("1")||reviewStatus.equals("2"))){
         	searchSQL = searchSQL + " and t.review_status ="+reviewStatus;
         	dbKit.append(searchSQL);
         	 setAttr("reviewStatus", reviewStatus);
         }
         dbKit.append(orderSQL);
         System.out.println(dbKit.getSql());
         Page pageList = securityNewsService.queryForPageList(dbKit, getPage(), SecurityNews.class);
         setAttr("pageList", pageList);
        return "/com/jdk2010/system/othersetting/newsselect";
    }
    
    
    @RequestMapping("/activitylist")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	 Map<String, Object> indexsettingMap = dalClient.queryForObject("select * from system_indexsetting ");
         setAttr("indexsettingMap", indexsettingMap);
        DbKit dbKit = new DbKit("select * from member_activity  where 1=1 ");
        String searchSQL = "";
        String orderSQL = "";
        String title = getPara("title");
        if (title != null && !"".equals(title)) {
            searchSQL = searchSQL + " and  title LIKE '%" + title + "%'";
            setAttr("title", title);
            dbKit.append(searchSQL);
        }

        String activity_status = getPara("activity_status");
        if (activity_status != null && !"".equals(activity_status)) {
            searchSQL = searchSQL + " and  activity_status ="+activity_status ;
            setAttr("activity_status", activity_status);
            dbKit.append(searchSQL);
        }

        String status = getPara("status");
        if (status != null && !"".equals(status)) {
            searchSQL = searchSQL + " and  status =" + status;
            setAttr("status", status);
            dbKit.append(searchSQL);
        }

        String review_status = getPara("review_status");
        if (review_status != null && !"".equals(review_status)) {
            searchSQL = searchSQL + " and  review_status =" + review_status;
            setAttr("review_status", review_status);
            dbKit.append(searchSQL);
        }

        String start_time_start = getPara("start_time_start");
        if (start_time_start != null && !"".equals(start_time_start)) {
            searchSQL = searchSQL + " and  start_time >='"+start_time_start+"'";
            setAttr("start_time_start", start_time_start);
            dbKit.append(searchSQL);
        }
        
        String start_time_end= getPara("start_time_end");
        if (start_time_end != null && !"".equals(start_time_end)) {
            searchSQL = searchSQL + " and  start_time <='"+start_time_end+"'";
            setAttr("start_time_end", start_time_end);
            dbKit.append(searchSQL);
        }

        String end_time_start = getPara("end_time_start");
        if (end_time_start != null && !"".equals(end_time_start)) {
            searchSQL = searchSQL + " and  end_time >='"+end_time_start+"'";
            setAttr("end_time_start", end_time_start);
            dbKit.append(searchSQL);
        }
        
        String end_time_end= getPara("end_time_end");
        if (end_time_end != null && !"".equals(end_time_end)) {
            searchSQL = end_time_end + " and  end_time <='"+end_time_end+"'";
            setAttr("end_time_end", end_time_end);
            dbKit.append(searchSQL);
        }

        dbKit.append(orderSQL);
        Page pageList = memberActivityService.queryForPageList(dbKit, getPage(), MemberActivity.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/system/othersetting/activityselect";
    }
    
    
    
    @RequestMapping("/submitCheck")
    public void submitCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        String type=getPara("type");
        for(int i=0;i<ids.split(",").length;i++){
        	dalClient.update("delete from  setting where type="+type+" and  key_id="+ids.split(",")[i]+"");
        	dalClient.update("insert into setting(type,key_id) values("+type+","+ids.split(",")[i]+")");
        }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
    
    @RequestMapping("/deleteNewOne")
    public void deleteNewOne(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer id = getParaToInt("id");
        String type=getPara("type");
        dalClient.update("delete from setting where  type='"+type+"' and key_id="+id);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    

}
