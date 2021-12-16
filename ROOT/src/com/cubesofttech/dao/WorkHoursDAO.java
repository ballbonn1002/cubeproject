package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.User;
import com.cubesofttech.model.WorkHours;


public interface WorkHoursDAO {
    
    public void save(WorkHours workHours) throws Exception;
    
    public List<Map<String, Object>> checkStatusCheckIn(String month, String year, String limit) throws Exception;
    public List<Map<String, Object>> checkStatusLate(String month, String year, String limit)throws Exception;
        
    public List<WorkHours> findAll() throws Exception;
    
    public WorkHours findByWorkHoursId(int workHoursId) throws Exception;
    
    public WorkHours findById(String id) throws Exception;
    
    public WorkHours findById(int id) throws Exception;
    
    public void update(WorkHours workHours) throws Exception;
    
    public void delete(WorkHours workHours) throws Exception;

	public List<WorkHours> search(String workHoursId) throws Exception;

	public List<Map<String, Object>> checkhistory(String currentUserhistory, String month, String year) throws Exception;
	
	public List<Map<String, Object>> checklist(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	
	public List<Map<String, Object>> timemonth(String currentUserlist,String month, String year) throws Exception;
	
	public List<Map<String, Object>> checklistcalendar(String currentUserlist,String month, String year) throws Exception;
	
	public List<Map<String, Object>> checklistcalendars(String datecheckin, String currentUserlist, String month, String year) throws Exception;
	
	public List<Map<String, Object>> idcheckinsearchcheckout(String datecheckin, String idinsearchout, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	
	public List<Map<String, Object>> checkincalendars(String datecheckin, String currentUserlist, String month, String year) throws Exception;
	
	public List<Map<String, Object>> idcheckoutcalendars(String idcheckin, String currentUserlist) throws Exception;

	public List<Map<String, Object>> timecheckoutfromid(String idcheckoutsearchtime) throws Exception;
	
	public List<Map<String, Object>> lastcheckin(String user) throws Exception;

	
	public List<Map<String, Object>> idcheckincalendars(String datecheckin, String currentUserlist, String month, String year) throws Exception;

	
	public List<Map<String, Object>> checklistcalendarstime(String datecheckin, String currentUserlist, String month, String year) throws Exception;
	
	public List<Map<String, Object>> searchList(String Username, java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchListall(java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchListalltime(java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchHis(String Username, java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchHisall(java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> checkIn(String Username) throws Exception;

	Integer getMaxId() throws Exception;
	
	public List<Map<String, Object>> checkinhourtime(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore) throws Exception;
	
	public List<Map<String, Object>> checkouthourtime(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore) throws Exception;
	
	public List<Map<String, Object>> checkinmintime(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore) throws Exception;
	
	public List<Map<String, Object>> checkoutmintime(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore) throws Exception;
	
	public List<Map<String, Object>> searchcheckinhourtime(String Username, java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	
	public List<Map<String, Object>> checktimehours(String currentUserlist, String date, String month, String year) throws Exception;
	
	public List<Map<String, Object>> check_in(String currentUserlist) throws Exception;
	
	public List<Map<String, Object>> checktimemin(String currentUserlist, String date, String month, String year) throws Exception;
	
	public List<Map<String, Object>> usertype1(String currentUserlist) throws Exception;
	
	public List<Map<String, Object>> checkdate(String currentUserlist) throws Exception;
	
	public List<Map<String, Object>> checktime(String currentUserlist, String month, String year) throws Exception;
	
	public List<Map<String, Object>> checktimecalendar(String currentUserlist, String month, String year) throws Exception;

	
	public List<Map<String, Object>> timecheckin (String currentUserlist) throws Exception;
	
	public List<Map<String, Object>> datecheckin (String currentUserlist) throws Exception;
	
	public List<Map<String, Object>> startmonth(String currentUserlist ,String month, String year) throws Exception;
	
//	20/03
	public List<Map<String, Object>> checkStatus(String currentUserlist,String month, String year) throws Exception;
	
	public List<Map<String, Object>> searchListalltimeapprove(java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchListallapprove(java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchListallapprovecheckin(java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchListallapprovecheckinuser(String Username,java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> checklistapprove(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	
	public List<Map<String, Object>> checklistapprovecheckout(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	
	public List<Map<String, Object>> checklistapprovestatus(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	
	public List<Map<String, Object>> checklistapprovestatusall(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	
	public List<Map<String, Object>> checklistapprovestatusall1(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	
	public List<Map<String, Object>> timecheckout(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;

	public List<Map<String, Object>> checktimeapprove(String currentUserlist, String month, String year) throws Exception;
	
	public List<Map<String, Object>> worksearchapprove(String Username, java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> worksearchapproveall(String Username, java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	public List<Map<String, Object>> searchcheckinhourtimeapprove(String Username, java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	
	
	public List<Map<String, Object>> checkin(String usercheck, String y, String m, String d) throws Exception;
	
	public List<Map<String, Object>> idtoday(String usercheck, String y, String m, String d) throws Exception;
	
	public List<Map<String, Object>> hourtimeidtodaycheckin(String usercheck, String id) throws Exception;
	
	public List<Map<String, Object>> mintimeidtodaycheckin(String usercheck, String id) throws Exception;

	public List<Map<String, Object>> fullidtimecheckout(String usercheck, String y, String m, String d) throws Exception;
	
	public List<Map<String, Object>> searchidcheckintomorrow(String usercheck, String idcheckintoday) throws Exception;
	
	public List<Map<String, Object>> searchtimehourcheckintomorrow(String usercheck, String idcheckintoday) throws Exception;
	
	public List<Map<String, Object>> searchtimemincheckintomorrow(String usercheck, String idcheckintoday) throws Exception;
	
	public List<Map<String, Object>> timeidcheckouthour(String id) throws Exception;
	
	public List<Map<String, Object>> timeidcheckoutmin(String id) throws Exception;
	
	public List<Map<String, Object>> checkin1(String usercheck) throws Exception;
	
	public List<Map<String, Object>> timecheckin1(String id) throws Exception;
	
	public List<Map<String, Object>> timecheckin2(String id) throws Exception;

	public List<Map<String, Object>> checklistLL(String id) throws Exception;
	
	//18-01-2019
	public List<Map<String, Object>> checkInMapAll(java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	public List<Map<String, Object>> checkInMap(String name, java.sql.Timestamp Datestart, java.sql.Timestamp Dateend) throws Exception;
	

	public List<Map<String, Object>> graph_workhours(String user, String year) throws Exception;
	public List<Map<String, Object>> graph_workhours_out(String user, String year) throws Exception;
	public List<String> graph_workhours_avg_in(String user, String year) throws Exception;
	public List<String> graph_workhours_avg_in(String year) throws Exception;
	public List<String> graph_workhours_avg_out(String user, String year) throws Exception;
	public List<String> graph_workhours_avg_out(String year) throws Exception;
	public  String graph_workhours_in_avg(String year) throws Exception;
	public  String graph_workhours_out_avg(String year) throws Exception ;

	List<Map<String, Object>> workallTime() throws Exception;
	//search user list that have no description
	public List<Map<String, Object>> searchByMonthAndYearDescriptionNull(String monthSelect, String yearSelect,int amoutDataInt) throws Exception;
	//search user list that have description
	public List<Map<String, Object>> searchByMonthAndYearDescriptionNotNull(String monthSelect, String yearSelect) throws Exception;
	//search work time by user and plused by 480(8hrs)
	public List<Map<String, Object>> searchWorkCountDescriptionNotNullbyUser(String user,int year,int month) throws Exception;
	//search work time by user one by one
	public List<Map<String, Object>> searchWorkCountbyUser(String user,int year,int month) throws Exception;
	
	//search today check in/out 
	public List<Map<String, Object>> QRchecklist(String work_hour_id) throws Exception;

	public List<Map<String, Object>> QRchecktime(String work_hour_id) throws Exception;

	public List<Map<String, Object>> check_work(String currentUserlist, String type) throws Exception;

	public List<Map<String, Object>> alertm(String user, String date) throws Exception;
	
	public List<Map<String, Object>> checkholiday(String date) throws Exception;
	
	public List<Map<String, Object>> checkleave(String date) throws Exception;
	
	public List<Map<String, Object>> test_workhoursummary(String id, int year) throws Exception;
	
	public List<Map<String, Object>> test_timeckeckin(String type,String logonUser,int year) throws Exception;

	public List<Map<String, Object>> test_workhoursummary2(String id,int year) throws Exception ;
	
	public List<Map<String, Object>> test_workHoursAnniversary() throws Exception ;
	
	public List<Map<String, Object>> test_lastWorkHour(int year) throws Exception ;
	
	public List<Map<String, Object>> test_lastWorkHour2(int year) throws Exception ;
	
	public List<Map<String, Object>> todayLogin(String date) throws Exception;

	public List<Map<String, Object>> lastcheckout(String user) throws Exception;
	
	/* check In today or not? */
	public List<Map<String, Object>> getTodayCheckInById (String id) throws Exception;

	public List<Map<String, Object>> getTodayCheckOutById(String id) throws Exception;
	public List<Map<String , Object>> Duplicate_Workhour_list(String name,String year)throws Exception;
	 public List<Map<String , Object>> Duplicate_Workhour(String daylist,String id,String year) throws Exception;
	List<Map<String, Object>> getTimeByDate(String date, String user, String type);
	 List<Map<String, Object>> Work_Hoursesheet( String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  , String year , String month) throws Exception;
	

	 List<Map<String, Object>> Work_Hoursesheettimesearchall(String year) throws Exception;
	 
	 List<Map<String, Object>> Work_Hoursesheettimesearch(String name,String year,String month) throws Exception;
	 List<Map<String, Object>> Work_Hoursesheettimesearch2(String name,String year) throws Exception;
	 List<Map<String, Object>> Work_Hoursesheettimesearchall(String year , String month) throws Exception;
	 List<Map<String, Object>> Work_Hoursesheettimesearchall2(String year) throws Exception;
	 // UserIn Out
	 List<Map<String, Object>> Userwork(String username,String month,String year) throws Exception;
	 List<Map<String, Object>> UserworkOUT(String username,String month,String year) throws Exception;
	 List<Map<String, Object>> UserworkAllMonth(String username,String year) throws Exception;
	 List<Map<String, Object>> UserworkAllMonthOUT(String username,String year) throws Exception;
	 List<Map<String, Object>> UserworkYear(String username,String year) throws Exception;
	 List<Map<String, Object>> UserworkOUTYear(String username,String year) throws Exception;
	 
	 List<Map<String, Object>> lastusercheckin() throws Exception;
	 List<Map<String, Object>> lastusercheckout() throws Exception;

	 List<Map<String, Object>> descheckin(String currentUserlist, java.sql.Timestamp Datenow, java.sql.Timestamp DateBefore  ,String month, String year) throws Exception;
	 // Count CheckList Until today
	 
	 public List<Map<String, Object>> Count_checkList(String user,String start_mouth, String today) throws Exception;
}
