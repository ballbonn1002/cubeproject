package com.cubesofttech.action;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FaqCategoryDAO;
import com.cubesofttech.dao.FaqDAO;
import com.cubesofttech.dao.FaqImageDAO;
import com.cubesofttech.dao.FaqStatusDAO;
import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.FaqImage;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.FAQCategory;
import com.cubesofttech.model.FAQStatus;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class FaqAction extends ActionSupport {
	public static final String ONLINEUSER = "onlineUser";
	private static final Logger log = Logger.getLogger(FaqAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private FaqDAO faqDAO;

	@Autowired
	private FaqImageDAO faqImageDAO;

	@Autowired
	private FaqCategoryDAO faqCategoryDAO;
	
	@Autowired
	private FaqStatusDAO faqStatusDAO;

	@Autowired
	private FileUploadDAO fileuploadDAO;

	List<Map<String, Object>> faqJoin; // faqJoin include faq and faq_category and faq_status columns
	List<FAQCategory> faqCategoryList;
	List<FAQStatus> faqStatusList;
	private FAQ faq;
	private FaqImage faqImage;

	private Integer faq_id;
	private String topic;
	private String details;
	private String author;
	private String faq_cat_id;
	private String faq_cat_name;
	private String faq_status_id;
	private String faq_status_name;
	private String fileName;
	private String fileType;
	private String srcDelete;

	/* FAQ Image */
	File FaqImage;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String Init() {
		try {

			faqJoin = faqDAO.findAll();
			request.setAttribute("faqJoinList", faqJoin);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public void refreshCategory() throws IOException {
		try {

			/* GET List of Category */
			faqCategoryList = faqCategoryDAO.findAll();
			request.setAttribute("faqCategoryList", faqCategoryList);

			String CategoryJson = new Gson().toJson(faqCategoryList);

			response.getWriter().write(CategoryJson);
		} catch (Exception e) {
			log.error(e);
			response.getWriter().write("ERROR");
		}

	}
	
	public void refreshStatus() throws IOException {
		try {
			faqStatusList = faqStatusDAO.findAll();
			request.setAttribute("faqStatusList", faqStatusList);
			
			String StatusJson = new Gson().toJson(faqStatusList);
			
			response.getWriter().write(StatusJson);
			
		} catch (Exception e) {
			log.error(e);
			response.getWriter().write("ERROR");
		}
	}

	public String Delete() {

		try {
			faq = faqDAO.findById(faq_id);

			if (faq != null) {

				faqDAO.delete(faq);
			}
			faqJoin = faqDAO.findAll();

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String AddFAQPage() {

		try {
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			author = ur.getName();

			List<Map<String, Object>> cubeUser = userDAO.sequense();
			request.setAttribute("cubeUser", cubeUser);

			request.setAttribute("author", author);

			/* GET List of Category */
			faqCategoryList = faqCategoryDAO.findAll();
			request.setAttribute("faqCategoryList", faqCategoryList);
			
			faqStatusList = faqStatusDAO.findAll();
			request.setAttribute("faqStatusList", faqStatusList);

			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public void Add() {
		int categoryID = 0;
		int statusID = 1;

		try {

			categoryID = faqCategoryDAO.findIdByName(faq_cat_name);
			//statusID = faqStatusDAO.findIdByName(faq_status_name);

		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			FAQ faq = new FAQ();
			faq.setTopic(topic);
			faq.setAuthor(author);
			faq.setDetails(details);
			faq.setFaq_cat_id(categoryID);
			faq.setFaq_status_id(statusID);
			faq.setTime_posted(DateUtil.getCurrentTime());
			faq.setTime_updated_post(DateUtil.getCurrentTime());

			faqDAO.save(faq);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void AddImg() {
		/* get user name in session */
		User ur = (User) request.getSession().getAttribute(ONLINEUSER);
		String userID = ur.getId();
		try {

			ServletContext context;
			String fileServerPath;
			String locationFile = "";

			int ImgMaxId = faqImageDAO.getMaxId() + 1;
			if (FaqImage != null) {
				context = request.getServletContext();
				fileServerPath = context.getRealPath("/");

				// log.debug(context.getContextPath());
				FileUtil.upload(FaqImage, fileServerPath + "upload/faq/", ImgMaxId + "_faq_" + fileName);
//				locationFile = fileServerPath + "upload\\faq\\" + ImgMaxId + "_" + fileName;
				locationFile = context.getContextPath() + "/upload/faq/" + ImgMaxId + "_faq_" + fileName;
				// log.debug(locationFile);

				// locationFile = "http://127.0.0.1:8887/" + ImgMaxId + "_" + fileName;

				String fileBaseName = FilenameUtils.getBaseName(fileName); // cut type file
				String fileSize = readableFileSize(FaqImage.length()); // Initial size of file
				String filePath = "upload/faq/" + ImgMaxId + "_faq_" + fileName; // Initial path of file

				// insert to faq_image table
				FaqImage faqImages = new FaqImage();
				faqImages.setFaq_user_id(userID);
				faqImages.setFaq_img_name(ImgMaxId + "_faq_" + fileBaseName);
				faqImages.setFaq_img_type(fileType);
				faqImages.setFaq_img_size(fileSize);
				faqImages.setFaq_img_path(filePath);
				faqImages.setFaq_time_upload(DateUtil.getCurrentTime());

				faqImageDAO.save(faqImages);

				// insert to file table
				FileUpload fileUpload = new FileUpload();
				int maxId = fileuploadDAO.getMaxId() + 1;
				fileUpload.setFileId(maxId);
				fileUpload.setUserId(userID);
				fileUpload.setUserCreate(userID);
				fileUpload.setName(ImgMaxId + "_faq_" + fileBaseName);
				fileUpload.setSize(fileSize);
				fileUpload.setPath(filePath);
				fileUpload.setType("." + fileType);
				fileUpload.setUserUpdate(userID);
				fileUpload.setTimeCreate(DateUtil.getCurrentTime());
				fileUpload.setTimeUpdate(DateUtil.getCurrentTime());

				fileuploadDAO.save(fileUpload);
			}

			response.getWriter().write(locationFile);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void DeleteImg() {

		// log.debug("deleteSrc: " + srcDelete);

		if (srcDelete != null) {

			try {
				File fileImage = new File(srcDelete);

				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");

				Path path = Paths.get(fileServerPath + "upload/faq/" + fileImage.getName());
				Files.delete(path);

				// log.debug("Delete File " + path.toString());

				// delete img from database

				faqImageDAO.deleteByPath("upload/faq/" + fileImage.getName());
				fileuploadDAO.deleteByPath("upload/faq/" + fileImage.getName());

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public String readableFileSize(long size) {
		if (size <= 0)
			return "0";
		final String[] units = new String[] { "B", "KB", "MB", "GB", "TB" };
		int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
		return new DecimalFormat("#,##0.#").format(size / Math.pow(1024, digitGroups)) + " " + units[digitGroups];
	}

	public String editPage() {

//		String getFaqId = request.getParameter("faq_id");

		if (faq_id != null) {

			try {

				List<Map<String, Object>> cubeUser = userDAO.sequense();
				request.setAttribute("cubeUser", cubeUser);

				FAQ faqs = new FAQ();
				faqs = faqDAO.findById(faq_id);
				request.setAttribute("faqs", faqs);

				Integer faq_cat_id = faqs.getFaq_cat_id();
				FAQCategory faqCategory = new FAQCategory();
				faqCategory = faqCategoryDAO.findById(faq_cat_id);
				request.setAttribute("faqs_category", faqCategory);
				faqCategoryList = faqCategoryDAO.findAll();
				request.setAttribute("faqCategoryList", faqCategoryList);
				
				Integer faq_status_id = faqs.getFaq_status_id();
				FAQStatus faqStatus = new FAQStatus();
				faqStatus = faqStatusDAO.findById(faq_status_id);
				request.setAttribute("faqs_status", faqStatus);
				faqStatusList = faqStatusDAO.findAll();
				request.setAttribute("faqStatusList", faqStatusList);	

			} catch (Exception e) {
				e.printStackTrace();
			}

			return SUCCESS;

		} else {

			log.debug("error " + faq_id);
			return ERROR;

		}

	}

	public String updateFAQ() {
		int categoryID = 0;
		int statusID = 0;
		try {
			faq_id = Integer.parseInt(request.getParameter("faq_id"));
			// log.debug(faq_id);
			FAQ faqs = new FAQ();
			faqs = faqDAO.findById(faq_id);
			categoryID = faqCategoryDAO.findIdByName(faq_cat_name);
			statusID = faqStatusDAO.findIdByName(faq_status_name);
			// log.debug(categoryID);

			faqs.setAuthor(author);
			faqs.setTopic(topic);
			faqs.setDetails(details);
			faqs.setFaq_cat_id(categoryID);
			faqs.setFaq_status_id(statusID);
			faqs.setTime_updated_post(DateUtil.getCurrentTime());

			faqDAO.update(faqs);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public Integer getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(Integer faq_id) {
		this.faq_id = faq_id;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getFaq_cat_id() {
		return faq_cat_id;
	}

	public void setFaq_cat_id(String faq_cat_id) {
		this.faq_cat_id = faq_cat_id;
	}

	public String getFaq_cat_name() {
		return faq_cat_name;
	}

	public void setFaq_cat_name(String faq_cat_name) {
		this.faq_cat_name = faq_cat_name;
	}

	public String getFaq_status_id() {
		return faq_status_id;
	}

	public void setFaq_status_id(String faq_status_id) {
		this.faq_status_id = faq_status_id;
	}

	public String getFaq_status_name() {
		return faq_status_name;
	}

	public void setFaq_status_name(String faq_status_name) {
		this.faq_status_name = faq_status_name;
	}

	public File getFaqImage() {
		return FaqImage;
	}

	public void setFaqImage(File faqImage) {
		FaqImage = faqImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getSrcDelete() {
		return srcDelete;
	}

	public void setSrcDelete(String srcDelete) {
		this.srcDelete = srcDelete;
	}

}
