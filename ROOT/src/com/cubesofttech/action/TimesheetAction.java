package com.cubesofttech.action;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.ExpTravelTypeDAO;
import com.cubesofttech.dao.ExpenseDAO;
import com.cubesofttech.dao.ExpenseGroupDAO;
import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.ProjectDAO;
import com.cubesofttech.dao.ProjectFunctionDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.Project;
import com.cubesofttech.model.ProjectFunction;
import com.cubesofttech.model.Timesheet;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ibm.icu.util.GregorianCalendar;
import com.opensymphony.xwork2.ActionSupport;

public class TimesheetAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(TimesheetAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	public TimesheetDAO timesheetDAO;
	@Autowired
	private ExpenseDAO expenseDAO;
	@Autowired
	private ExpTravelTypeDAO expTravelTypeDAO;
	@Autowired
	private HolidayDAO holidayDAO;
	@Autowired
	private ExpenseGroupDAO expensegroupDAO;
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private ProjectFunctionDAO projectFunctionDAO;
	@Autowired
	private WorkHoursDAO workHoursDAO;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String TIMESHEET = "timesheet";

	public static final String USERSEQ = "userseq";
	public static final String USERID = "userId";
	public static final String ONLINEUSER = "onlineUser";
	public static final String STARTTIME = "0000-01-01 01:01:01";
	public static final String ENDTIME = "9999-12-31 23:59:59";
	public static final String EXPSEARCHLIST = "expSearchList";
	public static final String EXPENSETABLELIST = "expensetableList";
	public static final String EXPENSELIST = "expenseList";
	public static final String EXPENSEGROUPLIST = "expensegroupList";
	public static final String USERLIST = "userList";
	public static final String EXPTRAVELTYPELIST = "expTravelTypeList";

	List<ProjectFunction> functionList;

	private Integer id;
	private String description;
	private String status;
	private String user_create;
	private String user_update;
	private Integer project_id;
	private Integer function_id;
	private String timesheetStatusId;
	private String team;

	public String timeList() {
		try {

			String listId = request.getParameter("id");
			System.out.println(listId);

			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(projectDAO.allfunction(listId));

			request.setAttribute("json", responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getTimeFromDate() {
		try {
			String user = request.getParameter("user");
			String date = request.getParameter("date");
			Gson gson = new GsonBuilder().setDateFormat("dd MMM yyyy HH:mm").create();

			List<Map<String, Object>> timeCheckin = workHoursDAO.getTimeByDate(date, user, "1");

			List<Map<String, Object>> timeCheckout = workHoursDAO.getTimeByDate(date, user, "2");
			Timestamp temp = null;
			if (timeCheckout.size() < 1) {
				String timeOutStr = "";
				for (Map<String, Object> map : timeCheckin) {
					timeOutStr = map.get("work_hours_time_work").toString();
					temp = Timestamp.valueOf(timeOutStr);
					int hr9 = 9 * 3600 * 1000;
					temp.setTime(temp.getTime() + hr9);
				}
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("work_hours_time_work", temp);
				timeCheckout.add(tempMap);
			}

			List<Map<String, Object>> timeDateListAll = Stream.concat(timeCheckin.stream(), timeCheckout.stream())
					.collect(Collectors.toList());

			String responseJSON = gson.toJson(timeDateListAll);
			request.setAttribute("json", responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String list() {

		try {
			String listId = request.getParameter("id");
			System.out.println(listId);

			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(projectDAO.allfunction(listId));

			request.setAttribute("json", responseJSON);

//			List<Map<String, Object>> functiona = projectDAO.allfunction(listId);
//			request.setAttribute("functionA", functiona);
			List<Map<String, Object>> projecta = projectDAO.allproject();
			request.setAttribute("projectA", projecta);
			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String user = ur.getId();
			request.setAttribute("logonUser", user);
			String nametest = request.getParameter("nametest");
			request.setAttribute("nametest", nametest);
			String mounthtest = request.getParameter("mounthtest");
			request.setAttribute("mounthtest", mounthtest);

			int monthInt;
			int yearInt;
			GregorianCalendar date = new GregorianCalendar();
			monthInt = date.get(Calendar.MONTH);
			yearInt = date.get(Calendar.YEAR);
			monthInt = monthInt + 1;
			String month = Integer.toString(monthInt);
			if (month.length() == 1) {
				month = "0" + month;
			}
			String year = Integer.toString(yearInt);
			// set search
			request.setAttribute("name", user);
			request.setAttribute("monthSearch", month);
			request.setAttribute("yearSearch", year);
			request.setAttribute("flag", "1");
			// End set search

			// set day month year
			int iYear = Integer.parseInt(year);
			int iMonth = Integer.parseInt(month);
			// Create a calendar object and set year and month
			GregorianCalendar mycal = new GregorianCalendar(iYear, iMonth - 1, 1);
			// Get the number of days in that month
			int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH); // 28
			String dateStartSearch = year + '/' + month + '/' + "01";
			// String dateEndSearch = year + '/' + month + '/' + (daysInMonth + 2);
			String dateEndSearch = year + '/' + month + '/' + (daysInMonth);
			List<Map<String, Object>> setTimeInTimeOut = timesheetDAO.findTimeInTimeOutBytimeMonthYear(user,
					dateStartSearch, dateEndSearch);
			List<Map<String, Object>> setDescription = timesheetDAO.findDescription(user, dateStartSearch,
					dateEndSearch);

			String[] arrayDay = new String[daysInMonth];
			String[] arrayTimeIn = new String[daysInMonth];
			String[] arrayTimeOut = new String[daysInMonth];
			String[] arrayDescription = new String[daysInMonth];
			String[] arrayProject = new String[daysInMonth];
			String[] arrayFunction = new String[daysInMonth];
			String[] arrayStatus = new String[daysInMonth];
			String[] arrayId = new String[daysInMonth];
			String[] arrayDayHidden = new String[daysInMonth];
			Date[] fullDateKub = new Date[daysInMonth];

			for (int dayNum = 0; dayNum < daysInMonth; dayNum++) {
				dayNum = dayNum++;
				int num = dayNum + 1;
				String numStr = Integer.toString(num);
				arrayDay[dayNum] = numStr;
				if (numStr.length() == 1) {
					numStr = "0" + numStr;
				}
				String newMonth = new DateFormatSymbols().getShortMonths()[iMonth - 1];
				String fullDate = numStr + "-" + newMonth + "-" + iYear;

				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				Date dates = formatter.parse(fullDate);

				fullDateKub[dayNum] = dates;

				arrayDayHidden[dayNum] = numStr;

				for (Map<String, Object> obj : setTimeInTimeOut) {
					Object dateObj = obj.get("date");
					String timeInObj = obj.get("workin").toString().substring(11, 16);
					String timeOutObj = obj.get("workout").toString().substring(11, 16);
					String dateobjStr = dateObj.toString().substring(8, 10);
					if (numStr.equals(dateobjStr)) {
						arrayTimeIn[dayNum] = timeInObj;
						arrayTimeOut[dayNum] = timeOutObj;
					}

				}
				for (Map<String, Object> objDescription : setDescription) {
					String idTimesheet = objDescription.get("id").toString();
					String descriptionStr = objDescription.get("description").toString();

					Object projectStrObj = objDescription.get("project_id");
					String projectStr = null;
					if (projectStrObj != null) {
						projectStr = projectStrObj.toString();
					}

					Object functionStrObj = objDescription.get("function_id");
					String functionStr = null;
					if (functionStrObj != null) {
						functionStr = functionStrObj.toString();
					}

					String statusStr = objDescription.get("status").toString();
					String dateInStr = objDescription.get("time_check_in").toString();
					String timeInStr = objDescription.get("time_check_in").toString().substring(11, 16);
					String timeOutStr = objDescription.get("time_check_out").toString().substring(11, 16);
					String dateStr = dateInStr.substring(8, 10);
					if (numStr.length() == 1) {
						numStr = "0" + numStr;
					}
					if (numStr.equals(dateStr)) {
						arrayDescription[dayNum] = descriptionStr;
						arrayProject[dayNum] = projectStr;
						arrayFunction[dayNum] = functionStr;
						arrayStatus[dayNum] = statusStr;
						if (!arrayDescription[dayNum].isEmpty()) {
							arrayTimeIn[dayNum] = timeInStr;
							arrayTimeOut[dayNum] = timeOutStr;
							arrayId[dayNum] = idTimesheet;
						}
					}

				}

			}
			List<Map<String, Object>> setHoli = timesheetDAO.findHoliday();
			request.setAttribute("setHoli", setHoli);

			request.setAttribute("arrayDayHidden", arrayDayHidden);
			request.setAttribute("monthList", iMonth);
			request.setAttribute("yearList", iYear);
			request.setAttribute("arrayDay", arrayDay);
			request.setAttribute("arrayTimeIn", arrayTimeIn);
			request.setAttribute("arrayTimeOut", arrayTimeOut);
			request.setAttribute("arrayDescription", arrayDescription);
			request.setAttribute("arrayProject", arrayProject);
			request.setAttribute("arrayFunction", arrayFunction);
			request.setAttribute("arrayStatus", arrayStatus);
			request.setAttribute("arrayId", arrayId);
			String newMonth = new DateFormatSymbols().getShortMonths()[iMonth - 1];
			String newMouthnum = Integer.toString(iMonth);
			request.setAttribute("newMonth", newMonth);
			request.setAttribute("newMouthnum", newMouthnum);
			request.setAttribute("daysInMonth", daysInMonth);
			request.setAttribute("fullDateKub", fullDateKub);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
	}

	public String listforadd() throws Exception {
		try {
			List<Map<String, Object>> userseq = userDAO.sequense();
			String useradd = request.getParameter("useradd");
			request.setAttribute(USERSEQ, userseq);
			request.setAttribute("useradd", useradd);

			String flag = request.getParameter("flag");
			if (flag != null) {
				String date = request.getParameter("date");
				request.setAttribute("date", date);
				request.setAttribute("flag", flag);
			}
			String userId = request.getParameter(USERID);
			String from = STARTTIME;
			String to = ENDTIME;
			request.setAttribute(USERID, userId);
			// List<Map<String, Object>> expensetableList = expenseDAO.findExpense();
			// request.setAttribute(EXPENSETABLELIST, expensetableList);
			// request.setAttribute(EXPENSELIST, expenseDAO.findAll());
			// request.setAttribute(EXPENSEGROUPLIST, expensegroupDAO.findAll());
			// request.setAttribute(USERLIST, userDAO.findAll());
			// request.setAttribute(EXPTRAVELTYPELIST, expTravelTypeDAO.findAll());
			// request.setAttribute("expensegroup_type", expensegroupDAO.findtype());
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String calendar() throws Exception {
		try {
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String userIdTest = ur.getId();
			String userLogin = ur.getId();
			List<Map<String, Object>> userseq = userDAO.sequense();
			request.setAttribute(USERSEQ, userseq);

			String userId = request.getParameter(USERID);
			request.setAttribute("userSelect", userId);
			String from = STARTTIME;
			String to = ENDTIME;
			List<Map<String, Object>> timesheetSearchList = timesheetDAO.timesheetSearch_forCalendar(userId, from, to);
			// List<Map<String, Object>> expSearchList =
			// expenseDAO.expSearch_forCalendar(userId, from, to);

			request.setAttribute(EXPTRAVELTYPELIST, expTravelTypeDAO.findAll());// ??????????????
			request.setAttribute("holidayList", holidayDAO.findAll());

			// List<ExpenseGroup> expensegroup = new ArrayList<>();
			// BigInteger expenseGroupId;
			/*
			 * for (int i = 0; i < expSearchList.size(); i++) { expenseGroupId =
			 * (BigInteger) expSearchList.get(i).get("expense_group_id"); ExpenseGroup ex =
			 * expensegroupDAO.findByGroupId(expenseGroupId.intValue()); // null
			 * expensegroup.add(ex); }
			 */

			request.setAttribute(EXPSEARCHLIST, timesheetSearchList);
			// request.setAttribute("expgroupList", expensegroup);
			request.setAttribute("flag_search", "");
			request.setAttribute(USERID, userId);
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String timesheetDel() throws Exception {
		try {
			String Id = request.getParameter("id");
			Integer idValue = Integer.valueOf(Id);
			Timesheet timesheet = timesheetDAO.findById(idValue);
			request.setAttribute(USERID, timesheet.getUserCreate());
			timesheetDAO.delete(timesheet);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}

	public String addTimesheetPage() {
		try {
			List<Map<String, Object>> projecta = projectDAO.allproject();
			request.setAttribute("projectA", projecta);

			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			user_create = ur.getName();
			request.setAttribute("user_create", user_create);

			List<Map<String, Object>> cubeUser = userDAO.sequense();
			request.setAttribute("cubeUser", cubeUser);

			// prepopulate function and project by last timesheet's
			Timesheet lastTimesheet = (Timesheet) timesheetDAO.latestTimesheet(ur.getId());

			if (lastTimesheet != null) {
				request.setAttribute("lastTimesheet", lastTimesheet);
				if (lastTimesheet.getProject_id() != null) {
					int lastTimesheetProj = lastTimesheet.getProject_id();
					Project project = new Project();
					project = projectDAO.findById(lastTimesheetProj);
					request.setAttribute("projectf", project);
				
					// get last time project and function
					functionList = projectFunctionDAO.findByProject(lastTimesheetProj);
				}
			}

			// getting the inserted timesheet date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			String datenow = sdf.format(timestamp).toString();
			Timestamp nowdate = Timestamp.valueOf(datenow);
			String dateExist = (nowdate.getYear() + 1900) + ":" + (nowdate.getMonth() + 1) + ":" + nowdate.getDate();
			boolean sheetExist = timesheetDAO.checkExistUserDate(ur.getId(), dateExist);
			request.setAttribute("exist", sheetExist);

			// get today's checkin time
			List<Map<String, Object>> list = workHoursDAO.getTodayCheckInById(ur.getId());
			String checkinTimeStr = "";
			String checkoutTimeStr = "";
			// String timesheetDate = "";
			Timestamp checkinTime = null;

			for (Map<String, Object> map : list) {
				checkinTimeStr = map.get("work_hours_time_work").toString();
			}

			if (checkinTimeStr.length() > 3) {
				checkinTime = Timestamp.valueOf(checkinTimeStr);
				checkinTimeStr = checkinTime.getHours() + ":" + checkinTime.getMinutes();
				checkoutTimeStr = (checkinTime.getHours() + 8) + ":" + checkinTime.getMinutes();
				// timesheetDate = (checkinTime.getYear() + 1900) + ":" + checkinTime.getMonth()
				// + ":"
				// + checkinTime.getDate();
				request.setAttribute("timesheetDate", checkinTime);
			} else {
				request.setAttribute("timesheetDate", nowdate);
			}

			request.setAttribute("timeStart", checkinTimeStr);
			request.setAttribute("timeEnd", checkoutTimeStr);

			/*
			 * if (lastTimesheet != null) { Integer function_id =
			 * lastTimesheet.getFunction_id(); ProjectFunction projectFunction = new
			 * ProjectFunction(); projectFunction =
			 * projectFunctionDAO.findById(function_id); request.setAttribute("functionf",
			 * projectFunction); request.setAttribute("functionList", functionList); }
			 */

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String addTimesheet() throws Exception {
		try {

			// Date dateTimeNow = new Date();
			List<Map<String, Object>> projecta = projectDAO.allproject();
			request.setAttribute("projectA", projecta);
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			String timestart = request.getParameter("timestart");
			String endtime = request.getParameter("endtime");
			String team = request.getParameter("team");

			String OT_description = request.getParameter("descriptionot");
			String timestartot = request.getParameter("timestartot");
			String endtimeot = request.getParameter("endtimeot");

			
			String project = request.getParameter("projectf");
			//int function = Integer.valueOf(request.getParameter("functionf"));
			Integer l = timesheetDAO.getMaxId() + 1;
			Timesheet timesheet = new Timesheet();
			timesheet.setId(l);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			String datenow = sdf.format(timestamp).toString();
			Timestamp nowdate = Timestamp.valueOf(datenow);

			timesheet.setTimeCreate(nowdate);
			timesheet.setTimeUpdate(nowdate);
			timesheet.setDescription(description);
			if(!projectDAO.checkExistByName(project)) {
				int projectIdAdd = 0;
				Project projectAdd = new Project();
				projectAdd.setProject_name(project);
				projectAdd.setDescription("");
				projectAdd.setUser_create(name);
				projectAdd.setTime_create(DateUtil.getCurrentTime());
				projectDAO.save(projectAdd);
				
				projectIdAdd = projectDAO.findByName(projectAdd.getProject_name()).getProject_id();
				timesheet.setProject_id(projectIdAdd);
			} else {
				Project projectOld = projectDAO.findByName(project);
				timesheet.setProject_id(projectOld.getProject_id());
			}
			
			//timesheet.setFunction_id(function);
			timesheet.setStatus("W");
			Timestamp timestart1 = Timestamp.valueOf(timestart);

			Timestamp endtime1 = Timestamp.valueOf(endtime);

			Timestamp OT_time_start1 = Timestamp.valueOf(timestartot);

			Timestamp OT_time_end1 = Timestamp.valueOf(endtimeot);
			
			int start = OT_time_start1.getHours();
			int end = OT_time_end1.getHours();

			String timestart1s = String.valueOf(timestart1);
			
			if (start < 9 && end < 9){
				
				int dote = OT_time_start1.getDate();
				dote = dote + 1;
				
				String com =  timestart1s.substring(5,7);
				String coy =  timestart1s.substring(0,4);
				
				String startt = String.valueOf(OT_time_start1);		
				String timestartots =  startt.substring(11,19);
				
				String dotes = String.valueOf(dote);
				
				
				int dots = OT_time_end1.getDate();
				dots = dots + 1;
				
				String cim =  timestart1s.substring(5,7);
				String ciy =  timestart1s.substring(0,4);
				
				String endt = String.valueOf(OT_time_end1);		
				String endtimeots =  endt.substring(11,19);
				
				String dotss = String.valueOf(dots);
			
				String fulldatestart = coy+"-"+com+"-"+dotes+" "+timestartots;
				String fulldateend = ciy+"-"+cim+"-"+dotss+" "+endtimeots;
				
				Timestamp OT_time_start = Timestamp.valueOf(fulldatestart);
				Timestamp OT_time_end = Timestamp.valueOf(fulldateend);
	
				System.out.println("check eek wan");
				System.out.println(OT_time_start);
				System.out.println(OT_time_end);
				System.out.println("------------------------------");
				if (OT_description != "") {
					timesheet.setOT_time_start(OT_time_start);
					timesheet.setOT_time_end(OT_time_end);
					timesheet.setOT_description(OT_description);
				} else {

				}
			}
			else if(start > end) {
				int dots = OT_time_end1.getDate();
				dots = dots + 1;
				
				String cim =  timestart1s.substring(5,7);
				String ciy =  timestart1s.substring(0,4);
				
				String endt = String.valueOf(OT_time_end1);			
				String endtimeots =  endt.substring(11,19);
				String dotss = String.valueOf(dots);

				String fulldateend = ciy+"-"+cim+"-"+dotss+" "+endtimeots;
				
				Timestamp OT_time_start = Timestamp.valueOf(timestartot);
				Timestamp OT_time_end = Timestamp.valueOf(fulldateend);
	
				System.out.println("check kam wan");
				System.out.println(OT_time_start);
				System.out.println(OT_time_end);
				System.out.println("------------------------------");
				if (OT_description != "") {
					timesheet.setOT_time_start(OT_time_start);
					timesheet.setOT_time_end(OT_time_end);
					timesheet.setOT_description(OT_description);
				} else {

				}
				
			}else if(start < end) {
				Timestamp OT_time_start = Timestamp.valueOf(timestartot);
				Timestamp OT_time_end = Timestamp.valueOf(endtimeot);
				System.out.println("check wan deaw kan");
				System.out.println(OT_time_start);
				System.out.println(OT_time_end);
				System.out.println("------------------------------");
				if (OT_description != "") {
					timesheet.setOT_time_start(OT_time_start);
					timesheet.setOT_time_end(OT_time_end);
					timesheet.setOT_description(OT_description);
				} else {

				}
			}
		
			

			timesheet.setTimeCheckIn(timestart1);
			timesheet.setTimeCheckOut(endtime1);
			timesheet.setTeam(team);
			timesheet.setUserCreate(name);
			

			timesheetDAO.save(timesheet); 
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String editPage() {
		if (id != null) {
			try {
				List<Map<String, Object>> projecta = projectDAO.allproject();
				request.setAttribute("projectA", projecta);

				User ur = (User) request.getSession().getAttribute(ONLINEUSER);
				user_create = ur.getName();
				request.setAttribute("user_create", user_create);

				List<Map<String, Object>> cubeUser = userDAO.sequense();
				request.setAttribute("cubeUser", cubeUser);

				Timesheet timesheet = new Timesheet();
				timesheet = timesheetDAO.findById(id);
				request.setAttribute("timesheet", timesheet);

				String timeStart = timesheet.getTimeCheckIn().getHours() + ":"
						+ timesheet.getTimeCheckIn().getMinutes();
				request.setAttribute("timeStart", timeStart);
				String timeEnd = timesheet.getTimeCheckOut().getHours() + ":" + timesheet.getTimeCheckIn().getMinutes();
				request.setAttribute("timeEnd", timeEnd);

				if (timesheet.getOT_time_start() != null && timesheet.getOT_time_end() != null) {
					String timeStartot = timesheet.getOT_time_start().getHours() + ":"
							+ timesheet.getOT_time_start().getMinutes();
					request.setAttribute("timeStartot", timeStartot);
					String timeEndot = timesheet.getOT_time_end().getHours() + ":"
							+ timesheet.getOT_time_end().getMinutes();
					request.setAttribute("timeEndot", timeEndot);
				}

				// prepopulate the timesheet's date
				request.setAttribute("timesheetDate", timesheet.getTimeCheckIn());

				// get checkin date from timsheet
				String dateExist = (timesheet.getTimeCheckIn().getYear() + 1900) + ":"
						+ (timesheet.getTimeCheckIn().getMonth() + 1) + ":" + timesheet.getTimeCheckIn().getDate();
				// check if the checkin date was created
				boolean sheetExist = timesheetDAO.checkExistUserDate(ur.getId(), dateExist);

				Integer project_id = timesheet.getProject_id();
				if (project_id != null) {
					Project project = new Project();
					project = projectDAO.findById(project_id);
					request.setAttribute("projectf", project);
					functionList = projectFunctionDAO.findByProject(project_id);

					Integer function_id = timesheet.getFunction_id();
					ProjectFunction projectFunction = new ProjectFunction();
					//projectFunction = projectFunctionDAO.findById(function_id);
					//request.setAttribute("functionf", projectFunction);
					request.setAttribute("functionList", functionList);
					request.setAttribute("team", team);
				}

			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		} else {
			System.out.println("Error, cannot find timesheet id");
			return ERROR;
		}

	}

	public String updateTimesheet() throws Exception {// ????????????
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			String datenow = sdf.format(timestamp).toString();
			Timestamp nowdate = Timestamp.valueOf(datenow);

			String project = request.getParameter("projectf");
			int function = Integer.valueOf(request.getParameter("functionf"));
			String userupdate = request.getParameter("useradd");
			String newtimestart = request.getParameter("timestart");
			String newtimeend = request.getParameter("endtime");
			String description = request.getParameter("description");
			String team = request.getParameter("team");

			String OT_time_start2 = request.getParameter("timestartot");
			String OT_time_end2 = request.getParameter("endtimeot");
			String OT_description = request.getParameter("descriptionot");

			String id = request.getParameter("id");
			Integer idValue = Integer.valueOf(id);
			Timesheet timesheet = timesheetDAO.findById(idValue);

			newtimestart = newtimestart.replaceAll("/", "-");

			System.out.println("Time: " + newtimestart);
			Timestamp timestart = Timestamp.valueOf(newtimestart);
			Timestamp endtime = Timestamp.valueOf(newtimeend);

			Timestamp OT_time_start1 = Timestamp.valueOf(OT_time_start2);
			Timestamp OT_time_end1 = Timestamp.valueOf(OT_time_end2);

			int start = OT_time_start1.getHours();
			int end = OT_time_end1.getHours();
			
			String timestart1s = String.valueOf(newtimestart);
			
			if (start < 9 && end < 9){
				
				int dote = OT_time_start1.getDate();
				dote = dote + 1;
				
				String com =  timestart1s.substring(5,7);
				String coy =  timestart1s.substring(0,4);
				
				String startt = String.valueOf(OT_time_start1);		
				String timestartots =  startt.substring(11,19);
				
				String dotes = String.valueOf(dote);
				
				
				int dots = OT_time_end1.getDate();
				dots = dots + 1;
				
				String cim =  timestart1s.substring(5,7);
				String ciy =  timestart1s.substring(0,4);
				
				String endt = String.valueOf(OT_time_end1);		
				String endtimeots =  endt.substring(11,19);
				
				String dotss = String.valueOf(dots);
			
				String fulldatestart = coy+"-"+com+"-"+dotes+" "+timestartots;
				String fulldateend = ciy+"-"+cim+"-"+dotss+" "+endtimeots;
				
				Timestamp OT_time_start = Timestamp.valueOf(fulldatestart);
				Timestamp OT_time_end = Timestamp.valueOf(fulldateend);
	
				System.out.println("check eek wan");
				System.out.println(OT_time_start);
				System.out.println(OT_time_end);
				System.out.println("------------------------------");
				if (OT_description != "") {
					timesheet.setOT_time_start(OT_time_start);
					timesheet.setOT_time_end(OT_time_end);
					timesheet.setOT_description(OT_description);
				} else {

				}
			}
			else if(start > end) {
				int dots = OT_time_end1.getDate();
				dots = dots + 1;
				
				String cim =  timestart1s.substring(5,7);
				String ciy =  timestart1s.substring(0,4);
				
				String endt = String.valueOf(OT_time_end1);			
				String endtimeots =  endt.substring(11,19);
				String dotss = String.valueOf(dots);

				String fulldateend = ciy+"-"+cim+"-"+dotss+" "+endtimeots;
				
				Timestamp OT_time_start = Timestamp.valueOf(OT_time_start2);
				Timestamp OT_time_end = Timestamp.valueOf(fulldateend);
	
				System.out.println("check kam wan");
				System.out.println(OT_time_start);
				System.out.println(OT_time_end);
				System.out.println("------------------------------");
				if (OT_description != "") {
					timesheet.setOT_time_start(OT_time_start);
					timesheet.setOT_time_end(OT_time_end);
					timesheet.setOT_description(OT_description);
				} else {

				}
				
			}
			else if(start < end) {
				Timestamp OT_time_start = Timestamp.valueOf(OT_time_start2);
				Timestamp OT_time_end = Timestamp.valueOf(OT_time_end2);
				System.out.println("check wan deaw kan");
				System.out.println(OT_time_start);
				System.out.println(OT_time_end);
				System.out.println("------------------------------");
				if (OT_description != "") {
					timesheet.setOT_time_start(OT_time_start);
					timesheet.setOT_time_end(OT_time_end);
					timesheet.setOT_description(OT_description);
				} else {

				}
			}
			
			timesheet.setTimeCheckIn(timestart);
			timesheet.setTimeCheckOut(endtime);
			timesheet.setUserUpdate(userupdate);
			timesheet.setTimeUpdate(nowdate);
			timesheet.setDescription(description);
			if(!projectDAO.checkExistByName(project)) {
				int projectIdAdd = 0;
				Project projectAdd = new Project();
				projectAdd.setProject_name(project);
				projectAdd.setDescription("");
				projectAdd.setUser_create(userupdate);
				projectAdd.setTime_create(DateUtil.getCurrentTime());
				projectDAO.save(projectAdd);
				
				projectIdAdd = projectDAO.findByName(projectAdd.getProject_name()).getProject_id();
				timesheet.setProject_id(projectIdAdd);
			} else {
				Project projectOld = projectDAO.findByName(project);
				timesheet.setProject_id(projectOld.getProject_id());
			}
			//timesheet.setProject_id(project);
			//timesheet.setFunction_id(function);
			timesheet.setTeam(team);
			timesheetDAO.update(timesheet);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String saveTimesheet() throws Exception {
		try {
			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String nameuser = ur.getId();
			Timesheet timesheet = new Timesheet();
			String discription = request.getParameter("discription");
			int project = Integer.valueOf(request.getParameter("projectf"));
			int function = Integer.valueOf(request.getParameter("functionf"));
			String status = request.getParameter("status");
			String timeIn = request.getParameter("time_in");
			String timeOut = request.getParameter("time_out");
			String dateInOut = request.getParameter("dateInOut");
			String monthInOut = request.getParameter("monthInOut");
			String yearInOut = request.getParameter("yearInOut");
			String dateInOutStr = dateInOut + "-" + monthInOut + "-" + yearInOut;

			String dateNow = request.getParameter("date_now");
			String timeNow = request.getParameter("time_now");
			String idStr = request.getParameter("id");

			Timestamp dateTimeNowList = DateUtil.dateToTimestamp(dateNow, timeNow);
			Timestamp dateTimeIn = DateUtil.dateToTimestamp(dateInOutStr, timeIn);
			Timestamp dateTimeOut = DateUtil.dateToTimestamp(dateInOutStr, timeOut);
			String dateInOutStrSearch = dateTimeIn.toString().substring(0, 10);

			Integer l = timesheetDAO.getMaxId() + 1;
			timesheet.setId(l);

			timesheet.setDescription(discription);
			timesheet.setProject_id(project);
			timesheet.setFunction_id(function);
			timesheet.setStatus("W");
			timesheet.setTimeCheckIn(dateTimeIn);
			timesheet.setTimeCheckOut(dateTimeOut);
			timesheet.setTimeCreate(dateTimeNowList);
			timesheet.setTimeUpdate(dateTimeNowList);
			timesheet.setUserCreate(nameuser);
			timesheet.setUserUpdate(nameuser);

			List<Map<String, Object>> timesheetDateList = timesheetDAO.searchTimesheet(nameuser, dateInOutStrSearch);
			if (timesheetDateList.isEmpty()) {
				timesheetDAO.save(timesheet);
			}
			List<Map<String, Object>> timesheetDate = timesheetDAO.searchTimesheet(nameuser, dateInOutStrSearch);
			String idListStr = timesheetDate.get(0).get("id").toString();
			if (!timesheetDateList.isEmpty()) {
				int idInt = Integer.parseInt(idListStr);
				timesheet.setId(idInt);
				timesheetDAO.update(timesheet);
			}

			return SUCCESS;

		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			return ERROR;
		}
	}

	public String searchTable() {
		try {
			Date dateTimeNow = new Date();
			String userid = request.getParameter("tempuser");
			String month = request.getParameter("monthSearch");
			String year = request.getParameter("yearSearch");
			int iYear = Integer.parseInt(year);
			int iMonth = Integer.parseInt(month);
			GregorianCalendar mycal = new GregorianCalendar(iYear, iMonth - 1, 1);
			int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH); // 28
			String dateStartSearch = year + '/' + month + '/' + "01";
			String dateEndSearch = year + '/' + month + '/' + daysInMonth;

			request.setAttribute("dateTimeNow", dateTimeNow);
			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);

			List<Map<String, Object>> listtimes = timesheetDAO.listtimesheet2(userid, dateStartSearch, dateEndSearch);
			request.setAttribute("listtime", listtimes);
			System.out.print(userid);
			System.out.print(month);
			System.out.print(year);
			request.setAttribute("logonUser", userid);
			request.setAttribute("monthSearch", month);
			request.setAttribute("yearSearch", year);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);

			return ERROR;
		}

	}

	public String searchTable2() {
		try {
			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);
			String user = request.getParameter("name");
			String month = request.getParameter("monthSearch");
			String year = request.getParameter("yearSearch");
			// set search
			request.setAttribute("name", user);
			request.setAttribute("monthSearch", month);
			request.setAttribute("yearSearch", year);
			request.setAttribute("flag", "1");
			// End set search

			// set day month year
			int iYear = Integer.parseInt(year);
			int iMonth = Integer.parseInt(month);
			// Create a calendar object and set year and month
			GregorianCalendar mycal = new GregorianCalendar(iYear, iMonth - 1, 1);
			// Get the number of days in that month
			int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH); // 28
			String dateStartSearch = year + '/' + month + '/' + "01";
			String dateEndSearch = year + '/' + month + '/' + daysInMonth;
			List<Map<String, Object>> setTimeInTimeOut = timesheetDAO.findTimeInTimeOutBytimeMonthYear(user,
					dateStartSearch, dateEndSearch);
			List<Map<String, Object>> setDescription = timesheetDAO.findDescription(user, dateStartSearch,
					dateEndSearch);

			String[] arrayDay = new String[daysInMonth];
			String[] arrayTimeIn = new String[daysInMonth];
			String[] arrayTimeOut = new String[daysInMonth];
			String[] arrayDescription = new String[daysInMonth];
			String[] arrayProject = new String[daysInMonth];
			String[] arrayFunction = new String[daysInMonth];
			String[] arrayStatus = new String[daysInMonth];
			String[] arrayId = new String[daysInMonth];
			String[] arrayDayHidden = new String[daysInMonth];
			Date[] fullDateKub = new Date[daysInMonth];
			for (int dayNum = 0; dayNum < daysInMonth; dayNum++) {
				dayNum = dayNum++;
				int num = dayNum + 1;
				String numStr = Integer.toString(num);
				arrayDay[dayNum] = numStr;
				if (numStr.length() == 1) {
					numStr = "0" + numStr;
				}
				String newMonth = new DateFormatSymbols().getShortMonths()[iMonth - 1];
				String fullDate = numStr + "-" + newMonth + "-" + iYear;

				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				Date dates = formatter.parse(fullDate);

				fullDateKub[dayNum] = dates;
				arrayDayHidden[dayNum] = numStr;
				for (Map<String, Object> obj : setTimeInTimeOut) {
					Object dateObj = obj.get("date");
					String timeInObj = obj.get("workin").toString().substring(11, 16);
					String timeOutObj = obj.get("workout").toString().substring(11, 16);
					String dateobjStr = dateObj.toString().substring(8, 10);

					if (numStr.equals(dateobjStr)) {
						arrayTimeIn[dayNum] = timeInObj;
						arrayTimeOut[dayNum] = timeOutObj;

					}

				}
				for (Map<String, Object> objDescription : setDescription) {
					String idTimesheet = objDescription.get("id").toString();
					String descriptionStr = objDescription.get("description").toString();

					Object projectStrObj = objDescription.get("project_id");
					String projectStr = null;
					if (projectStrObj != null) {
						projectStr = projectStrObj.toString();
					}

					Object functionStrObj = objDescription.get("function_id");
					String functionStr = null;
					if (functionStrObj != null) {
						functionStr = functionStrObj.toString();
					}

					String statusStr = objDescription.get("status").toString();
					String dateInStr = objDescription.get("time_check_in").toString();
					String timeInStr = objDescription.get("time_check_in").toString().substring(11, 16);
					String timeOutStr = objDescription.get("time_check_out").toString().substring(11, 16);
					String dateStr = dateInStr.substring(8, 10);
					if (numStr.length() == 1) {
						numStr = "0" + numStr;
					}
					if (numStr.equals(dateStr)) {
						arrayDescription[dayNum] = descriptionStr;
						arrayProject[dayNum] = projectStr;
						arrayFunction[dayNum] = functionStr;
						arrayStatus[dayNum] = statusStr;
						if (!arrayDescription[dayNum].isEmpty()) {
							arrayTimeIn[dayNum] = timeInStr;
							arrayTimeOut[dayNum] = timeOutStr;
							arrayId[dayNum] = idTimesheet;

						}
					}

				}

			}

			// set jsp
			request.setAttribute("arrayDayHidden", arrayDayHidden);
			request.setAttribute("monthList", iMonth);
			request.setAttribute("yearList", iYear);
			request.setAttribute("arrayDay", arrayDay);
			request.setAttribute("arrayTimeIn", arrayTimeIn);
			request.setAttribute("arrayTimeOut", arrayTimeOut);
			request.setAttribute("arrayId", arrayId);
			request.setAttribute("holidayList", holidayDAO.findAll());
			request.setAttribute("arrayDescription", arrayDescription);
			request.setAttribute("arrayProject", arrayProject);
			request.setAttribute("arrayFunction", arrayFunction);
			request.setAttribute("arrayStatus", arrayStatus);
			String newMonth = new DateFormatSymbols().getShortMonths()[iMonth - 1];
			String newMouthnum = Integer.toString(iMonth);
			request.setAttribute("newMonth", newMonth);
			request.setAttribute("newMouthnum", newMouthnum);
			request.setAttribute("daysInMonth", daysInMonth);
			request.setAttribute("fullDateKub", fullDateKub);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);

			return ERROR;
		}

	}

	public String timesheetCalendarSearch() throws Exception {
		request.setAttribute(USERSEQ, userDAO.sequense());
		String userId = request.getParameter("name");
		request.setAttribute("userSelect", userId);
		String from = STARTTIME;
		String to = ENDTIME;
		// request.setAttribute(EXPTRAVELTYPELIST, expTravelTypeDAO.findAll());//
		// ??????????
		request.setAttribute("holidayList", holidayDAO.findAll());
		List<Map<String, Object>> timesheetSearchList = timesheetDAO.timesheetSearch_forCalendar(userId, from, to);
		request.setAttribute(USERID, userId);
		if (timesheetSearchList != null) {
			return SUCCESS;
		}
		// request.setAttribute(EXPSEARCHLIST, expSearchList);
		// request.setAttribute("expgroupList", expensegroup);
		return ERROR;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUser_create() {
		return user_create;
	}

	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}

	public String getUser_update() {
		return user_update;
	}

	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}

	public Integer getProject_id() {
		return project_id;
	}

	public void setProject_id(Integer project_id) {
		this.project_id = project_id;
	}

	public Integer getFunction_id() {
		return function_id;
	}

	public void setFunction_id(Integer function_id) {
		this.function_id = function_id;
	}
	
	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String gettimesheetStatusId() {
		return this.timesheetStatusId;
	}

	public void settimesheetStatusId(String timesheetStatusId) {
		this.timesheetStatusId = timesheetStatusId;
	}

	public String listts() {

		try {
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date Longday = DateUtil.periodMinus(date, 8);
			Timestamp tstampbefore = new Timestamp(Longday.getTime());

			Date date1;
			date1 = tstamp;
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);

			String month = datenow.substring(3, 5);
			String year = datenow.substring(6, 10);
			
			String userid = request.getParameter("userseq");
			List<Map<String, Object>> listtimes = timesheetDAO.listtimesheet(userid, tstamp, tstampbefore, month, year);
			request.setAttribute("listtime", listtimes);

			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
	}

	public String addapproved() {

		try {
			User onlineUser = (User) request.getSession().getAttribute("onlineUser");
			String id_s = request.getParameter("id");
			int id = Integer.parseInt(id_s);

			String user = request.getParameter("user");
			String status = ("A");
			System.out.print(id);
			Timesheet timesheet = timesheetDAO.findById(id);
			timesheet.setStatus(status);
			timesheetDAO.update(timesheet);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
	}

	public String listot() {

		try {
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date Longday = DateUtil.periodMinus(date, 8);
			Timestamp tstampbefore = new Timestamp(Longday.getTime());

			Date date1;
			date1 = tstamp;
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);

			String month = datenow.substring(3, 5);
			String year = datenow.substring(6, 10);
			
			String userid = request.getParameter("userseq");
			List<Map<String, Object>> listtimes = timesheetDAO.listot(userid, tstamp, tstampbefore, month, year);
			request.setAttribute("listot", listtimes);

			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
	}

	public String searchTableot() {
		try {
			Date dateTimeNow = new Date();
			String userid = request.getParameter("tempuser");
			String month = request.getParameter("monthSearch");
			String year = request.getParameter("yearSearch");
			int iYear = Integer.parseInt(year);
			int iMonth = Integer.parseInt(month);
			GregorianCalendar mycal = new GregorianCalendar(iYear, iMonth - 1, 1);
			int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH); // 28
			String dateStartSearch = year + '/' + month + '/' + "01";
			String dateEndSearch = year + '/' + month + '/' + daysInMonth;

			request.setAttribute("dateTimeNow", dateTimeNow);
			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);

			List<Map<String, Object>> listtimes = timesheetDAO.listot2(userid, dateStartSearch, dateEndSearch);
			request.setAttribute("listot", listtimes);
			System.out.print(userid);
			System.out.print(month);
			System.out.print(year);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);

			return ERROR;
		}

	}
	public static final String idtimesheet = "id";
	public String addapprovedall() {

		try {
			String name = request.getParameter("name");
			String month = request.getParameter("month");
			String year = request.getParameter("year");

			System.out.println(name);
			System.out.println(month);
			System.out.println(year);	
			List<Map<String, Object>> approvealllist = timesheetDAO.approveall(name, year, month);
			request.setAttribute("aa", approvealllist);
		
			for (int i = 0; i < approvealllist.size(); i++) {
				BigInteger id2 = (BigInteger) approvealllist.get(i).get(idtimesheet);
				String status = ("A");
				Integer id = id2.intValue();
				Timesheet timesheet = timesheetDAO.findById(id);
				timesheet.setStatus(status);
				timesheetDAO.update(timesheet);
			}
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
	}

}