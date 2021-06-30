package com.cubesofttech.action;

import java.io.File;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FeedDAO;
import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.LeaveDAO;
import com.cubesofttech.dao.NewsDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.News;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport {

	private static final long serialVersionUID = 2280661337420278284L;

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	@Autowired
	private NewsDAO newsDAO;

	@Autowired
	private FeedDAO feedDAO;

	@Autowired
	private FileUploadDAO fileuploadDAO;

	@Autowired
	private LeaveDAO leaveDAO;

	@Autowired
	private HolidayDAO holidayDAO;

	@Autowired
	public TimesheetDAO timesheetDAO;

	@Autowired
	public UserDAO userDAO;
	
	@Autowired
	public WorkHoursDAO workhoursDAO;

	private int newId;

	private User user;

	private String userId;

	private String title_News;

	private String detail_News;

	private int mynewsId;

	private File fileUpload;

	private String fileUploadFileName;

	private String userUploadId;

	private String userUploadCreate;

	private String fileUploadSize;

	private int mypic;

	private int allNews;

	public int getAllNews() {
		return allNews;
	}

	public void setAllNews(int allNews) {
		this.allNews = allNews;
	}

	public int getMypic() {
		return mypic;
	}

	public void setMypic(int mypic) {
		this.mypic = mypic;
	}

	public int getNewId() {
		return newId;
	}

	public void setNewId(int newId) {
		this.newId = newId;
	}

	public String getFileUploadSize() {
		return fileUploadSize;
	}

	public void setFileUploadSize(String fileUploadSize) {
		this.fileUploadSize = fileUploadSize;
	}

	public String getUserUploadCreate() {
		return userUploadCreate;
	}

	public void setUserUploadCreate(String userUploadCreate) {
		this.userUploadCreate = userUploadCreate;
	}

	public String getUserUploadId() {
		return userUploadId;
	}

	public void setUserUploadId(String userUploadId) {
		this.userUploadId = userUploadId;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getMynewsId() {
		return mynewsId;
	}

	public void setMynewsId(int mynewsId) {
		this.mynewsId = mynewsId;
	}

	public String getTitle_News() {
		return title_News;
	}

	public void setTitle_News(String title_News) {
		this.title_News = title_News;
	}

	public String getDetail_News() {
		return detail_News;
	}

	public void setDetail_News(String detail_News) {
		this.detail_News = detail_News;
	}

	public static final String NEWSFEED = "newsfeed";
	public static final String ONLINEUSER = "onlineUser";
	public static final String NODAY = "no_day";
	public static final String WORKHOURS = "workinghours";
	public static final String WORKTIMESTRAT = "work_time_start";

	public String feedList() {
		try {
			String plusLimit = request.getParameter("mylimit");
			int limit = 0;
			if (plusLimit != null) {
				limit = Integer.parseInt(plusLimit);
			}
			int realLimit = 5 + limit;
			request.setAttribute(NEWSFEED, newsDAO.listnews(realLimit));
			request.setAttribute("realLimit", realLimit);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String moreFeedList() {
		try {
			String plusLimit = request.getParameter("mylimit");
			int limit = 0;
			if (plusLimit != null) {
				limit = Integer.parseInt(plusLimit);
			}
			int realLimit = 5 + limit;
			List<Map<String, Object>> newsfeed = newsDAO.listnews(realLimit);
			allNews = newsfeed.get(0).get("allnews").hashCode();
			if (realLimit > allNews || realLimit < allNews) {
				String showHidebtn = "display: none;";
				request.setAttribute("show_hidebtn", showHidebtn);
			} else {
				String showHidebtn = "";
				request.setAttribute("show_hidebtn", showHidebtn);
			}
			request.setAttribute(NEWSFEED, newsDAO.listnews(allNews));
			request.setAttribute("allNews", allNews);
			return SUCCESS;
		}

		catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String addNews() {
		try {
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			request.setAttribute(NEWSFEED, newsDAO.mynews(ur.getId()));
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String performEdit() {
		try {
			News news = newsDAO.findById(newId);
			Integer fileId = news.getFileId();
			if (fileId != null) {
				request.setAttribute("pathfile", newsDAO.find_filepath(fileId));
			}
			request.setAttribute("news", news);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String editNews() {
		try {
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId();
			FileUpload fileupload = new FileUpload();
			System.out.print(fileupload);
			Integer mynewsid = Integer.valueOf(mynewsId);
			News ne = newsDAO.findById(mynewsid);
			ne.setNewsId(mynewsId);
			ne.setNewsHead(title_News);
			ne.setNewsDescription(detail_News);
			ne.setTimeUpdate(DateUtil.getCurrentTime());
			ne.setUserUpdate(logonUser);
			newsDAO.update(ne);
			int picture = mypic;
			if (picture > 0) {
				if (fileUpload != null) {
					int maxId = fileuploadDAO.getMaxId();
					ServletContext context = request.getServletContext();
					String fileServerPath = context.getRealPath("/");
					fileupload.setSize(fileUploadSize);
					String fileName = fileUploadFileName;
					fileupload.setPath("/upload/user/" + maxId + "_" + fileName);
					FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId + "_" + fileName);

					int l = fileUploadFileName.length();
					int split = fileUploadFileName.indexOf('.');
					String name = fileUploadFileName.substring(0, split);
					String type = (String) fileUploadFileName.subSequence(split, l);

					fileupload.setFileId(maxId);
					fileupload.setUserId(logonUser);
					fileupload.setUserCreate(logonUser);
					fileupload.setName(name);
					fileupload.setType(type);
					fileupload.setTimeCreate(DateUtil.getCurrentTime());
					fileuploadDAO.update(fileupload);
					System.out.print(fileupload);
					ne.setFileId(maxId);
					newsDAO.update(ne);
				}
			} else {
				if (fileUpload != null) {
					int maxId2 = fileuploadDAO.getMaxId() + 1;
					ServletContext context = request.getServletContext();
					String fileServerPath = context.getRealPath("/");
					fileupload.setSize(fileUploadSize);
					String fileName = fileUploadFileName;
					fileupload.setPath("/upload/user/" + maxId2 + "_" + fileName);
					FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId2 + "_" + fileName);

					int l = fileUploadFileName.length();
					int split = fileUploadFileName.indexOf('.');
					String name = fileUploadFileName.substring(0, split);
					String type = (String) fileUploadFileName.subSequence(split, l);

					fileupload.setFileId(maxId2);
					fileupload.setUserId(logonUser);
					fileupload.setUserCreate(logonUser);
					fileupload.setName(name);
					fileupload.setType(type);
					fileupload.setTimeCreate(DateUtil.getCurrentTime());
					fileuploadDAO.save(fileupload);
					System.out.print(fileupload);
					ne.setFileId(maxId2);
					newsDAO.update(ne);
				}
			}
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String delete() {
		try {

			User ur = (User) request.getSession().getAttribute(ONLINEUSER);

			News news = new News();
			news.setNewsId(Integer.valueOf(request.getParameter("news_id")));
			newsDAO.delete(news);

			request.setAttribute(NEWSFEED, newsDAO.mynews(ur.getId()));
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String saveNewsFeed() {
		try {

			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId();

			int maxId = fileuploadDAO.getMaxId() + 1;

			FileUpload fileupload = new FileUpload();
			System.out.print(fileUploadFileName);
			if (fileUpload != null) {
				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");
				fileupload.setSize(fileUploadSize);
				String fileName = fileUploadFileName;
				fileupload.setPath("/upload/user/" + maxId + "_" + fileName);
				FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId + "_" + fileName);
				System.out.println(fileUploadFileName);
				int l = fileUploadFileName.length();
				int split = fileUploadFileName.indexOf('.');
				String name = fileUploadFileName.substring(0, split);
				String type = (String) fileUploadFileName.subSequence(split, l);

				fileupload.setFileId(maxId);
				fileupload.setUserId(logonUser);
				fileupload.setUserCreate(logonUser);
				fileupload.setName(name);
				fileupload.setType(type);
				fileupload.setTimeCreate(DateUtil.getCurrentTime());
				fileuploadDAO.save(fileupload);

				News ns = new News();
				ns.setFileId(maxId);
				ns.setUserCreate(logonUser);
				ns.setNewsId(newsDAO.getMaxId() + 1);
				ns.setNewsHead(title_News);
				ns.setNewsDescription(detail_News);
				ns.setTimeCreate(DateUtil.getCurrentTime());
				newsDAO.save(ns);
				request.setAttribute(NEWSFEED, newsDAO.listnews(5));
			} else {
				News ns = new News();
				ns.setUserCreate(logonUser);
				ns.setNewsId(newsDAO.getMaxId() + 1);
				ns.setNewsHead(title_News);
				ns.setNewsDescription(detail_News);
				ns.setTimeCreate(DateUtil.getCurrentTime());
				newsDAO.save(ns);
				request.setAttribute(NEWSFEED, newsDAO.listnews(5));
			}
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String dashList() {
		try {
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId();
			request.setAttribute("sumtravel", newsDAO.sumtravelPrice());
			request.setAttribute("News", newsDAO.dashboardNews());
			request.setAttribute("Goodem", newsDAO.mostcometoWork());
			request.setAttribute("totalborrowNows", newsDAO.sumItem());
			request.setAttribute("myobtainMoney", newsDAO.obtainTravel(logonUser));

			int yearNow = DateUtil.checkCurrentYear();
			if (yearNow > 2500) {
				yearNow = yearNow - 543;
			}
			request.setAttribute("mytravel", newsDAO.totaltravel(logonUser));
			request.setAttribute("myleaves", newsDAO.totallyleaves(logonUser, yearNow));

			BigDecimal x1 = new BigDecimal(0);
			BigDecimal x2 = new BigDecimal(0);
			BigDecimal x3 = new BigDecimal(0);
			BigDecimal x4;
			BigDecimal x5 = new BigDecimal(0);
			BigDecimal x6 = new BigDecimal(0);
			BigDecimal x7 = new BigDecimal(0);
			List<Map<String, Object>> wanla1 = leaveDAO.findleaveallByType(logonUser, 1);
			List<Map<String, Object>> wanla2 = leaveDAO.findleaveallByType(logonUser, 2);
			List<Map<String, Object>> wanla3 = leaveDAO.findleaveallByType(logonUser, 3);
			List<Map<String, Object>> wanla5 = leaveDAO.findleaveallByType(logonUser, 4);
			List<Map<String, Object>> wanla6 = leaveDAO.findleaveallByType(logonUser, 5);
			List<Map<String, Object>> wanla7 = leaveDAO.findleaveallByType(logonUser, 9);
			int n1 = wanla1.size();
			int n2 = wanla2.size();
			int n3 = wanla3.size();
			int n5 = wanla5.size();
			int n6 = wanla6.size();
			int n9 = wanla7.size();
			for (int i = 0; i < n1; i++) {
				BigDecimal a = (BigDecimal) wanla1.get(i).get(NODAY);

				BigDecimal b = a;

				x1 = b.add(x1);

				request.setAttribute("x1", x1);

			}

			for (int i = 0; i < n2; i++) {
				BigDecimal a = (BigDecimal) wanla2.get(i).get(NODAY);

				BigDecimal b = a;

				x2 = b.add(x2);

				request.setAttribute("x2", x2);

			}

			for (int i = 0; i < n3; i++) {
				BigDecimal a = (BigDecimal) wanla3.get(i).get(NODAY);

				BigDecimal b = a;

				x3 = b.add(x3);

				request.setAttribute("x3", x3);

			}
			for (int i = 0; i < n5; i++) {
				BigDecimal a = (BigDecimal) wanla5.get(i).get(NODAY);

				BigDecimal b = a;

				x5 = b.add(x5);

				request.setAttribute("x5", x5);
			}

			for (int i = 0; i < n6; i++) {
				BigDecimal a = (BigDecimal) wanla6.get(i).get(NODAY);

				BigDecimal b = a;

				x6 = b.add(x6);

				request.setAttribute("x6", x6);

			}
			for (int i = 0; i < n9; i++) {
				BigDecimal a = (BigDecimal) wanla7.get(i).get(NODAY);

				BigDecimal b = a;

				x7 = b.add(x7);

				request.setAttribute("x7", x7);

			}
			x4 = x1.add(x2).add(x3).add(x5).add(x6).add(x7);
			request.setAttribute("x4", x4);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String user_dashboard() throws Exception {
		// variable
		BigDecimal Leavesum = new BigDecimal(0);
		Integer Hday = 0, Tday = 0;

		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String monthnow = strDate.substring(5, 7);
		String yearnow = strDate.substring(0, 4);
		User urs = (User) request.getSession().getAttribute(ONLINEUSER);
		String logonUsers = urs.getId();

		List<Map<String, Object>> checkin = newsDAO.checkin(logonUsers, monthnow, yearnow);
		List<Map<String, Object>> checkout = newsDAO.checkout(logonUsers, monthnow, yearnow);
		List<Map<String, Object>> leves = newsDAO.leves(logonUsers, monthnow, yearnow);
		List<Map<String, Object>> userpath = feedDAO.userpath(logonUsers);
		request.setAttribute("userpath", userpath);
		List<Map<String, String>> timeline = new ArrayList<>();
		List<Map<String, String>> timelinefirst = new ArrayList<>();
		
if(checkin.size() == 0 || checkout.size() == 0) {
	
}else {
	for(int i=0 ; i< checkin.size();i++) {
		for(int j=0 ; j<checkout.size() ;j++ ) {
			if(checkin.get(i).get("fulldate").equals(checkout.get(j).get("fulldate"))) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("fulldate", (String) checkin.get(i).get("fulldate"));
				map.put("user_create", (String) checkin.get(i).get("user_create"));
				map.put("checkin", (String) checkin.get(i).get("timework"));
				map.put("checkout", (String) checkout.get(j).get("timework"));
				map.put("leave", null);
				timeline.add(map);
			}
			
		}			
	}	
}
	
if(leves.size() == 0) {
	
}	else {
	for(int i = 0 ;i< leves.size();i++) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("fulldate", (String) leves.get(i).get("fulldate"));
		map.put("user_create", (String) leves.get(i).get("user_create"));
		map.put("checkin", null);
		map.put("checkout", null);
		map.put("leave", "วันลา");
		timeline.add(map);
	}
}

if(timeline.size() == 0 ) {
	
}else {
	Map<String, String> map1 = new HashMap<String, String>();
	map1.put("fulldate", (String) checkin.get(0).get("fulldate"));
	map1.put("user_create", (String) checkin.get(0).get("user_create"));
	map1.put("checkin", (String) checkin.get(0).get("timework"));
	map1.put("checkout", (String) checkout.get(0).get("timework"));
	map1.put("leave",  (String) checkout.get(0).get("leave"));
	timelinefirst.add(map1);
	
}
		if (timeline.size() == 0) {
			request.setAttribute("timeline", null);

			request.setAttribute("months", monthnow);
			request.setAttribute("yearsearch", yearnow);
		} else {
			timeline.remove(0);
			request.setAttribute("timeline", timeline);

			request.setAttribute("months", monthnow);
			request.setAttribute("yearsearch", yearnow);
		}

		if (timelinefirst.size() == 0) {
			request.setAttribute("timelinefirst", null);

			request.setAttribute("months", monthnow);
			request.setAttribute("yearsearch", yearnow);
		} else {
			request.setAttribute("timelinefirst", timelinefirst);

			request.setAttribute("months", monthnow);
			request.setAttribute("yearsearch", yearnow);
		}
		

		// ----------------- Sum Calendar of now MONTH -----------------
		Calendar calendar = Calendar.getInstance();
		int days = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		log.debug("DAY  "+days);

		
		
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
		for (Date date : disable) {
//			 System.out.println(fmt.format(date));
			Hday += 1;
		}
		

		// ----------------- Total Day Work -----------------
		Tday = days - Hday;
		
		
		//------------------Sut,Sun Until today------------------------
				List<Date> endweek = new ArrayList<>();
				Calendar cals = Calendar.getInstance();
				cals.set(Calendar.DAY_OF_MONTH, 1);
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				String start_mouth = format1.format(cals.getTime());
				String today = format1.format(Calendar.getInstance().getTime());
				float Ssday = 0;
				
				//System.out.println(cals.getTime());
				String formatted1 = format1.format(Calendar.getInstance().getTime());
				//System.out.println(format1.format(Calendar.getInstance().getTime()));
				//System.out.println(format1.format(cals.getTime()));
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
				//SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
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
				User ch_user = (User) request.getSession().getAttribute(ONLINEUSER);
				String Check_user = ch_user.getId();
				//System.out.println("Check_user = " + Check_user);
				List<Map<String, Object>> count_checklist = workhoursDAO.Count_checkList(Check_user,start_mouth, today);
				BigInteger counts = ((BigInteger) count_checklist.get(0).get("count_workday"));
				float checkList = counts.floatValue();
		
		//------------------ count today-------------------------------------------
				Date date_start =  format1.parse(start_mouth);
				Date date_today =  format1.parse(today);
				long diff = date_today.getTime() - date_start.getTime();
				float month_to_present = (diff / (1000*60*60*24))+1;
		
				
		try {

			// ----------------- sum userID Leave -----------------
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId();
			//System.out.println(logonUser);
			List<Map<String, Object>> sul = newsDAO.searchUserLeave(logonUser, monthnow, yearnow);

			request.setAttribute("searchUserLeave", sul);
			for (int i = 0; i < sul.size(); i++) {

				BigDecimal sulonday = (BigDecimal) sul.get(i).get(NODAY);
//				System.out.println(sulonday);
				Leavesum = sulonday.add(Leavesum);
				
				
				
			}
			 
			//--------------------- sum Absent ------------------------------------------
			float Leave_me = Leavesum.floatValue();
			//System.out.println(month_to_present);
			//System.out.println(Ssday);
			//System.out.println(Holidays);
			//System.out.println(checkList);
			//System.out.println(Leave_me);
			float Absent = month_to_present - (Ssday+Holidays+checkList+Leave_me);
			//System.out.println(Absent);
			

//			System.out.println("userLeave  " + Leavesum);
			// ----------------- END sum userID Leave -----------------

			// ----------------- findHolidayMonth -----------------

			List<Map<String, Object>> holidayList = holidayDAO.findHolidayMonth(monthnow, yearnow);
//			System.out.println("Holi  "+holidayList.size());
			// ----------------- END findHolidayMonth -----------------

			// ----------------- finduserWork CheckIn -----------------
			List<Map<String, Object>> userWork = timesheetDAO.finduserWork(logonUser, monthnow, yearnow);
//			System.out.println("user checkIn " + userWork.size());
			Double dTday = Double.valueOf(Tday);
			Double dHolidayList = Double.valueOf(holidayList.size());

			Double sumday = dTday - dHolidayList;
			String newdatadate = "";
			List<Map<String, Object>> datafromsql = timesheetDAO.findcurrent(logonUser, monthnow, yearnow);
			Double dataworkuser = Double.valueOf(datafromsql.size());
			Double newusersumday = (sumday - (dataworkuser + Leavesum.floatValue()));
			List<Map<String, Object>> datadate = new ArrayList();
			datadate = timesheetDAO.getdate(monthnow, yearnow);
			for (Map<String, Object> map1 : datadate) {
				Object ly = map1.get("currentdata");
				newdatadate = ly.toString();
			}
			newusersumday = newusersumday - Double.parseDouble(newdatadate); 	
//			System.out.println(usersumday);
			// ----------------- END finduserWork CheckIn -----------------

			// ----------------- User Late -----------------
			List<Map<String, Object>> TimeUserWork = userDAO.findTimeUserWork(logonUser);
			String TimeStratWork = (String) TimeUserWork.get(0).get(WORKTIMESTRAT);


			String tF = "0", tL = ":00", tS = null;

			if (TimeStratWork.equals("0:00") || TimeStratWork.equals("00:00")) {
				request.setAttribute("userlatenum", 0);
				request.setAttribute("userlate", "*");
			} else if (TimeStratWork.length() == 4 || TimeStratWork.equals("8:00") || TimeStratWork.equals("9:00")
					|| TimeStratWork.equals("8:30")) {
				tS = tF + TimeStratWork + tL;
			} else if (TimeStratWork.length() == 5 || TimeStratWork.equals("08:00") || TimeStratWork.equals("09:00")
					|| TimeStratWork.equals("08:30")) {
				tS = TimeStratWork + tL;
			}

			// 0:00 08:00 09:00 9:00 8:00
//			if (TimeStratWork.equals("8:00")) {
//				tS = tF + TimeStratWork + tL;
//			} else if (TimeStratWork.equals("08:00")) {
//				tS = TimeStratWork + tL;
//			} else if (TimeStratWork.equals("9:00")) {
//				tS = tF + TimeStratWork + tL;
//			} else if (TimeStratWork.equals("09:00")) {
//				tS = TimeStratWork + tL;
//			} else if (TimeStratWork.equals("8:30")) {
//				tS = tF + TimeStratWork + tL;
//			} else if (TimeStratWork.equals("08:30")) {
//				tS = TimeStratWork + tL;
//			} else {
//				request.setAttribute("userlatenum", 0);
//				request.setAttribute("userlate", "*");
//			}

//			System.out.println(tS);
			if (!TimeStratWork.equals("0:00") && !TimeStratWork.equals("00:00")) {
				List<Map<String, Object>> userlate = newsDAO.finduserLate(logonUser, monthnow, yearnow, tS);
//				System.out.println(userlate.size()+"  "+ userlate);
				String aString = Integer.toString(userlate.size());
				request.setAttribute("userlate", aString);
				request.setAttribute("userlatenum", userlate.size());
			}

//			System.out.println("user late " + userlate.size());
			// ----------------- END User Late -----------------

			// ----------------- User WORK HOURS -----------------
			List<Map<String, Object>> userWorkCheckOut = timesheetDAO.finduserWorkCheckOut(logonUser, monthnow,
					yearnow);
			Integer sumworkhours = 0;
			for (int j = 0; j < userWorkCheckOut.size(); j++) {
//				System.out.println(userWorkCheckOut.size());
				Integer workhours = (Integer) userWorkCheckOut.get(j).get(WORKHOURS);
//				System.out.println("WORKHOURS" + (j + 1) + ": " + workhours);
				sumworkhours += workhours;
			}

			BigDecimal WH = new BigDecimal(sumworkhours);
			long longVal = WH.longValue();
			int hours = (int) longVal / 60;
			int remainder = (int) longVal - hours * 60;
			int mins = remainder / 1;

			int[] ints = { hours, mins };

			SimpleDateFormat sdfDate1 = new SimpleDateFormat("yyyy-MMM-dd");
			String strDate1 = sdfDate1.format(now);
			String monthnowMMM = strDate1.substring(5, 8);

			// ----------------- END User WORK HOURS -----------------

			// ----------------- User WORK Project -----------------
			List<Map<String, Object>> userWorkProject = timesheetDAO.finduserWorkProject(logonUser, monthnow, yearnow);
			// ----------------- END User WORK Project -----------------

			request.setAttribute("Leavesum", Leavesum);

			
			request.setAttribute("usersumday", Absent);
			
			request.setAttribute("userWork", userWork.size());
			request.setAttribute("Tday", sumday);
//			request.setAttribute("userlate", userlate.size());
			request.setAttribute("userWorkProject", userWorkProject);
			request.setAttribute("HH", ints[0]);
			request.setAttribute("MM", ints[1]);
			request.setAttribute("monthnow", monthnowMMM);
			request.setAttribute("yearnow", yearnow);
			request.setAttribute("months", monthnow);
//			System.out.println("********************");
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	private Object removeTheElement(List<Map<String, Object>> tilmeline, int i) {
		// TODO Auto-generated method stub
		return null;
	}

	public String timeline() throws Exception {

		User urs = (User) request.getSession().getAttribute(ONLINEUSER);
		String logonUsers = urs.getId();
		String monthsearch = request.getParameter("month");
		String yearsearch = request.getParameter("yearSearch");

		List<Map<String, Object>> userpath = feedDAO.userpath(logonUsers);
		request.setAttribute("userpath", userpath);
		List<Map<String, Object>> checkin = newsDAO.checkin(logonUsers, monthsearch, yearsearch);
		List<Map<String, Object>> checkout = newsDAO.checkout(logonUsers, monthsearch, yearsearch);
		
		List<Map<String, String>> timeline = new ArrayList<>();
		List<Map<String, String>> timelinefirst = new ArrayList<>();
		if(checkin.size() == 0 || checkout.size() == 0) {
			
		}else {
			for(int i=0 ; i< checkin.size();i++) {
				for(int j=0 ; j<checkout.size() ;j++ ) {
					if(checkin.get(i).get("fulldate").equals(checkout.get(j).get("fulldate"))) {
						Map<String, String> map = new HashMap<String, String>();
						map.put("fulldate", (String) checkin.get(i).get("fulldate"));
						map.put("user_create", (String) checkin.get(i).get("user_create"));
						map.put("checkin", (String) checkin.get(i).get("timework"));
						map.put("checkout", (String) checkout.get(j).get("timework"));
						map.put("leave", null);
						timeline.add(map);
					}
					
				}			
			}	
		}
		
		
		




		if(timeline.size() == 0 ) {
			
		}else {
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("fulldate", (String) checkin.get(0).get("fulldate"));
			map1.put("user_create", (String) checkin.get(0).get("user_create"));
			map1.put("checkin", (String) checkin.get(0).get("timework"));
			map1.put("checkout", (String) checkout.get(0).get("timework"));
			map1.put("leave",  null);
			timelinefirst.add(map1);
			
		}

	
		timeline.sort(Comparator.comparing(o -> String.valueOf(o.get("fulldate"))));
	
		if (timeline.size() == 0) {
			request.setAttribute("timeline", null);

			request.setAttribute("months", monthsearch);
			request.setAttribute("yearsearch", yearsearch);
		} else {
		

			timeline.remove(0);
			request.setAttribute("timeline", timeline);

			request.setAttribute("months", monthsearch);
			request.setAttribute("yearsearch", yearsearch);
		}

		if (timelinefirst.size() == 0) {
			request.setAttribute("timelinefirst", null);

			request.setAttribute("months", monthsearch);
			request.setAttribute("yearsearch", yearsearch);
		} else {
			request.setAttribute("timelinefirst", timelinefirst);

			request.setAttribute("months", monthsearch);
			request.setAttribute("yearsearch", yearsearch);
		}
		

		BigDecimal Leavesum = new BigDecimal(0);
		Integer Hday = 0, Tday = 0;

		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String monthnow = strDate.substring(5, 7);
		String yearnow = strDate.substring(0, 4);
		User ur = (User) request.getSession().getAttribute(ONLINEUSER);
		String logonUser = ur.getId();

		request.setAttribute("monthnow", monthnow);
		request.setAttribute("yearnow", yearnow);

		// ----------------- Sum Calendar of now MONTH -----------------
		Calendar calendar = Calendar.getInstance();
		int days = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
//		System.out.println("DAY  "+days);

		// ----------------- Sut,SunDAY of now MONTH -----------------

		List<Date> disable = new ArrayList<>();
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int month1 = cal.get(Calendar.MONTH);
		do {
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY)
				disable.add(cal.getTime());

			cal.add(Calendar.DAY_OF_MONTH, 1);
		} while (cal.get(Calendar.MONTH) == month1);

		SimpleDateFormat fmt = new SimpleDateFormat("EEE M/d/yyyy");
		for (Date date : disable) {
//			 System.out.println(fmt.format(date));
			Hday += 1;
		}

		// ----------------- Total Day Work -----------------
		Tday = days - Hday;
//		System.out.println("day of month: " + days);
//		System.out.println("sat sun: " + Hday);
//		System.out.println("Total: " + Tday);

		try {

			// ----------------- sum userID Leave -----------------
			User ur1 = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser1 = ur1.getId();

			List<Map<String, Object>> sul = newsDAO.searchUserLeave(logonUser1, monthnow, yearnow);

			request.setAttribute("searchUserLeave", sul);
			for (int i = 0; i < sul.size(); i++) {

				BigDecimal sulonday = (BigDecimal) sul.get(i).get(NODAY);
//				System.out.println(sulonday);
				Leavesum = sulonday.add(Leavesum);

			}

//			System.out.println("userLeave  " + Leavesum);
			// ----------------- END sum userID Leave -----------------

			// ----------------- findHolidayMonth -----------------

			List<Map<String, Object>> holidayList = holidayDAO.findHolidayMonth(monthnow, yearnow);
//			System.out.println("Holi  "+holidayList.size());
			// ----------------- END findHolidayMonth -----------------

			// ----------------- finduserWork CheckIn -----------------
			List<Map<String, Object>> userWork = timesheetDAO.finduserWork(logonUser1, monthnow, yearnow);
//			System.out.println("user checkIn " + userWork.size());

			Double dTday = Double.valueOf(Tday);
			Double dHolidayList = Double.valueOf(holidayList.size());
			Double dUserWork = Double.valueOf(userWork.size());

			Double sumday = dTday - dHolidayList;

			Double usersumday = (sumday);
//			System.out.println(usersumday);
			// ----------------- END finduserWork CheckIn -----------------

			// ----------------- User Late -----------------
			List<Map<String, Object>> TimeUserWork = userDAO.findTimeUserWork(logonUser1);
			System.out.println(TimeUserWork);
			String TimeStratWork = (String) TimeUserWork.get(0).get(WORKTIMESTRAT);

			String tF = "0", tL = ":00", tS = null;

			if (TimeStratWork.equals("0:00") || TimeStratWork.equals("00:00")) {
				request.setAttribute("userlatenum", 0);
				request.setAttribute("userlate", "*");
			} else if (TimeStratWork.length() == 4 || TimeStratWork.equals("8:00") || TimeStratWork.equals("9:00")
					|| TimeStratWork.equals("8:30")) {
				tS = tF + TimeStratWork + tL;
			} else if (TimeStratWork.length() == 5 || TimeStratWork.equals("08:00") || TimeStratWork.equals("09:00")
					|| TimeStratWork.equals("08:30")) {
				tS = TimeStratWork + tL;
			}

			// 0:00 08:00 09:00 9:00 8:00
//			if (TimeStratWork.equals("8:00")) {
//				tS = tF + TimeStratWork + tL;
//			} else if (TimeStratWork.equals("08:00")) {
//				tS = TimeStratWork + tL;
//			} else if (TimeStratWork.equals("9:00")) {
//				tS = tF + TimeStratWork + tL;
//			} else if (TimeStratWork.equals("09:00")) {
//				tS = TimeStratWork + tL;
//			} else if (TimeStratWork.equals("8:30")) {
//				tS = tF + TimeStratWork + tL;
//			} else if (TimeStratWork.equals("08:30")) {
//				tS = TimeStratWork + tL;
//			} else {
//				request.setAttribute("userlatenum", 0);
//				request.setAttribute("userlate", "*");
//			}

//			System.out.println(tS);
			if (!TimeStratWork.equals("0:00") && !TimeStratWork.equals("00:00")) {
				List<Map<String, Object>> userlate = newsDAO.finduserLate(logonUser1, monthnow, yearnow, tS);
//				System.out.println(userlate.size()+"  "+ userlate);
				String aString = Integer.toString(userlate.size());
				request.setAttribute("userlate", aString);
				request.setAttribute("userlatenum", userlate.size());
			}

//			System.out.println("user late " + userlate.size());
			// ----------------- END User Late -----------------

			// ----------------- User WORK HOURS -----------------
			List<Map<String, Object>> userWorkCheckOut = timesheetDAO.finduserWorkCheckOut(logonUser1, monthnow,
					yearnow);
			Integer sumworkhours = 0;
			for (int j = 0; j < userWorkCheckOut.size(); j++) {
//				System.out.println(userWorkCheckOut.size());
				Integer workhours = (Integer) userWorkCheckOut.get(j).get(WORKHOURS);
//				System.out.println("WORKHOURS" + (j + 1) + ": " + workhours);
				sumworkhours += workhours;
			}

			BigDecimal WH = new BigDecimal(sumworkhours);
			long longVal = WH.longValue();
			int hours = (int) longVal / 60;
			int remainder = (int) longVal - hours * 60;
			int mins = remainder / 1;

			int[] ints = { hours, mins };

			SimpleDateFormat sdfDate1 = new SimpleDateFormat("yyyy-MMM-dd");
			String strDate1 = sdfDate1.format(now);
			String monthnowMMM = strDate1.substring(5, 8);

			// ----------------- END User WORK HOURS -----------------

			// ----------------- User WORK Project -----------------
			List<Map<String, Object>> userWorkProject = timesheetDAO.finduserWorkProject(logonUser1, monthnow, yearnow);
			// ----------------- END User WORK Project -----------------

			request.setAttribute("Leavesum", Leavesum);
			if (usersumday < 0) {
				request.setAttribute("usersumday", 0);
			} else {
				request.setAttribute("usersumday", usersumday);
			}

			request.setAttribute("userWork", userWork.size());
			request.setAttribute("Tday", sumday);
//			request.setAttribute("userlate", userlate.size());
			request.setAttribute("userWorkProject", userWorkProject);
			request.setAttribute("HH", ints[0]);
			request.setAttribute("MM", ints[1]);
			request.setAttribute("monthnow", monthnowMMM);
			request.setAttribute("yearnow", yearnow);

//			System.out.println("********************");
			return SUCCESS;

		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	private List<Map<String, String>> sortByKeys(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	private Map<String, Integer> sortByValue(List<Map<String, String>> timeline) {
		// TODO Auto-generated method stub
		return null;
	}
}
