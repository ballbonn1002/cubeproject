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
import java.text.DecimalFormat;
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
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.PalmDAO;
import com.cubesofttech.model.LeaveType;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.ibm.icu.util.GregorianCalendar;
import com.opensymphony.xwork2.ActionSupport;
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

public class PalmAction extends ActionSupport {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	public TimesheetDAO timesheetDAO;

	@Autowired
	public PalmDAO palmDAO;
	private static final Logger log = Logger.getLogger(TimesheetAction.class);
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public static final String ONLINEUSER = "onlineUser";

	private InputStream excelStream; // variable output stream
	private String excelFileName; // download file name
	public List<Map<String, Object>> spalms;

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

	public String openPalm() {
		
		
		
		int Hday = 0;
		// ----------------- Sum Calendar of now MONTH -----------------
		Calendar calendar = Calendar.getInstance();
		int days = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

		// ----------------- Sut,SunDAY of now MONTH -----------------
		List<Date> disable = new ArrayList<>();
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int month = cal.get(Calendar.MONTH);
		do {
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY)
				disable.add(cal.getTime());

			cal.add(Calendar.DAY_OF_MONTH, 1);
		} while (cal.get(Calendar.MONTH) == month);

		SimpleDateFormat fmt = new SimpleDateFormat("EEE M/d/yyyy");
		for (Date date : disable) {
			Hday += 1;
		}

		int workday = 0;
		workday = days - Hday;

		try {
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
			request.setAttribute("uselogin", "All");
			Date dateTimeNow = new Date();
			request.setAttribute("dateTimeNow", dateTimeNow);
			
			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);
			List<Map<String, Object>> workdays = palmDAO.workdays(month1, year);

			workday = workday - workdays.size();
//			System.out.println(workday + "=" +workday +"+" +workdays +"day:"+ days);
			request.setAttribute("workday", workday);
			List<Map<String, Object>> spalm = palmDAO.notsatsun(month1, year);
			request.setAttribute("spalm", spalm);

			List<Map<String, Object>> late = palmDAO.latedayall(month1, year);
			request.setAttribute("late", late);

			List<Map<String, Object>> leave = palmDAO.leavenotsatsun(month1, year);
			request.setAttribute("leave", leave);
////			System.out.println(spalm.size() + "  ====== spalm.size");

