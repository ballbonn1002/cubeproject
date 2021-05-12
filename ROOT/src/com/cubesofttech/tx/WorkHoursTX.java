package com.cubesofttech.tx;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.LeaveDAO;
import com.cubesofttech.dao.LeaveTypeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.User;
import com.cubesofttech.model.WorkHours;
import com.cubesofttech.service.LoginService;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class WorkHoursTX extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2280661337420278284L;

	private static final Integer Interger = null;

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private UserDAO userDAO;

//	@Autowired
//	private QRCodeDAO qrcodeDAO;

	@Autowired
	private DepartmentDAO departmentDAO;

	@Autowired
	private LeaveDAO leaveDAO;

	@Autowired
	private LeaveTypeDAO leavetypeDAO;

	@Autowired
	private HolidayDAO holidayDAO;

	@Autowired
	private WorkHoursDAO workHoursDAO;

//	@Autowired
//	private Constant constant;

	@Autowired
	private LoginService loginService;

	private WorkHours workhours;
	private String number;
	private String worktype;
	private String qrcodeID;
//	private QRCodeList qrcodelist;

	private int maxId;
	private int currentQrID;
	private int currentQrStatus;

//	public QRCodeList getQrcodelist() {
//		return qrcodelist;
//	}
//	public void setQrcodelist(QRCodeList qrcodelist) {
//		this.qrcodelist = qrcodelist;
//	}
	public String getQrcodeID() {
		return qrcodeID;
	}

	public void setQrcodeID(String qrcodeID) {
		this.qrcodeID = qrcodeID;
	}

	public String getWorktype() {
		return worktype;
	}

	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public WorkHours getWorkhours() {
		return workhours;
	}

	public void setWorkhours(WorkHours workhours) {
		this.workhours = workhours;
	}

	private Integer workId;

	public Integer getWorkId() {
		return workId;
	}

	public void setWorkId(Integer workId) {
		this.workId = workId;
	}

	String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getMaxId() {
		return maxId;
	}

	public void setMaxId(int maxId) {
		this.maxId = maxId;
	}

	public int getCurrentQrID() {
		return currentQrID;
	}

	public void setCurrentQrID(int currentQrID) {
		this.currentQrID = currentQrID;
	}

	public int getCurrentQrStatus() {
		return currentQrStatus;
	}

	public void setCurrentQrStatus(int currentQrStatus) {
		this.currentQrStatus = currentQrStatus;
	}

	

	public static final String USERID = "userId";
	public static final String ONLINEUSER = "onlineUser";

	private static final String SUCCESS2 = null;

	
	
	
	public String Angularcheckin() {
		try {
			List<Map<String,Object>> checkinjson = new ArrayList();
			Map<String,Object> m = new HashMap();
			log.debug("login");
			int count_setAttribute = 0;
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String logonUser = ur.getId();
			String ytime = null;
			String ytd = null;
			List<Map<String, Object>> work = workHoursDAO.checkIn(logonUser);
			List<Map<String, Object>> timecheckin = workHoursDAO.timecheckin(logonUser);
			List<Map<String, Object>> datecheckin = workHoursDAO.datecheckin(logonUser);
			List<Map<String, Object>> lastcheckin = workHoursDAO.lastcheckin(logonUser);
			List<Map<String, Object>> lastcheckout = workHoursDAO.lastcheckout(logonUser);

			String days = null;
			String da = null;
			for (Map<String, Object> maps : datecheckin) {
				for (Map.Entry<String, Object> entry : maps.entrySet()) {
					log.debug(entry.getValue());
					Date date;
					date = (Date) entry.getValue();
					DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
					days = dateFormat.format(date);

				}
			}
			for (Map<String, Object> maps : timecheckin) {
				for (Map.Entry<String, Object> entry : maps.entrySet()) {
					log.debug(entry.getValue());
					Date date = new Date();
					date = (Date) entry.getValue();
					DateFormat dateFormat = new SimpleDateFormat("HH:mm");
					da = dateFormat.format(date);
				}
			}

			request.setAttribute("datecheckin", days);count_setAttribute+=1;
			request.setAttribute("timecheckin", da);count_setAttribute+=1;
			request.setAttribute("lastcheckin", lastcheckin);count_setAttribute+=1;
			request.setAttribute("lastcheckout", lastcheckout);count_setAttribute+=1;
			request.setAttribute("currentDate", DateUtil.getCurrentTime());count_setAttribute+=1;
			m.put("datecheckin", days);
			m.put("timecheckin", da);
			m.put("lastcheckin", lastcheckin);
			m.put("lastcheckout", lastcheckout);
			m.put("currentDate", DateUtil.getCurrentTime());
			if (!work.isEmpty()) {
				String beforeType = String.valueOf(work.get(0).get("work_hours_type"));
				String beforeStamp = String.valueOf(work.get(0).get("time_create"));
				request.setAttribute("beforeType", beforeType);count_setAttribute+=1;
				request.setAttribute("beforeStamp", beforeStamp);count_setAttribute+=1;
				m.put("beforeType", beforeType);
				m.put("beforeStamp", beforeStamp);
			}
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			String day = dateFormat.format(date);
			String daycut = day.substring(6, 10);
			int foo = Integer.parseInt(daycut);
			if (foo > 2500) {
				int year = foo - 543;
				String strI = Integer.toString(year);
				String daycut2 = day.substring(0, 6);
				String fulldate = daycut2 + strI.trim();
				String time = DateUtil.getTimeNow();
				request.setAttribute("time", time);count_setAttribute+=1;
				request.setAttribute("fulldate", fulldate);count_setAttribute+=1;
				m.put("time", time);
				m.put("fulldate", fulldate);
			} else {
				String strI = Integer.toString(foo);
				String daycut2 = day.substring(0, 6);
				String fulldate = daycut2 + strI.trim();
				String time = DateUtil.getTimeNow();
				request.setAttribute("time", time);count_setAttribute+=1;
				request.setAttribute("fulldate", fulldate);count_setAttribute+=1;
				m.put("time", time);
				m.put("fulldate", fulldate);
			}
			long millis=System.currentTimeMillis();  
			java.util.Date md=new java.util.Date(millis);    
			boolean mday = false;
			Calendar c2 = Calendar.getInstance();
			c2.setTime(md);
			if ((c2.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY))
			{
				Date yesterday = DateUtils.addDays(date, -3);
				String yday = dateFormat.format(yesterday);
				String ydaycut = yday.substring(6, 10);
				int yfoo = Integer.parseInt(ydaycut);
				if (yfoo > 2500) {
					int year = yfoo - 543;
					String strI = Integer.toString(year);
					String daycut2 = yday.substring(0, 6);
					ytd = daycut2 + strI.trim();
					ytime = DateUtil.getTimeNow();
					request.setAttribute("ytime", ytime);count_setAttribute+=1;
					request.setAttribute("ytd", ytd);count_setAttribute+=1;
				} else {
					String strI = Integer.toString(yfoo);
					String daycut2 = yday.substring(0, 6);
					ytd = daycut2 + strI.trim();
					ytime = DateUtil.getTimeNow();
					request.setAttribute("ytime", ytime);count_setAttribute+=1;
					request.setAttribute("ytd", ytd);count_setAttribute+=1;
						}
			} else {
				Date yesterday = DateUtils.addDays(date, -1);
				String yday = dateFormat.format(yesterday);
				String ydaycut = yday.substring(6, 10);
				int yfoo = Integer.parseInt(ydaycut);
				if (yfoo > 2500) {
					int year = yfoo - 543;
					String strI = Integer.toString(year);
					String daycut2 = yday.substring(0, 6);
					ytd = daycut2 + strI.trim();
					ytime = DateUtil.getTimeNow();
					request.setAttribute("ytime", ytime);count_setAttribute+=1;
					request.setAttribute("ytd", ytd);count_setAttribute+=1;
				} else {
					String strI = Integer.toString(yfoo);
					String daycut2 = yday.substring(0, 6);
					ytd = daycut2 + strI.trim();
					ytime = DateUtil.getTimeNow();
					request.setAttribute("ytime", ytime);count_setAttribute+=1;
					request.setAttribute("ytd", ytd);count_setAttribute+=1;
					}
			}
			
			System.out.print(mday);
			String spl[] = ytd.split("-");
			String date1 = (spl[0]);
			String month2 = (spl[1]);
			String year3 = (spl[2]);
			String ydate = year3 + "-" + month2 + "-" + date1;
			String string = ytd;
			System.out.print(ytd);
			DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			Date datec = format.parse(string);
			boolean week = false;
			Date d1 = datec;
			Calendar c1 = Calendar.getInstance();
			c1.setTime(d1);
			if ((c1.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY)
					|| (c1.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)) {
				week = true;
			} else {
				week = false;
			}
	
			List<Map<String, Object>> datecheck = workHoursDAO.checkholiday(ydate);
			List<Map<String, Object>> checkleave = workHoursDAO.checkleave(ydate);
			List<Map<String, Object>> alertm = workHoursDAO.alertm(logonUser, ydate);
			request.setAttribute(logonUser, ytd);count_setAttribute+=1;
			boolean leavecheck = false;
			boolean holidaycheck = false;
			boolean yyy = false;
			boolean chn = false;
			for (Map<String, Object> map2 : datecheck) {
				Object holi = map2.get("start_date");
				String holicheck = String.valueOf(holi);
				if (holicheck.equals(ydate)) {
					holidaycheck = true;
					break;
				} else {
					break;
				}
			}

			for (Map<String, Object> map : alertm) {
				Object ly = map.get("work_hours_type");
				String lyy = String.valueOf(ly);
				String[] arrData = { lyy };
				for (int i = 0; i < arrData.length; i++) {
					if (arrData[i].equals("1")) {
						yyy = true;
						break;
					} else if (arrData[i].equals("2")) {
						chn = true;
						break;
					} else {
						break;
					}
				}

			}
			for (Map<String, Object> map3 : checkleave) {
				Object leave = map3.get("start_date");
				String leaveday = String.valueOf(leave);
				if (leaveday.equals("")) {
					leavecheck = false;
					break;
				} else {
					leavecheck = true;
					break;
				}
			}
			request.setAttribute("leavecheck", leavecheck);count_setAttribute+=1;
			request.setAttribute("holidaycheck", holidaycheck);count_setAttribute+=1;
			request.setAttribute("weekcheck", week);count_setAttribute+=1;
			request.setAttribute("nocheckout", yyy);count_setAttribute+=1;
			request.setAttribute("nocheckin", chn);count_setAttribute+=1;
			// request.setAttribute("GOOGLE_API_KEY", constant.getGoogleApiKey());
			// PRODUCTION GOOGLE KEY
			request.setAttribute("GOOGLE_API_KEY", "AIzaSyDQajNmqwu5dl6tJ3nnOoYhnRl2ndchKAg");count_setAttribute+=1;
			List<Map<String, Object>> lastusercheck1 = workHoursDAO.lastusercheckin();
			request.setAttribute("lastusercheckin", lastusercheck1);count_setAttribute+=1;
			List<Map<String, Object>> lastusercheck2 = workHoursDAO.lastusercheckout();
			request.setAttribute("lastusercheckout", lastusercheck2);count_setAttribute+=1;
			
			
			Date datehbd = new Date();
			Timestamp tstamphbd = new Timestamp(datehbd.getTime());
			Date Longdayhbd = DateUtil.periodMinus(datehbd, 8);
			Timestamp tstampbeforehbd = new Timestamp(Longdayhbd.getTime());

			Date date1hbd;
			date1hbd = tstamphbd;
			DateFormat dateFormathbd = new SimpleDateFormat("dd-MM-yyyy");
			String datenowhbd = dateFormat.format(date1hbd);
		

			String monthhbd = datenowhbd.substring(3, 5);
			String yearhbd = datenowhbd.substring(6, 10);
			String dayhbd = datenowhbd.substring(0, 2);
			
			List<Map<String, Object>> happybirthday = userDAO.HappyBirthday(monthhbd, dayhbd);
			request.setAttribute("hbd", happybirthday);count_setAttribute+=1;
			
			request.setAttribute("useron", logonUser);count_setAttribute+=1;

			Date d = new Date();
			int timecheck = d.getHours();

			request.setAttribute("timecheck", timecheck);count_setAttribute+=1;
			
			m.put("timecheck", timecheck);
			m.put("useron", logonUser);
			m.put("hbd", happybirthday);
			m.put("lastusercheckout", lastusercheck2);
			m.put("lastusercheckin", lastusercheck1);
			m.put("GOOGLE_API_KEY", "AIzaSyDQajNmqwu5dl6tJ3nnOoYhnRl2ndchKAg");
			m.put("nocheckin", chn);
			m.put("nocheckout", yyy);
			m.put("weekcheck", week);
			m.put("holidaycheck", holidaycheck);
			m.put("leavecheck", leavecheck);
			m.put(logonUser, ytd);
			m.put("ytd", ytd);
			m.put("ytime", ytime);
			checkinjson.add(m);
			Gson gson = new GsonBuilder().create();
			String responseJSON = gson.toJson(checkinjson);
			request.setAttribute("json", responseJSON);
			
			return SUCCESS;
		} catch (Exception e) {
			
			return ERROR;
		}
	}

}
