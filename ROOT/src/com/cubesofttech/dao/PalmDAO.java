package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Timesheet;
import com.google.gson.JsonElement;


public interface PalmDAO {


	public List<Map<String, Object>> listtimesheet(String month, String year) throws Exception;
	
	public List<Map<String, Object>> spalm(String userid, String month, String year) throws Exception;
	

	public List<Map<String, Object>> workdays(String month, String year) throws Exception;

	public List<Map<String, Object>> lateday(String userid,String month1,String year)throws Exception;

	public List<Map<String, Object>> latedayall(String month1,String year)throws Exception;

	public List<Map<String, Object>> multipleDay(String userid, String month1, String year) throws Exception;

	public List<Map<String, Object>> multipleDay(String month1, String year) throws Exception;

	public List<Map<String, Object>> notsatsun(String month, String year) throws Exception;

	public List<Map<String, Object>> leavenotsatsun(String month1, String year)throws Exception;
	public List<Map<String, Object>> leavenotsatsun(String userid ,String month1, String year)throws Exception;
	public List<Map<String, Object>> leavehalfday(String month1, String year)throws Exception;
	public List<Map<String, Object>> leavehalfdayuser(String month1, String year)throws Exception;
	
	public List<Map<String, Object>> date1sttonow(String todaydatenow, String todaydatefirst)throws Exception;
//	public List<Map<String, Object>> spalmleave(String userid, String month, String year) throws Exception;
	
	public List<Map<String, Object>> plamuserleave(String userid, String dateStartSearch, String dateEndSearch)throws Exception;
	
	public List<Map<String, Object>> serchnamejob(String userid)throws Exception;
}

