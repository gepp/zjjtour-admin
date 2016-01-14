package com.jdk2010.member.memberactivity.controller;

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
import com.jdk2010.member.memberactivity.model.MemberActivity;
import com.jdk2010.member.memberactivity.service.IMemberActivityService;

@Controller
@RequestMapping(value = "/memberactivity")
public class MemberActivityController extends BaseController {

    @Resource
    IMemberActivityService memberActivityService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DbKit dbKit = new DbKit("select * from member_activity  where 1=1 ");
        String searchSQL = "";
        String orderSQL = "";
        String litter_title = getPara("litter_title");
        if (litter_title != null && !"".equals(litter_title)) {
            searchSQL = searchSQL + " and  litter_title LIKE '%" + litter_title + "%'";
            setAttr("litter_title", litter_title);
            dbKit.append(searchSQL);
        }

        String activity_status = getPara("activity_status");
        if (activity_status != null && !"".equals(activity_status)) {
            searchSQL = searchSQL + " and  activity_status LIKE '%" + activity_status + "%'";
            setAttr("activity_status", activity_status);
            dbKit.append(searchSQL);
        }

        String status = getPara("status");
        if (status != null && !"".equals(status)) {
            searchSQL = searchSQL + " and  status LIKE '%" + status + "%'";
            setAttr("status", status);
            dbKit.append(searchSQL);
        }

        String review_status = getPara("review_status");
        if (review_status != null && !"".equals(review_status)) {
            searchSQL = searchSQL + " and  review_status LIKE '%" + review_status + "%'";
            setAttr("review_status", review_status);
            dbKit.append(searchSQL);
        }

        String start_time = getPara("start_time");
        if (start_time != null && !"".equals(start_time)) {
            searchSQL = searchSQL + " and  start_time LIKE '%" + start_time + "%'";
            setAttr("start_time", start_time);
            dbKit.append(searchSQL);
        }

        String end_time = getPara("end_time");
        if (end_time != null && !"".equals(end_time)) {
            searchSQL = searchSQL + " and  end_time LIKE '%" + end_time + "%'";
            setAttr("end_time", end_time);
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

}
