package com.jdk2010.member.membercomplain.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.DateUtil;
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
    
    @Resource
    DalClient dalClient;

    @RequestMapping("/list")
    public String  list(HttpServletRequest request,HttpServletResponse response) throws Exception {
        DbKit dbKit=new DbKit("select t.*,a.realname as replayName,b.realname as reviewName from member_complain t inner join security_user a on t.replay_userid=a.id   inner join security_user b on t.review_userid=b.id    where 1=1 ");
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

        String complain_time_start=getPara("complain_time_start");
        if(complain_time_start!=null&&!"".equals(complain_time_start)){
            searchSQL=searchSQL+" and  complain_time >='"+complain_time_start+"'";
            setAttr("complain_time_start",complain_time_start);
            dbKit.append(searchSQL);
        }
        
        String complain_time_end=getPara("complain_time_end");
        if(complain_time_end!=null&&!"".equals(complain_time_end)){
            searchSQL=searchSQL+" and  complain_time <='"+complain_time_end+"'";
            setAttr("complain_time_end",complain_time_end);
            dbKit.append(searchSQL);
        }

        String replay_status=getPara("replay_status");
        if(replay_status!=null&&!"".equals(replay_status)){
            searchSQL=searchSQL+" and  replay_status ="+replay_status;
            setAttr("replay_status",replay_status);
            dbKit.append(searchSQL);
        }

        String review_status=getPara("review_status");
        if(review_status!=null&&!"".equals(review_status)){
            searchSQL=searchSQL+" and  review_status ="+review_status;
            setAttr("review_status",review_status);
            dbKit.append(searchSQL);
        }

        String review_time_start=getPara("review_time_start");
        if(review_time_start!=null&&!"".equals(review_time_start)){
            searchSQL=searchSQL+" and  review_time >='"+review_time_start+"'";
            setAttr("review_time_start",review_time_start);
            dbKit.append(searchSQL);
        }
        
        String review_time_end=getPara("review_time_end");
        if(review_time_end!=null&&!"".equals(review_time_end)){
            searchSQL=searchSQL+" and  review_time <='"+review_time_end+"'";
            setAttr("review_time_end",review_time_end);
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
    
    @RequestMapping("/toReplay")
    public String toReplay(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        setAttr("ids", ids);
        return "/com/jdk2010/member/membercomplain/toRelpay";
    }
    
    @RequestMapping("/toCheck")
    public String toCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        setAttr("ids", ids);
        String type=getPara("type");
        setAttr("type", type);
        return "/com/jdk2010/member/membercomplain/toCheck";
    }
    
    @RequestMapping("/updateReplay")
    public void updateReplay(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        String reason=getPara("reason");
         
        SecurityUser securityUser=getSessionAttr("securityUser");
        Integer replay_userid=securityUser.getId();
        String replay_time=DateUtil.getNowTime();
        
        for(int i=0;i<ids.split(",").length;i++){
            dalClient.update("update member_complain set replay_userid="+replay_userid+", replay_status=1,replay_message='"+reason+"',replay_time='"+replay_time+"' where id="+ids.split(",")[i]);
        }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
    @RequestMapping("/updateReview")
    public void updateReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = getPara("ids");
        String reason=getPara("reason");
        String review_status=getPara("reviewStatus");
        SecurityUser securityUser=getSessionAttr("securityUser");
        Integer review_userid=securityUser.getId();
        String review_time=DateUtil.getNowTime();
        
        for(int i=0;i<ids.split(",").length;i++){
            dalClient.update("update member_complain set review_userid="+review_userid+", review_status="+review_status+",review_message='"+reason+"',review_time='"+review_time+"' where id="+ids.split(",")[i]);
        }
        ReturnData returnData = new ReturnData(Constants.SUCCESS, "操作成功");
        renderJson(response, returnData);
    }
    
    @RequestMapping("/memberComplainDetail")
    public String  memberComplainDetail(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String id=getPara("id");
        MemberComplain memberComplain=memberComplainService.findById(id, MemberComplain.class);
        setAttr("memberComplain", memberComplain);
        return "/com/jdk2010/member/membercomplain/complainDetail";
    }
    
    @RequestMapping("/reviewDetail")
    public String  reviewDetail(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String id=getPara("id");
        MemberComplain memberComplain=dalClient.queryForObject("select t.*,a.realname as replayName,b.realname as reviewName from member_complain t left join security_user a on t.replay_userid=a.id   left join security_user b on t.review_userid=b.id    where 1=1 and t.id="+id,MemberComplain.class);
        setAttr("memberComplain", memberComplain);
        return "/com/jdk2010/member/membercomplain/reviewDetail";
    }
    

}
