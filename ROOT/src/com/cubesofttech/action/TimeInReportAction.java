package com.cubesofttech.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.TimeInDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.model.Timesheet;
import com.cubesofttech.model.User;
import com.ibm.icu.util.GregorianCalendar;
import com.opensymphony.xwork2.ActionSupport;

public class TimeInReportAction extends ActionSupport {

	private static final long serialVersionUID = 2280661337420278284L;

	private static final Integer Interger = null;

	private InputStream excelStream; // variable output stream
	private String excelFileName; // download file name

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private TimeInDAO TimeInDAO;

	@Autowired
	private TimesheetDAO TimesheetDAO;

	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public String getExcelFileName() {
		return excelFileName;
	}

	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}

	private String monthGlobal;
	private String yearGlobal;

	public String SearchTimeinlistReport() {
		try {
			String search_user = request.getParameter("user.roletId");
			String searchmonth = request.getParameter("searchmonth");
			log.debug("searchmonth: " + searchmonth); 
			request.setAttribute("sl_month", searchmonth);
			
			String[] splitstr = searchmonth.split("\\s+");
			String s_month = splitstr[0];
			String s_year = splitstr[1];
			log.debug("select month: "+ s_month + " select year: "+s_year);
			
			String month = null;
			String year = s_year;

			switch (s_month) {
				case "January": month = "01"; break;
				case "February": month = "02"; break;
				case "March": month = "03"; break;
				case "April": month = "04"; break;
				case "May": month = "05"; break;
				case "June": month = "06"; break;
				case "July": month = "07"; break;
				case "August": month = "08"; break;
				case "September": month = "09"; break;
				case "October": month = "10"; break;
				case "November": month = "11"; break;
				case "December": month = "12"; break;
			}
			
			System.out.println("month = "+month +" year = "+year);

			monthGlobal = month;
			yearGlobal = year;
			List<Map<String, Object>> cubeUser;
			cubeUser = userDAO.sequense();

			String positionusers = null;
			List<Map<String, Object>> positionuser = userDAO.positionuser(search_user);
			for (Map<String, Object> map : positionuser) {
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					positionusers = (String) entry.getValue();
				}
			}

			ArrayList<String> daylist = new ArrayList<String>();
			int iyear = Integer.parseInt(year);
			int imonth = Integer.parseInt(month);
			GregorianCalendar mycal = new GregorianCalendar(iyear, imonth - 1, 1);
			int dayinmonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH);

			for (int i = 1; i <= dayinmonth; i++) {

				if (i < 10) {
					daylist.add("0" + i + "/" + month + "/" + year);
				} else {
					daylist.add(i + "/" + month + "/" + year);
				}

			}

			List<Map<String, Object>> Timeinlist1 = TimeInDAO.TimeInList(month, year, search_user);
			for (int t = 0; t < Timeinlist1.size(); t++) {
				BigInteger findid = (BigInteger)Timeinlist1.get(t).get("timesheetId");
				int timesheetid = findid.intValue();
				Timestamp timecheckin = (Timestamp)Timeinlist1.get(t).get("time_check_in");
				log.debug(timecheckin);
				Timesheet timesheet = TimesheetDAO.findById(timesheetid);
				Date started_date = timesheet.getStarted_date();
				String date = String.valueOf(started_date);
				String day = date.substring(8, 10);
				
				List<Map<String, Object>> whereworkhour = TimesheetDAO.whereworkhour(year,
						month, day, search_user);
				if (!whereworkhour.isEmpty() && timecheckin == null) {
					for (int wwh = 0; wwh < whereworkhour.size(); wwh++) {
						char work_hours_type = ((char) whereworkhour.get(wwh).get("work_hours_type"));
						if (work_hours_type == '1') {
							Timestamp startDate = ((Timestamp) whereworkhour.get(wwh)
									.get("work_hours_time_work"));
							timesheet.setTimeCheckIn(startDate);
							// log.debug(startDate);
						} else if (work_hours_type == '2') {
							Timestamp endDate = ((Timestamp) whereworkhour.get(wwh)
									.get("work_hours_time_work"));
							timesheet.setTimeCheckOut(endDate);
							// log.debug(endDate);
						}

					}
				}
				TimesheetDAO.update(timesheet);
			}
			List<Map<String, Object>> Timeinlist = TimeInDAO.TimeInList(month, year, search_user);
			List<Map<String, Object>> Holidaylist = TimeInDAO.HolidayForTimeinList(month, year);
			List<Map<String, Object>> leavelist = TimeInDAO.LeaveForTimeinList(month, year, search_user);
			Map<String, Object> TimeCallist = TimeCalculate(Timeinlist, leavelist, Holidaylist);
			
			log.debug(Timeinlist);
			log.debug(daylist);
			request.setAttribute("daylist", daylist);
			request.setAttribute("userId", search_user);
			request.setAttribute("monthSearch", month);
			request.setAttribute("yearSearch", year);
			request.setAttribute("logonUser", search_user);
			request.setAttribute("position", positionusers);
			request.setAttribute("cubeUser", cubeUser);
			request.setAttribute("TimeInlist", Timeinlist);
			request.setAttribute("Holidayls", Holidaylist);
			request.setAttribute("leavelists", leavelist);
			request.setAttribute("TimeCalList", TimeCallist); // work_day_count ,
																// work_day_hour,leave_day_count,leave_hour,absent_day_count,absent_hour,late_early_day_count,
			// late_early_hour,ot_day_count,ot_hour

			 return "success"; 
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}

	public String listTimeInReport() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			// String uid = user.getId();
			String logonUser = user.getId();
			List<Map<String, Object>> cubeUser;
			cubeUser = userDAO.sequense();
			ArrayList<String> daylist = new ArrayList<String>();
			ArrayList<String> daylistsql_Format = new ArrayList<String>();
			String positionusers = null;
			List<Map<String, Object>> positionuser = userDAO.positionuser(logonUser);
			for (Map<String, Object> map : positionuser) {
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					positionusers = (String) entry.getValue();
				}
			}

			int monthInt;
			int yearInt;

			GregorianCalendar date = new GregorianCalendar();
			monthInt = date.get(Calendar.MONTH);
			yearInt = date.get(Calendar.YEAR);

			monthGlobal = String.valueOf(monthInt);
			yearGlobal = String.valueOf(yearInt);

			monthInt = monthInt + 1;
			String month = Integer.toString(monthInt);
			if (month.length() == 1) {
				month = "0" + month;
			}
			String year = Integer.toString(yearInt);
			// set search

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DAY_OF_MONTH, 1);
			int myMonth = cal.get(Calendar.MONTH);

			while (myMonth == cal.get(Calendar.MONTH)) {

				String day = String.valueOf(cal.getTime());
				day = day.replaceAll(" ", "");
				if (Integer.valueOf((date.get(Calendar.MONTH) + 1)).toString().length() == 1) {
					daylist.add(day.substring(6, 8) + "/0" + (date.get(Calendar.MONTH) + 1) + "/"
							+ date.get(Calendar.YEAR));
				} else {
					daylist.add(
							day.substring(6, 8) + "/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR));
				}
				cal.add(Calendar.DAY_OF_MONTH, 1);
			}

			
			List<Map<String, Object>> Timeinlist1 = TimeInDAO.TimeInList(month, year, logonUser);
			for (int t = 0; t < Timeinlist1.size(); t++) {
				BigInteger findid = (BigInteger)Timeinlist1.get(t).get("timesheetId");
				int timesheetid = findid.intValue();
				Timestamp timecheckin = (Timestamp)Timeinlist1.get(t).get("time_check_in");
				log.debug(timecheckin);
				Timesheet timesheet = TimesheetDAO.findById(timesheetid);
				Date started_date = timesheet.getStarted_date();
				String d = String.valueOf(started_date);
				String dayt = d.substring(8, 10);
				
				List<Map<String, Object>> whereworkhour = TimesheetDAO.whereworkhour(year,
						month, dayt, logonUser);
				if (!whereworkhour.isEmpty() && timecheckin == null) {
					for (int wwh = 0; wwh < whereworkhour.size(); wwh++) {
						char work_hours_type = ((char) whereworkhour.get(wwh).get("work_hours_type"));
						if (work_hours_type == '1') {
							Timestamp startDate = ((Timestamp) whereworkhour.get(wwh)
									.get("work_hours_time_work"));
							timesheet.setTimeCheckIn(startDate);
							// log.debug(startDate);
						} else if (work_hours_type == '2') {
							Timestamp endDate = ((Timestamp) whereworkhour.get(wwh)
									.get("work_hours_time_work"));
							timesheet.setTimeCheckOut(endDate);
							// log.debug(endDate);
						}

					}
				}
				TimesheetDAO.update(timesheet);
			}
			List<Map<String, Object>> Timeinlist = TimeInDAO.TimeInList(month, year, logonUser);
			List<Map<String, Object>> Holidaylist = TimeInDAO.HolidayForTimeinList(month, year);
			List<Map<String, Object>> leavelist = TimeInDAO.LeaveForTimeinList(month, year, logonUser);
			Map<String, Object> TimeCallist = TimeCalculate(Timeinlist, leavelist, Holidaylist);

			
			log.debug(Timeinlist);
			log.debug(daylist);
			request.setAttribute("daylist", daylist);
			request.setAttribute("userId", logonUser);
			request.setAttribute("monthSearch", month);
			request.setAttribute("yearSearch", year);
			request.setAttribute("logonUser", logonUser);
			request.setAttribute("position", positionusers);
			request.setAttribute("cubeUser", cubeUser);
			request.setAttribute("TimeInlist", Timeinlist);

			request.setAttribute("Holidayls", Holidaylist);
			request.setAttribute("leavelists", leavelist);
			request.setAttribute("TimeCalList", TimeCallist); // work_day_count ,
																// work_day_hour,leave_day_count,leave_hour,absent_day_count,absent_hour,late_early_day_count,
			// late_early_hour,ot_day_count,ot_hour
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}

	public Map<String, Object> TimeCalculate(List<Map<String, Object>> TimeList, List<Map<String, Object>> leavelist,
			List<Map<String, Object>> holiday) throws ParseException {
		Map<String, Object> TimeCal = new HashMap<String, Object>();
		DateFormat parser = new SimpleDateFormat("dd/MM/yyyy");
		DateFormat parsers = new SimpleDateFormat("HH:mm");
		DateFormat day_parse = new SimpleDateFormat("E");
		List<String> Timein = new ArrayList<String>();
		List<String> Timeout = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		String current_date = parser.format(cal.getTime());
		int workstart_min = 0;
		int workend_min = 0;
		int timein_min = 0;
		int timeout_min = 0;
		int OT_in_min = 0;
		int OT_out_min = 0;
		int latecount = 0;
		int earlycount = 0;
		int late_min_count = 0;
		int early_min_count = 0;
		int ot_min_count = 0;
		int work_day_count = 0;
		int work_day_hour_count = 0;
		int work_day_min_count = 0;
		int worktime = 0;
		int x1_ot_min_count = 0;
		int x1_5_ot_min_count = 0;
		int x3_ot_min_count = 0;
		int max_work_hour = 8 * 60;
		int late_day_count = 0, late_hour = 0, late_min = 0;
		int absent_day = 0, absent_hour = 0, absent_min = 0;
		int leave_day = 0, leave_hour = 0, leave_min = 0;
		int half_day = 0;
		int leave_day_min_count = 0;
		int weekendcount = 0;
		for (Map<String, Object> map : TimeList) {
			if(map.get("time_check_in") != null) {
				String timein = parsers.format(map.get("time_check_in")).toString();
				String timeout = parsers.format(map.get("time_check_out")).toString();
				String day_of_work = day_parse.format(map.get("time_check_in")).toString();
				String Workstart;
				String Workend;
				String OTin = "";
				String OTout = "";
	
				if (!day_of_work.equalsIgnoreCase("sat") && !day_of_work.equalsIgnoreCase("sun")) {
					if (map.get("work_time_start") != null || !map.get("work_time_start").toString().equals("")) {
						Workstart = map.get("work_time_start").toString();
						Workend = map.get("work_time_end").toString();
					} else {
						Workstart = "";
						Workend = "";
					}
	
					if (!Workstart.equals("") && !Workend.equals("")) {
						String work_start_arr[] = Workstart.split(":");
						String work_end_arr[] = Workend.split(":");
						workstart_min = Integer.valueOf(work_start_arr[0]) * 60 + Integer.valueOf(work_start_arr[1]);// time
																														// start
						workend_min = Integer.valueOf(work_end_arr[0]) * 60 + Integer.valueOf(work_end_arr[1]);// time end
	
						if (map.get("OT_time_start") != null) {
							OTin = parsers.format(map.get("OT_time_start"));
							OTout = parsers.format(map.get("OT_time_end"));
						} else if (map.get("OT_time_start") == null) {
							OTin = "";
							OTout = "";
						}
					}
	
					String ot_in_arr[];
					String ot_out_arr[];
					String before_midnight[] = ("24:00".split(":"));
					String after_midnight[] = ("00:00".split(":"));
					int bmidnight_m = (Integer.valueOf(before_midnight[0]) * 60) + Integer.valueOf(before_midnight[1]);
					int afmidnight_m = (Integer.valueOf(after_midnight[0]) * 60) + Integer.valueOf(after_midnight[1]);
	
					if (!OTin.equals("") && !OTout.equals("")) {
						ot_in_arr = OTin.split(":");
						ot_out_arr = OTout.split(":");
						OT_in_min = Integer.valueOf(ot_in_arr[0]) * 60 + Integer.valueOf(ot_in_arr[1]);
	
						OT_out_min = Integer.valueOf(ot_out_arr[0]) * 60 + Integer.valueOf(ot_out_arr[1]);
	
						if (OT_out_min >= OT_in_min) {
							ot_min_count += (OT_out_min - OT_in_min);
	
						} else if (OT_out_min < OT_in_min) {
							int time1 = bmidnight_m - OT_in_min;
							int time2 = OT_out_min - afmidnight_m;
							ot_min_count += time1 + time2;
	
						}
					}
	
				}
				// OT Time Calculate for Saturday and Sunday
				if (day_of_work.equalsIgnoreCase("sat") || day_of_work.equalsIgnoreCase("sun")) {
	
					String timein_arr[] = timein.split(":");// 08 25
					String timeout_arr[] = timeout.split(":"); // 17 36
					timein_min = Integer.valueOf(timein_arr[0]) * 60 + Integer.valueOf(timein_arr[1]); // time check in 8*60
																										// +
																										// 35
					timeout_min = Integer.valueOf(timeout_arr[0]) * 60 + Integer.valueOf(timeout_arr[1]); // time check out
					// 17*60 +35
	
					if (map.get("OT_time_start") != null) {
						OTin = parsers.format(map.get("OT_time_start"));
						OTout = parsers.format(map.get("OT_time_end"));
					} else if (map.get("OT_time_start") == null) {
						OTin = "";
						OTout = "";
					}
	
					String ot_in_arr[];
					String ot_out_arr[];
					String before_midnight[] = ("24:00".split(":"));
					String after_midnight[] = ("00:00".split(":"));
					int bmidnight_m = (Integer.valueOf(before_midnight[0]) * 60) + Integer.valueOf(before_midnight[1]);
					int afmidnight_m = (Integer.valueOf(after_midnight[0]) * 60) + Integer.valueOf(after_midnight[1]);
	
					if (!OTin.equals("") && !OTout.equals("")) {
						ot_in_arr = OTin.split(":");
						ot_out_arr = OTout.split(":");
						OT_in_min = Integer.valueOf(ot_in_arr[0]) * 60 + Integer.valueOf(ot_in_arr[1]);
	
						OT_out_min = Integer.valueOf(ot_out_arr[0]) * 60 + Integer.valueOf(ot_out_arr[1]);
	
						if (OT_out_min >= OT_in_min) {
							ot_min_count += (OT_out_min - OT_in_min);
	
						} else if (OT_out_min < OT_in_min) {
							int time1 = bmidnight_m - OT_in_min;
							int time2 = OT_out_min - afmidnight_m;
							ot_min_count += time1 + time2;
	
						}
					}
	
					// OTx3
					String ot_time1startx3[] = "00:00".split(":");
					String ot_time1endx3[] = "08:30".split(":");
					int ot1start = Integer.valueOf(ot_time1startx3[0]) * 60 + Integer.valueOf(ot_time1startx3[1]);
					int ot1end = Integer.valueOf(ot_time1endx3[0]) * 60 + Integer.valueOf(ot_time1endx3[1]);
	
					// OTx1
					String ot_time2startx1[] = "8:30".split(":");
					String ot_time2endx1[] = "17:30".split(":");
					int ot2start = Integer.valueOf(ot_time2startx1[0]) * 60 + Integer.valueOf(ot_time2startx1[1]);
					int ot2end = Integer.valueOf(ot_time2endx1[0]) * 60 + Integer.valueOf(ot_time2endx1[1]);
	
					// OTx3
					String ot_time3startx3[] = "17:30".split(":");
					String ot_time3endx3[] = "24:00".split(":");
					int ot3start = Integer.valueOf(ot_time3startx3[0]) * 60 + Integer.valueOf(ot_time3startx3[1]);
					int ot3end = Integer.valueOf(ot_time3endx3[0]) * 60 + Integer.valueOf(ot_time3endx3[1]);
	
					// OT time section
					if ((ot1start <= OT_in_min && OT_in_min <= ot1end)
							&& (ot1start <= OT_out_min && OT_out_min <= ot1end)) {
						x3_ot_min_count += (OT_out_min - OT_in_min);
	
					} else if ((ot1start <= OT_in_min && OT_in_min <= ot1end)
							&& (ot2start <= OT_out_min && OT_out_min <= ot2end)) {
						x1_ot_min_count += (OT_out_min - ot2start);
						x3_ot_min_count += (ot1end - OT_in_min);
	
					} else if ((ot1start <= OT_in_min && OT_in_min <= ot1end)
							&& (ot3start <= OT_out_min && OT_out_min <= ot3end)) {
						x3_ot_min_count += (ot1end - OT_in_min);
						x1_ot_min_count += (ot2end - ot2start);
						x3_ot_min_count += (ot3start - OT_out_min);
	
					}
	
					if ((ot2start <= OT_in_min && OT_in_min <= ot2end)
							&& (ot2start <= OT_out_min && OT_out_min <= ot2end)) {
						x1_ot_min_count += (OT_out_min - OT_in_min);
	
					} else if ((ot2start <= OT_in_min && OT_in_min <= ot2end)
							&& (ot3start <= OT_out_min && OT_out_min <= ot3end)) {
						x1_ot_min_count += (ot2end - OT_in_min);
						x3_ot_min_count += (OT_out_min - ot3start);
	
					} else if ((ot2start <= OT_in_min && OT_in_min <= ot2end)
							&& (ot1start <= OT_out_min && OT_out_min <= ot1end)) {
						x1_ot_min_count += (ot2end - OT_in_min);
						x3_ot_min_count += (ot3end - ot3start);
						x3_ot_min_count += (OT_out_min - ot1start);
	
					}
	
					if ((ot3start <= OT_in_min && OT_in_min <= ot3end)
							&& (ot3start <= OT_out_min && OT_out_min <= ot3end)) {
						x3_ot_min_count += (OT_out_min - OT_in_min);
	
					} else if ((ot3start <= OT_in_min && OT_in_min <= ot3end)
							&& (ot1start <= OT_out_min && OT_out_min <= ot1end)) {
						x3_ot_min_count += (ot3end - OT_in_min);
						x3_ot_min_count += (OT_out_min - ot1start);
	
					} else if ((ot3start <= OT_in_min && OT_in_min <= ot3end)
							&& (ot2start <= OT_out_min && OT_out_min <= ot2end)) {
						x3_ot_min_count += (ot3end - OT_in_min);
						x3_ot_min_count += (ot1end - ot1start);
						x1_ot_min_count += (OT_out_min - ot2start);
	
					}
	
					// normal time in weekend section
					if ((ot1start <= timein_min && timein_min <= ot1end)
							&& (ot1start <= timeout_min && timeout_min <= ot1end)) {
						x3_ot_min_count += (timeout_min - timein_min);
	
					} else if ((ot1start <= timein_min && timein_min <= ot1end)
							&& (ot2start <= timeout_min && timeout_min <= ot2end)) {
						x1_ot_min_count += (timeout_min - ot2start);
						x3_ot_min_count += (ot1end - timein_min);
	
					} else if ((ot1start <= timein_min && timein_min <= ot1end)
							&& (ot3start <= timeout_min && timeout_min <= ot3end)) {
						x3_ot_min_count += (ot1end - timein_min);
						x1_ot_min_count += (ot2end - ot2start);
						x3_ot_min_count += (ot3start - timeout_min);
	
					}
	
					if ((ot2start <= timein_min && timein_min <= ot2end)
							&& (ot2start <= timeout_min && timeout_min <= ot2end)) {
						x1_ot_min_count += (timeout_min - timein_min);
	
					} else if ((ot2start <= timein_min && timein_min <= ot2end)
							&& (ot3start <= timeout_min && timeout_min <= ot3end)) {
						x1_ot_min_count += (ot2end - timein_min);
						x3_ot_min_count += (timeout_min - ot3start);
	
					} else if ((ot2start <= timein_min && timein_min <= ot2end)
							&& (ot1start <= timeout_min && timeout_min <= ot1end)) {
						x1_ot_min_count += (ot2end - timein_min);
						x3_ot_min_count += (ot3end - ot3start);
						x3_ot_min_count += (timeout_min - ot1start);
	
					}
	
					if ((ot3start <= timein_min && timein_min <= ot3end)
							&& (ot3start <= timeout_min && timeout_min <= ot3end)) {
						x3_ot_min_count += (timeout_min - timein_min);
	
					} else if ((ot3start <= timein_min && timein_min <= ot3end)
							&& (ot1start <= timeout_min && timeout_min <= ot1end)) {
						x3_ot_min_count += (ot3end - timein_min);
						x1_ot_min_count += (timeout_min - ot1start);
	
					} else if ((ot3start <= timein_min && timein_min <= ot3end)
							&& (ot2start <= timeout_min && timeout_min <= ot2end)) {
						x3_ot_min_count += (ot3end - timein_min);
						x3_ot_min_count += (ot1end - ot1start);
						x1_ot_min_count += (timeout_min - ot2start);
						// int a [] [] [] [] [] [] [] [] [] []= null;
					}
	
				} else {
					// OT Calculate for normal day
					String timein_arr[] = timein.split(":");// 08 25
					String timeout_arr[] = timeout.split(":"); // 17 36
					timein_min = Integer.valueOf(timein_arr[0]) * 60 + Integer.valueOf(timein_arr[1]); // time check in 8*60
																										// +
																										// 35
					timeout_min = Integer.valueOf(timeout_arr[0]) * 60 + Integer.valueOf(timeout_arr[1]); // time check out
					if ((timeout_min - timein_min) > max_work_hour) {
						worktime += max_work_hour;
					} else {
						worktime += timeout_min - timein_min;
					}
					String ot_time1startx1_5[] = "00:00".split(":");
					String ot_time1endx1_5[] = "08:30".split(":");
					int ot1start = Integer.valueOf(ot_time1startx1_5[0]) * 60 + Integer.valueOf(ot_time1startx1_5[1]);
					int ot1end = Integer.valueOf(ot_time1endx1_5[0]) * 60 + Integer.valueOf(ot_time1endx1_5[1]);
	
					String ot_time2startx1[] = "8:30".split(":");
					String ot_time2endx1[] = "17:30".split(":");
					int ot2start = Integer.valueOf(ot_time2startx1[0]) * 60 + Integer.valueOf(ot_time2startx1[1]);
					int ot2end = Integer.valueOf(ot_time2endx1[0]) * 60 + Integer.valueOf(ot_time2endx1[1]);
	
					String ot_time3startx1_5[] = "18:30".split(":");
					String ot_time3endx1_5[] = "24:00".split(":");
					int ot3start = Integer.valueOf(ot_time3startx1_5[0]) * 60 + Integer.valueOf(ot_time3startx1_5[1]);
					int ot3end = Integer.valueOf(ot_time3endx1_5[0]) * 60 + Integer.valueOf(ot_time3endx1_5[1]);
	
					if ((ot1start <= OT_in_min && OT_in_min <= ot1end)
							&& (ot1start <= OT_out_min && OT_out_min <= ot1end)) {
						x1_5_ot_min_count += (OT_out_min - OT_in_min);
					} else if ((ot1start <= OT_in_min && OT_in_min <= ot1end)
							&& (ot2start <= OT_out_min && OT_out_min <= ot2end)) {
	
						x1_5_ot_min_count += (ot1end - OT_in_min);
					} else if ((ot1start <= OT_in_min && OT_in_min <= ot1end)
							&& (ot3start <= OT_out_min && OT_out_min < ot3end)) {
						x1_5_ot_min_count += (ot1end - OT_in_min);
						x1_5_ot_min_count += (ot3start - OT_out_min);
					}
	
					if ((ot2start <= OT_in_min && OT_in_min <= ot2end)
							&& (ot2start <= OT_out_min && OT_out_min <= ot2end)) {
					} else if ((ot2start <= OT_in_min && OT_in_min <= ot2end)
							&& (ot3start <= OT_out_min && OT_out_min < ot3end)) {
						x1_5_ot_min_count += (OT_out_min - ot3start);
					} else if ((ot2start <= OT_in_min && OT_in_min <= ot2end)
							&& (ot1start <= OT_out_min && OT_out_min <= ot1end)) {
						x1_5_ot_min_count += (ot3end - ot3start);
						x1_5_ot_min_count += (OT_out_min - ot1start);
					}
	
					if ((ot2end <= OT_in_min && OT_in_min <= ot3start) && (ot3start <= OT_out_min && OT_out_min < ot3end)) {
						x1_5_ot_min_count += (OT_out_min - OT_in_min) - (ot3start - OT_in_min);
					} else if ((ot2end <= OT_in_min && OT_in_min <= ot3start)
							&& (ot1start <= OT_out_min && OT_out_min <= ot1end)) {
						x1_5_ot_min_count += (ot3end - ot3start) + (OT_out_min - ot1start) - (ot3start - OT_in_min);
					}
	
					if ((ot3start <= OT_in_min && OT_in_min < ot3end) && (ot3start <= OT_out_min && OT_out_min <= ot3end)) {
						x1_5_ot_min_count += (OT_out_min - OT_in_min);
					} else if ((ot3start <= OT_in_min && OT_in_min < ot3end)
							&& (ot1start <= OT_out_min && OT_out_min <= ot1end)) {
						x1_5_ot_min_count += (ot3end - OT_in_min);
						x1_5_ot_min_count += (OT_out_min - ot1start);
	
					} else if ((ot3start <= OT_in_min && OT_in_min < ot3end)
							&& (ot2start <= OT_out_min && OT_out_min <= ot2end)) {
						x1_5_ot_min_count += (ot3end - OT_in_min);
						x1_5_ot_min_count += (ot1end - ot1start);
	
					}
	
				}
	
				if (day_of_work.equalsIgnoreCase("sat") || day_of_work.equalsIgnoreCase("sun")) {
					ot_min_count += timeout_min - timein_min;
				}
	
				System.out.println();
				
				if (workstart_min != 0 && workend_min != 0) {
					if (workstart_min < timein_min) {
						latecount += 1;
						late_min_count += timein_min - workstart_min;
					}
	
					if (workend_min > timeout_min) {
						earlycount += 1;
						early_min_count += workend_min - timeout_min;
	
					}
				}
			} else {
				
			}
		}

		for (Map<String, Object> map : leavelist) {
			int full_day_leave = 0;
			int leavePreMonth = 0;
			int leavePostMonth = 0;
			int sum_day_leave = 0;
			String startdate = parser.format(map.get("start_date")).toString();
			String enddate = parser.format(map.get("end_date")).toString();
			String leave_applove_stat = map.get("leave_status_id").toString();
			weekendcount = 0;

			if (Integer.valueOf(startdate.substring(3, 5)) == Integer.valueOf(enddate.substring(3, 5))) {
				String num_day = map.get("no_day").toString();
				String num_day_fullday = num_day.substring(0, 1);
				// System.out.println(num_day_fullday);
				String num_day_halfday = num_day.substring(2, 3);
				// System.out.println(num_day_halfday);
				if (Integer.valueOf(num_day_halfday) > 0) {
					half_day += 1;
				}
				// System.out.println(num_day_fullday);
				// System.out.println( num_day_halfday);

				List<String> daylist = new ArrayList<String>();

				for (int i = (Integer.valueOf(startdate.substring(0, 2))); i <= Integer
						.valueOf(enddate.substring(0, 2)); i++) {
					String month = enddate.substring(3, 5);
					String year = enddate.substring(6, 10);
					if (i < 10) {
						daylist.add("0" + i + "/" + month + "/" + year);
					} else {
						daylist.add(i + "/" + month + "/" + year);
					}
				}

				for (String day : daylist) {
					Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(day);
					String day_of_week = day_parse.format(date1);
					// System.out.println(day_of_week);
					if (day_of_week.equalsIgnoreCase("sun") || day_of_week.equalsIgnoreCase("sat")) {
						weekendcount += 1;
						// System.out.println(weekendcount);
					}
				}

				full_day_leave = Integer.valueOf(num_day_fullday) - weekendcount;

			} else if (Integer.valueOf(startdate.substring(3, 5)) < Integer.valueOf(this.monthGlobal)) {

				int imonth = Integer.valueOf(this.monthGlobal) - 1;
				int iyear = Integer.valueOf(this.yearGlobal);
				GregorianCalendar mycal = new GregorianCalendar(iyear, imonth - 1, 1);
				int dayinmonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH);

				List<String> daylist = new ArrayList<String>();

				for (int i = (Integer.valueOf(startdate.substring(0, 2))); i <= dayinmonth; i++) {
					String month = enddate.substring(3, 5);
					String year = enddate.substring(6, 10);
					if (i < 10) {
						daylist.add("0" + i + "/" + month + "/" + year);
					} else {
						daylist.add(i + "/" + month + "/" + year);
					}
				}

				for (String day : daylist) {
					Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(day);
					String day_of_week = day_parse.format(date1);
					// System.out.println(day_of_week);
					if (day_of_week.equalsIgnoreCase("sun") || day_of_week.equalsIgnoreCase("sat")) {
						weekendcount += 1;
						// System.out.println(weekendcount);
					}
				}

				leavePreMonth = (Integer.valueOf(enddate.substring(0, 2)));
				if (weekendcount != 0) {
					leavePreMonth = Integer.valueOf(enddate.substring(0, 2));
					// System.out.println("ddd" +weekendcount);
				}
				weekendcount = 0;
				daylist.removeAll(daylist);
			} else if (Integer.valueOf(enddate.substring(3, 5)) > Integer.valueOf(monthGlobal)) {

				int imonth = Integer.valueOf(monthGlobal);
				int iyear = Integer.valueOf(yearGlobal);
				GregorianCalendar mycal = new GregorianCalendar(iyear, imonth - 1, 1);
				int dayinmonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH);
				List<String> daylist = new ArrayList<String>();

				for (int i = Integer.valueOf(startdate.substring(0, 2)); i <= dayinmonth; i++) {
					String month = startdate.substring(3, 5);
					String year = startdate.substring(6, 10);
					if (i < 10) {
						daylist.add("0" + i + "/" + month + "/" + year);
					} else {
						daylist.add(i + "/" + month + "/" + year);
					}
				}

				for (String day : daylist) {
					Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(day);
					String day_of_week = day_parse.format(date1);

					if (day_of_week.equalsIgnoreCase("sun") || day_of_week.equalsIgnoreCase("sat")) {
						weekendcount += 1;
						// System.out.println(weekendcount);
					}
				}

				// todo: get leave day from remains from previous month
				System.out.println("dayinmonth: " + dayinmonth + " date: " + startdate.substring(0, 2));
				leavePostMonth = dayinmonth - (Integer.valueOf(startdate.substring(0, 2))) + 1;

				if (weekendcount != 0) {
					// full_day_leave = (dayinmonth - Integer.valueOf(current_date.substring(0, 2))
					// + 1) - weekendcount;
					leavePostMonth = dayinmonth - (Integer.valueOf(startdate.substring(0, 2))) + 1 - weekendcount;
					// System.out.println(dayinmonth - Integer.valueOf(current_date.substring(0,2))
					// + 1);
				}
				weekendcount = 0;

			}

			System.out.println("leavepremonth: " + leavePreMonth);
			System.out.println("leavepostmonth: " + leavePostMonth);
			System.out.println("fulldayleave: " + full_day_leave);
			if (leave_applove_stat.equalsIgnoreCase("1")) {
				leave_day_min_count += ((full_day_leave + leavePreMonth + leavePostMonth) * 8) * 60;
			} else {

			}

			System.out.println();
		}

		leave_day_min_count += (half_day * 4) * 60;
		leave_day = leave_day_min_count / 480;
		leave_hour = (leave_day_min_count % 480) / 60;
		leave_min = (leave_day_min_count % 480) % 60;
		System.out.println("late_min_count : "+late_min_count);
		// late and early calculate
		
