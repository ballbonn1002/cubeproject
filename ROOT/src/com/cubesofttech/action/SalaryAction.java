package com.cubesofttech.action;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FaqCategoryDAO;
import com.cubesofttech.dao.FaqDAO;
import com.cubesofttech.dao.FaqImageDAO;
import com.cubesofttech.dao.FaqStatusDAO;
import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.JobsiteDAO;
import com.cubesofttech.dao.NewsDAO;
import com.cubesofttech.dao.SalaryUserDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.FaqImage;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.Project;
import com.cubesofttech.model.Salary_user;
import com.cubesofttech.model.Timesheet;
import com.cubesofttech.model.FAQCategory;
import com.cubesofttech.model.FAQStatus;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ibm.icu.util.GregorianCalendar;
import com.opensymphony.xwork2.ActionSupport;

public class SalaryAction extends ActionSupport {
	public static final String ONLINEUSER = "onlineUser";
	private static final Logger log = Logger.getLogger(FaqAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private JobsiteDAO jobsiteDAO;
	@Autowired
	private TimesheetDAO timesheetDAO;
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private SalaryUserDAO salaryuserDAO;
	
	
	@Autowired
	private HolidayDAO holidayDAO;
	
	@Autowired
	private WorkHoursDAO workhoursDAO;
	
	@Autowired
	private NewsDAO newsDAO;



	List<Map<String, Object>> faqJoin; // faqJoin include faq and faq_category and faq_status columns
	List<FAQCategory> faqCategoryList;
	List<FAQStatus> faqStatusList;
	

	/* FAQ Image */
	File FaqImage;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String jobsite_add() {
		try {	
			List<Map<String, Object>> jslist = jobsiteDAO.findAll();
			request.setAttribute("jobsitelist", jslist);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String jobsite_json() {
		try {

			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(jobsiteDAO.findAll2());

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	public String usersalary_list() {
		try {

			List<Map<String, Object>> cubeUser = userDAO.sequense();
			request.setAttribute("cubeUser", cubeUser);
			List<Map<String, Object>> uslist = salaryuserDAO.findAll3();
			request.setAttribute("uslist", uslist);
			
			sumsalary();
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String usersalary_save() {
		try {
			String name = request.getParameter("name");
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			String salary = request.getParameter("salary");
			String des = request.getParameter("des");
			
			System.out.println(name);
			System.out.println(from);
			System.out.println(to);
			System.out.println(salary);
			System.out.println(des);
			
			int salary1 = Integer.parseInt(salary);

//			Timestamp startDate = DateUtil.dateFormatEdit(from);
//			Timestamp endDate = DateUtil.dateFormatEdit(to);		
		
			Timestamp startDate = Timestamp.valueOf(from);

			Timestamp endDate = Timestamp.valueOf(to);
			
			Salary_user salary_user = new Salary_user();
			
			int a = 111;
			
			salary_user.setId_salary_user(a);
			salary_user.setStart_date(startDate);
			salary_user.setEnd_date(endDate);
			salary_user.setUser(name);
			salary_user.setSalary(salary1);
			salary_user.setDescription(des);
			salary_user.setUser_create(name);

			salary_user.setTime_create(DateUtil.getCurrentTime());

			salaryuserDAO.save(salary_user);
			

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String usersalary_delete() throws Exception {
		try {
			String Id = request.getParameter("id");
			Integer idValue = Integer.valueOf(Id);
			Salary_user salary_user = salaryuserDAO.findById(idValue);
			
			System.out.println(Id);
			
			salaryuserDAO.delete(salary_user);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}
	public String usersalary_edit() throws Exception {
		try {
			String Id = request.getParameter("id");
			Integer idValue = Integer.valueOf(Id);
			Salary_user salary_user = salaryuserDAO.findById(idValue);
			
			String name = request.getParameter("name");
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			String salary = request.getParameter("salary");
			String des = request.getParameter("des");
			
			Timestamp startDate = Timestamp.valueOf(from);

			Timestamp endDate = Timestamp.valueOf(to);
			
			int salary1 = Integer.parseInt(salary);
			
			salary_user.setUser(name);
			salary_user.setStart_date(startDate);
			salary_user.setEnd_date(endDate);
			salary_user.setSalary(salary1);
			salary_user.setDescription(des);		
			salary_user.setUser_update(name);			
			salary_user.setTime_update(DateUtil.getCurrentTime());
			salaryuserDAO.update(salary_user);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}
	
	public void sumsalary() throws Exception {
		
		List<Map<String, Object>> users = salaryuserDAO.findUser();
		float[] Absent = new float[users.size()];
		
		//------------------Sut,Sun Until today------------------------
		List<Date> endweek = new ArrayList<>();
		Calendar cals = Calendar.getInstance();
		cals.set(Calendar.DAY_OF_MONTH, 1);
		float Ssday = 0;
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String formatted1 = format1.format(Calendar.getInstance().getTime());
		int result = -1;
		while(result != 0) {
			int dayOfWeek = cals.get(Calendar.DAY_OF_WEEK);
			if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY)
				endweek.add(cals.getTime());
			String formatted2 = format1.format(cals.getTime());
			result = formatted1.compareTo(formatted2);
			cals.add(Calendar.DAY_OF_MONTH, 1);
		}
		for (Date date : endweek) {
			Ssday += 1;
		}
		
		//-----------------------Holiday Until today-----------------------
		cals.set(Calendar.DAY_OF_MONTH, 1);
		//SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
		String start_mouth = format1.format(cals.getTime());
		String today = format1.format(Calendar.getInstance().getTime());
		List<Map<String, Object>> count = holidayDAO.count_hoilday(start_mouth, today);
		float Holidays = 0;
		for(int i = 0; i< count.size(); i++) {
			Date start_h = ((Date) count.get(i).get("start_date"));
			Date end_h = ((Date) count.get(i).get("end_date"));
			long diff = end_h.getTime() - start_h.getTime();
			float result_h = (diff / (1000 * 60 * 60 * 24));
			Holidays += (result_h+1);
		}
		
		//-------------------CheckList Until today-------------------------------
		float[] checkList = new float[users.size()];
		for (int i = 0; i < users.size(); i++) {
			String users_box = ((String) users.get(i).get("USER"));
			List<Map<String, Object>> count_checklist = workhoursDAO.Count_checkList(users_box,start_mouth, today);
			BigInteger counts = ((BigInteger) count_checklist.get(0).get("count_workday"));
			checkList[i] = counts.floatValue();
		}
		
		//------------------ count today-------------------------------------------
		Date date_start =  format1.parse(start_mouth);
		Date date_today =  format1.parse(today);
		long diff = date_today.getTime() - date_start.getTime();
		float month_to_present = (diff / (1000*60*60*24));
		
		
		// ----------------- sum userID Leave -----------------
		Date now = new Date();
		String strDate = format1.format(now);
		String monthnow = strDate.substring(5, 7);
		String yearnow = strDate.substring(0, 4);
		BigDecimal Leavesum = new BigDecimal(0);
		float[] Leave_me = new float[users.size()];
		
		for(int i = 0; i < users.size(); i++) {
		String users_box = ((String) users.get(i).get("USER"));
		List<Map<String, Object>> sul = newsDAO.searchUserLeave(users_box, monthnow, yearnow);

			for (int j = 0; j < sul.size(); j++) {

				BigDecimal sulonday = (BigDecimal) sul.get(j).get("no_day");
				Leavesum = sulonday.add(Leavesum);
			
			}
		Leave_me[i] = Leavesum.floatValue();
		Leavesum = BigDecimal.ZERO;
		}
		
		//--------------------- sum Absent ------------------------------------------
		for (int i = 0; i < users.size(); i++) {
			Absent[i] = month_to_present - (Ssday+Holidays+checkList[i]+Leave_me[i]);
		}
		
		request.setAttribute("absents", Absent);
		
	}
}