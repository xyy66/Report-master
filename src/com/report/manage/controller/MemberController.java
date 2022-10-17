package com.report.manage.controller;


import com.css.base.BaseException;
import com.report.global.Constants;
import com.report.global.SysGlobals;
import com.report.global.SysMessageBean;
import com.report.home.bean.Announce;
import com.report.home.bean.Member;
import com.report.manage.bo.AnnounceBo;
import com.report.manage.bo.MemberBo;
import com.report.manage.form.AnnounceForm;
import com.report.manage.form.MemberForm;
import com.report.utils.Page;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class MemberController {
    public ActionForward load4MemberIndex(ActionMapping mapping,
                                          ActionForm form, HttpServletRequest request,
                                          HttpServletResponse response) throws BaseException {
        MemberForm memberForm = (MemberForm) form;
        Member member = memberForm.getMember();
        String istrash = request.getParameter("istrash");
        String accountid = member.getAccountid();
        String factname = member.getFactname();
        String p = request.getParameter("p");
        MemberBo bo = new MemberBo();
        member.setIsvalid("1".equals(istrash) ? 0 : 1);
        int total = bo.getMemberListSize(member);
        Page page = new Page(total, p, member, "load4MemberIndex");
        page.setQueryData("istrash", istrash == null ? "" : istrash);
        page.setQueryData("member.accountid", accountid == null ? ""
                : accountid);
        page.setQueryData("member.factname", factname == null ? "" : factname);
        List<Member> memberList = bo.getMemberList(member);
        request.setAttribute("memberList", memberList);
        request.setAttribute("page", page);
        request.setAttribute("istrash", istrash);
        return mapping.findForward("success");
    }

    public ActionForward addMember(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request, HttpServletResponse response)
            throws BaseException {
        MemberBo bo = new MemberBo();
        MemberForm memberForm = (MemberForm) form;
        Member member = memberForm.getMember();
        int cnt = bo.getMemberCount(member.getAccountid());//如果账号已被注册
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

        bo.addMember(member);

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "manage.MemberAction.addMember.success"));
        smb.setLinkText(new ActionMessage("manage.MemberAction.return"));
        smb.setAction("/load4MemberIndex");
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }

    @SuppressWarnings("unchecked")
    public ActionForward modifyMember(ActionMapping mapping, ActionForm form,
                                      HttpServletRequest request, HttpServletResponse response)
            throws BaseException {
        Map<String, String> sessionMap = SysGlobals.getSessionObj(request,
                Constants.MANAGE_SESSION);
        String id = sessionMap.get("memberid");
        MemberBo bo = new MemberBo();
        MemberForm memberForm = (MemberForm) form;
        Member member = memberForm.getMember();
        member.setId(Integer.valueOf(id));
        bo.modifyMember(member);

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "manage.MemberAction.modifyMember.success"));
        smb.setAction("/load4MemberInfo1");
        smb.setLinkText(new ActionMessage(
                "UserAction.modifyUser.returnModify"));
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }
    public ActionForward removeMember(ActionMapping mapping, ActionForm form,
                                      HttpServletRequest request, HttpServletResponse response)
            throws BaseException {
        String id = request.getParameter("id");
        MemberBo bo = new MemberBo();
        bo.removeMember(Integer.valueOf(id));

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "manage.MemberAction.removeMember.success"));
        smb.setLinkText(new ActionMessage("manage.MemberAction.return"));
        smb.setAction("/load4MemberIndex");
        smb.setQueryData("istrash", "1");
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }
}
