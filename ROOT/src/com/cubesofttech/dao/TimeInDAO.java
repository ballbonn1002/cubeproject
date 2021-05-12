package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

public interface TimeInDAO {

	public List<Map<String, Object>> TimeInList(String month ,String year , String Userid);
	public List<Map<String, Object>> HolidayForTimeinList(String month , String year);
	public List<Map<String, Object>> LeaveForTimeinList(String month ,String year ,String Userid);
}
