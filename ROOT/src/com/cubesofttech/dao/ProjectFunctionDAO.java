package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Project;
import com.cubesofttech.model.ProjectFunction;


public interface ProjectFunctionDAO {
	public void save(ProjectFunction projectFunction) throws Exception;

	public void update(ProjectFunction projectFunction) throws Exception;

	public void delete(ProjectFunction projectFunction) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;
	
	public List<ProjectFunction> findByProject(Integer project_id) throws Exception;
	
	public void deleteByProject(Integer project_id) throws Exception;

	public ProjectFunction findById(Integer function_id) throws Exception;
	
	public boolean checkExistByName(String function_name) throws Exception;
	
	public List<ProjectFunction> findFunction(Integer findpfunc) throws Exception;
	
	public ProjectFunction findByName(String functionName) throws Exception;
}
