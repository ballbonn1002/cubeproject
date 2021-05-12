package com.cubesofttech.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.model.ArticleType;

import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.dao.ArticleTypeDAO;

public class ArticleTypeAction {

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String ONLINEUSER = "onlineUser";


	@Autowired
	private ArticleTypeDAO articleTypeDAO;

	private String name;

	public void Add() throws IOException {
		try {

			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String userName = ur.getId();

			if (articleTypeDAO.checkExistByName(name)) { // case return true = Exist this category name
				response.getWriter().write("existed");
			} else {
				ArticleType articleType = new ArticleType();
				articleType.setArticleTypeName(name);
				articleType.setUserCreate(userName);
				articleType.setTimeCreate(DateUtil.getCurrentTime());
				articleType.setUserUpdate(userName);
				articleType.setTimeUpdate(DateUtil.getCurrentTime());

				articleTypeDAO.save(articleType);
				response.getWriter().write("success");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("ERROR");
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