			int countpalm = spalm.size();

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
//		System.out.println("--------------------------------------------\n"+spalm);

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
			List<Map<String, Object>> multipleDay = palmDAO.multipleDay(month1, year);
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

//				System.out.println(".....................................");
//				System.out.println(nd);
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
							spalm.get(i).replace("no_day", b2 - ss);
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
			
		
		

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}

	}

	// only 1 person
	public String searchPalm() {
		try {
			String userid = request.getParameter("name");
			String month1 = request.getParameter("monthSearch");
			String year = request.getParameter("yearSearch");

			request.setAttribute("yearSearch", year);
			request.setAttribute("monthSearch", month1);
			request.setAttribute("tempuser", userid);

			Date dateTimeNow = new Date();
			int iYear = Integer.parseInt(year);
			int iMonth = Integer.parseInt(month1);
			int Hday = 0;
			int workday = 0;
			int d = 1;
			int m = Integer.parseInt(month1);
			int y = Integer.parseInt(year);

//			y = y - 1;
			m = m - 1;

			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);

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
			for (Date date : disable) {
				Hday += 1;
			}
			workday = days - Hday;
//			System.out.println("workday: "+workday+" days: "+" Hday:"+Hday);
			GregorianCalendar mycal = new GregorianCalendar(iYear, iMonth - 1, 1);
			request.setAttribute("dateTimeNow", dateTimeNow);
			request.setAttribute("uselogin", userid);
			request.setAttribute("monthSearch", month1);
			request.setAttribute("yearSearch", year);

			if (userid.equals("All") || userid.equals("") || userid.equals(null) || userid.isEmpty()) {

				List<Map<String, Object>> workdays = palmDAO.workdays(month1, year);

				workday = workday - workdays.size();
//				System.out.println(workday + "=" +workday +"+" +workdays +"day:"+ days);
				request.setAttribute("workday", workday);
				List<Map<String, Object>> spalm = palmDAO.notsatsun(month1, year);
				request.setAttribute("spalm", spalm);

				List<Map<String, Object>> late = palmDAO.latedayall(month1, year);
				request.setAttribute("late", late);

				List<Map<String, Object>> leave = palmDAO.leavenotsatsun(month1, year);
				request.setAttribute("leave", leave);
////				System.out.println(spalm.size() + "  ====== spalm.size");

				int countpalm = spalm.size();

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
//			System.out.println("--------------------------------------------\n"+spalm);

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
				List<Map<String, Object>> multipleDay = palmDAO.multipleDay(month1, year);
				request.setAttribute("multipleDay", multipleDay);
				int smd = multipleDay.size();
//			System.out.println("multipleDay.size====>"+multipleDay.size());
				for (int md = 0; md < countpalm; md++) {
					if (!(multipleDay.isEmpty())) {
						for (int md2 = 0; md2 < smd; md2++) {
//						
							if (spalm.get(md).get("user_create").toString().toLowerCase()
									.equals(multipleDay.get(md2).get("user_create").toString().toLowerCase())) {
//						
								BigDecimal mda = (BigDecimal) multipleDay.get(md2).get("no_day");
								multipleDay.get(md2).put("multiD", mda.doubleValue());
//							System.out.println("-------------------------------");
//							System.out.println(mda + "." + multipleDay );
							}
//						else {
//							multipleDay.get(md2).put("multiD", 0);
//						}
						}
					}
				}

				for (int i = 0; i < countpalm; i++) {
					double sss = 0;
					double miss = 0;

					BigInteger tci = ((BigInteger) spalm.get(i).get("time_check_in"));

					BigDecimal nd = ((BigDecimal) spalm.get(i).get("no_day"));

//					System.out.println(".....................................");
//					System.out.println(nd);
//					System.out.println(".....................................");
					double b1 = tci.intValue();
					double b2 = nd.doubleValue();
//					System.out.println("miss = workday - b1 - b2 == "+ miss +" = "+ workday +" - "+ b1+" - "+ b2);
					if (!(multipleDay.isEmpty())) {
						for (int md3 = 0; md3 < smd; md3++) {

							if (spalm.get(i).get("user_create").toString().toLowerCase()
									.equals(multipleDay.get(md3).get("user_create").toString().toLowerCase())) {

								Double ss = (Double) (multipleDay.get(md3).get("multiD"));
								miss = (double) (workday - (b1 + b2 - ss));
								spalm.get(i).replace("no_day", b2 - ss);
								sss = ss.doubleValue();
//						if(spalm.get(i).get("user_create").equals("thanet.s"))System.out.println("111111111111111111111111111");
								break;

							}

							miss = (double) (workday - (b1 + b2));
//						if(spalm.get(i).get("user_create").equals("thanet.s"))System.out.println("222222222222222222222222222");

						}
					} else {
						miss = (double) (workday - (b1 + b2));
					}

//					if (spalm.get(i).get("user_create").equals("thanet.s")) {
//						System.out.println("miss = (workday - (b1 + b2-ss)) >>>>>"+miss+ " = " + workday +"-"+ "("+b1 +"+"+ b2+"-"+sss+")");
//					}
					spalm.get(i).put("miss", miss);

					b1 = 0;
					b2 = 0;

				}
				
			
			
				return SUCCESS;

			} else {
//				System.out.println("iMonth=="+iMonth+"\n"
//						+ "iYear=="+iYear+"\n"
//						+ "userid=="+userid+"\n"
//						+ "month1=="+month1+"\n"
//						+ "year=="+year+"\n");

				List<Map<String, Object>> spalm = palmDAO.spalm(userid, month1, year);
				request.setAttribute("spalm", spalm);
				List<Map<String, Object>> leave = palmDAO.leavenotsatsun(userid, month1, year);
				request.setAttribute("leave", leave);
				List<Map<String, Object>> workdays = palmDAO.workdays(month1, year);
				List<Map<String, Object>> late = palmDAO.lateday(userid, month1, year);
				request.setAttribute("late", late);
//System.out.println("spalm one user=="+spalm+"\nleave=="+leave+"\nlate=="+late);
//				System.out.println("size===="+leave.size());
//				System.out.println("xxxxxx"+leave);

				if (spalm.isEmpty()) {
						System.out.println("spalm.size()=="+spalm.size());
					return SUCCESS;
				}

				if (leave.get(0).get("user_id") == null || leave.get(0).get("user_id") == ""
						|| leave.get(0).isEmpty()) {
					spalm.get(0).put("user_id", spalm.get(0).get("user_create"));
					spalm.get(0).put("no_day", BigDecimal.valueOf(0.0));
//						System.out.println("xxxxxx222\n"+spalm);

				} else {

					if (spalm.get(0).get("user_create").toString().toLowerCase().equals(leave.get(0).get("user_id").toString().toLowerCase())) {
						spalm.get(0).put("user_id", leave.get(0).get("user_id"));
						spalm.get(0).put("no_day", leave.get(0).get("no_day"));
//						System.out.println("Lower");
//						System.out.println("xxxxxx111\n"+spalm);
					}
				}

				List<Map<String, Object>> multipleDay = palmDAO.multipleDay(userid, month1, year);
				request.setAttribute("multipleDay", multipleDay);
//				System.out.println("multipleDay==>"+multipleDay);

				double mda = 0;
				if (!multipleDay.isEmpty()) {

					for (int md = 0; md < multipleDay.size(); md++) {
						BigDecimal bmd = ((BigDecimal) multipleDay.get(md).get("no_day"));

						mda = mda + bmd.doubleValue();
					}
				}
//				System.out.println("mda => " + mda);
				double miss = 0;

				double lateday = late.size();
//					System.out.println("lateday => " + lateday);

				spalm.get(0).put("lateday", lateday);

				workday = workday - workdays.size();
//					System.out.println(workday + "=" +workday +"+" +workdays.size() +"day:"+ days);
				request.setAttribute("workday", workday);

				BigInteger tci = ((BigInteger) spalm.get(0).get("time_check_in"));

				BigDecimal nd = ((BigDecimal) spalm.get(0).get("no_day"));
//				System.out.println("tci => " + tci);
//				System.out.println("nd => " + nd);
				double b1 = tci.intValue();
				double b2 = nd.doubleValue();
//				System.out.println("b1 => " + b1);
//				System.out.println("b2 => " + b2);
				miss = (double) (workday - (b1 + (b2 - mda)));
//					System.out.println("miss = (double)(workday - (b1 + b2-mda))" + (double)(workday)+" - ("+  (double)b1 +" + "+ (double)b2+"-"+mda+	")");      

				request.setAttribute("miss", miss);
				spalm.get(0).put("miss", miss);
				spalm.get(0).replace("no_day", nd.doubleValue() - mda);

//				System.out.println("spalm=="+spalm);
				return SUCCESS;
			}
			
		} catch (Exception e) {
			log.error(e);

			return ERROR;
		}

	}

	public String PalmExportTimeIn() {
		try {
			
		
			String useridS = request.getParameter("user");
			String monthS = request.getParameter("month1");
			String yearS = request.getParameter("year");
			
		
//-------------------------------------------------------------------------
			String userid = request.getParameter("user");
			String month1 = request.getParameter("month1");
			String year = request.getParameter("year");

			
			Date dateTimeNow = new Date();
			int iYear = Integer.parseInt(year);
			int iMonth = Integer.parseInt(month1);
			int Hday = 0;
			int workday = 0;
			int d = 1;
			int m = Integer.parseInt(month1);
			int y = Integer.parseInt(year);


			m = m - 1;

			List<Map<String, Object>> userSeq = userDAO.sequense();
			request.setAttribute("userseq", userSeq);

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
			for (Date date : disable) {
				Hday += 1;
			}
			workday = days - Hday;
//			System.out.println("workday: "+workday+" days: "+" Hday:"+Hday);
			GregorianCalendar mycal = new GregorianCalendar(iYear, iMonth - 1, 1);
			request.setAttribute("dateTimeNow", dateTimeNow);
			request.setAttribute("uselogin", userid);
			request.setAttribute("monthSearch", month1);
			request.setAttribute("yearSearch", year);

			

				List<Map<String, Object>> workdays = palmDAO.workdays(month1, year);

				workday = workday - workdays.size();
//				System.out.println(workday + "=" +workday +"+" +workdays +"day:"+ days);
				request.setAttribute("workday", workday);
				List<Map<String, Object>> spalm = palmDAO.notsatsun(month1, year);
				request.setAttribute("spalm", spalm);

				List<Map<String, Object>> late = palmDAO.latedayall(month1, year);
				request.setAttribute("late", late);

				List<Map<String, Object>> leave = palmDAO.leavenotsatsun(month1, year);
				request.setAttribute("leave", leave);


				int countpalm = spalm.size();

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

				for (int x = 0; x < countpalm; x++) {
					for (int z = 0; z < late.size(); z++) {

						if (spalm.get(x).get("user_create").toString().toLowerCase()
								.equals(late.get(z).get("user_create").toString().toLowerCase())) {
							spalm.get(x).put("lateday", late.get(z).get("wt"));
						}
						
					}
					if (spalm.get(x).size() != 5) {
						spalm.get(x).put("lateday", 0);
					}
				}
			
				List<Map<String, Object>> multipleDay = palmDAO.multipleDay(month1, year);
				request.setAttribute("multipleDay", multipleDay);
				int smd = multipleDay.size();

				for (int md = 0; md < countpalm; md++) {
					if (!(multipleDay.isEmpty())) {
						for (int md2 = 0; md2 < smd; md2++) {
				
							if (spalm.get(md).get("user_create").toString().toLowerCase()
									.equals(multipleDay.get(md2).get("user_create").toString().toLowerCase())) {
						
								BigDecimal mda = (BigDecimal) multipleDay.get(md2).get("no_day");
								multipleDay.get(md2).put("multiD", mda.doubleValue());

							}

						}
					}
				}

				for (int i = 0; i < countpalm; i++) {
					double sss = 0;
					double miss = 0;

					BigInteger tci = ((BigInteger) spalm.get(i).get("time_check_in"));

					BigDecimal nd = ((BigDecimal) spalm.get(i).get("no_day"));


					double b1 = tci.intValue();
					double b2 = nd.doubleValue();

					if (!(multipleDay.isEmpty())) {
						for (int md3 = 0; md3 < smd; md3++) {

							if (spalm.get(i).get("user_create").toString().toLowerCase()
									.equals(multipleDay.get(md3).get("user_create").toString().toLowerCase())) {

								Double ss = (Double) (multipleDay.get(md3).get("multiD"));
								miss = (double) (workday - (b1 + b2 - ss));
								spalm.get(i).replace("no_day", b2 - ss);
								sss = ss.doubleValue();

								break;

							}

							miss = (double) (workday - (b1 + b2));


						}
					} else {
						miss = (double) (workday - (b1 + b2));
					}

					
					spalm.get(i).put("miss", miss);

					b1 = 0;
					b2 = 0;

				}
			
			
//-------------------------------------------------------------------------

			
			
			ServletContext context = request.getServletContext();
			String fileServerPath = context.getRealPath("/");
			File myFile = new File(fileServerPath + "upload/template/palmReport.xlsx");
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
			style.setAlignment(CellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			style.setFont(font);
			style.setBorderBottom(BorderStyle.THIN);
			style.setBorderLeft(BorderStyle.THIN);
			style.setBorderTop(BorderStyle.THIN);
			style.setBorderRight(BorderStyle.THIN);
			XSSFCellStyle Holidaystyle = wb.createCellStyle();
			Holidaystyle.setAlignment(CellStyle.ALIGN_CENTER);
			Holidaystyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			Holidaystyle.setFont(font);
			Holidaystyle.setBorderBottom(BorderStyle.THIN);
			Holidaystyle.setBorderLeft(BorderStyle.THIN);
			Holidaystyle.setBorderTop(BorderStyle.THIN);
			Holidaystyle.setBorderRight(BorderStyle.THIN);
			Holidaystyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			Holidaystyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			XSSFCellStyle Weekendstyle = wb.createCellStyle();
			Weekendstyle.setAlignment(CellStyle.ALIGN_CENTER);
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
			XSSFFont dataFontStyle = wb.createFont();
			// HeadFontStyle.setUnderline(HSSFFont.U_SINGLE);
			dataFontStyle.setFontName("Angsana New");
			dataFontStyle.setFontHeightInPoints((short) 16);
			XSSFCellStyle UsernameStyle = wb.createCellStyle();
			UsernameStyle.setFont(HeadFontStyle);
			UsernameStyle.setBorderBottom(BorderStyle.THIN);
			UsernameStyle.setBorderRight(BorderStyle.THIN);
			XSSFCellStyle userlistStyle = wb.createCellStyle();
			userlistStyle.setFont(dataFontStyle);
			userlistStyle.setAlignment(CellStyle.ALIGN_CENTER);
			userlistStyle.setBorderBottom(BorderStyle.THIN);
			userlistStyle.setBorderLeft(BorderStyle.THIN);
			userlistStyle.setBorderTop(BorderStyle.THIN);
			userlistStyle.setBorderRight(BorderStyle.THIN);
			XSSFCellStyle listStyle = wb.createCellStyle();
			listStyle.setFont(dataFontStyle);
			listStyle.setAlignment(CellStyle.ALIGN_RIGHT);
			listStyle.setBorderBottom(BorderStyle.THIN);
			listStyle.setBorderLeft(BorderStyle.THIN);
			listStyle.setBorderTop(BorderStyle.THIN);
			listStyle.setBorderRight(BorderStyle.THIN);
			// The fifth step, create a header cell, and set the style
			XSSFCell cell = row.createCell(1);
			// cell.setCellValue("Geeks");
			// sheet.addMergedRegion(rowFrom,rowTo,colFrom,colTo);
			// sheet.addMergedRegion(new CellRangeAddress(2,2,2,8));
			XSSFCellStyle Recieverstyle = wb.createCellStyle();
			Recieverstyle.setFont(HeadFontStyle);
			Recieverstyle.setBorderBottom(BorderStyle.THIN);
			XSSFCellStyle DATErstyle = wb.createCellStyle();
			DATErstyle.setFont(HeadFontStyle);

			// set Position
			row = sheet.getRow(2);
			cell = row.createCell(1);

			// USERNAME PLOT SECTION
			cell.setCellValue(useridS);
			cell.setCellStyle(UsernameStyle);

			// Name PLOT SECTION
			row = sheet.getRow(2);
			cell = row.createCell(5);
			cell.setCellValue("All - members");
			cell.setCellStyle(UsernameStyle);

			row = sheet.getRow(3);
			cell = row.createCell(5);
			cell.setCellValue(monthS);
			cell.setCellStyle(UsernameStyle);
			
			row = sheet.getRow(3);
			cell = row.createCell(8);
			cell.setCellValue(yearS);
			cell.setCellStyle(UsernameStyle);
			List<String> user_createl = new ArrayList<String>();
			List<String> no_dayl = new ArrayList<String>();
			List<String> latedayl = new ArrayList<String>();
			List<String> time_check_inl = new ArrayList<String>();	
			List<String> missl = new ArrayList<String>();	
			for(int i=0;i<spalm.size();i++) {
				DecimalFormat f = new DecimalFormat("#0.00");
//				BigDecimal b2= (BigDecimal)(spalm.get(i).get("no_day"));
//				b2.setScale(2);
				time_check_inl.add(f.format(spalm.get(i).get("time_check_in")));
				no_dayl.add(f.format(spalm.get(i).get("no_day")));
				user_createl.add((String)spalm.get(i).get("user_create").toString());
				latedayl.add(f.format(spalm.get(i).get("lateday")));
				missl.add(f.format(spalm.get(i).get("miss")));
			
			}
//			System.out.println(user_createl);
//			System.out.println(no_dayl);
//			System.out.println(latedayl);
//			System.out.println(time_check_inl);
			
//			System.out.println("spalm=="+spalm);
//			System.out.println("size"+spalm.size());
				
				for(int i=0;i<spalm.size();i++) {
				row = sheet.getRow(i+6);
				cell = row.createCell(0);
				cell.setCellValue(user_createl.get(i));
				cell.setCellStyle(userlistStyle);
				
				row = sheet.getRow(i+6);
				cell = row.createCell(2);
				cell.setCellValue(time_check_inl.get(i));
				cell.setCellStyle(listStyle);
				
				row = sheet.getRow(i+6);
				cell = row.createCell(4);
				cell.setCellValue(no_dayl.get(i));
				cell.setCellStyle(listStyle);
				
				
				row = sheet.getRow(i+6);
				cell = row.createCell(6);
				cell.setCellValue(missl.get(i));
				cell.setCellStyle(listStyle);
				
				row = sheet.getRow(i+6);
				cell = row.createCell(8);
				cell.setCellValue(latedayl.get(i));
				cell.setCellStyle(listStyle);
				}
			
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			wb.write(os);
			byte[] fileContent = os.toByteArray();
			ByteArrayInputStream is = new ByteArrayInputStream(fileContent);

			excelStream = is; // file stream
			excelFileName = "palmReport.xlsx"; // set the download file name

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);

			return ERROR;
		}

	};

}
