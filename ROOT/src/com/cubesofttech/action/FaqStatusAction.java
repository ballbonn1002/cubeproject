package com.cubesofttech.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FaqStatusDAO;
import com.cubesofttech.model.FAQStatus;
import com.cubesofttech.model.User;

public class FaqStatusAction {
	public static final String ONLINEUSER = "onlineUser";

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private FaqStatusDAO faqStatusDAO;
	
	private String faq_status_name;
	
	public void Add() throws IOException {
		
		try {
			
			if (faqStatusDAO.checkExistByName(faq_status_name)) {
				// case return true = Exist this status name
				response.getWriter().write("existed");
			} else {
				FAQStatus faqStatus = new FAQStatus();
				faqStatus.setFaq_status_name(faq_status_name);
				faqStatusDAO.save(faqStatus);
				response.getWriter().write("success");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("ERROR");
		}
		
	}

	public String getFaq_status_name() {
		return faq_status_name;
	}

	public void setFaq_status_name(String faq_status_name) {
		this.faq_status_name = faq_status_name;
	}
	
}
