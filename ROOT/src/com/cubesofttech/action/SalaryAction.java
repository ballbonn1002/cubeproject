package com.cubesofttech.action;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
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
import com.cubesofttech.dao.PalmDAO;
import com.cubesofttech.dao.SalaryUserDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.FaqImage;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.HistorySalary;
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

	@Autowired
	public PalmDAO palmDAO;
	
	

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
			
			Integer oldsalary = salary_user.getSalary();
			
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
			
			//String oldsalary = request.getParameter("oldsalary");
			//int old_salary = Integer.parseInt(oldsalary);
			/*if(oldsalary != salary1) {
				historysalary_save(name,oldsalary,startDate);
			}*/
			
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}
	
	public String salary_list() {
		try {
			//tab search
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date date1;
			date1 = tstamp;
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);
			String month1 = datenow.substring(3, 5);
			String year = datenow.substring(6, 10);			
			request.setAttribute("monthSearch", month1);
			request.setAttribute("yearSearch", year);
			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			
			
			
			
			//list
//			List<Map<String, Object>> uslist = salaryuserDAO.salarylist();
//			request.setAttribute("uslist", uslist);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String salary_search() {
		try {
			//get search
			String monthsearch = request.getParameter("monthSearch");
			String yearsearch = request.getParameter("yearSearch");
		
			//tab search
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date date1;
			date1 = tstamp;
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);
			String month1 = datenow.substring(3, 5);
			String year = datenow.substring(6, 10);			
			request.setAttribute("monthSearch", month1);
			request.setAttribute("yearSearch", year);
			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			
		
			
			int iYear = Integer.parseInt(yearsearch);
			int iMonth = Integer.parseInt(monthsearch);
			GregorianCalendar mycal = new GregorianCalendar(iYear, iMonth - 1, 1);
			int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH); // 28
			String dateStartSearch = year + '/' + monthsearch + '/' + "01";
			String dateEndSearch = year + '/' + monthsearch + '/' + daysInMonth;
			
			int day30 = 30;
			//list
			List<Map<String, Object>> uslist = salaryuserDAO.salarylist(monthsearch,yearsearch);
			request.setAttribute("uslist", uslist);
			List<Map<String, Object>> checkin = salaryuserDAO.notsatsun(monthsearch, yearsearch);
			request.setAttribute("checkin", checkin);
			
			
			int countuser = uslist.size();
			for (int i = 0; i < countuser; i++) {
			

				Integer salary = ((Integer) uslist.get(i).get("salary"));
				System.out.println(salary);
				
				int daysalary = salary / day30;
				System.out.println(daysalary);
				
				for(int a = 0;a<2;a++) {
					salary = salary - daysalary;
				}
				uslist.get(i).put("sumsalary", salary);
				System.out.println(salary);
				
			}
			
			//palmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

			int Hday = 0;
			int workday = 0;
			int d = 1;
			int m = Integer.parseInt(monthsearch);
			int y = Integer.parseInt(yearsearch);

//			y = y - 1;
			m = m - 1;
			Calendar calendar = Calendar.getInstance();
			calendar.set(y, m, d);
			int days = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			List<Date> disable = new ArrayList<>();
			Calendar cal = Calendar.getInstance();
			cal.set(y, m, d);
			cal.set(Calendar.DAY_OF_MONTH, 1);
			int month = cal.get(Calendar.MONTH);
			do {
				int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
				if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY)
					disable.add(cal.getTime());

				cal.add(Calendar.DAY_OF_MONTH, 1);
			} while (cal.get(Calendar.MONTH) == month);

			SimpleDateFormat fmt = new SimpleDateFormat("EEE M/d/yyyy");
			for (Date date2 : disable) {
				Hday += 1;
			}
			workday = days - Hday;
			List<Map<String, Object>> workdays = salaryuserDAO.workdays(monthsearch, yearsearch);

			workday = workday - workdays.size();
