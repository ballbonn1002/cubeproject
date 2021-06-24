package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.HistorySalary;
import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.Salary;
import com.cubesofttech.model.Salary_user;
import com.cubesofttech.model.Timesheet;

public interface SalaryUserDAO {
	public List<Salary_user> findAll() throws Exception;
	public void save(Salary_user salary_user) throws Exception;
	public void update(Salary_user salary_user) throws Exception;
	public void delete(Salary_user salary_user) throws Exception;
	public Salary_user findById(Integer id) throws Exception;
	public List<Map<String, Object>> findAll2() throws Exception;
	public List<Map<String, Object>> findAll3() throws Exception;
	public List<Map<String, Object>> findAllbyid(Integer id) throws Exception;
	
	public List<Map<String, Object>> findUser() throws Exception;

	public List<Map<String, Object>> salarylist(String month, String year) throws Exception;
	
	public List<Map<String, Object>> notsatsun(String month, String year) throws Exception;
	public List<Map<String, Object>> workdays(String month, String year) throws Exception;
	public List<Map<String, Object>> latedayall(String month1,String year)throws Exception;
	public List<Map<String, Object>> leavenotsatsun(String month1, String year)throws Exception;
	public List<Map<String, Object>> leavehalfday(String month1, String year)throws Exception;
	public List<Map<String, Object>> multipleDay(String month1, String year) throws Exception;
	public List<Map<String, Object>> serchnamejob(String userid)throws Exception;
	
	public void save_history(HistorySalary historysalary) throws Exception;
	
	public List<Map<String, Object>> find_historybyname(String user,String start_mouth, String today) throws Exception;
	
	public List<Map<String, Object>> findAll4() throws Exception;
	
	public List<Map<String, Object>> find_late(String user,String start_mouth, String today) throws Exception;
	
	public void save_salary(Salary salary) throws Exception;
}
