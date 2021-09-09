package com.cubesofttech.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.InvitingDAO;
import com.cubesofttech.model.Inviting;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class invitingAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private static final Logger log = Logger.getLogger(FaqAction.class);
	List<Map<String, Object>> faqJoin;
	@Autowired
	private InvitingDAO InvitingDAO;
	@Autowired
	private UserDAO userDAO;
	
	//invite
	public String invitingMember_list() {
		try {
			List<Map<String, Object>> invitingMemberlist = InvitingDAO.findAll2();
			request.setAttribute("invitingMemberlist", invitingMemberlist);
			System.out.println(invitingMemberlist);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	
}