//			System.out.println(workday + "=" +workday +"+" +workdays +"day:"+ days);
			request.setAttribute("workday", workday);
			List<Map<String, Object>> spalm = salaryuserDAO.notsatsun(monthsearch, yearsearch);
			request.setAttribute("spalm", spalm);

			List<Map<String, Object>> late = salaryuserDAO.latedayall("06", "2021");
			request.setAttribute("late", late);

			List<Map<String, Object>> leave = salaryuserDAO.leavenotsatsun(monthsearch, yearsearch);
			request.setAttribute("leave", leave);
			
			List<Map<String, Object>> leavehalfday = salaryuserDAO.leavehalfday(monthsearch, yearsearch);
			
			request.setAttribute("leavehalfday", leavehalfday);
			System.out.println(leavehalfday);
////			System.out.println(spalm.size() + "  ====== spalm.size");
	
			int countpalm = spalm.size();
			System.out.println("test"+spalm);
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leave.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leave.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leave.get(z).get("user_id"));
						spalm.get(x).put("no_day", leave.get(z).get("no_day"));
					}
				}
			}
			
			for (int x = 0; x < countpalm; x++) {
				if (spalm.get(x).size() != 4) {
					spalm.get(x).put("user_id", spalm.get(x).get("user_create"));
					spalm.get(x).put("no_day", BigDecimal.valueOf(0.0));
				}

			}
			System.out.println("test"+spalm);

			
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leavehalfday.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leavehalfday.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leavehalfday.get(z).get("user_id"));
						spalm.get(x).put("hour1", leavehalfday.get(z).get("hour1"));
					}
				}
			}
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leavehalfday.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leavehalfday.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leavehalfday.get(z).get("user_id"));
						spalm.get(x).put("hour2", leavehalfday.get(z).get("hour2"));
					}
				}
			}
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leavehalfday.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leavehalfday.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leavehalfday.get(z).get("user_id"));
						spalm.get(x).put("hour3", leavehalfday.get(z).get("hour3"));
					}
				}
			}
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leavehalfday.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leavehalfday.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leavehalfday.get(z).get("user_id"));
						spalm.get(x).put("hour4", leavehalfday.get(z).get("hour4"));
					}
				}
			}
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leavehalfday.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leavehalfday.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leavehalfday.get(z).get("user_id"));
						spalm.get(x).put("hour5", leavehalfday.get(z).get("hour5"));
					}
				}
			}
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leavehalfday.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leavehalfday.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leavehalfday.get(z).get("user_id"));
						spalm.get(x).put("hour6", leavehalfday.get(z).get("hour6"));
					}
				}
			}
			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < leavehalfday.size(); z++) {
					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(leavehalfday.get(z).get("user_id").toString().toLowerCase())) {
						spalm.get(x).put("user_id", leavehalfday.get(z).get("user_id"));
						spalm.get(x).put("hour7", leavehalfday.get(z).get("hour7"));
					}
				}
			}
			
			
			
		System.out.println("--------------------------------------------\n"+spalm);

			for (int x = 0; x < countpalm; x++) {
				for (int z = 0; z < late.size(); z++) {

					if (spalm.get(x).get("user_create").toString().toLowerCase()
							.equals(late.get(z).get("user_create").toString().toLowerCase())) {
						spalm.get(x).put("lateday", late.get(z).get("wt"));
					}
//					
				}
				if (spalm.get(x).size() != 5) {
					spalm.get(x).put("lateday", 0);
				}
			}
//			
			List<Map<String, Object>> multipleDay = salaryuserDAO.multipleDay(monthsearch, yearsearch);
			request.setAttribute("multipleDay", multipleDay);
			int smd = multipleDay.size();