//		if (late_min_count < 60) {
//			late_min_count = 0;
//		}

//		late_day_count = (late_min_count + early_min_count) / 480;
//		System.out.println("late_min_count : "+late_min_count);
//		System.out.println("early_min_count : "+early_min_count);
//		System.out.println("late_day_count : "+late_day_count);
//		late_hour = ((late_min_count + early_min_count) % 480) / 60;
//		late_min = ((late_min_count + early_min_count) % 480) % 60;
				
		late_day_count = (late_min_count) / 480;
		System.out.println("late_min_count : "+late_min_count);
		System.out.println("early_min_count : "+early_min_count);
		System.out.println("late_day_count : "+late_day_count);
		late_hour = ((late_min_count) % 480) / 60;
		late_min = ((late_min_count) % 480) % 60;
		
		// late and early condition
		int ot_day = ot_min_count / 480;
		int ot_hour = (ot_min_count % 480) / 60;
		int ot_min = (ot_min_count % 480) % 60;

		work_day_count = worktime / 480;
		work_day_hour_count = (worktime % 480) / 60;
		work_day_min_count = (worktime % 480) % 60;
		absent_day = 0;
		int ot_x3_day = x3_ot_min_count / 480;
		int ot_x3_hour = (x3_ot_min_count % 480) / 60;
		int ot_x3_min = (x3_ot_min_count % 480) % 60;

		int ot_x1_day = x1_ot_min_count / 480;
		int ot_x1_hour = (x1_ot_min_count % 480) / 60;
		int ot_x1_min = (x1_ot_min_count % 480) % 60;

		int ot_x1_5_day = x1_5_ot_min_count / 480;
		int ot_x1_5_hour = (x1_5_ot_min_count % 480) / 60;
		int ot_x1_5_min = (x1_5_ot_min_count % 480) % 60;

		TimeCal.put("work_day_count", work_day_count);
		TimeCal.put("work_day_hour",
				String.format("%02d", work_day_hour_count) + ":" + String.format("%02d", work_day_min_count));
		TimeCal.put("late_early_day_count", late_day_count);
		TimeCal.put("late_early_hour", String.format("%02d", late_hour) + ":" + String.format("%02d", late_min));
		TimeCal.put("absent_day_count", absent_day);
		TimeCal.put("absent_hour", String.format("%02d", absent_hour) + ":" + String.format("%02d", absent_min));
		TimeCal.put("leave_day_count", leave_day);
		TimeCal.put("leave_hour", String.format("%02d", leave_hour) + ":" + String.format("%02d", leave_min));
		TimeCal.put("ot_day_count", ot_day);
		TimeCal.put("ot_hour", String.format("%02d", ot_hour) + ":" + String.format("%02d", ot_min));
		TimeCal.put("ot_x3_day_count", ot_x3_day);
		TimeCal.put("ot_x3_hour", String.format("%02d", ot_x3_hour) + ":" + String.format("%02d", ot_x3_min));
		TimeCal.put("ot_x1_day_count", ot_x1_day);
		TimeCal.put("ot_x1_hour", String.format("%02d", ot_x1_hour) + ":" + String.format("%02d", ot_x1_min));
		TimeCal.put("ot_x15_day_count", ot_x1_5_day);
		TimeCal.put("ot_x15_hour", String.format("%02d", ot_x1_5_hour) + ":" + String.format("%02d", ot_x1_5_min));
		System.out.println("Timein : "+Timein);
		System.out.println("Timeout : "+Timeout);
		return TimeCal;
	}

	public String ExcelExportTimeIn() {
		try {
			boolean daycheck = false;
			String userid = request.getParameter("user");
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			this.monthGlobal = month;
			this.yearGlobal = year;
			ArrayList<String> daylist = new ArrayList<String>();
			int iyear = Integer.parseInt(year);
			int imonth = Integer.parseInt(month);
			GregorianCalendar mycal = new GregorianCalendar(iyear, imonth - 1, 1);
			int dayinmonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH);

			for (int i = 1; i <= dayinmonth; i++) {

				if (i < 10) {
					daylist.add("0" + i + "/" + month + "/" + year);
				} else {
					daylist.add(i + "/" + month + "/" + year);
				}

			}

			List<Map<String, Object>> Timeinlist = TimeInDAO.TimeInList(month, year, userid);
			List<Map<String, Object>> Holidaylist = TimeInDAO.HolidayForTimeinList(month, year);
			List<Map<String, Object>> leavelist = TimeInDAO.LeaveForTimeinList(month, year, userid);
			Map<String, Object> TimeCal = TimeCalculate(Timeinlist, leavelist, Holidaylist);

			User userinfo = userDAO.findById(userid);
			String team = "";
			ServletContext context = request.getServletContext();
			String fileServerPath = context.getRealPath("/");
			File myFile = new File(fileServerPath + "upload/template/timesheet.xlsx");
			FileInputStream file = new FileInputStream(myFile);

			XSSFWorkbook wb = new XSSFWorkbook(file);
			XSSFSheet sheet = wb.getSheetAt(0);
			XSSFRow row = sheet.getRow(6);
			XSSFFont font = wb.createFont();
			font.setFontHeightInPoints((short) 16);
			font.setFontName("Angsana New");
			font.setBold(false);
			font.setItalic(false);
			XSSFCellStyle style = wb.createCellStyle();
			style.setAlignment(CellStyle.ALIGN_LEFT);
			style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			style.setFont(font);
			style.setBorderBottom(BorderStyle.THIN);
			style.setBorderLeft(BorderStyle.THIN);
			style.setBorderTop(BorderStyle.THIN);
			style.setBorderRight(BorderStyle.THIN);

			// style for Holiday
			XSSFCellStyle Holidaystyle = wb.createCellStyle();
			Holidaystyle.setAlignment(CellStyle.ALIGN_LEFT);
			Holidaystyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			Holidaystyle.setFont(font);
			Holidaystyle.setBorderBottom(BorderStyle.THIN);
			Holidaystyle.setBorderLeft(BorderStyle.THIN);
			Holidaystyle.setBorderTop(BorderStyle.THIN);
			Holidaystyle.setBorderRight(BorderStyle.THIN);
			Holidaystyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			Holidaystyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			// style for weekend
			XSSFCellStyle Weekendstyle = wb.createCellStyle();
			Weekendstyle.setAlignment(CellStyle.ALIGN_LEFT);
			Weekendstyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			Weekendstyle.setFont(font);
			Weekendstyle.setBorderBottom(BorderStyle.THIN);
			Weekendstyle.setBorderLeft(BorderStyle.THIN);
			Weekendstyle.setBorderTop(BorderStyle.THIN);
			Weekendstyle.setBorderRight(BorderStyle.THIN);
			Weekendstyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			Weekendstyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			XSSFFont HeadFontStyle = wb.createFont();
			// HeadFontStyle.setUnderline(HSSFFont.U_SINGLE);
			HeadFontStyle.setFontName("Angsana New");
			HeadFontStyle.setFontHeightInPoints((short) 20);
			XSSFCellStyle UsernameStyle = wb.createCellStyle();
			UsernameStyle.setFont(HeadFontStyle);
			UsernameStyle.setBorderBottom(BorderStyle.THIN);
			// The fifth step, create a header cell, and set the style
			XSSFCell cell = row.createCell(1);
			XSSFCellStyle Recieverstyle = wb.createCellStyle();
			Recieverstyle.setFont(HeadFontStyle);
			Recieverstyle.setBorderBottom(BorderStyle.THIN);
			XSSFCellStyle DATErstyle = wb.createCellStyle();
			DATErstyle.setFont(HeadFontStyle);

			// USERNAME PLOT SECTION
			row = sheet.getRow(2);
			cell = row.createCell(2);
			cell.setCellValue(userinfo.getId());
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(3);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(4);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(5);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(6);
			cell.setCellStyle(UsernameStyle);

			// COMPANY PLOT SECTION
			row = sheet.getRow(3);
			cell = row.createCell(2);
			cell.setCellValue("Cube SoftTech");
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(3);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(4);
			cell.setCellStyle(UsernameStyle);

			// NAME PLOT SECTION
			row = sheet.getRow(2);
			cell = row.createCell(16);
			cell.setCellValue(userinfo.getName());
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(17);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(18);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(19);
			cell.setCellStyle(UsernameStyle);

			// MONTH PLOT SECTION
			row = sheet.getRow(3);
			cell = row.createCell(16);
			cell.setCellValue(month + "/" + year);
			cell.setCellStyle(UsernameStyle);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(17);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(18);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(19);
			cell.setCellStyle(UsernameStyle);

			// RECIEVER PLOT SECTION
//			row = sheet.getRow(49);
//			cell = row.createCell(15);
//			cell.setCellValue("Phatcharee Sittisanwattanachai");
//			cell.setCellStyle(Recieverstyle);
//			cell = row.createCell(16);
//			cell.setCellStyle(Recieverstyle);
//			cell = row.createCell(17);
//			cell.setCellStyle(Recieverstyle);
//			cell = row.createCell(18);
//			cell.setCellStyle(Recieverstyle);
//			SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/YYYY");
//			Date today = new Date();
//			// DATE PLOT SECTION
//			row = sheet.getRow(50);
//			cell = row.createCell(16);
//			cell.setCellValue(fmt.format(today));
//			cell.setCellStyle(DATErstyle);

			int rowd = 6 + dayinmonth; // start row in excel
			int leavedayStack = 0; // Stack for leaveday loop
			int holidayStack = 0; // Stack for holiday loop
			int holidayStackNextMonth = 0;
			int leavedayStackNextMonth = 0;
			int sumworkmin = 0;
			int workdaycount = 0;
			int daycount = 0;
			int weekendcount = 0;
			int holidaycount = 0;
			int leavedaycount = 0;
			int lateandearlycount = 0;
			int OTcount = 0;
			String Workstart = "";
			String Workend = "";
			String Workdes = "";
			String Workstart_split_arr[];
			String Workend_split_arr[];
			int workstart_min = 0;
			int workend_min = 0;
			String leave_description = "";
			List<String> dayinlist = new ArrayList<String>();
			List<String> Timein = new ArrayList<String>();
			List<String> Timeout = new ArrayList<String>();
			List<String> OTin = new ArrayList<String>();
			List<String> OTout = new ArrayList<String>();
			List<String> OTmark = new ArrayList<String>();
			List<String> holiday_start_date = new ArrayList<String>();
			List<String> holiday_end_date = new ArrayList<String>();
			List<String> holidayhead = new ArrayList<String>();
			List<String> Weekendlist = new ArrayList<String>();
			List<String> leavelistStartDate = new ArrayList<String>();
			List<String> leavelistEndDate = new ArrayList<String>();
			List<String> leavedescription = new ArrayList<String>();
			List<String> leave_status = new ArrayList<String>();
			List<String> leaveTypeName = new ArrayList<String>();
			List<Integer> leavenumberday = new ArrayList<Integer>();
			DateFormat parser = new SimpleDateFormat("dd/MM/yyyy");
			DateFormat parsers = new SimpleDateFormat("HH:mm");
			DateFormat parsdayofweek = new SimpleDateFormat("E");

			// get leave data form leave list map
			for (Map<String, Object> map : leavelist) {
				leavelistStartDate.add(parser.format(map.get("start_date")));
				leavelistEndDate.add(parser.format(map.get("end_date")));
				leavedescription.add(map.get("description").toString());
				leaveTypeName.add(map.get("leave_type_name").toString());
				leavenumberday.add(((BigDecimal) map.get("no_day")).intValue());
				leave_status.add(map.get("leave_status_id").toString());
			}
			int TimeinlistLoopCount = 0;

			// get TimeSheet data form Timeinlist map
			for (Map<String, Object> map : Timeinlist) {

				dayinlist.add(parser.format(map.get("time_check_in")));
				Timein.add(parsers.format(map.get("time_check_in")));
				Timeout.add(parsers.format(map.get("time_check_out")));
				
			
				OTmark.add(map.get("description").toString());
				if (map.get("work_time_start") != null || !map.get("work_time_start").toString().equals("")) {
					Workstart = map.get("work_time_start").toString();
					Workend = map.get("work_time_end").toString();
				
				} else {
					Workstart = "";
					Workend = "";
				
				}

				if (map.get("OT_time_start") != null) {
					OTin.add(parsers.format(map.get("OT_time_start")));
					OTout.add(parsers.format(map.get("OT_time_end")));
//					if (map.get("OT_description") != null) {
//						OTmark.add("(OT) " + map.get("OT_description").toString());
//					} else {
//						OTmark.add("(OT)");
//					}
				 

				} else if (map.get("OT_time_start") == null) {
					OTin.add("");
					OTout.add("");
//					OTmark.add("");
				}
				if (TimeinlistLoopCount == 0) {
					if (map.get("team") != null) {
						team = map.get("team").toString();
					} else {
						team = "";
					}

				}
				//TimeinlistLoopCount += 1;

			}

			if (!Workstart.equals("0:00") && !Workstart.equals("")) {
				Workstart_split_arr = Workstart.split(":");
				Workend_split_arr = Workend.split(":");
				workstart_min = (Integer.valueOf(Workstart_split_arr[0]) * 60)
						+ Integer.valueOf(Workstart_split_arr[1]);
				workend_min = (Integer.valueOf(Workend_split_arr[0]) * 60) + Integer.valueOf(Workend_split_arr[1]);
			}

			TimeinlistLoopCount = 0;

			// Team plot section
			row = sheet.getRow(4);
			cell = row.createCell(2);
			if (team != null) {
				cell.setCellValue(team);
			} else {
				cell.setCellValue("");
			}
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(3);
			cell.setCellStyle(UsernameStyle);
			cell = row.createCell(4);
			cell.setCellStyle(UsernameStyle);

			for (Map<String, Object> map : Holidaylist) {
				holiday_start_date.add(parser.format(map.get("start_date")));
				holiday_end_date.add(parser.format(map.get("end_date")));
				holidayhead.add(map.get("head").toString());
			}
			for (int i = 7; i <= rowd; i++) {
				daycount += 1;
				Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(daylist.get(i - 7));
				Weekendlist.add(parsdayofweek.format(date1));
				for (String day : dayinlist) {
					if (daylist.get(i - 7).equals(day)) {
						char st = '\u25F4';
						char late = '\uFFEB';
						char early = '\uFFE9';
						row = sheet.getRow(i);

						cell = row.getCell(0);
						cell.setCellValue(day);
						cell.setCellStyle(style);

						cell = row.createCell(2);
						cell.setCellValue(Timein.get(dayinlist.indexOf(day)));
						cell.setCellStyle(style);

						cell = row.createCell(4);
						cell.setCellValue(Timeout.get(dayinlist.indexOf(day)));
						cell.setCellStyle(style);

						cell = row.createCell(6);
						cell.setCellValue(OTin.get(dayinlist.indexOf(day)));
						cell.setCellStyle(style);

						cell = row.createCell(8);
						cell.setCellValue(OTout.get(dayinlist.indexOf(day)));
						cell.setCellStyle(style);

						if (parsdayofweek.format(date1).equalsIgnoreCase("sat")
								|| parsdayofweek.format(date1).equalsIgnoreCase("sun")) {

						} else {
							workdaycount += 1;
						}

						String timein_h_m[] = Timein.get(dayinlist.indexOf(day)).split(":");
						String timeout_h_m[] = Timeout.get(dayinlist.indexOf(day)).split(":");

						int time_in_m = (Integer.valueOf(timein_h_m[0]) * 60) + Integer.valueOf(timein_h_m[1]);
						int time_out_m = (Integer.valueOf(timeout_h_m[0]) * 60) + Integer.valueOf(timeout_h_m[1]);

						int time = (time_out_m - time_in_m) / 60;
						int time_min = (time_out_m - time_in_m) % 60;
						
						
						
						sumworkmin += time_out_m - time_in_m;
						if (!Workstart.equals("0:00")) {
							if (time_in_m > workstart_min || workend_min > time_out_m) {
								lateandearlycount += 1;
							}
							if (time_in_m > workstart_min) {

								cell = row.createCell(3);
								cell.setCellValue(String.valueOf(late));
								cell.setCellStyle(style);
							} else {
								cell = row.createCell(3);
								cell.setCellValue("");
								cell.setCellStyle(style);
							}

							if (workend_min > time_out_m) {

								cell = row.createCell(5);
								cell.setCellValue(String.valueOf(early));
								cell.setCellStyle(style);
							} else {
								cell = row.createCell(5);
								cell.setCellValue("");
								cell.setCellStyle(style);
							}
						} else {
							cell = row.createCell(3);
							cell.setCellValue(" * ");
							cell.setCellStyle(style);
							cell = row.createCell(5);
							cell.setCellValue(" * ");
							cell.setCellStyle(style);
						}
						cell = row.createCell(10);
						
						if(time_out_m <= 780) {					
								cell.setCellValue(String.format("%02d", time) + ":" + String.format("%02d", time_min));						
						}
						else if(time < 9) {
								cell.setCellValue(String.format("%02d", time-1) + ":" + String.format("%02d", time_min));							
						}
						else if(time >= 9) {				
								cell.setCellValue(String.format("%02d", 8) + ":" + String.format("%02d", 0));						
						}
						
						
						

						cell.setCellStyle(style);

						if (OTin.get(dayinlist.indexOf(day)) != null && OTout.get(dayinlist.indexOf(day)) != null
								&& !OTin.get(dayinlist.indexOf(day)).equals("")
								&& !OTout.get(dayinlist.indexOf(day)).equals("")) {
							cell = row.createCell(7);
							cell.setCellValue(String.valueOf(st));
							cell.setCellStyle(style);
							cell = row.createCell(9);
							cell.setCellValue(String.valueOf(st));
							cell.setCellStyle(style);
							timein_h_m = OTin.get(dayinlist.indexOf(day)).split(":");
							timeout_h_m = OTout.get(dayinlist.indexOf(day)).split(":");
							time_in_m = (Integer.valueOf(timein_h_m[0]) * 60) + Integer.valueOf(timein_h_m[1]);
							time_out_m = (Integer.valueOf(timeout_h_m[0]) * 60) + Integer.valueOf(timeout_h_m[1]);

							cell = row.createCell(12);
							OTcount += 1;
							if (time_out_m >= time_in_m) {
								time = (time_out_m - time_in_m) / 60;
								time_min = (time_out_m - time_in_m) % 60;
								cell.setCellValue(String.format("%02d", time) + ":" + String.format("%02d", time_min));

							} else if (time_out_m < time_in_m) {
								String before_midnight[] = ("24:00".split(":"));
								String after_midnight[] = ("00:00".split(":"));
								int bmidnight_m = (Integer.valueOf(before_midnight[0]) * 60)
										+ Integer.valueOf(before_midnight[1]);
								int afmidnight_m = (Integer.valueOf(after_midnight[0]) * 60)
										+ Integer.valueOf(after_midnight[1]);
								int time1 = bmidnight_m - time_in_m;
								int time2 = time_out_m - afmidnight_m;

								time = (time1 + time2) / 60;
								time_min = (time1 + time2) % 60;
								cell.setCellValue(String.format("%02d", time) + ":" + String.format("%02d", time_min));
							}

							cell.setCellStyle(style);

						}

						cell = row.createCell(14);
						cell.setCellValue(OTmark.get(dayinlist.indexOf(day)));
						cell.setCellStyle(style);
						daycheck = true;
					}

				}

				for (String hday : holiday_start_date) {

					if (hday.equals(daylist.get(i - 7))) {

						if (hday.equals(holiday_end_date.get(holiday_start_date.indexOf(hday)))
								|| holiday_end_date.get(holiday_start_date.indexOf(hday)) == null) {

							row = sheet.getRow(i);
							holidaycount += 1;
							cell = row.getCell(0);
							cell.setCellValue(hday);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(2);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(3);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(4);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(5);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(6);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(7);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(8);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(9);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(10);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(11);
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(12);
							cell.setCellStyle(Holidaystyle);

							cell = row.createCell(14);
							cell.setCellValue(holidayhead.get(holiday_start_date.indexOf(hday)));
							cell.setCellStyle(Holidaystyle);
							daycheck = true;

						} else {

							if (Integer.valueOf(hday.substring(3, 5)) == Integer
									.valueOf(holiday_end_date.get(holiday_start_date.indexOf(hday)).substring(3, 5))
									&& holiday_end_date.get(holiday_start_date.indexOf(hday)) != null) {
								// present now to now
								int day_start = Integer.valueOf(hday.substring(0, 2));
								int day_end = Integer.valueOf(
										holiday_end_date.get(holiday_start_date.indexOf(hday)).substring(0, 2));
								int holidaynumcount = 0;
								for (int x = day_start; x <= day_end; x++) {
									holidaynumcount += 1;
								}
								holidayStack = holidaynumcount - 1;
								for (int c = 0; c < holidaynumcount; c++) {

									row = sheet.getRow(i + c);
									holidaycount += 1;

									cell = row.getCell(0);
									cell.setCellValue(daylist.get(i - 7));
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(2);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(3);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(4);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(5);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(6);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(7);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(8);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(9);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(10);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(11);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(12);
									cell.setCellStyle(Holidaystyle);

									cell = row.createCell(14);
									cell.setCellValue(holidayhead.get(holiday_start_date.indexOf(hday)));
									cell.setCellStyle(Holidaystyle);
									daycheck = true;

								}

							} else if (Integer.valueOf(hday.substring(3, 5)) < Integer
									.valueOf(holiday_end_date.get(holiday_start_date.indexOf(hday)).substring(3, 5))
									&& holiday_end_date.get(holiday_start_date.indexOf(hday)) != null) {
								// now to next month
								int current_holiday = Integer.valueOf(hday.substring(0, 2));
								int holidaynumcount = 0;
								for (int x = current_holiday; x <= dayinmonth; x++) {
									holidaynumcount += 1;
								}
								holidayStack = holidaynumcount - 1;
								for (int c = 0; c < holidaynumcount; c++) {

									row = sheet.getRow(i + c);
									holidaycount += 1;

									cell = row.getCell(0);
									cell.setCellValue(daylist.get(i - 7));
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(2);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(3);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(4);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(5);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(6);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(7);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(8);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(9);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(10);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(11);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(12);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.createCell(14);
									cell.setCellValue(holidayhead.get(holiday_start_date.indexOf(hday)));
									cell.setCellStyle(Holidaystyle);
									daycheck = true;

								}

							} else if (Integer.valueOf(hday.substring(3, 5)) > Integer
									.valueOf(holiday_end_date.get(holiday_start_date.indexOf(hday)).substring(3, 5))
									&& holiday_end_date.get(holiday_start_date.indexOf(hday)) != null) {
								// past to now

							}

						}

					} else if (!hday.substring(3, 5).equals(daylist.get(i - 7).substring(3, 5))) {
						if (Integer.valueOf(hday.substring(3, 5)) < Integer
								.valueOf(daylist.get(i - 7).substring(3, 5))) {

							int holidaynumcount = 0;

							if (holiday_end_date.get(holiday_start_date.indexOf(hday)).equals(daylist.get(i - 7))) {
								// past to now

								for (int x = 1; x <= Integer.valueOf(
										holiday_end_date.get(holiday_start_date.indexOf(hday)).substring(0, 2)); x++) {
									holidaynumcount += 1;
								}
								holidayStackNextMonth = holidaynumcount - 1;

								for (int c = 0; c < holidaynumcount; c++) {

									row = sheet.getRow(i - c);
									holidaycount += 1;

									cell = row.getCell(0);
									cell.setCellValue(daylist.get(i - 7 - c));
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(2);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(3);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(4);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(5);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(6);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(7);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(8);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(9);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(10);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(11);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(12);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.createCell(14);
									cell.setCellValue(holidayhead.get(holiday_start_date.indexOf(hday)));
									cell.setCellStyle(Holidaystyle);
									daycheck = true;

								}
							}

						}

					}

				}

				for (String leaveday : leavelistStartDate) {

					if (leaveday.equals(daylist.get(i - 7))) {

						if (leave_status.get(leavelistStartDate.indexOf(leaveday)).equals("1")) {
							if (leaveday.equals(leavelistEndDate.get(leavelistStartDate.indexOf(leaveday)))
									|| leavelistEndDate.get(leavelistStartDate.indexOf(leaveday)) == null) {
								if (leavenumberday.get(leavelistStartDate.indexOf(leaveday)) > 1) {
									leavedayStack = leavenumberday.get(leavelistStartDate.indexOf(leaveday)) - 1;
									for (int c = 0; c < leavenumberday.get(leavelistStartDate.indexOf(leaveday)); c++) {
										row = sheet.getRow(i + c);
										leavedaycount += 1;
										cell = row.getCell(0);
										cell.setCellValue(daylist.get(i - 7));
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(2);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(3);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(4);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(5);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(6);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(7);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(8);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(9);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(10);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(11);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(12);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.createCell(14);
										cell.setCellValue(leavedescription.get(leavelistStartDate.indexOf(leaveday)));
										cell.setCellStyle(Holidaystyle);
										daycheck = true;
										leave_description = leavedescription.get(leavelistStartDate.indexOf(leaveday));

									}

								} else {
									row = sheet.getRow(i);
									leavedaycount += 1;
									cell = row.getCell(0);
									cell.setCellValue(leaveday);
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(2);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(3);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(4);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(5);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(6);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(7);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(8);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(9);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(10);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(11);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.getCell(12);
									cell.setCellValue("");
									cell.setCellStyle(Holidaystyle);

									cell = row.createCell(14);
									cell.setCellValue(leavedescription.get(leavelistStartDate.indexOf(leaveday)));
									cell.setCellStyle(Holidaystyle);
									daycheck = true;
									leave_description = leavedescription.get(leavelistStartDate.indexOf(leaveday));
								}
							} else {
								if (Integer.valueOf(leaveday.substring(3, 5)) == Integer.valueOf(
										leavelistEndDate.get(leavelistStartDate.indexOf(leaveday)).substring(3, 5))
										&& leavelistEndDate.get(leavelistStartDate.indexOf(leaveday)) != null) {
									// present now to now
									int day_start = Integer.valueOf(leaveday.substring(0, 2));
									int day_end = Integer.valueOf(
											leavelistEndDate.get(leavelistStartDate.indexOf(leaveday)).substring(0, 2));
									int leaveaynumcount = 0;
									for (int x = day_start; x <= day_end; x++) {
										leaveaynumcount += 1;
									}
									leavedayStack = leaveaynumcount - 1;
									for (int c = 0; c < leaveaynumcount; c++) {

										row = sheet.getRow(i + c);
										leavedaycount += 1;

										cell = row.getCell(0);
										cell.setCellValue(daylist.get(i - 7));
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(2);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(3);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(4);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(5);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(6);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(7);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(8);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(9);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(10);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(11);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(12);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.createCell(14);
										cell.setCellValue(leavedescription.get(leavelistStartDate.indexOf(leaveday)));
										cell.setCellStyle(Holidaystyle);
										daycheck = true;
										leave_description = leavedescription.get(leavelistStartDate.indexOf(leaveday));

									}

								} else if (Integer.valueOf(leaveday.substring(3, 5)) < Integer.valueOf(
										leavelistEndDate.get(leavelistStartDate.indexOf(leaveday)).substring(3, 5))
										&& leavelistEndDate.get(leavelistStartDate.indexOf(leaveday)) != null) {
									// now to next month
									int current_holiday = Integer.valueOf(leaveday.substring(0, 2));
									int leavedaynumcount = 0;
									for (int x = current_holiday; x <= dayinmonth; x++) {
										leavedaynumcount += 1;
									}
									leavedayStack = leavedaynumcount - 1;

									for (int c = 0; c < leavedaynumcount; c++) {

										row = sheet.getRow(i + c);
										leavedaycount += 1;

										cell = row.getCell(0);
										cell.setCellValue(daylist.get(i - 7));
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(2);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(3);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(4);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(5);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(6);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(7);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(8);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(9);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(10);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(11);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.getCell(12);
										cell.setCellValue("");
										cell.setCellStyle(Holidaystyle);

										cell = row.createCell(14);
										cell.setCellValue(leavedescription.get(leavelistStartDate.indexOf(leaveday)));
										cell.setCellStyle(Holidaystyle);
										daycheck = true;
										leave_description = leavedescription.get(leavelistStartDate.indexOf(leaveday));
									}
								}

							}
						}

						///////////////////////////////////

					} else if (!leaveday.substring(3, 5).equals(daylist.get(i - 7).substring(3, 5))) {
						if (leave_status.get(leavelistStartDate.indexOf(leaveday)).equals("1")) {
							if (Integer.valueOf(leaveday.substring(3, 5)) < Integer
									.valueOf(daylist.get(i - 7).substring(3, 5))) {

								int leavedaynumcount = 0;

								if (leavelistEndDate.get(leavelistStartDate.indexOf(leaveday))
										.equals(daylist.get(i - 7))) {
									// past to now

									for (int x = 1; x <= Integer.valueOf(leavelistEndDate
											.get(leavelistStartDate.indexOf(leaveday)).substring(0, 2)); x++) {
										leavedaynumcount += 1;
									}
									// leavedayStack = leavedaynumcount - 1;

									for (int c = 0; c < leavedaynumcount; c++) {

										row = sheet.getRow(i - c);
										// holidaycount += 1;
										Date date = new SimpleDateFormat("dd/MM/yyyy").parse(daylist.get(i - 7 - c));
										// String day_format = parser.format(date);
										String day_of_week_format = parsdayofweek.format(date).toString();
										if (day_of_week_format.equalsIgnoreCase("sat")
												|| day_of_week_format.equalsIgnoreCase("sun")) {
											cell = row.getCell(0);
											cell.setCellValue(daylist.get(i - 7 - c));
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(2);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(3);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(4);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(5);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(6);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(7);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(8);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(9);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(10);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(11);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(12);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.createCell(14);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);
											daycheck = true;
										} else {
											cell = row.getCell(0);
											cell.setCellValue(daylist.get(i - 7 - c));
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(2);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(3);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(4);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(5);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(6);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(7);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(8);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(9);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(10);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(11);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.getCell(12);
											cell.setCellValue("");
											cell.setCellStyle(Holidaystyle);

											cell = row.createCell(14);
											cell.setCellValue(
													leavedescription.get(leavelistStartDate.indexOf(leaveday)));
											cell.setCellStyle(Holidaystyle);
											daycheck = true;
										}

									}
								}

							}

						}
					}
					//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				}
				if (daycheck == false) {
					if (Weekendlist.get(i - 7).equalsIgnoreCase("Sat")
							|| Weekendlist.get(i - 7).equalsIgnoreCase("Sun")) {
						row = sheet.getRow(i);
						// weekendcount += 1;
						cell = row.getCell(0);
						cell.setCellValue(daylist.get(i - 7));
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(2);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(3);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(4);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(5);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(6);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(7);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(8);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(9);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(10);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(11);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(12);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);

						cell = row.getCell(14);
						cell.setCellValue("");
						cell.setCellStyle(Weekendstyle);
						if (leavedayStack > 0) {
							leavedayStack -= 1;
							leavedaycount -= 1;
						}
						if (holidayStack > 0) {
							holidaycount -= 1;
							holidayStack -= 1;
						}
					} else {
						if (leavedayStack > 0) {
							row = sheet.getRow(i);
							cell = row.getCell(0);
							cell.setCellValue(daylist.get(i - 7));
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(2);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(3);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(4);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(5);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(6);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(7);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(8);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(9);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(10);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(11);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(12);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(14);
							cell.setCellValue(leave_description);
							cell.setCellStyle(Holidaystyle);

							leavedayStack -= 1;
						} else if (holidayStack > 0) {
							row = sheet.getRow(i);
							cell = row.getCell(0);
							cell.setCellValue(daylist.get(i - 7));
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(2);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(3);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(4);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(5);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(6);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(7);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(8);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(9);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(10);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(11);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(12);
							cell.setCellValue("");
							cell.setCellStyle(Holidaystyle);

							cell = row.getCell(14);

							cell.setCellStyle(Holidaystyle);
							holidayStack -= 1;
						} /*
							 * else if(holidayStackNextMonth > 0) {
							 * System.out.println("do holidayStack-nextmonth"); row = sheet.getRow(i); cell
							 * = row.getCell(0); cell.setCellValue(daylist.get(i-7));
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(2); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(3); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(4); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(5); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(6); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(7); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(8); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(9); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(10); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(11); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(12); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(14); cell.setCellStyle(Holidaystyle);
							 * holidayStackNextMonth-=1; //System.out.println(holidayStackNextMonth); }else
							 * if(leavedayStackNextMonth > 0) {
							 * System.out.println("do leavedayStack-nextmonth"); row = sheet.getRow(i); cell
							 * = row.getCell(0); cell.setCellValue(daylist.get(i-7));
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(2); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(3); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(4); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(5); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(6); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(7); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(8); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(9); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(10); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(11); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(12); cell.setCellValue("");
							 * cell.setCellStyle(Holidaystyle);
							 * 
							 * cell = row.getCell(14); cell.setCellStyle(Holidaystyle);
							 * 
							 * 
							 * leavedayStackNextMonth-=1; }
							 */
						else {
							row = sheet.getRow(i);
							cell = row.getCell(0);
							cell.setCellValue(daylist.get(i - 7));
							cell.setCellStyle(style);

							cell = row.getCell(2);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(3);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(4);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(5);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(6);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(7);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(8);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(9);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(10);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(11);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(12);
							cell.setCellValue("");
							cell.setCellStyle(style);

							cell = row.getCell(14);
							cell.setCellValue("");
							cell.setCellStyle(style);
						}

					}

				}
				daycheck = false;
			}

			for (String day : daylist) {
				Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(day);
				String day_of_week = parsdayofweek.format(date1);
				if (day_of_week.equalsIgnoreCase("sun") || day_of_week.equalsIgnoreCase("sat")) {
					weekendcount += 1;
				}
			}
			double workhour = (sumworkmin / 60);
			row = sheet.getRow(40);
			cell = row.getCell(6);
			cell.setCellValue(TimeCal.get("work_day_count").toString());
			cell.setCellStyle(style);
			cell = row.getCell(8);
			cell.setCellValue(TimeCal.get("work_day_hour").toString());
			cell.setCellStyle(style);
			// leave day and hour count plot section
			row = sheet.getRow(42);
			cell = row.getCell(6);
			cell.setCellValue(TimeCal.get("leave_day_count").toString());
			cell.setCellStyle(style);
			row = sheet.getRow(42);
			cell = row.getCell(8);
			cell.setCellValue(TimeCal.get("leave_hour").toString());
			cell.setCellStyle(style);

			// absent
