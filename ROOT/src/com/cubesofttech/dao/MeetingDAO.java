package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Meeting;

public interface MeetingDAO {
	public List<Map<String, Object>> checkRoomToday(String today) throws Exception;
	public List<Map<String, Object>> myTodayMeet(String userid,String today) throws Exception;
	public List<Map<String, Object>> findAllperDay(String today) throws Exception ;
	public List<Map<String, Object>> hourPerDay() throws Exception;
	public List<Map<String, Object>> myNowMeet(String userid,Timestamp today) throws Exception;
	public List<Map<String, Object>> myAllMeet(String userid) throws Exception;
	public List<Map<String, Object>> emptyRoom(Timestamp today) throws Exception;
	public Meeting findById(Integer idmeeting) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;

	public void save(Meeting meeting) throws Exception;

	public void update(Meeting meeting) throws Exception;

	public void delete(Meeting meeting) throws Exception;
}
