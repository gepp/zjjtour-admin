package com.jdk2010.member.membercomplain.controller;
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
import com.jdk2010.member.membercomplain.model.MemberComplain;
import com.jdk2010.member.membercomplain.service.IMemberComplainService;
@Controller
@RequestMapping(value="/membercomplain")
public class MemberComplainController extends BaseController{

    @Resource
    IMemberComplainService memberComplainService;

    @RequestMapping("/list")
    public String  list(HttpServletRequest request,HttpServletResponse response) throws Exception {
        DbKit dbKit=new DbKit("select * from member_complain  where 1=1 ");
        String searchSQL="";
        String orderSQL="";
        String member_mobile=getPara("member_mobile");
        if(member_mobile!=null&&!"".equals(member_mobile)){
            searchSQL=searchSQL+" and  member_mobile LIKE '%"+member_mobile+"%'";
            setAttr("member_mobile",member_mobile);
            dbKit.append(searchSQL);
        }

        String member_name=getPara("member_name");
        if(member_name!=null&&!"".equals(member_name)){
            searchSQL=searchSQL+" and  member_name LIKE '%"+member_name+"%'";
            setAttr("member_name",member_name);
            dbKit.append(searchSQL);
        }

        String complain_time=getPara("complain_time");
        if(complain_time!=null&&!"".equals(complain_time)){
            searchSQL=searchSQL+" and  complain_time LIKE '%"+complain_time+"%'";
            setAttr("complain_time",complain_time);
            dbKit.append(searchSQL);
        }

        String replay_status=getPara("replay_status");
        if(replay_status!=null&&!"".equals(replay_status)){
            searchSQL=searchSQL+" and  replay_status LIKE '%"+replay_status+"%'";
            setAttr("replay_status",replay_status);
            dbKit.append(searchSQL);
        }

        String review_status=getPara("review_status");
        if(review_status!=null&&!"".equals(review_status)){
            searchSQL=searchSQL+" and  review_status LIKE '%"+review_status+"%'";
            setAttr("review_status",review_status);
            dbKit.append(searchSQL);
        }

        String review_time=getPara("review_time");
        if(review_time!=null&&!"".equals(review_time)){
            searchSQL=searchSQL+" and  review_time LIKE '%"+review_time+"%'";
            setAttr("review_time",review_time);
            dbKit.append(searchSQL);
        }

        dbKit.append(orderSQL);
        Page pageList=memberComplainService.queryForPageList(dbKit, getPage(),MemberComplain.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/member/membercomplain/membercomplain";
    }

    @RequestMapping("/add")
    public String  add(HttpServletRequest request,HttpServletResponse response) throws Exception {
        return "/com/jdk2010/member/membercomplain/membercomplain_add";
    }
    @RequestMapping("/addaction")
    public void  addaction(HttpServletRequest request,HttpServletResponse response) throws Exception {
        MemberComplain memberComplain=getModel(MemberComplain.class);
        memberComplainService.save(memberComplain);
        ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
        renderJson(response,returnData);
    }


    @RequestMapping("/modify")
    public String  modify(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String id=getPara("id");
        MemberComplain memberComplain=memberComplainService.findById(id, MemberComplain.class);
        setAttr("memberComplain", memberComplain);
        return "/com/jdk2010/member/membercomplain/membercomplain_modify";
    }
    @RequestMapping("/modifyaction")
    public void  modifyaction(HttpServletRequest request,HttpServletResponse response) throws Exception {
        MemberComplain memberComplain=getModel(MemberComplain.class);
        memberComplainService.update(memberComplain);
        ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/delete")
    public void  delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String ids=getPara("ids");
        memberComplainService.deleteByIDS(ids,MemberComplain.class);
        ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/view")
    public String  view(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String id=getPara("id");
        MemberComplain memberComplain=memberComplainService.findById(id, MemberComplain.class);
        setAttr("memberComplain", memberComplain);
        return "/com/jdk2010/member/membercomplain/membercomplain_view";
    }

}
