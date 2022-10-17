package com.report.home.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.validator.DynaValidatorForm;

import com.css.base.BaseAction;
import com.css.base.BaseException;
import com.report.global.Constants;
import com.report.global.SysGlobals;
import com.report.global.SysMessageBean;
import com.report.home.bean.Member;
import com.report.home.bo.LoginBo;

public class LoginAction extends BaseAction {

	public ActionForward load4Login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws BaseException {
		return mapping.findForward("success");
	}

	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws BaseException {
		LoginBo loginBo = new LoginBo();
		DynaValidatorForm loginForm = (DynaValidatorForm) form;
		String accountid = loginForm.getString("accountid");
		String password = loginForm.getString("password");
		String imagecode = loginForm.getString("imagecode");
		String flag = "index";
		HttpSession session = request.getSession(false);

		session.removeAttribute("accountid");
		if (!imagecode.equals(session.getAttribute("imagecode"))) {
			flag = "failure";
			ActionMessages msg = new ActionMessages();
			msg.add("sysMessage", new ActionMessage("error.input.imagecode"));
			saveErrors(request, msg);
		} else {
			Member member = new Member();
			member.setAccountid(accountid);
			member.setPassword(password);

			try {
				Member memberDB = loginBo.getMember(member);
				if (memberDB != null) {
					if (memberDB.getState() == 0) {
						SysMessageBean smb = new SysMessageBean(true);
						smb.setMessage(new ActionMessage(
								"LoginAction.login.notaudit"));
						smb.setLinkText(new ActionMessage(
								"LoginAction.login.returnindex"));
						smb.setAction("/index");
						smb.setLinkTarget("_parent");
						SysGlobals.setSysMessage(request, smb);
						return mapping.findForward("error");
					} else if (memberDB.getState() == 2) {
						SysMessageBean smb = new SysMessageBean(true);
						smb.setMessage(new ActionMessage(
								"LoginAction.login.lock"));
						smb.setLinkText(new ActionMessage(
								"LoginAction.login.returnindex"));
						smb.setAction("/index");
						smb.setLinkTarget("_parent");
						SysGlobals.setSysMessage(request, smb);
						return mapping.findForward("error");
					}
					Map<String, String> sessionMap = new HashMap<String, String>();
					sessionMap
							.put("memberid", String.valueOf(memberDB.getId()));
					sessionMap.put("accountid", memberDB.getAccountid());
					sessionMap.put("factname", memberDB.getFactname());
					SysGlobals.setSessionObj(request, Constants.HOME_SESSION,
							sessionMap);
					loginBo.modifyMemberLogintime(memberDB);
				} else {
					ActionMessages msg = new ActionMessages();
					msg.add("sysMessage", new ActionMessage(
							"LoginAction.login.failed"));
					saveErrors(request, msg);
					flag = "failure";
				}
			} catch (BaseException e) {
				throw new BaseException("errors.not.connect.db", e);
			}
		}
		return mapping.findForward(flag);
	}

	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws BaseException {
		SysGlobals.removeSessionObj(request, Constants.HOME_SESSION);
		return mapping.findForward("success");
	}

}