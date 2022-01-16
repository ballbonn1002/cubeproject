package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Project;
import com.cubesofttech.model.ProjectFunction;



public interface ProjectDAO {
	public void save(Project project) throws Exception;
	public void update(Project project) throws Exception;
	public void delete(Project project) throws Exception;
	public List<Project> findProjectAll() throws Exception;
	public List<Map<String, Object>> findFunctions(Integer project_id) throws Exception;
	public List<Map<String, Object>> findProjectAndFunctionAll() throws Exception;
	public Project findById(Integer project_id) throws Exception;
	public List<Map<String, Object>> allproject() throws Exception;
	public List<Map<String, Object>> allfunction(String listId) throws Exception;
	public boolean checkExistByName(String projectName);
	public Project findByName(String projectName);
	public List<Map<String, Object>> projectlist() throws Exception;
	public List<Map<String, Object>> functionlist() throws Exception;
	
}
