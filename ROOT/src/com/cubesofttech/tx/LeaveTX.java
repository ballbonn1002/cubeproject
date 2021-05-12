package com.cubesofttech.tx;

import java.io.Console;
import java.io.File;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.action.FaqAction;
import com.cubesofttech.dao.AuthorizedObjectDAO;
import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.JobsiteDAO;
import com.cubesofttech.dao.LeaveDAO;
import com.cubesofttech.dao.LeaveTypeDAO;
import com.cubesofttech.dao.LeaveUserDAO;
import com.cubesofttech.dao.RoleAuthorizedObjectDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.FAQCategory;
import com.cubesofttech.model.FAQStatus;
import com.cubesofttech.model.Holiday;
import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.LeaveType;
import com.cubesofttech.model.Leaves;
import com.cubesofttech.model.Role;
import com.cubesofttech.model.RoleAuthorizedObject;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ibm.icu.util.RangeValueIterator.Element;
import com.opensymphony.xwork2.ActionSupport;
public class LeaveTX extends ActionSupport{
	public static final String ONLINEUSER = "onlineUser";
	private static final Logger log = Logger.getLogger(FaqAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private JobsiteDAO jobsiteDAO;
	@Autowired
	private LeaveTypeDAO leavetypeDAO;
	@Autowired
	private LeaveUserDAO leaveuserDAO;
	@Autowired
	private LeaveDAO leaveDAO;
	Integer id;

	List<Map<String, Object>> faqJoin; // faqJoin include faq and faq_category and faq_status columns
	List<FAQCategory> faqCategoryList;
	List<FAQStatus> faqStatusList;
	

	/* FAQ Image */
	File FaqImage;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	
	public String leave_json() {
		try {

			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(leaveDAO.leavejson());

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	public String leave_jsonbyid() {
		try {
			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();
			
			String responseJSON = gson.toJson(jobsiteDAO.findAllbyid(id));

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	public String leave_save() {
		try {
			
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String userLogin = ur.getId();// online user
			String userId = request.getParameter("name");

			String leaveStatusId = request.getParameter("leaveStatusId");
			String apprUserId = request.getParameter("apprUserId");
			String description = request.getParameter("description");
			String halfDay = request.getParameter("halfDay"); // null set 0
			String reason = request.getParameter("reason");

			String from = request.getParameter("from");
			String to = request.getParameter("to");

			Timestamp start_date = DateUtil.dateFormatEdit(from);// changeformat
			Timestamp end_date = DateUtil.dateFormatEdit(to);// changeformat
			String noDay = request.getParameter("noDay");
			BigDecimal no_day = new BigDecimal(noDay);

			Integer l = leaveDAO.getMaxId() + 1;
			Leaves le = new Leaves();
			le.setLeaveId(l);
			String TypeId = request.getParameter("leaveTypeId");
			if (!TypeId.equals("1") && !TypeId.equals("2") && !TypeId.equals("3") && !TypeId.equals("4")
					&& !TypeId.equals("5") && !TypeId.equals("6")) {
				le.setLeaveTypeId("9");
			} else {
				le.setLeaveTypeId(TypeId);
			}

			le.setLeaveStatusId(leaveStatusId);
			le.setHalfDay(halfDay);
			String hd = request.getParameter("halfDay");
			if (hd == null) {
				le.setHalfDay("0");
			}
			le.setUserId(userId);
			le.setApprUserId(apprUserId);
			le.setStartDate(start_date);
			le.setEndDate(end_date);
			le.setDescription(description);
			le.setReason(reason);
			le.setNoDay(no_day);
			le.setUserCreate(userLogin);
			le.setUserUpdate(userLogin);
			le.setTimeCreate(DateUtil.getCurrentTime());
			le.setTimeUpdate(DateUtil.getCurrentTime());

			List<Map<String, Object>> leavenameList = leaveDAO.findLeave();
			request.setAttribute("leavenameList", leavenameList);
			request.setAttribute("leavenameList", leaveDAO.findAll());
			request.setAttribute("leavetypeList", leavetypeDAO.findAll_calendar());
			request.setAttribute("leaveuserList", leaveuserDAO.findAll());
			request.setAttribute("test", "test");
			request.setAttribute("id", userId);

			leaveDAO.save(le);
			

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String leave_delete() throws Exception {
		try {
			String Id = request.getParameter("id");
			Integer idValue = Integer.valueOf(Id);
			Jobsite jobsite = jobsiteDAO.findById(idValue);

			jobsiteDAO.delete(jobsite);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}
	public String leave_edit() throws Exception {
		try {
			String Id = request.getParameter("id");
			Integer idValue = Integer.valueOf(Id);
			Jobsite jobsite = jobsiteDAO.findById(idValue);
			
			String namesite = request.getParameter("name");
			String user_update = request.getParameter("user");
			jobsite.setName_site(namesite);
			jobsite.setUser_update(user_update);
			jobsite.setTime_update(DateUtil.getCurrentTime());
			jobsiteDAO.update(jobsite);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
