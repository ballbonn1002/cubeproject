package com.cubesofttech.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FaqCategoryDAO;
import com.cubesofttech.model.FAQCategory;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;

public class FaqCategoryAction {

	public static final String ONLINEUSER = "onlineUser";
//	private static final Logger log = Logger.getLogger(FAQCategory.class);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private FaqCategoryDAO faqCategoryDAO;

	private String faq_cat_name;

	public void Add() throws IOException {

		try {

			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String userName = ur.getId();

			if (faqCategoryDAO.checkExistByName(faq_cat_name)) { // case return true = Exist this category name
				response.getWriter().write("existed");
			} else {
				FAQCategory faqCateory = new FAQCategory();
				faqCateory.setFaq_cat_name(faq_cat_name);
				faqCateory.setFaq_cat_user_id(userName);
				faqCateory.setFaq_cat_add_time(DateUtil.getCurrentTime());

				faqCategoryDAO.save(faqCateory);
				response.getWriter().write("success");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("ERROR");
		}
	}

	public String getFaq_cat_name() {
		return faq_cat_name;
	}

	public void setFaq_cat_name(String faq_cat_name) {
		this.faq_cat_name = faq_cat_name;
	}

}
