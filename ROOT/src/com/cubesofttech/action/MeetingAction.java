package com.cubesofttech.action;

import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.MeetingDAO;
import com.cubesofttech.dao.RoomDAO;
import com.cubesofttech.model.Meeting;
import com.cubesofttech.model.Room;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class MeetingAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private static final Logger log = Logger.getLogger(FaqAction.class);
	@Autowired
	 private MeetingDAO meetingDAO;
	@Autowired
	 private RoomDAO roomDAO;
	
	public String myMeetingList() {
		User ur = (User) request.getSession().getAttribute("onlineUser");
		String user = ur.getId();
		Timestamp today = DateUtil.getCurrentTime();
		try {
			List<Map<String, Object>> myNowMeetlist = meetingDAO.myNowMeet(user,today);
			request.setAttribute("Statusbar", myNowMeetlist);
			List<Map<String, Object>> myAllMeetlist = meetingDAO.myAllMeet(user);
			request.setAttribute("Calendar", myAllMeetlist);
			
		
		return SUCCESS;
		}catch(Exception e) {
		return ERROR;
		}
	}
	public String selectRoom() {
			System.out.println("hello");
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String user = ur.getId();
			String date = new SimpleDateFormat("yyyy-MM-dd").format(DateUtil.getCurrentTime());
			List<Map<String, Object>> listPerDay = meetingDAO.findAll();
			request.setAttribute("AllMeetperDay", listPerDay);
	//		List<Map<String, Object>> listToday = meetingDAO.myTodayMeet(user,today);
	//		request.setAttribute("listToday", listToday);
			List<Map<String, Object>> checkRoom = meetingDAO.checkRoomToday(date);
			request.setAttribute("checkRoomToday", checkRoom);
			List<Map<String, Object>> amountRoom = roomDAO.getAmountRoom();
			request.setAttribute("amountRoom", amountRoom);
			String today = new SimpleDateFormat("dd-MMMM-yyyy").format(DateUtil.getCurrentTime());
			request.setAttribute("today", today);
			request.setAttribute("date", date);
			return SUCCESS;
		}catch(Exception e) {
			log.error(e);
			System.out.println("outtttt");
			return ERROR;}
	}
	public String createRoom() {
		
		Room room=new Room();
		try {
		String room_name=request.getParameter("room_name");
		String user_create=request.getParameter("user_create");
		String user_update=request.getParameter("user_create");
		
		room.setRoom_name(room_name);
		room.setUser_create(user_create);
		room.setUser_update(user_update);
		room.setTime_create(DateUtil.getCurrentTime());
		room.setTime_update(DateUtil.getCurrentTime());
		roomDAO.save(room);
		return SUCCESS;
		}catch(Exception e) {
		return ERROR;
		}
	}
	public String updateRoom() {
		try {
			Integer idroom=Integer.parseInt(request.getParameter("idroom"));
			Room room=roomDAO.findById(idroom);
			String room_name=request.getParameter("room_name");
			String user_update=request.getParameter("user_update");
			
			room.setRoom_name(room_name);
			room.setUser_update(user_update);
			room.setTime_update(DateUtil.getCurrentTime());
			roomDAO.update(room);
			return SUCCESS;
			}catch(Exception e) {
			return ERROR;
			}
	}
	public String reserveRoom() {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("hh:mm");
			SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			Meeting meet=new Meeting();
			String name = request.getParameter("user_reserve");
			String start=request.getParameter("time_start");
			String end=request.getParameter("time_end");
			Date dateParse= formatDate.parse("2021-09-02");
			int idroom=Integer.parseInt(request.getParameter("idroom"));
			java.sql.Time time_start = new java.sql.Time(formatter.parse(start).getTime());
			java.sql.Time time_end = new java.sql.Time(formatter.parse(end).getTime());
			java.sql.Date date = new java.sql.Date(dateParse.getTime());
			System.out.println(date);
			meet.setUser_reserve(name);
			meet.setTime_start(time_start);	
			meet.setTime_end(time_end);
			meet.setDate(date);
			meet.setIdroom(idroom);
			meetingDAO.save(meet); 
			System.out.println("Reserve Success");
			
			return SUCCESS;
		
		}catch(Exception e) {return ERROR;}
	}
}