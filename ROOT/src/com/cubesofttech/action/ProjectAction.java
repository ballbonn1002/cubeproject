package com.cubesofttech.action;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.ProjectDAO;
import com.cubesofttech.dao.ProjectFunctionDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.Project;
import com.cubesofttech.model.ProjectFunction;
import com.cubesofttech.model.User;
import com.cubesofttech.model.Timesheet;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport {

	public static final String ONLINEUSER = "onlineUser";
	private static final long serialVersionUID = 1L;

	List<Project> projectList;
	Project project;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	ProjectDAO projectDAO;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private ProjectFunctionDAO projectFunctionDAO;
	
	@Autowired
	private TimesheetDAO timesheetDAO;

	private Integer project_id;
	private String project_name;
	private String description;
	private String userCreate;
	private String projectFunctionList;

	public String Init() {
		try {

			projectList = projectDAO.findProjectAll();
			//List<Map<String, Object>>projectList =  projectDAO.projectlist();
			request.setAttribute("projectList", projectList);
			System.out.println(projectList);
			
			List<Map<String, Object>>functionlist =  projectDAO.functionlist();
			request.setAttribute("functionlist", functionlist);
			
			//List<Timesheet>timesheetlist = timesheetDAO.findAll();
			//request.setAttribute("timesheetlist", timesheetlist);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String deleteProject() {
		try {
			project = projectDAO.findById(project_id);
			if (project != null) {
				projectDAO.delete(project);
				projectFunctionDAO.deleteByProject(project_id);

			}

			//projectList = projectDAO.findProjectAll();
			//request.setAttribute("projectList", projectList);
			

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String AddProjectPage() {

		try {
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			userCreate = ur.getName();

			List<Map<String, Object>> cubeUser = userDAO.sequense();
			request.setAttribute("cubeUser", cubeUser);

			request.setAttribute("userCreate", userCreate);

			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String addProject() {
		try {
			User user = (User) request.getSession().getAttribute(ONLINEUSER);

			Project project = new Project();
			project.setProject_name(project_name);
			project.setDescription(description);
			project.setUser_create(user.getId());
			project.setTime_create(DateUtil.getCurrentTime());

			projectDAO.save(project);

			List<String> functionArray = Arrays.asList(projectFunctionList.split(","));

			if (!functionArray.isEmpty() && functionArray.size() > 1) {
				for (int i = 0; i < functionArray.size(); i += 2) {
					ProjectFunction function = new ProjectFunction();
					function.setFunction_name(functionArray.get(i));
					function.setStatus(functionArray.get(i + 1));
					function.setProject_id(project.getProject_id());
					function.setUser_create(user.getId());
					function.setTime_create(DateUtil.getCurrentTime());

					projectFunctionDAO.save(function);

				}
			}

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String editProjectPage() {
		try {
			project_id = Integer.parseInt(request.getParameter("project_id"));
			project = projectDAO.findById(project_id);
			List<Map<String, Object>> cubeUser = userDAO.sequense();
			List<ProjectFunction> projectFunctionList = projectFunctionDAO.findByProject(project_id);

			request.setAttribute("cubeUser", cubeUser);
			request.setAttribute("project", project);
			request.setAttribute("projectFunctionList", new Gson().toJson(projectFunctionList));
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String editProject() {
		try {
			User user = (User) request.getSession().getAttribute(ONLINEUSER);

			Project project = new Project();
			project = projectDAO.findById(project_id);

			project.setProject_name(project_name);
			project.setDescription(description);
			project.setTime_update(DateUtil.getCurrentTime());
			project.setUser_update(user.getId());

			projectDAO.save(project);

			List<String> functionArray = Arrays.asList(projectFunctionList.split(","));

			if (functionArray != null) {
				projectFunctionDAO.deleteByProject(project_id);
				for (int i = 0; i < functionArray.size(); i += 3) {
					ProjectFunction function = projectFunctionDAO.findById(Integer.parseInt(functionArray.get(i)));
					
					//List<ProjectFunction> oldFuncs = projectFunctionDAO.findByProject(project_id);
					
					if (function != null) {
						function.setFunction_name(functionArray.get(i + 1));
						function.setStatus(functionArray.get(i + 2));
						function.setTime_update(DateUtil.getCurrentTime());
						function.setUser_update(user.getId());
						projectFunctionDAO.update(function);
					} else {
						ProjectFunction functionNew = new ProjectFunction();
						functionNew.setFunction_name(functionArray.get(i + 1));
						functionNew.setStatus(functionArray.get(i + 2));
						functionNew.setProject_id(project.getProject_id());
						functionNew.setUser_create(user.getId());
						functionNew.setTime_create(DateUtil.getCurrentTime());

						projectFunctionDAO.save(functionNew);
					}
				}

				
			}

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public Integer getProject_id() {
		return project_id;
	}

	public void setProject_id(Integer project_id) {
		this.project_id = project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProjectFunctionList() {
		return projectFunctionList;
	}

	public void setProjectFunctionList(String projectFunctionList) {
		this.projectFunctionList = projectFunctionList;
	}

}
