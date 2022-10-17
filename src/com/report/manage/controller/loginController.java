package com.report.manage.controller;


import com.css.base.BaseException;
import com.report.global.Constants;
import com.report.global.SysGlobals;
import com.report.global.SysMessageBean;
import com.report.home.bean.Announce;
import com.report.home.bean.Member;
import com.report.manage.bean.User;
import com.report.manage.bo.AnnounceBo;
import com.report.manage.bo.LoginBo;
import com.report.manage.bo.MemberBo;
import com.report.manage.form.AnnounceForm;
import com.report.manage.form.MemberForm;
import com.report.utils.Page;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.*;
import org.apache.struts.validator.DynaValidatorForm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class loginController {

    public ActionForward login(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws BaseException {
        LoginBo bo = new LoginBo();
        DynaValidatorForm loginForm = (DynaValidatorForm) form;
        String username = loginForm.getString("username");
        String password = loginForm.getString("password");
        String imagecode = loginForm.getString("imagecode");
        String logintype = loginForm.getString("logintype");
        HttpSession session = request.getSession(false);
        session.removeAttribute("username");

        if (!imagecode.equals(session.getAttribute("imagecode"))) {
            SysMessageBean smb = new SysMessageBean(true);
            smb.setMessage(new ActionMessage("error.input.imagecode"));
            smb.setLinkText(new ActionMessage("LoginAction.login.return"));
            smb.setAction("/load4Login");
            smb.setLinkTarget("_parent");
            SysGlobals.setSysMessage(request, smb);
            return mapping.findForward("error");
        }
        else if (StringUtils.isEmpty(logintype)) {
            SysMessageBean smb = new SysMessageBean(true);
            smb.setMessage(new ActionMessage("error.input.logintype"));
            smb.setLinkText(new ActionMessage("LoginAction.login.return"));
            smb.setAction("/load4Login");
            smb.setLinkTarget("_parent");
            SysGlobals.setSysMessage(request, smb);
            return mapping.findForward("error");
        }
        else {
            try {
                if ("1".equals(logintype)) {
                    Member member = new Member();
                    member.setAccountid(username);
                    member.setPassword(password);

                    Member memberDB = bo.getMemberInfo(member);
                    if (memberDB != null) {
                        if (memberDB.getState() == 0) {//没账号 账号被锁丁
                            SysMessageBean smb = new SysMessageBean(true);
                            smb.setMessage(new ActionMessage(
                                    "LoginAction.login.notaudit"));
                            smb.setLinkText(new ActionMessage(
                                    "LoginAction.login.return"));
                            smb.setAction("/load4Login");
                            smb.setLinkTarget("_parent");
                            SysGlobals.setSysMessage(request, smb);
                            return mapping.findForward("error");
                        }
                        else if (memberDB.getState() == 2) {
                            SysMessageBean smb = new SysMessageBean(true);
                            smb.setMessage(new ActionMessage(
                                    "LoginAction.login.lock"));
                            smb.setLinkText(new ActionMessage(
                                    "LoginAction.login.return"));
                            smb.setAction("/index");
                            smb.setLinkTarget("_parent");
                            SysGlobals.setSysMessage(request, smb);
                            return mapping.findForward("error");
                        }

                        Map<String, String> sessionMap = new HashMap<String, String>();
                        sessionMap.put("memberid", String.valueOf(memberDB
                                .getId()));
                        sessionMap.put("accountid", memberDB.getAccountid());
                        sessionMap.put("factname", memberDB.getFactname());
                        SysGlobals.setSessionObj(request,
                                Constants.MANAGE_SESSION, sessionMap);
                        return mapping.findForward("indexMember");
                    }
                    else {
                        SysMessageBean smb = new SysMessageBean(true);
                        smb.setMessage(new ActionMessage(
                                "LoginAction.login.failed"));
                        smb.setLinkText(new ActionMessage(
                                "LoginAction.login.return"));
                        smb.setAction("/load4Login");
                        smb.setLinkTarget("_parent");
                        SysGlobals.setSysMessage(request, smb);
                        return mapping.findForward("error");
                    }
                }
                else if ("2".equals(logintype)) {
                    User user = new User();
                    user.setUsername(username);
                    user.setPassword(password);

                    User userDB = bo.getUserInfo(user);
                    if (userDB != null) {
                        Map<String, String> sessionMap = new HashMap<String, String>();
                        sessionMap
                                .put("userid", String.valueOf(userDB.getId()));
                        sessionMap.put("username", userDB.getUsername());
                        sessionMap.put("factname", userDB.getFactname());
                        sessionMap.put("usertype", String.valueOf(userDB
                                .getUsertype()));
                        SysGlobals.setSessionObj(request,
                                Constants.MANAGE_SESSION, sessionMap);
                        return mapping.findForward("index");
                    }
                    else {
                        SysMessageBean smb = new SysMessageBean(true);
                        smb.setMessage(new ActionMessage(
                                "LoginAction.login.failed"));
                        smb.setLinkText(new ActionMessage(
                                "LoginAction.login.return"));
                        smb.setAction("/load4Login");
                        smb.setLinkTarget("_parent");
                        SysGlobals.setSysMessage(request, smb);
                        return mapping.findForward("error");
                    }
                }
                else {
                    SysMessageBean smb = new SysMessageBean(true);
                    smb.setMessage(new ActionMessage("error.input.logintype"));
                    smb.setLinkText(new ActionMessage(
                            "LoginAction.login.return"));
                    smb.setAction("/load4Login");
                    smb.setLinkTarget("_parent");
                    SysGlobals.setSysMessage(request, smb);
                    return mapping.findForward("error");
                }
            }
            catch (BaseException e) {
                throw new BaseException("errors.not.connect.db", e);
            }
        }
    }

    public ActionForward logout(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response)
            throws BaseException {
        SysGlobals.removeSessionObj(request, Constants.MANAGE_SESSION);
        return mapping.findForward("success");
    }
    public ActionForward regMember(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request, HttpServletResponse response)
            throws BaseException {
        MemberBo bo = new MemberBo();
        MemberForm memberForm = (MemberForm) form;
        Member member = memberForm.getMember();
        HttpSession session = request.getSession(false);
        String imagecode = (String) session.getAttribute("imagecode");
        if (!imagecode.equals(member.getImagecode())) {
            ActionMessages am = new ActionMessages();
            am.add("sysMessage", new ActionMessage("error.input.imagecode"));
            return mapping.findForward("failure");
        }
        int cnt = bo.getMemberCount(member.getAccountid());
        if (cnt > 0) {
            ActionMessages am = new ActionMessages();
            am.add("sysMessage", new ActionMessage(
                    "manage.MemberAction.addMember.accountidExists"));
            return mapping.findForward("failure");
        }
        if (!member.getPassword().equals(member.getPassword_re())) {
            ActionMessages am = new ActionMessages();
            am.add("sysMessage", new ActionMessage(
                    "manage.MemberAction.addMember.password"));
            return mapping.findForward("failure");
        }

        member.setState(1);// 默认审核通过
        bo.addMember(member);

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "manage.MemberAction.addMember.success"));
        smb
                .setLinkText(new ActionMessage(
                        "MemberAction.regMember.returnLogin"));
        smb.setAction("/load4Login");
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }

}
