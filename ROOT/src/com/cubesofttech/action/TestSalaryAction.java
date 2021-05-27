package com.cubesofttech.action;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.NewsDAO;
import com.cubesofttech.dao.SalaryUserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.opensymphony.xwork2.ActionSupport;


public class TestSalaryAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(FaqAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	@Autowired
	private HolidayDAO holidayDAO;
	
	@Autowired
	private WorkHoursDAO workhoursDAO;
	
	@Autowired
	private SalaryUserDAO salaryuserDAO;
	
	@Autowired
	private NewsDAO newsDAO;
	
	
	
	public String Sumsalary() throws Exception {
		//String[] user_saraly = null;
		try {
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
		
		
		request.setAttribute("Absents", Absent);
		
		return SUCCESS;
		}catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
}
