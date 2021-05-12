package com.cubesofttech.ms;

import java.io.File;
import java.text.DecimalFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.TicketDAO;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.Ticket;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionSupport;

public class TicketMS extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private static final Logger log = Logger.getLogger(TicketMS.class);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private TicketDAO ticketDAO;

	@Autowired
	private FileUploadDAO fileuploadDAO;
	
	File fileUpload;
	
	String ticket;
	
	String fileName;
	
	public String getAllTicket() {
		try {

			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(ticketDAO.findAll());

			request.setAttribute("json", responseJSON);

			log.debug("called");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String addTicket() {
		JsonObject jsonObj = new JsonObject();
		Gson gson = new GsonBuilder().create();
		try {
			log.debug("called add Ticket");
			int maxFileId = 0;
			String fileBaseName;
			String fileSize;
			String filePath;
			ServletContext context;
			String fileServerPath;
		
			if(fileUpload != null) {
				log.debug(" file not null");
				
				log.debug("fileName: " + fileName);
				context = request.getServletContext();
				fileServerPath = context.getRealPath("/");
				maxFileId = fileuploadDAO.getMaxId() + 1;

				FileUtil.upload(fileUpload, fileServerPath + "upload/ticket/", maxFileId + "_ticket_" + fileName);

				
				fileBaseName = FilenameUtils.getBaseName(fileName); // cut type file
				fileSize = readableFileSize(fileUpload.length()); // Initial size of file
				filePath = "upload/ticket/" + maxFileId + "_ticket_" + fileName; // Initial path of file
				log.debug("filePath: " + fileServerPath + filePath);
				
				// insert to file table
				FileUpload fileUpload = new FileUpload();
				fileUpload.setFileId(maxFileId);
				fileUpload.setUserId("-userId");
				fileUpload.setUserCreate("-userId");
				fileUpload.setName(maxFileId + "_ticket_" + fileBaseName);
				fileUpload.setSize(fileSize);
				fileUpload.setPath(filePath);
				fileUpload.setType("." + FilenameUtils.getExtension(filePath));
				fileUpload.setTimeCreate(DateUtil.getCurrentTime());
				fileuploadDAO.save(fileUpload);

			}else {
				log.debug("file null");
			}
			
			//mapping String Json to model object
			ObjectMapper mapper = new ObjectMapper();
			Ticket ticketFromGson = mapper.readValue(ticket, Ticket.class);
			ticketFromGson.setTimeCreate(DateUtil.getCurrentTime());
			ticketFromGson.setTicketStatus_Id(1); // onProcess
			if(ticketFromGson.getUserAssigned() != null) {
				ticketFromGson.setTimeAssigned(DateUtil.getCurrentTime());
			}
			
			ticketDAO.save(ticketFromGson);
			
			jsonObj.addProperty("status", "success");
			String responseJSON = gson.toJson(jsonObj);
			request.setAttribute("json", responseJSON);
			
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			jsonObj.addProperty("status", "error");
			String responseJSON = gson.toJson(jsonObj);
			request.setAttribute("json", responseJSON);
			return ERROR;
		}
	}

	
	public String readableFileSize(long size) {
		if (size <= 0)
			return "0";
		final String[] units = new String[] { "B", "KB", "MB", "GB", "TB" };
		int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
		return new DecimalFormat("#,##0.#").format(size / Math.pow(1024, digitGroups)) + " " + units[digitGroups];
	}


	
	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	

	
}
