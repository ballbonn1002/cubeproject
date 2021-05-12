package com.cubesofttech.ms;


import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.WorkHours;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.ibm.icu.text.SimpleDateFormat;
import com.opensymphony.xwork2.ActionSupport;

public class WorkHoursMS extends ActionSupport {

	private static final long serialVersionUID = 1L;
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String ONLINEUSER = "onlineUser";
	public static final String USERSEQ = "userseq";
	public static final String USERID = "userId";
	public static final String ARTICLEID = "articleId";
	public static final String ARTICLELIST = "articleList";

	String id;
	String work_hours_type;
	String work_hours_time_work;
	String latitude;
	String longitude;
	String description = "";
	String userAgent;
	String ip_address;
	String user_create;

	@Autowired
	private WorkHoursDAO workHoursDAO;

	public String checkInAndOut() {

//		log.debug("work_hours_type: " + work_hours_type);
//		log.debug("latitude: " + latitude);
//		log.debug("longitude: " + longitude);
//		log.debug("description: " + description);
//		log.debug("userAgent: " + userAgent);
//		log.debug("ip_address: " + ip_address);
//		log.debug("user_create: " + user_create);
		
		try {
			WorkHours workHours = new WorkHours();
			if(work_hours_type.equals("1")) {
				//case CheckIn
			
				workHours.setWorkinghours(0);
				
			}else if(work_hours_type.equals("2")){
				//case CheckOut
			
				
				List<Map<String, Object>> workHoursList = workHoursDAO.getTodayCheckInById(user_create);

				Date dateCheckIn = new Date(); //get last checkIn
				Date dateCheckOut = new Date();
				
				if (!workHoursList.isEmpty()) {
					String dateCheckInStr = workHoursList.get(0).get("work_hours_time_work").toString();
					 SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
					 dateCheckIn=formatter.parse(dateCheckInStr);
					
				} else {
					log.debug("workHoursList: Null");
					workHours.setWorkinghours(0);
				}
				
				//get difference of datetime type minutes
				long workHourTime = getDateDiff(dateCheckIn, dateCheckOut, TimeUnit.MINUTES);

				
				
				workHours.setWorkinghours((int)workHourTime);
			}else {
				log.debug("error type workhours");
			}
			
			Date date = new Date();
			Timestamp timeCreate = new Timestamp(date.getTime());
			Integer maxWorkHourId = workHoursDAO.getMaxId();
			
			workHours.setWorkHoursId(maxWorkHourId + 1);
			workHours.setWorkHoursType(work_hours_type);
			workHours.setDescription(description);
			workHours.setWorkHoursTimeWork(timeCreate);
			workHours.setLatitude(latitude);
			workHours.setLongitude(longitude);
			workHours.setUserAgent(userAgent);
			workHours.setIpAddress(ip_address);
			workHours.setUserCreate(user_create);
			workHours.setTimeCreate(timeCreate);
			
			workHoursDAO.save(workHours);
			log.debug(workHours);
			
			JsonObject jsonObj = new JsonObject();
			jsonObj.addProperty("status", "success");
			
			Gson gson = new GsonBuilder().create();
			String responseJSON = gson.toJson(jsonObj);

			request.setAttribute("json", responseJSON);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			
			return ERROR;
		}
	}
	