//		System.out.println("multipleDay.size====>"+multipleDay.size());
			for (int md = 0; md < countpalm; md++) {
				if (!(multipleDay.isEmpty())) {
					for (int md2 = 0; md2 < smd; md2++) {
//					
						if (spalm.get(md).get("user_create").toString().toLowerCase()
								.equals(multipleDay.get(md2).get("user_create").toString().toLowerCase())) {
//					
							BigDecimal mda = (BigDecimal) multipleDay.get(md2).get("no_day");
							multipleDay.get(md2).put("multiD", mda.doubleValue());
//						System.out.println("-------------------------------");
//						System.out.println(mda + "." + multipleDay );
						}
//					else {
//						multipleDay.get(md2).put("multiD", 0);
//					}
					}
				}
			}

			for (int i = 0; i < countpalm; i++) {
				double sss = 0;
				double miss = 0;
				
				BigInteger tci = ((BigInteger) spalm.get(i).get("time_check_in"));

				BigDecimal nd = ((BigDecimal) spalm.get(i).get("no_day"));
				
				String sname = ((String) spalm.get(i).get("user_create"));
	
				//serchsitejob
				List<Map<String, Object>> serchname = salaryuserDAO.serchnamejob(sname);
				request.setAttribute("serchname", serchname);
				
				
				for (int z = 0; z < serchname.size(); z++) {
					if (spalm.get(i).get("user_create").toString().toLowerCase()
							.equals(serchname.get(z).get("id").toString().toLowerCase())) {
						spalm.get(i).put("user_id", serchname.get(z).get("id"));
						spalm.get(i).put("name_site", serchname.get(z).get("name_site"));
					}
				}
				
				
				
					for (int z = 0; z < uslist.size(); z++) {
						if (spalm.get(i).get("user_create").toString().toLowerCase()
								.equals(uslist.get(z).get("user").toString().toLowerCase())) {
							spalm.get(i).put("user_id", uslist.get(z).get("user"));
							spalm.get(i).put("salary", uslist.get(z).get("salary"));
						}
					}
				
				//end serchsitejob
				
//				System.out.println(".....................................");
				System.out.println(tci);
				System.out.println(nd);
//				System.out.println(".....................................");
				double b1 = tci.intValue();
				double b2 = nd.doubleValue();
//				System.out.println("miss = workday - b1 - b2 == "+ miss +" = "+ workday +" - "+ b1+" - "+ b2);
					
				
				if (!(multipleDay.isEmpty())) {
					for (int md3 = 0; md3 < smd; md3++) {

						if (spalm.get(i).get("user_create").toString().toLowerCase()
								.equals(multipleDay.get(md3).get("user_create").toString().toLowerCase())) {

							Double ss = (Double) (multipleDay.get(md3).get("multiD"));
							miss = (double) (workday - (b1 + b2 - ss));
//							spalm.get(i).replace("no_day", b2-ss);
							spalm.get(i).replace("no_day", b2);
							sss = ss.doubleValue();
//					if(spalm.get(i).get("user_create").equals("thanet.s"))System.out.println("111111111111111111111111111");
							break;

						}

						miss = (double) (workday - (b1 + b2));
//					if(spalm.get(i).get("user_create").equals("thanet.s"))System.out.println("222222222222222222222222222");

					}
				} else {
					miss = (double) (workday - (b1 + b2));
				}

//				if (spalm.get(i).get("user_create").equals("thanet.s")) {
//					System.out.println("miss = (workday - (b1 + b2-ss)) >>>>>"+miss+ " = " + workday +"-"+ "("+b1 +"+"+ b2+"-"+sss+")");
//				}
				spalm.get(i).put("miss", miss);
				 
				b1 = 0;
				b2 = 0;

			}
			//palmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
			for (int i = 0; i < countpalm; i++) {
				Double miss = ((Double) spalm.get(i).get("miss"));

				Integer salary = ((Integer) spalm.get(i).get("salary"));
				System.out.println(salary);
				
				int daysalary = salary / day30;
				System.out.println(daysalary);
				
				for(int a = 0;a<miss;a++) {
					salary = salary - daysalary;
				}
				spalm.get(i).put("sumsalary", salary);
				System.out.println(salary);
				
			}
			
			request.setAttribute("monthSearch", monthsearch);
			request.setAttribute("yearSearch", yearsearch);
		

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	public String historysalary_save(String name,int salary,Timestamp end_salary) {
		try {
			
			HistorySalary historysalary = new HistorySalary();
			
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = format1.format(end_salary);
			//String monthnow = strDate.substring(5, 7);
			String dayofmonth = strDate.substring(8, 10);
			int day = Integer.parseInt(dayofmonth);  
			
			Calendar cals = Calendar.getInstance();	
			cals.set(Calendar.DAY_OF_MONTH, 1);
			//cals.set ( Calendar.MONTH, 10 );
			
			
			String start_mouth = format1.format(cals.getTime());
			String end_oldsalary =  format1.format(end_salary);
			//String today = format1.format(Calendar.getInstance().getTime());
			
			int present = getpresent(name,start_mouth,end_oldsalary);
			int holiday = getHoliday(start_mouth,end_oldsalary);
			int leaves = getleaves(name);
			int absent  = getabsent(name);
			int late = getlate(name, start_mouth, end_oldsalary);
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId();
			
			if(day == 1) {
				present = 0;
				holiday = 0;
				leaves = 0;
				absent = 0;
				late = 0;
			}
			
			historysalary.setHistory_id(1);
			historysalary.setUser(name);
			historysalary.setPresent(present+holiday);
			historysalary.setLeave(leaves);
			historysalary.setAbsent(absent);
			historysalary.setLate(late);
			historysalary.setSalary(salary);
			historysalary.setTime_create(end_salary);
			historysalary.setUser_create(logonUser);
			

			salaryuserDAO.save_history(historysalary);
			

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	
	public int getpresent(String users_list, String start_mouth,String today) throws Exception {
		//-------------------------CheckList Until today--------------------------------
		List<Map<String, Object>> count_checklist = workhoursDAO.Count_checkList(users_list,start_mouth, today);
		BigInteger counts = ((BigInteger) count_checklist.get(0).get("count_workday"));
		int checkList = counts.intValue();
		return checkList;
	}
	
	public int getleaves(String users_list) throws Exception {
		// ------------------------- sum userID Leave ---------------------------
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String strDate = format1.format(now);
		String monthnow = strDate.substring(5, 7);
		String yearnow = strDate.substring(0, 4);
		BigDecimal Leavesum = new BigDecimal(0);
		//System.out.println(logonUser);
		List<Map<String, Object>> sul = newsDAO.searchUserLeave(users_list, monthnow, yearnow);

		for (int k = 0; k < sul.size(); k++) {

			BigDecimal sulonday = (BigDecimal) sul.get(k).get("no_day");
			//System.out.println(sulonday);
			Leavesum = sulonday.add(Leavesum);
			
		}
		int Leave_me = Leavesum.intValue();
		return Leave_me;
	}
	
	public int getabsent(String users_list) throws Exception {
		//------------------Sut,Sun Until today------------------------
				List<Date> endweek = new ArrayList<>();
				Calendar cals = Calendar.getInstance();
				cals.set(Calendar.DAY_OF_MONTH, 1);
				int Ssday = 0;
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
				int Holidays = 0;
				for(int i = 0; i< count.size(); i++) {
					Date start_h = ((Date) count.get(i).get("start_date"));
					Date end_h = ((Date) count.get(i).get("end_date"));
					long diff = end_h.getTime() - start_h.getTime();
					float result_h = (diff / (1000 * 60 * 60 * 24));
					Holidays += (result_h+1);
				}
		
		//------------------ count today-------------------------------------------
				Date date_start =  format1.parse(start_mouth);
				Date date_today =  format1.parse(today);
				long diff = date_today.getTime() - date_start.getTime();
				int month_to_present = (int) ((diff / (1000*60*60*24)))+1;
		
				int present = getpresent(users_list,start_mouth, today);
				int leaves = getleaves(users_list);
				
				int Absent = month_to_present - (Ssday+Holidays+present+leaves);
		
		return Absent;
	}
	
	public int getlate(String user,String start_mouth, String today) throws Exception {
		int lates = 0;
		List<Map<String, Object>> late = salaryuserDAO.find_late(user,start_mouth, today);
		if(late.size() != 0) {
			//BigInteger late_counts = ((BigInteger) late.get(0).get("wt"));
			//lates = late_counts.intValue();
			lates = late.size();
		}
		
		return lates;
	}
	
	public int getworkday() {
		int lastDayOfMonth = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
		//------------------Sut,Sun ------------------------
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateend = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(dateend);
        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
        String formatlastDayOfMonth = format1.format(c.getTime());
		
		List<Date> endweek = new ArrayList<>();
		Calendar cals = Calendar.getInstance();
		cals.set(Calendar.DAY_OF_MONTH, 1);
		int Ssday = 0;
	
		int result = -1;
		while(result != 0) {
			int dayOfWeek = cals.get(Calendar.DAY_OF_WEEK);
			if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY)
				endweek.add(cals.getTime());
			String formatted2 = format1.format(cals.getTime());
			result = formatlastDayOfMonth.compareTo(formatted2);
			cals.add(Calendar.DAY_OF_MONTH, 1);
		}
		for (Date date : endweek) {
			Ssday += 1;
		}
		
		return (lastDayOfMonth-Ssday);
	}
	
	public int getHoliday(String start_mouth,String today) throws Exception {
		
		List<Map<String, Object>> count = holidayDAO.count_hoilday(start_mouth, today);
		int Holidays = 0;
		for(int i = 0; i< count.size(); i++) {
			Date start_h = ((Date) count.get(i).get("start_date"));
			Date end_h = ((Date) count.get(i).get("end_date"));
			long diff = end_h.getTime() - start_h.getTime();
			float result_h = (diff / (1000 * 60 * 60 * 24));
			Holidays += (result_h+1);
		}
		return Holidays;
	}
	
	public String getsumsalary() throws Exception{
		try {
			Calendar cals = Calendar.getInstance();	
			cals.set(Calendar.DAY_OF_MONTH, 1);
			SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
			String start_mouth = formatdate.format(cals.getTime());
			String today = formatdate.format(Calendar.getInstance().getTime());
			
			double workday = 30;
			
			NumberFormat nf= NumberFormat.getInstance();
	        nf.setMaximumFractionDigits(2);
			
			List<Map<String, Object>> users = salaryuserDAO.findAll4();
			
			for(int i = 0; i< users.size(); i++) {
				String users_list = ((String) users.get(i).get("USER"));
				int present = getpresent(users_list,start_mouth, today);
				int leaves = getleaves(users_list);
				int Absent =  getabsent(users_list);
				int late = getlate(users_list, start_mouth, today);
				
				List<Map<String, Object>> late_data = salaryuserDAO.find_late(users_list,start_mouth, today);
				
				//int[] hour = new int[late_data.size()];
				//int[] minute = new int[late_data.size()];
				//double[] hourlymoney = new double[late_data.size()];
				//double[] minutemoney = new double[late_data.size()];
				
				double hourlymoney = 0;
				double minutemoney = 0;
				
				Integer salary = ((Integer) users.get(i).get("salary"));
				
				double dailymoney = salary/workday;
				
			if(late_data.size() != 0) {
					
				String start_time = ((String) late_data.get(i).get("work_time_start"));
				String start_hh = start_time.substring(0, 2);
				String start_mm = start_time.substring(3, 5);
				int start_hour = Integer.parseInt(start_hh);
				int start_minute = Integer.parseInt(start_mm);
				
				for(int j = 0; j< late_data.size(); j++) {
				String late_time = ((String) late_data.get(j).get("worktime"));
				String hh = late_time.substring(0, 2);
				String mm = late_time.substring(3, 5);
				int hour = Integer.parseInt(hh);
				int minute = Integer.parseInt(mm);
				
				hourlymoney += (dailymoney/8)*(hour-start_hour);
				
				minutemoney += (dailymoney/480)*Math.abs((minute-start_minute));
				}
			}
				
				double deductionamount = (dailymoney*Absent) + hourlymoney + minutemoney;
				
				double sum_salary = salary - deductionamount;
				
				users.get(i).put("sumsalary", nf.format(sum_salary));
				users.get(i).put("present", present);
				users.get(i).put("late", late);
				users.get(i).put("leaves", leaves);
				users.get(i).put("absent", Absent);
				 
			}
			
			request.setAttribute("users", users);
			
			
		return SUCCESS;
		}catch (Exception e) {
			log.error(e);
			return ERROR;
		}
		
	}
	
	
/*	public String calculatesalary() throws Exception {
		
		getsumsalary();
		try {
		Calendar cals = Calendar.getInstance();	
		cals.set(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String start_mouth = format1.format(cals.getTime());
		String today = format1.format(Calendar.getInstance().getTime());
		
		
		int workday = getworkday();
		List<Map<String, Object>> users = salaryuserDAO.findAll4();
		
		for(int i = 0; i< users.size(); i++) {
			//------------------start old salary------------------------------
			double sum_oldsalary1 = 0;
			int oldpresent = 0;
			String users_list = ((String) users.get(i).get("USER"));
			List<Map<String, Object>> allsalary = salaryuserDAO.find_historybyname(users_list,start_mouth, today);
			if(allsalary.size() != 0) {
				for(int j = 0; j< allsalary.size(); j++) {
					Integer before_salary = ((Integer) allsalary.get(j).get("salary"));
					Integer present = ((Integer) allsalary.get(j).get("present_holiday"));
					//Integer leaves = ((Integer) allsalary.get(j).get("leaves"));
					//Integer absent = ((Integer) allsalary.get(j).get("absent"));
					//Integer late = ((Integer) allsalary.get(j).get("late"));
					//System.out.println(oldsalary+" "+present+" "+leaves+" "+absent+" "+late);
					
					double salarybyday = (double)before_salary/(double)workday;
					double salary1 = salarybyday*(present-oldpresent);
					sum_oldsalary1 = sum_oldsalary1 + salary1;
					oldpresent = present;
					
					//System.out.println(salary);
				}
				users.get(i).put("oldsalary", sum_oldsalary1);
				users.get(i).put("oldpresent", oldpresent);
			}
			else {
				users.get(i).put("oldsalary", (double)0);
				users.get(i).put("oldpresent", 0);
			}
			//----------------------------end old salary ----------------------------------
			
			//----------------------------start calculate salary---------------------------
					int present = getpresent(users_list,start_mouth, today);
					int leaves = getleaves(users_list);
					int Absent =  getabsent(users_list);
					int late = getlate(users_list, start_mouth, today);
					//int holiday = getHoliday(start_mouth,today);
					//System.out.println(late);
					double old_salary = ((double) users.get(i).get("oldsalary"));
					Integer old_present = ((Integer) users.get(i).get("oldpresent"));
					
					Integer new_salary = ((Integer) users.get(i).get("salary"));
					
					
					//int salary2 = ((new_salary/workday)*((present+holiday)-old_present));
					
					//int sum_salary = salary2 + old_salary;
					
					int[] p = {22,22,22,0,21,21,20,22};
					
					double testsalary = ((new_salary/(double)workday)*( p[i]-old_present));
					double sumtest_salary = testsalary + old_salary;
					
					
					
					users.get(i).put("sumsalary", sumtest_salary);
					users.get(i).put("present", present);
					users.get(i).put("late", late);
					users.get(i).put("leaves", leaves);
					users.get(i).put("absent", Absent);
					
			
		}
		
			request.setAttribute("users", users);
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}*/
}