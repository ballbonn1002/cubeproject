package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Jobsite;
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

}