	public String lateCheckInAndOut() {

//		log.debug("work_hours_type: " + work_hours_type);
//		log.debug("workHoursTimeWork: " + work_hours_time_work);
//		log.debug("latitude: " + latitude);
//		log.debug("longitude: " + longitude);
//		log.debug("description: " + description);
//		log.debug("userAgent: " + userAgent);
//		log.debug("ip_address: " + ip_address);
//		log.debug("user_create: " + user_create);
		
		try {
			WorkHours workHours = new WorkHours();
			if(work_hours_type.equals("1")) {
				//case CheckIn
				workHours.setWorkinghours(0);
			}else if(work_hours_type.equals("2")){
				//case CheckOut
			
				List<Map<String, Object>> workHoursList = workHoursDAO.getTodayCheckInById(user_create);

				Date dateCheckIn = new Date(); //get last checkIn
				Date dateCheckOut = new Date();
				
				if (!workHoursList.isEmpty()) {
					String dateCheckInStr = workHoursList.get(0).get("work_hours_time_work").toString();
					 SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
					 dateCheckIn=formatter.parse(dateCheckInStr);
					
				} else {
					log.debug("workHoursList: Null");
					workHours.setWorkinghours(0);
				}
				
				//get difference of datetime type minutes
				long workHourTime = getDateDiff(dateCheckIn, dateCheckOut, TimeUnit.MINUTES);
				workHours.setWorkinghours((int)workHourTime);
			}else {
				log.debug("error type workhours");
			}
			
			//convert string date to date object
			Date workHoursTimeWorkDate = new Date();
			SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			workHoursTimeWorkDate = formatter.parse(work_hours_time_work);
			//convert date to timestamp
			Timestamp workHoursTimeWorkTimeStamp = new Timestamp(workHoursTimeWorkDate.getTime());;
			
			if(workHoursTimeWorkTimeStamp.before(new Date())) {
				log.debug("status time is before");
				
				Date date = new Date();
				Timestamp timeCreate = new Timestamp(date.getTime());
				Integer maxWorkHourId = workHoursDAO.getMaxId();
				
				workHours.setWorkHoursId(maxWorkHourId + 1);
				workHours.setWorkHoursType(work_hours_type);
				workHours.setWorkHoursTimeWork(workHoursTimeWorkTimeStamp);
				workHours.setDescription(description);
				workHours.setLatitude(latitude);
				workHours.setLongitude(longitude);
				workHours.setUserAgent(userAgent);
				workHours.setIpAddress(ip_address);
				workHours.setUserCreate(user_create);
				workHours.setTimeCreate(timeCreate);
				
				workHoursDAO.save(workHours);
				log.debug(workHours);
				
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("status", "success");
				
				Gson gson = new GsonBuilder().create();
				String responseJSON = gson.toJson(jsonObj);

				request.setAttribute("json", responseJSON);
				
				
			}else {
				log.debug("status time is after" + new Date());
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("status", "ErrorTimeFuture");
				Gson gson = new GsonBuilder().create();
				String responseJSON = gson.toJson(jsonObj);
				request.setAttribute("json", responseJSON);
			}
			
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			
			return ERROR;
		}
	}

	public String getWorkHoursById() {
		try {
			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();

			// get first date of year
			int currentYear = Calendar.getInstance().get(Calendar.YEAR);

			String startFirstDate = "01-01-" + currentYear;
			// get last date of year
			String endLastDate = "12-12-" + currentYear;

			Timestamp mystartStamp = DateUtil.myDateStart(startFirstDate);
			Timestamp myEndStamp = DateUtil.myDateEnd(endLastDate);

			List<Map<String, Object>> workHours = workHoursDAO.searchHis(id, mystartStamp, myEndStamp);

			String responseJSON = gson.toJson(workHours);

			request.setAttribute("json", responseJSON);
			//log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getWorkHoursOnMonth() {
		try {
			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();

			// get first date of year
			int currentYear = Calendar.getInstance().get(Calendar.YEAR);

			String startFirstDate = "01-01-" + currentYear;
			// get last date of year
			String endLastDate = "12-12-" + currentYear;

			Timestamp mystartStamp = DateUtil.myDateStart(startFirstDate);
			Timestamp myEndStamp = DateUtil.myDateEnd(endLastDate);

			List<Map<String, Object>> workHours = workHoursDAO.searchHis(id, mystartStamp, myEndStamp);

//			String t = workHours.get(0).get("time_create").toString();
//			System.out.print(t);

			String responseJSON = gson.toJson(workHours);

			request.setAttribute("json", responseJSON);
			//log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	
	public String getLastCheckIn () {
		try {
			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();



			List<Map<String, Object>> workHours = workHoursDAO.lastcheckin(id); //ex. 2020-09-21 08:06:04
			

			String responseJSON = gson.toJson(workHours.get(0));

			request.setAttribute("json", responseJSON);
			//log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String checkInTodayOrNot() {
		try {
			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();

			List<Map<String, Object>> workHours = workHoursDAO.getTodayCheckInById(id);

			if (workHours.isEmpty()) {
				log.debug("workHours: Null");
			} else {

			}

			String responseJSON = gson.toJson(workHours);

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	
	public String checkOutTodayOrNot() {
		try {
			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();

			List<Map<String, Object>> workHours = workHoursDAO.getTodayCheckOutById(id);

			if (workHours.isEmpty()) {
				log.debug("workHours: Null");
			} else {

			}

			String responseJSON = gson.toJson(workHours);

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String getAllWorkHours() {
		try {

			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(workHoursDAO.findAll());

			request.setAttribute("json", responseJSON);
			// log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
	    long diffInMillies = date2.getTime() - date1.getTime();
	    return timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);
	}
	
	public static boolean isFutureDate(Date date) throws ParseException {
        return new Date().before(date);
}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWork_hours_type() {
		return work_hours_type;
	}

	public void setWork_hours_type(String work_hours_type) {
		this.work_hours_type = work_hours_type;
	}
	

	public String getWork_hours_time_work() {
		return work_hours_time_work;
	}

	public void setWork_hours_time_work(String work_hours_time_work) {
		this.work_hours_time_work = work_hours_time_work;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getIp_address() {
		return ip_address;
	}

	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}

	public String getUser_create() {
		return user_create;
	}

	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}

}
