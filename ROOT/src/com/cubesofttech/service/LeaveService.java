package com.cubesofttech.service;


import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import com.cubesofttech.dao.LeaveTypeDAO;



public class LeaveService {

	@Autowired
	private LeaveTypeDAO leaveTypeDAO;
	
	@Autowired
	private JavaMailSender mailSender;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public void sendmail() throws Exception{
		String name = request.getParameter("name");
		String typeleave = request.getParameter("typeleave");
		String form = request.getParameter("from");
		String to = request.getParameter("to");
		String des = request.getParameter("des");
		String amount = request.getParameter("amount");
		String amount_sub = request.getParameter("amount_sub");
		String actionpage = request.getParameter("actionpage");
		List<Map<String, Object>> leaveTypeCheck = leaveTypeDAO.idtoname(typeleave);
		String leavetypename = ((String) leaveTypeCheck.get(0).get("leave_type_name"));
		System.out.println(leavetypename);
		
		int am1 = Integer.parseInt(amount); 
		int am2 = Integer.parseInt(amount_sub);
		int amsum = am1 + am2;
		System.out.println(name);
		System.out.println(typeleave);
		System.out.println(form);
		System.out.println(to);
		System.out.println(des);
		System.out.println(amount);
		System.out.println(amount_sub);
		
		String[] namemail = {"hr@cubesofttech.com", "sales@cubesofttech.com"};
		for(int i=1;i<3;i++) {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom("test@cubesofttech.com");
			message.setTo(namemail[i]);
			message.setSubject("name : " + name);
			message.setText("สถานะ : "+actionpage+"\nชื่อ : "+ name +"\nประเภทการลา : " + leavetypename + "\nวันที่ : " + form + " ถึงวันที่ : " +to+"\nจำนวน : " +amsum+" วัน");
			mailSender.send(message);
			System.out.println("success");
		}
		
	}

	
}
