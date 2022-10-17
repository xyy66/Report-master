package com.report.global;

import java.util.HashMap;

import org.apache.struts.action.ActionMessage;

public class SysMessageBean {
	// 查询字符串，url后的相关参数
	private HashMap<String, String> queryData;
	private boolean error = false;

	// Action的path属性

	private String action;

	// 系统信息提示内容
	private ActionMessage message = null;

	// 信息提示转向的链接文字

	private ActionMessage linkText = null;

	// 信息提示页面的title
	private ActionMessage pageTitle = null;

	// 信息提示链接转向的窗口,默认为本窗口_self
	private String linkTarget = "_self";

	// 定时转向设置默认为5，单位：秒，当timer为空("")时，不进行定时

	private String timer = "5";

	/**
	 * 构造方法
	 */
	public SysMessageBean(boolean error) {
		queryData = new HashMap<String, String>();
		this.error = error;
	}

	/**
	 * 设置查询字符串(参数)
	 * 
	 * @param key
	 * @param value
	 */
	public void setQueryData(String key, String value) {
		queryData.put(key, value);
	}

	/**
	 * 获取信息提示转向的action
	 * 
	 * @return String
	 */
	public String getAction() {
		return this.action;
	}

	/**
	 * 获取查询字符串(参数)
	 * 
	 * @return String
	 */
	public HashMap getQueryData() {
		return this.queryData;
	}

	/**
	 * 获取信息提示转向链接的文字
	 * 
	 * 
	 * @return String
	 */
	public ActionMessage getLinkText() {
		return linkText;
	}

	/**
	 * 设置信息提示转向链接的文字
	 * 
	 * 
	 * @param linkText
	 */
	public void setLinkText(ActionMessage linkText) {
		this.linkText = linkText;
	}

	/**
	 * 获取信息提示内容
	 * 
	 * @return ActionMessage
	 */
	public ActionMessage getMessage() {
		return message;
	}

	/**
	 * 设置信息提示内容
	 * 
	 * @param message
	 */
	public void setMessage(ActionMessage message) {
		this.message = message;
	}

	/**
	 * 获取信息提示页面title内容
	 * 
	 * @return ActionMessage
	 */
	public ActionMessage getPageTitle() {
		return pageTitle;
	}

	/**
	 * 设置信息提示页面title内容
	 * 
	 * @param pageTitle
	 */
	public void setPageTitle(ActionMessage pageTitle) {
		this.pageTitle = pageTitle;
	}

	/**
	 * 设置信息提示转向的action
	 * 
	 * @param action
	 */
	public void setAction(String action) {
		this.action = action;
	}

	/**
	 * 获取linkTarget属性
	 * 
	 * 
	 * @return
	 */
	public String getLinkTarget() {
		return linkTarget;
	}

	/**
	 * 设置linkTarget属性
	 * 
	 * 
	 * @param linkTarget
	 */
	public void setLinkTarget(String linkTarget) {
		this.linkTarget = linkTarget;
	}

	/**
	 * 获取定时转向时间
	 * 
	 * @return
	 */
	public String getTimer() {
		return timer;
	}

	/**
	 * 设置定时转向时间
	 * 
	 * @param timer
	 */
	public void setTimer(String timer) {
		this.timer = timer;
	}

	public boolean isError() {
		return error;
	}
}