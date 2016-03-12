package com.jdk2010.member.memberactivity.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.DateUtil;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.member.memberactivity.model.MemberActivity;
import com.jdk2010.member.memberactivity.service.IMemberActivityService;

@Controller
@RequestMapping(value = "/memberactivity")
public class MemberActivityController extends BaseController {

    @Resource
    IMemberActivityService memberActivityService;
    
    @Resource
    DalClient dalClient;

    @RequestMapping("/list")
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
        return "/com/jdk2010/member/memberactivity/memberactivity";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/member/memberactivity/memberactivity_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberActivity memberActivity = getModel(MemberActivity.class);
        
        SecurityUser user = getSessionAttr("securityUser");
        String indexStatus = getPara("indexStatus");
        if (indexStatus != null) {
            memberActivity.setIndexStatus("1");
        } else {
            memberActivity.setIndexStatus("0");
        }

        String topStatus = getPara("topStatus");
        if (topStatus != null) {
            memberActivity.setTopStatus("1");
        } else {
            memberActivity.setTopStatus("0");
        }
        
        String jumpType = getPara("jumpType");
        if (jumpType != null) {
            memberActivity.setJumpType("1");
        } else {
            memberActivity.setJumpType("0");
        }
        
        String supportStatus = getPara("supportStatus");
        if (supportStatus != null) {
            memberActivity.setSupportStatus("1");
        } else {
            memberActivity.setSupportStatus("0");
        }
        memberActivity.setUserid(user.getId());
        memberActivity.setCtime(new Date());
        memberActivity.setReviewStatus("0");
        memberActivity.setUsercount(0);
        memberActivityService.save(memberActivity);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        MemberActivity memberActivity = memberActivityService.findById(id, MemberActivity.class);
        setAttr("memberActivity", memberActivity);
        return "/com/jdk2010/member/memberactivity/memberactivity_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberActivity memberActivity = getModel(MemberActivity.class);
        String indexStatus = getPara("indexStatus");
        if (indexStatus != null) {
            memberActivity.setIndexStatus("1");
        } else {
            memberActivity.setIndexStatus("0");
        }

        String topStatus = getPara("topStatus");
        if (topStatus != null) {
            memberActivity.setTopStatus("1");
        } else {
            memberActivity.setTopStatus("0");
        }
        
        String jumpType = getPara("jumpType");
        if (jumpType != null) {
            memberActivity.setJumpType("1");
        } else {
            memberActivity.setJumpType("0");
        }
        
        String supportStatus = getPara("supportStatus");
        if (supportStatus != null) {
            memberActivity.setSupportStatus("1");
        } else {
            memberActivity.setSupportStatus("0");
        }
        memberActivityService.update(memberActivity);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        memberActivityService.deleteByIDS(ids, MemberActivity.class);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        MemberActivity memberActivity = memberActivityService.findById(id, MemberActivity.class);
        setAttr("memberActivity", memberActivity);
        return "/com/jdk2010/member/memberactivity/memberactivity_view";
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
        return "/com/jdk2010/member/memberactivity/toCheck";
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
            dalClient.update("update member_activity set review_userid="+review_userid+", review_status="+review_status+",review_reason='"+reason+"',review_time='"+review_time+"' where id="+ids.split(",")[i]);
        }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
    @RequestMapping("/memberList")
    public String memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        List<Map<String,Object>> userList=dalClient.queryForObjectList("select a.ctime,b.nickname,b.mobile,b.email,b.realname from member_activity_detail a left join member b on a.userid=b.id where a.activity_id="+id);
        setAttr("userList", userList);
        return "/com/jdk2010/member/memberactivity/activityMemberList";
    }
    

}
