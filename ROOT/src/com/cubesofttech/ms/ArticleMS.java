package com.cubesofttech.ms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.ArticleDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleMS extends ActionSupport {


	private static final long serialVersionUID = 1L;
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String ONLINEUSER = "onlineUser";
	public static final String USERSEQ = "userseq";
	public static final String USERID = "userId";
	public static final String ARTICLEID = "articleId";
	public static final String ARTICLELIST = "articleList";

	@Autowired
	private ArticleDAO articleDAO;
	
	
	public String getAllArticle() {
		try {

			Gson gson = new GsonBuilder().create();
			String responseJSON = gson.toJson(articleDAO.joinArticleMS());
			request.setAttribute("json", responseJSON);
			//log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

}
