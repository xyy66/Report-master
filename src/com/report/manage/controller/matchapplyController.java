package com.report.manage.controller;


import com.css.base.BaseException;
import com.report.global.Constants;
import com.report.global.SysGlobals;
import com.report.global.SysMessageBean;
import com.report.manage.bean.Matchapply;
import com.report.manage.bean.Matchinfo;
import com.report.manage.bo.MatchapplyBo;
import com.report.manage.form.MatchapplyForm;
import com.report.utils.CheckCodeImage;
import com.report.utils.Page;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

public class matchapplyController {

    @SuppressWarnings("unchecked")
    public ActionForward addMatchapply(ActionMapping mapping, ActionForm form,
                                       HttpServletRequest request, HttpServletResponse response)
            throws BaseException {
        Map<String, String> sessionMap = SysGlobals.getSessionObj(request,
                Constants.MANAGE_SESSION);
        int memberid = Integer.valueOf(sessionMap.get("memberid"));
        String contextPath = request.getContextPath();
        MatchapplyBo bo = new MatchapplyBo();
        MatchapplyForm matchapplyForm = (MatchapplyForm) form;
        Matchapply matchapply = matchapplyForm.getMatchapply();
        matchapply.setContextPath(contextPath);
        HttpSession session = request.getSession(false);
        String imagecode = (String) session.getAttribute("imagecode");
        if (!imagecode.equals(matchapply.getImagecode())) {
            ActionMessages am = new ActionMessages();
            am.add("sysMessage", new ActionMessage("error.input.imagecode"));
            return mapping.findForward("failure");
        }
        String message = bo.saveFile(matchapply);//文件
        if (StringUtils.isNotEmpty(message)) {
            ActionMessages am = new ActionMessages();
            am.add("sysMessage", new ActionMessage(message));
            return mapping.findForward("failure");
        }
        matchapply.setMemberid(String.valueOf(memberid));
        bo.addMatchapply(matchapply);

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "MatchapplyAction.addMatchapply.success"));
        smb.setLinkText(new ActionMessage("MatchapplyAction.return"));
        smb.setAction("/load4MatchapplyIndex");
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }
    public ActionForward imageCode(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request, HttpServletResponse response)
            throws BaseException {

        CheckCodeImage cci = new CheckCodeImage(CheckCodeImage.NUM);
        HttpSession session = request.getSession(false);
        try {
            response.setContentType("image/jpeg");
            OutputStream os = response.getOutputStream();
            ImageIO.write(cci.getImage(), "PNG", os);
            session.setAttribute("imagecode", cci.getRandCode());
        }
        catch (IOException e) {
            e.printStackTrace();
            throw new BaseException("LoginAction.imageCheck");
        }
        return null;
    }
    @SuppressWarnings("unchecked")
    public ActionForward modifyMatchapply(ActionMapping mapping,
                                          ActionForm form, HttpServletRequest request,
                                          HttpServletResponse response) throws BaseException {
        Map<String, String> sessionMap = SysGlobals.getSessionObj(request,
                Constants.MANAGE_SESSION);
        int memberid = Integer.valueOf(sessionMap.get("memberid"));
        String contextPath = request.getContextPath();
        MatchapplyBo bo = new MatchapplyBo();
        MatchapplyForm matchapplyForm = (MatchapplyForm) form;
        Matchapply matchapply = matchapplyForm.getMatchapply();
        matchapply.setContextPath(contextPath);
        HttpSession session = request.getSession(false);
        String imagecode = (String) session.getAttribute("imagecode");
        if (!imagecode.equals(matchapply.getImagecode())) {
            ActionMessages am = new ActionMessages();
            am.add("sysMessage", new ActionMessage("error.input.imagecode"));
            return mapping.findForward("failure");
        }
        String message = bo.saveFile(matchapply);
        if (StringUtils.isNotEmpty(message)) {
            ActionMessages am = new ActionMessages();
            am.add("sysMessage", new ActionMessage(message));
            return mapping.findForward("failure");
        }
        matchapply.setMemberid(String.valueOf(memberid));
        bo.modifyMatchapply(matchapply);

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "MatchapplyAction.modifyMatchapply.success"));
        smb.setLinkText(new ActionMessage("MatchapplyAction.return"));
        smb.setAction("/load4MatchapplyIndex");
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }
    public ActionForward removeMatchapply(ActionMapping mapping,
                                          ActionForm form, HttpServletRequest request,
                                          HttpServletResponse response) throws BaseException {
        String id = request.getParameter("id");
        MatchapplyBo bo = new MatchapplyBo();
        bo.removeMatchapply(Integer.valueOf(id));

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "MatchapplyAction.removeMatchapply.success"));
        smb.setLinkText(new ActionMessage("MatchapplyAction.return"));
        smb.setAction("/load4MatchapplyIndex");
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }
    public ActionForward load4MatchapplyAuditIndex(ActionMapping mapping,
                                                   ActionForm form, HttpServletRequest request,
                                                   HttpServletResponse response) throws BaseException {
        MatchapplyForm matchapplyForm = (MatchapplyForm) form;
        Matchapply matchapply = matchapplyForm.getMatchapply();
        String name = matchapply.getName();
        String factname = matchapply.getFactname();
        int matchid = matchapply.getMatchid();
        int state = matchapply.getState();
        String annualmatch = matchapply.getAnnualmatch();
        String p = request.getParameter("p");
        MatchapplyBo bo = new MatchapplyBo();
        int total = bo.getMatchapplyAuditListSize(matchapply);
        Page page = new Page(total, p, matchapply, "load4MatchapplyAuditIndex");
        page.setQueryData("matchapply.name", name == null ? "" : name);
        page.setQueryData("matchapply.factname", factname == null ? ""
                : factname);
        page.setQueryData("matchapply.matchid", matchid + "");
        page.setQueryData("matchapply.state", state + "");
        page.setQueryData("matchapply.annualmatch", annualmatch == null ? ""
                : annualmatch);
        List<Matchinfo> matchinfoList = bo.getMatchinfoList();
        request.setAttribute("matchinfoList", matchinfoList);

        List<Matchapply> matchapplyList = bo.getMatchapplyAuditList(matchapply);
        request.setAttribute("matchapplyList", matchapplyList);
        request.setAttribute("page", page);
        return mapping.findForward("success");
    }
    @SuppressWarnings("unchecked")
    public ActionForward auditMatchapply(ActionMapping mapping,
                                         ActionForm form, HttpServletRequest request,
                                         HttpServletResponse response) throws BaseException {
        Map<String, String> sessionMap = SysGlobals.getSessionObj(request,
                Constants.MANAGE_SESSION);
        int userid = Integer.valueOf(sessionMap.get("userid"));
        MatchapplyForm matchapplyForm = (MatchapplyForm) form;
        Matchapply matchapply = matchapplyForm.getMatchapply();
        MatchapplyBo bo = new MatchapplyBo();
        matchapply.setCheckuserid(userid);
        bo.auditMatchapply(matchapply);

        SysMessageBean smb = new SysMessageBean(false);
        smb.setMessage(new ActionMessage(
                "MatchapplyAction.auditMatchapply.success"));
        smb.setLinkText(new ActionMessage("MatchapplyAction.return"));
        smb.setAction("/load4MatchapplyAuditIndex1");
        smb.setQueryData("matchapply.memberid", (String) request.getSession()
                .getAttribute("matchapply.memberid"));
        smb.setQueryData("matchapply.annualmatch", (String) request
                .getSession().getAttribute("matchapply.annualmatch"));
        SysGlobals.setSysMessage(request, smb);
        return mapping.findForward("info");
    }


}
