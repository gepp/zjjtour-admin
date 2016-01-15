package com.jdk2010.member.member.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.MD5Utils;
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
        member.setMemberpwd(MD5Utils.md5(getPara("userpwd")));
        member.setCtime(new Date());
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
    
    @RequestMapping("/check")
    public void check(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String code = getPara("member.nickname");
        boolean isExist = memberService.isExistUsername(code);
        Map<String, Object> returnMap = new HashMap<String, Object>();
        if (isExist) {
            returnMap.put("error", "会员用户名已存在，请重新输入");
        } else {
            returnMap.put("ok", "恭喜您，该会员用户名可以使用");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", returnMap);
        renderJson(response, map);
    }
    
    @RequestMapping("/resetPwd")
    public void resetPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String flag = Constants.SUCCESS;
        String reason = "";
        String id = getPara("id");
        Member member = memberService.findById(id, Member.class);
        member.setMemberpwd("c4ca4238a0b923820dcc509a6f75849b");
        memberService.update(member);
        ReturnData returnData = new ReturnData(flag, reason);
        renderJson(response, returnData);
    }

}
