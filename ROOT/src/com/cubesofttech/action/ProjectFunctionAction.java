package com.cubesofttech.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.cubesofttech.dao.ProjectFunctionDAO;
import com.cubesofttech.model.ProjectFunction;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;

public class ProjectFunctionAction {
	public static final String ONLINEUSER = "onlineUser";
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	private ProjectFunctionDAO projectFunctionDAO;
	
	private String function_name;
	private Integer function_id;
	
	public void Add() throws IOException {
		try {
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String userName = ur.getId();
			
			ProjectFunction projectFunction = new ProjectFunction();
			projectFunction.setFunction_name(function_name);
			projectFunction.setUser_create(userName);
			projectFunction.setTime_create(DateUtil.getCurrentTime());
			
			projectFunctionDAO.save(projectFunction);
			response.getWriter().write("SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("ERROR");
		}
	}
	
	public void Delete() throws IOException {
		try {
			ProjectFunction projectFunction = projectFunctionDAO.findById(function_id);
			if (projectFunction != null) {
				projectFunctionDAO.delete(projectFunction);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getFunction_name() {
		return function_name;
	}

	public void setFunction_name(String function_name) {
		this.function_name = function_name;
	}
	
	public Integer getFunction_id() {
		return function_id;
	}

	public void setFunction_id(Integer function_id) {
		this.function_id = function_id;
	}
}
