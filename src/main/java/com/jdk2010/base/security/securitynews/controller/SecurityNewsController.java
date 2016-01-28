package com.jdk2010.base.security.securitynews.controller;

import java.util.Date;

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
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityMenu menu = securityMenuService.findById(id, SecurityMenu.class);
        setAttr("menu", menu);
        DbKit dbKit = new DbKit(
                "select t.*,a.realname,b.realname as reviewName from security_news t left join security_user a on t.userid=a.id   left join security_user b on t.review_userid=b.id where 1=1 and t.menu_id="+id+"");
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
        return "/com/jdk2010/base/security/securitynews/securitynews";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String menuId = getPara("menuId");
        SecurityMenu menu = securityMenuService.findById(menuId, SecurityMenu.class);
        setAttr("menu", menu);
        return "/com/jdk2010/base/security/securitynews/securitynews_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityNews securityNews = getModel(SecurityNews.class);
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
        securityNews.setMenuId(getParaToInt("menuId"));
        securityNews.setUserid(user.getId());
        securityNews.setCtime(new Date());
        securityNews.setStatus(0);
        securityNews.setReviewStatus("0");
        securityNews.setNewsType("ARTICLE");
        securityNewsService.save(securityNews);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityNews securityNews = securityNewsService.findById(id, SecurityNews.class);
        setAttr("securityNews", securityNews);
        
        Integer menuId = securityNews.getMenuId();
        SecurityMenu menu = securityMenuService.findById(menuId, SecurityMenu.class);
        setAttr("menu", menu);
        
        return "/com/jdk2010/base/security/securitynews/securitynews_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        securityNewsService.update(securityNews);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        securityNewsService.deleteByIDS(ids, SecurityNews.class);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityNews securityNews = securityNewsService.findById(id, SecurityNews.class);
        setAttr("securityNews", securityNews);
        return "/com/jdk2010/base/security/securitynews/securitynews_view";
    }
    
    @RequestMapping("/modifyDetail")
    public String modifyDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String menuId=getPara("menuId");
        SecurityMenu securityMenu = securityMenuService.findById(menuId, SecurityMenu.class);
       
        SecurityNews securityNews = securityNewsService.queryForObject("select * from security_news where menu_id="+menuId+"",SecurityNews.class);
        setAttr("securityNews", securityNews);
        setAttr("menuId", menuId);
        return "/com/jdk2010/base/security/securitynews/securitynews_modifydetail";
    }
    
    
    @RequestMapping("/modifydetailaction")
    public void modifydetailaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        if(securityNews.getId()!=null){
        securityNewsService.update(securityNews);
        }else{
          securityNewsService.save(securityNews);  
        }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
    
    @RequestMapping("/updateStatus")
    public void updateStatus(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        String reason=getPara("reason");
        String review_status=getPara("reviewStatus");
        
        SecurityUser securityUser=getSessionAttr("securityUser");
        Integer review_userid=securityUser.getId();
        String review_time=DateUtil.getNowTime();
        
        for(int i=0;i<ids.split(",").length;i++){
            if(!StringUtil.isBlank(ids.split(",")[i])){
            dalClient.update("update security_news set review_userid="+review_userid+", review_status="+review_status+",review_reason='"+reason+"',review_time='"+review_time+"' where id="+ids.split(",")[i]);
            }
            }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }

    @RequestMapping("/toCheck")
    public String toCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        String type=getPara("type");
        setAttr("type", type);
        setAttr("ids", ids);
        setAttr("id", getPara("id"));
        String jumpType=getPara("jumpType");
        setAttr("jumpType", jumpType);
        return "/com/jdk2010/base/security/securitynews/toCheck";
    }
    
    
    @RequestMapping("/listWaitShenhe")
    public String listWaitShenhe(HttpServletRequest request, HttpServletResponse response) throws Exception {
 
         DbKit dbKit = new DbKit( "select t.*,a.name as menuName from security_news t left join security_menu a on t.menu_id=a.id   where  t.review_status=0");
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
        Page pageList = securityNewsService.queryForPageList(dbKit, getPage(), SecurityNews.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/base/security/securitynews/securitynews_wait_check";
    }
    
    @RequestMapping("/listWaitHuifu")
    public String listWaitHuifu(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        return "/com/jdk2010/base/security/securitynews/securitynews";
    }
    
    
    @RequestMapping("/toViedoList")
    public String toViedoList(HttpServletRequest request, HttpServletResponse response) throws Exception {
         
        DbKit dbKit = new DbKit(
                "select t.*,a.realname,b.realname as reviewName from security_news t left join security_user a on t.userid=a.id   left join security_user b on t.review_userid=b.id where 1=1 and t.news_type='VIDEO'");
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
        String reviewStatus=getPara("reviewStatus");
        if(reviewStatus!=null&&(reviewStatus.equals("1")||reviewStatus.equals("2"))){
            searchSQL = searchSQL + " and t.review_status ="+reviewStatus;
            dbKit.append(searchSQL);
             setAttr("reviewStatus", reviewStatus);
        }
        dbKit.append(orderSQL);
        Page pageList = securityNewsService.queryForPageList(dbKit, getPage(), SecurityNews.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/base/security/video/securitynews";
    }
    
    
    @RequestMapping("/addVideo")
    public String addVideo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/base/security/video/securitynews_add";
    }

    @RequestMapping("/addVideoaction")
    public void addVideoaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SecurityNews securityNews = getModel(SecurityNews.class);
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
        securityNews.setMenuId(1054);
        securityNewsService.save(securityNews);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
    
    @RequestMapping("/modifyVideo")
    public String modifyVideo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        SecurityNews securityNews = securityNewsService.findById(id, SecurityNews.class);
        setAttr("securityNews", securityNews);
        
        
        return "/com/jdk2010/base/security/video/securitynews_modify";
    }

    @RequestMapping("/modifyVideoaction")
    public void modifyVideoaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        securityNewsService.update(securityNews);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
  
}