//			row = sheet.getRow(42);
//			cell = row.getCell(6);
//			// cell.setCellValue(TimeCal.get("absent_day_count").toString());
//			cell.setCellValue(daycount - (holidaycount + weekendcount + workdaycount
//					+ Integer.parseInt(TimeCal.get("leave_day_count").toString())));
//			System.out.println(daycount);
//			System.out.println(holidaycount);
//			System.out.println(weekendcount);
//			System.out.println(workdaycount);
//			System.out.println(Integer.parseInt(TimeCal.get("leave_day_count").toString()));
//			cell.setCellStyle(style);
//			row = sheet.getRow(42);
//			cell = row.getCell(8);
//			cell.setCellValue(TimeCal.get("absent_hour").toString());
//			cell.setCellStyle(style);

			// late and early leave plot section
			row = sheet.getRow(41);
			cell = row.getCell(6);
			cell.setCellValue(TimeCal.get("late_early_day_count").toString());
			cell.setCellStyle(style);
			row = sheet.getRow(41);
			cell = row.getCell(8);
			cell.setCellValue(TimeCal.get("late_early_hour").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(43);
			cell = row.getCell(6);
			cell.setCellValue(TimeCal.get("ot_day_count").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(43);
			cell = row.getCell(8);
			cell.setCellValue(TimeCal.get("ot_hour").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(44);
			cell = row.getCell(6);
			cell.setCellValue(TimeCal.get("ot_x1_day_count").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(44);
			cell = row.getCell(8);
			cell.setCellValue(TimeCal.get("ot_x1_hour").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(45);
			cell = row.getCell(6);
			cell.setCellValue(TimeCal.get("ot_x15_day_count").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(45);
			cell = row.getCell(8);
			cell.setCellValue(TimeCal.get("ot_x15_hour").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(46);
			cell = row.getCell(6);
			cell.setCellValue(TimeCal.get("ot_x3_day_count").toString());
			cell.setCellStyle(style);

			row = sheet.getRow(46);
			cell = row.getCell(8);
			cell.setCellValue(TimeCal.get("ot_x3_hour").toString());
			cell.setCellStyle(style);

			// seventh step, save the file to a stream
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			wb.write(os);
			byte[] fileContent = os.toByteArray();
			ByteArrayInputStream is = new ByteArrayInputStream(fileContent);

			excelStream = is; // file stream
			excelFileName = "report.xlsx"; // set the download file name
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}

	public void UpdateTimesheet() {
		try {
			String userID = ((User) request.getSession().getAttribute("onlineUser")).getId();

			Date dateTimeIn = null;
			Date dateTimeOut = null;
			Date dateTimeIn2 = null;
			Date dateTimeOut2 = null;

			String date = request.getParameter("date");
			System.out.println(date);
			date = date.replace("/", "-");
			int timesheetId = Integer.parseInt(request.getParameter("id"));
			String timeIn = request.getParameter("timeIn");
			if (timeIn.length() > 0) {
				timeIn = timeIn + ":00";
				dateTimeIn = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").parse(date + " " + timeIn);
			}
			String timeOut = request.getParameter("timeOut");
			if (timeOut.length() > 0) {
				timeOut = timeOut + ":00";
				dateTimeOut = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").parse(date + " " + timeOut);
			}
			String timeIn2 = request.getParameter("timeIn2");
			System.out.println(timeIn2);
			if (timeIn2.length() > 0) {
				timeIn2 = timeIn2 + ":00";
				dateTimeIn2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").parse(date + " " + timeIn2);
			}
			String timeOut2 = request.getParameter("timeOut2");
			if (timeOut2.length() > 0) {
				timeOut2 = timeOut2 + ":00";
				dateTimeOut2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").parse(date + " " + timeOut2);
			}
			String project = request.getParameter("project");
			String summary = request.getParameter("summary");
			String description = request.getParameter("description");
			//String timespent = request.getParameter("timespent");

			Timesheet currentTimesheet = TimesheetDAO.findById(timesheetId);
			if (currentTimesheet != null) {
				if (dateTimeIn != null) {
				Timestamp timeInStamp = new Timestamp(dateTimeIn.getTime());
				currentTimesheet.setTimeCheckIn(timeInStamp);
				}
				if (dateTimeOut != null) {
				Timestamp timeOutStamp = new Timestamp(dateTimeOut.getTime());
					currentTimesheet.setTimeCheckOut(timeOutStamp);
				}
				if (dateTimeIn2 != null) {
					Timestamp timeInStamp1 = new Timestamp(dateTimeIn2.getTime());
					currentTimesheet.setOT_time_start(timeInStamp1);
				}
				if (dateTimeOut2 != null) {
					Timestamp timeOutStamp1 = new Timestamp(dateTimeOut2.getTime());
					currentTimesheet.setOT_time_end(timeOutStamp1);
				}
				currentTimesheet.setProject(project);
				currentTimesheet.setSummary(summary);
				currentTimesheet.setDescription(description);
				//currentTimesheet.setTimespent(timespent);
				TimesheetDAO.update(currentTimesheet);
			} else {
				System.out.println("Timesheet is null");
				Timesheet newTimesheet = new Timesheet();

			}

			String findId = request.getParameter("id");
			Integer find = Integer.parseInt(findId);
			Timesheet timesheetlist = TimesheetDAO.findById(find);
			
			JSONArray arrayObj1 = new JSONArray();
			JSONArray arrayObj2 = new JSONArray();
			JSONArray arrayObj3 = new JSONArray();
			JSONArray arrayObj4 = new JSONArray();
			JSONArray arrayObj5 = new JSONArray();
			JSONArray arrayObj6 = new JSONArray();
			JSONArray arrayObj7 = new JSONArray();
			
			arrayObj1.put(timesheetlist.getTimeCheckIn());
			arrayObj2.put(timesheetlist.getTimeCheckOut());
			arrayObj3.put(timesheetlist.getOT_time_start());
			arrayObj4.put(timesheetlist.getOT_time_end());
			arrayObj5.put(timesheetlist.getProject());
			arrayObj6.put(timesheetlist.getSummary());
			arrayObj7.put(timesheetlist.getDescription());
			
			PrintWriter out = response.getWriter();
	           JSONObject json = new JSONObject();
	           
	        json.put("checkin", arrayObj1);
	        json.put("checkout", arrayObj2);
	        json.put("otin", arrayObj3);
	        json.put("otout", arrayObj4);
	        json.put("project", arrayObj5);
	        json.put("summary", arrayObj6);
	        json.put("desc", arrayObj7);
	        
	        out.print(json);
	    	out.flush();
	    	out.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
