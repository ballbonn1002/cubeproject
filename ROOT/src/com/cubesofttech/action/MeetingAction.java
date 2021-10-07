package com.cubesofttech.action;

import java.util.Calendar;
import java.util.Date;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.InvitingDAO;
import com.cubesofttech.dao.MeetingDAO;
import com.cubesofttech.dao.RoomDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.Meeting;
import com.cubesofttech.model.Room;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class MeetingAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	private static final Logger log = Logger.getLogger(FaqAction.class);
	private static  Calendar cal = Calendar.getInstance(); // Use Calendar .Year
	private static  String checkFlag ="";
	
	@Autowired
	 private MeetingDAO meetingDAO;
	@Autowired
	 private RoomDAO roomDAO;
	@Autowired
	private UserDAO userDAO;
		/*
		 * @Autowired private InvitingDAO InvitingDAO;
		 */
	public String List1() {
		try {
			checkFlag = "0";
			String date = request.getParameter("date");
			String date2 = request.getParameter("date2");
			if(date != null){
				java.util.Date utilDate = new SimpleDateFormat("dd-MM-yyyy").parse(date);
				java.sql.Date meeting_date = new java.sql.Date(utilDate.getTime());
				request.setAttribute("flag12",meeting_date);     
				//flag12 = Set default Date for Calendar
			}
			if(date2 != null){
				request.setAttribute("flag12",date2);      
				//flag12 = Set default Date for Calendar
			}
			List<Map<String, Object>> meetinglist = meetingDAO.findAll_calendar();
			request.setAttribute("meetinglist", meetinglist);
			
			List<Map<String, Object>> Roomlist = roomDAO.findAll();
			request.setAttribute("Roomlist", Roomlist);
			
			String flag_cal = request.getParameter("flag");
			if(flag_cal != null ){
				Calendar cal1 = Calendar.getInstance(); 
				cal = cal1;
			}
			String today = new SimpleDateFormat("yyyy-MM-dd").format(DateUtil.getCurrentTime());
			request.setAttribute("today", today);
			
			int month = cal.get(Calendar.MONTH);
			int year = cal.get(Calendar.YEAR);
			
			request.setAttribute("num_month", month);
			request.setAttribute("num_year", year);
			
			checkFlag ="0";
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public void findnext_year() {
		try {
			String next = request.getParameter("year_next");
			List<Meeting> meetinglist = meetingDAO.findnext_Year(next);
			
			JSONArray arrayObj1 = new JSONArray();
			JSONArray arrayObj2 = new JSONArray();
			JSONArray arrayObj3 = new JSONArray();
			JSONArray arrayObj4 = new JSONArray();
			JSONArray arrayObj5 = new JSONArray();
			
			for(int i = 0 ; i < meetinglist.size(); i++ ) {
				arrayObj1.put(meetinglist.get(i).getIdmeeting());
				arrayObj2.put(meetinglist.get(i).getDate().toString());
		    	arrayObj3.put(meetinglist.get(i).getTime_start().toString());
		    	arrayObj4.put(meetinglist.get(i).getTime_end().toString());
		    	arrayObj5.put(meetinglist.get(i).getUser_reserve());
			}
			
			PrintWriter out = response.getWriter();
			JSONObject json = new JSONObject();
			
			json.put("id", arrayObj1);
		    json.put("title", arrayObj3 + " - " + arrayObj4);
		    json.put("start", arrayObj2);
		    
		    out.print(json);
		 	out.flush();
		 	out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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
			String flag = request.getParameter("flag");
			String date_cal = request.getParameter("date_cal");	
			System.out.println(date_cal);
			
			List<Map<String, Object>> userseq = userDAO.sequense();
			request.setAttribute("userseq", userseq);
			System.out.println("11111xxxx");
			
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String user = ur.getId();
			String date = new SimpleDateFormat("yyyy-MM-dd").format(DateUtil.getCurrentTime());
			List<Map<String, Object>> listPerDay = meetingDAO.findAll(date_cal);
			request.setAttribute("AllMeetperDay", listPerDay);
	//		List<Map<String, Object>> listToday = meetingDAO.myTodayMeet(user,today);
	//		request.setAttribute("listToday", listToday);
			List<Map<String, Object>> checkRoom = meetingDAO.checkRoomToday(date_cal);
			request.setAttribute("checkRoomToday", checkRoom);
			List<Map<String, Object>> amountRoom = roomDAO.getAmountRoom();
			request.setAttribute("amountRoom", amountRoom);
			String today = new SimpleDateFormat("dd-MMMM-yyyy").format(DateUtil.getCurrentTime());
			request.setAttribute("date_cal", date_cal);
			request.setAttribute("today", today);
			request.setAttribute("date", date);
			return SUCCESS;
		}catch(Exception e) {
			log.error(e);
			System.out.println("outtttt");
			return ERROR;}
	}
	public String createRoom() {
		
		Room room = new Room();
		try {
		String room_name = request.getParameter("room_name");
		String user_create = request.getParameter("user_create");
		String user_update = request.getParameter("user_create");
		
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
	
	/*
	 * //inviting public String inviting_list() { try { List<Map<String, Object>>
	 * Invitinglist = InvitingDAO.findAll(); request.setAttribute("Invitinglist",
	 * Invitinglist); System.out.println(Invitinglist); return SUCCESS; } catch
	 * (Exception e) { log.error(e); return ERROR; }
	 * 
	 * }
	 * 
	 * public String inviting_add() { try { List<Map<String, Object>> userseq =
	 * userDAO.sequense(); request.setAttribute("userseq", userseq);
	 * List<Map<String, Object>> invitinglist = InvitingDAO.findAll();
	 * request.setAttribute("invitinglist", invitinglist);
	 * 
	 * return SUCCESS; } catch (Exception e) { log.error(e); return ERROR; }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * //meeting public String meeting_list() { try { List<Map<String, Object>>
	 * Meetinglist = meetingDAO.findAll(); request.setAttribute("Meetinglist",
	 * Meetinglist); System.out.println(Meetinglist); return SUCCESS; } catch
	 * (Exception e) { log.error(e); return ERROR; }
	 * 
	 * } public String meeting_add() { try { List<Map<String, Object>> userseq =
	 * userDAO.sequense(); request.setAttribute("userseq", userseq);
	 * List<Map<String, Object>> meetinglist = meetingDAO.findAll();
	 * request.setAttribute("meetinglist", meetinglist);
	 * 
	 * return SUCCESS; } catch (Exception e) { log.error(e); return ERROR; }
	 * 
	 * }
	 * 
	 * //Room public String room_list() { System.out.println("egg"); try {
	 * List<Map<String, Object>> Roomlist = roomDAO.findAll();
	 * request.setAttribute("Roomlist", Roomlist); System.out.println(Roomlist);
	 * return SUCCESS; } catch (Exception e) { log.error(e);
	 * System.out.println("error"); return ERROR; }
	 * 
	 * }
	 * 
	 * public String invitingMember_list() { try { List<Map<String, Object>>
	 * invitingMemberlist = InvitingDAO.findAll2();
	 * request.setAttribute("invitingMemberlist", invitingMemberlist);
	 * System.out.println(invitingMemberlist); return SUCCESS; } catch (Exception e)
	 * { log.error(e); return ERROR; }
	 * 
	 * }
	 */
}