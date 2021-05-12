package com.cubesofttech.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;

public class ReportRedirectAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(DepartmentAction.class);
	private static final long serialVersionUID = 2280661337420278284L;
	
	public String RedirectToMenu() {
		try {
			return SUCCESS;
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
	}
}
