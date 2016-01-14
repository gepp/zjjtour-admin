package com.jdk2010.member.member.controller;

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
import com.jdk2010.member.member.model.Member;
import com.jdk2010.member.member.service.IMemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController extends BaseController {

    @Resource
    IMemberService memberService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DbKit dbKit = new DbKit("select * from member  where 1=1 ");
        String searchSQL = "";
        String orderSQL = "";
        String nickname = getPara("nickname");
        if (nickname != null && !"".equals(nickname)) {
            searchSQL = searchSQL + " and  nickname LIKE '%" + nickname + "%'";
            setAttr("nickname", nickname);
            dbKit.append(searchSQL);
        }

        String email = getPara("email");
        if (email != null && !"".equals(email)) {
            searchSQL = searchSQL + " and  email LIKE '%" + email + "%'";
            setAttr("email", email);
            dbKit.append(searchSQL);
        }

        String mobile = getPara("mobile");
        if (mobile != null && !"".equals(mobile)) {
            searchSQL = searchSQL + " and  mobile LIKE '%" + mobile + "%'";
            setAttr("mobile", mobile);
            dbKit.append(searchSQL);
        }

        dbKit.append(orderSQL);
        Page pageList = memberService.queryForPageList(dbKit, getPage(), Member.class);
        setAttr("pageList", pageList);
        return "/com/jdk2010/member/member/member";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/com/jdk2010/member/member/member_add";
    }

    @RequestMapping("/addaction")
    public void addaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member member = getModel(Member.class);
        memberService.save(member);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        Member member = memberService.findById(id, Member.class);
        setAttr("member", member);
        return "/com/jdk2010/member/member/member_modify";
    }

    @RequestMapping("/modifyaction")
    public void modifyaction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member member = getModel(Member.class);
        memberService.update(member);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        memberService.deleteByIDS(ids, Member.class);
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response,returnData);
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = getPara("id");
        Member member = memberService.findById(id, Member.class);
        setAttr("member", member);
        return "/com/jdk2010/member/member/member_view";
    }

}