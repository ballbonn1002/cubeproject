package com.cubesofttech.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.listener.SessionListener;
import com.cubesofttech.model.User;
import com.cubesofttech.model.WorkHours;
import com.ibm.icu.util.GregorianCalendar;

public class Duplicate_WorkHour_Action {
	

	private static final long serialVersionUID = 2280661337420278284L;

	private static final Integer Interger = null;
	
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();


	@Autowired
	private UserDAO userDAO;
	@Autowired
	private WorkHoursDAO workHoursDAO;
	
	private WorkHours workHoursmodel;
	
	public String Duplicate_list () {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			// String uid = user.getId();
			String logonUser = user.getId();
			List<Map<String, Object>> cubeUser;
			cubeUser = userDAO.sequense();
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
			List<Map<String , Object>> check_duplicate = new ArrayList() ;
			List<Map<String, Object>> Duplicatelist = workHoursDAO.Duplicate_Workhour_list(logonUser, year);
			List<String> Duplicate_date = new ArrayList();
			for(Map<String, Object> list : Duplicatelist) {
				if(Integer.valueOf(list.get("check_in_out_count").toString()) > 2) {
					Duplicate_date.add(list.get("workday").toString());
				}
			}
			String daylist = "";
			int Duplicate_date_size = Duplicate_date.size();
			int i = 0;
			if(Duplicate_date != null) {
			for(String x : Duplicate_date) {
				if(Duplicate_date.indexOf(x) == Duplicate_date.size()-1) {
					daylist+="'"+x+"'";
				}else {
					daylist+="'"+x+"',";
				}
				//System.out.println(Duplicate_date.indexOf(x));
				
			}
			}
			
			if(daylist.equalsIgnoreCase("")) {
				daylist += "' '";
			}
			//System.out.println(daylist + "xc");
			String workday = "";
			int check_in_count = 0;
			int check_out_count = 0;
			List<Map<String, Object>> Duplicatelists = workHoursDAO.Duplicate_Workhour(daylist,logonUser,year);
			
			if(Duplicatelists != null) {
				
			for(Map<String, Object> map : Duplicatelists) {
				
				Map<String, Object> checkmap = new HashMap<String, Object>();
				if(workday.equalsIgnoreCase("")) {
					workday = map.get("workday").toString();
				}
				if(workday.equalsIgnoreCase(map.get("workday").toString())) {
					if(map.get("work_hours_type").toString().equalsIgnoreCase("1")) {
						check_in_count += 1;
					}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2")) {
						check_out_count += 1;
					}
					
				}else if(!workday.equalsIgnoreCase(map.get("workday").toString())
						) {
					System.out.println(workday+"==>"+ map.get("workday").toString());
					//checkmap.put("ID", map.get("work_hours_id"));
					checkmap.put("date", workday);
					checkmap.put("checkincount", check_in_count);
					checkmap.put("checkoutcount", check_out_count);
					check_duplicate.add(checkmap);
					check_in_count = 0;
					check_out_count = 0;
					if(map.get("work_hours_type").toString().equalsIgnoreCase("1")) {
						check_in_count += 1;
					}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2")) {
						check_out_count += 1;
					}
					workday = map.get("workday").toString();
				}
				if(Duplicatelists.indexOf(map) == Duplicatelists.size()-1) {
					//checkmap.put("ID", map.get("work_hours_id"));
					checkmap.put("date", workday);
					checkmap.put("checkincount", check_in_count);
					checkmap.put("checkoutcount", check_out_count);
					check_duplicate.add(checkmap);
					check_in_count = 0;
					check_out_count = 0;
					if(map.get("work_hours_type").toString().equalsIgnoreCase("1")) {
						check_in_count += 1;
					}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2")) {
						check_out_count += 1;
					}
				}
				
			}
			}
			//System.out.println(check_duplicate);
			List<Map<String , Object>> date_work_hours_duplicate = new ArrayList();
			if(check_duplicate != null) {
			for(Map<String, Object> Check_dup : check_duplicate) {
				Map<String ,Object> date_work_hours = new HashMap<String, Object>();
				date_work_hours.put("date", Check_dup.get("date").toString());
				if(Integer.valueOf(Check_dup.get("checkincount").toString()) > 1) {
					date_work_hours.put("check_in_del_stat", true);
				}else {
					date_work_hours.put("check_in_del_stat", false);
				}
				
				if(Integer.valueOf(Check_dup.get("checkoutcount").toString()) > 1) {
					date_work_hours.put("check_out_del_stat", true);
				}else {
					date_work_hours.put("check_out_del_stat", false);
				}
				date_work_hours_duplicate.add(date_work_hours);
			}
			}
			//System.out.println(date_work_hours_duplicate);
			List<Map<String , Object>> sendlist = new ArrayList();
			if(Duplicatelists != null) {
			for(Map<String , Object> map : Duplicatelists) {
				Map<String , Object> sendmap = new HashMap<String,Object>();
				sendmap.put("id", map.get("work_hours_id").toString());
				sendmap.put("workday", map.get("workday").toString());
				sendmap.put("work_hours_time_work", map.get("work_hours_time_work").toString());
				sendmap.put("user_create", map.get("user_create").toString());
				sendmap.put("description", map.get("description").toString());
				sendmap.put("work_hours_type", map.get("work_hours_type").toString());
				for(Map<String,Object> innermap : date_work_hours_duplicate) {
					
					if(map.get("workday").toString().equalsIgnoreCase(innermap.get("date").toString())){
						
						if(map.get("work_hours_type").toString().equalsIgnoreCase("1") && Boolean.parseBoolean(innermap.get("check_in_del_stat").toString()) == true) {
							sendmap.put("del_stat", true);
						}else if(map.get("work_hours_type").toString().equalsIgnoreCase("1") && Boolean.parseBoolean(innermap.get("check_in_del_stat").toString()) == false) {
							sendmap.put("del_stat", false);
						}
						
						if(map.get("work_hours_type").toString().equalsIgnoreCase("2") && Boolean.parseBoolean(innermap.get("check_out_del_stat").toString()) == true) {
							sendmap.put("del_stat", true);
						}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2") && Boolean.parseBoolean(innermap.get("check_out_del_stat").toString()) == false) {
							sendmap.put("del_stat", false);
						}
					}
					
				}
				sendlist.add(sendmap);
			}
			}
			request.setAttribute("sendduplicatelist", sendlist); 
			request.setAttribute("Duplicatelist", Duplicatelist);
			request.setAttribute("userId", logonUser);
			request.setAttribute("logonUser", logonUser);
			request.setAttribute("cubeUser", cubeUser);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}
	
	public String Search_Duplicate_list () {
		try {
			String userid = request.getParameter("user.roletId");
			String year = request.getParameter("yearSearch");
			
			User user = (User) request.getSession().getAttribute("onlineUser");
			// String uid = user.getId();
			String logonUser = user.getId();
			List<Map<String, Object>> cubeUser;
			cubeUser = userDAO.sequense();
			
			
			List<Map<String , Object>> check_duplicate = new ArrayList() ;
			List<Map<String, Object>> Duplicatelist = workHoursDAO.Duplicate_Workhour_list(userid, year);
			List<String> Duplicate_date = new ArrayList();
			if(Duplicatelist != null) {
			for(Map<String, Object> list : Duplicatelist) {
				if(Integer.valueOf(list.get("check_in_out_count").toString()) > 2) {
					Duplicate_date.add(list.get("workday").toString());
				}
			}
			}
			String daylist = "";
			int Duplicate_date_size = Duplicate_date.size();
			int i = 0;
			if(Duplicate_date != null) {
			for(String x : Duplicate_date) {
				if(Duplicate_date.indexOf(x) == Duplicate_date.size()-1) {
					daylist+="'"+x+"'";
				}else {
					daylist+="'"+x+"',";
				}
				//System.out.println(Duplicate_date.indexOf(x));
				
			}
			}
			if(daylist.equalsIgnoreCase("")) {
				daylist += "' '";
			}
			String workday = "";
			int check_in_count = 0;
			int check_out_count = 0;
			List<Map<String, Object>> Duplicatelists = workHoursDAO.Duplicate_Workhour(daylist, userid,year);
			//System.out.println(daylist);
			if(Duplicatelists != null) {
			for(Map<String, Object> map : Duplicatelists) {
				Map<String, Object> checkmap = new HashMap<String, Object>();
				if(workday.equalsIgnoreCase("")) {
					workday = map.get("workday").toString();
				}
				if(workday.equalsIgnoreCase(map.get("workday").toString())) {
					if(map.get("work_hours_type").toString().equalsIgnoreCase("1")) {
						check_in_count += 1;
					}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2")) {
						check_out_count += 1;
					}					
				}else if(!workday.equalsIgnoreCase(map.get("workday").toString())
						) {
					System.out.println(workday+"==>"+ map.get("workday").toString());
					//checkmap.put("ID", map.get("work_hours_id"));
					checkmap.put("date", workday);
					checkmap.put("checkincount", check_in_count);
					checkmap.put("checkoutcount", check_out_count);
					check_duplicate.add(checkmap);
					check_in_count = 0;
					check_out_count = 0;
					if(map.get("work_hours_type").toString().equalsIgnoreCase("1")) {
						check_in_count += 1;
					}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2")) {
						check_out_count += 1;
					}
					workday = map.get("workday").toString();
				}
				if(Duplicatelists.indexOf(map) == Duplicatelists.size()-1) {
					//checkmap.put("ID", map.get("work_hours_id"));
					checkmap.put("date", workday);
					checkmap.put("checkincount", check_in_count);
					checkmap.put("checkoutcount", check_out_count);
					check_duplicate.add(checkmap);
					check_in_count = 0;
					check_out_count = 0;
					if(map.get("work_hours_type").toString().equalsIgnoreCase("1")) {
						check_in_count += 1;
					}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2")) {
						check_out_count += 1;
					}
				}
				
			}
			}
			//System.out.println(check_duplicate);
			List<Map<String , Object>> date_work_hours_duplicate = new ArrayList();
			if(check_duplicate != null) {
			for(Map<String, Object> Check_dup : check_duplicate) {
				Map<String ,Object> date_work_hours = new HashMap<String, Object>();
				date_work_hours.put("date", Check_dup.get("date").toString());
				if(Integer.valueOf(Check_dup.get("checkincount").toString()) > 1) {
					date_work_hours.put("check_in_del_stat", true);
				}else {
					date_work_hours.put("check_in_del_stat", false);
				}				
				if(Integer.valueOf(Check_dup.get("checkoutcount").toString()) > 1) {
					date_work_hours.put("check_out_del_stat", true);
				}else {
					date_work_hours.put("check_out_del_stat", false);
				}
				date_work_hours_duplicate.add(date_work_hours);
			}
			}
			//System.out.println(date_work_hours_duplicate);
			List<Map<String , Object>> sendlist = new ArrayList();
			if(Duplicatelists != null) {
			for(Map<String , Object> map : Duplicatelists) {
				Map<String , Object> sendmap = new HashMap<String,Object>();
				sendmap.put("id", map.get("work_hours_id").toString());
				sendmap.put("workday", map.get("workday").toString());
				sendmap.put("work_hours_time_work", map.get("work_hours_time_work").toString());
				sendmap.put("user_create", map.get("user_create").toString());
				sendmap.put("description", map.get("description").toString());
				sendmap.put("work_hours_type", map.get("work_hours_type").toString());
				for(Map<String,Object> innermap : date_work_hours_duplicate) {
					
					if(map.get("workday").toString().equalsIgnoreCase(innermap.get("date").toString())){
						
						if(map.get("work_hours_type").toString().equalsIgnoreCase("1") && Boolean.parseBoolean(innermap.get("check_in_del_stat").toString()) == true) {
							sendmap.put("del_stat", true);
						}else if(map.get("work_hours_type").toString().equalsIgnoreCase("1") && Boolean.parseBoolean(innermap.get("check_in_del_stat").toString()) == false) {
							sendmap.put("del_stat", false);
						}
						
						if(map.get("work_hours_type").toString().equalsIgnoreCase("2") && Boolean.parseBoolean(innermap.get("check_out_del_stat").toString()) == true) {
							sendmap.put("del_stat", true);
						}else if(map.get("work_hours_type").toString().equalsIgnoreCase("2") && Boolean.parseBoolean(innermap.get("check_out_del_stat").toString()) == false) {
							sendmap.put("del_stat", false);
						}
					}
					
				}
				sendlist.add(sendmap);
			}
			}
			request.setAttribute("sendduplicatelist", sendlist); 
			request.setAttribute("Duplicatelist", Duplicatelist);
			request.setAttribute("userId", userid);
			request.setAttribute("logonUser", userid);
			request.setAttribute("cubeUser", cubeUser);
			request.setAttribute("yearSearch", year);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}
	
	public String Duplicate_del() {
		String id = request.getParameter("id");
		try {
			System.out.println(id);
			System.out.println(Integer.valueOf(id));
			workHoursmodel = new WorkHours();
			workHoursmodel.setWorkHoursId(Integer.parseInt(id));
			workHoursDAO.delete(workHoursmodel);
			System.out.println("done");
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		//request.setAttribute("del_a", q);
		
	}
}
