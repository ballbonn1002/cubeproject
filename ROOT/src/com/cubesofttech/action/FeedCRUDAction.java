package com.cubesofttech.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.FeedpostbackgroundDAO;
import com.cubesofttech.model.FeedPostBackground;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.opensymphony.xwork2.ActionSupport;

public class FeedCRUDAction extends ActionSupport {
	
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	private static final long serialVersionUID = 2280661337420278284L;

	private static final Integer Interger = null;
	
	@Autowired
	private FileUploadDAO fileuploadDAO;
	
	@Autowired
	private FeedpostbackgroundDAO FeedpostbackgroundDAO;
	
	private User user;
	
	private FeedPostBackground FeedBackground;
	
	private File fileUpload;

	private String fileUploadFileName;

	private String userUploadId;

	private String userUploadCreate;

	private String fileUploadSize;
	
	
	
	
	public File getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}
	public String getFileUploadFileName() {
		return fileUploadFileName;
	}
	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	public String getUserUploadId() {
		return userUploadId;
	}
	public void setUserUploadId(String userUploadId) {
		this.userUploadId = userUploadId;
	}
	public String getUserUploadCreate() {
		return userUploadCreate;
	}
	public void setUserUploadCreate(String userUploadCreate) {
		this.userUploadCreate = userUploadCreate;
	}
	public String getFileUploadSize() {
		return fileUploadSize;
	}
	public void setFileUploadSize(String fileUploadSize) {
		this.fileUploadSize = fileUploadSize;
	}
	public String opencrud() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String user_id = user.getId().toLowerCase();
			String user_name = user.getName();
			String user_path = user.getPath();
			List<Map<String,Object>> background = FeedpostbackgroundDAO.GetAllPostBackground();
			//System.out.println(background);
			request.setAttribute("userid", user_id);
			request.setAttribute("username", user_name);
			request.setAttribute("userpath", user_path);
			request.setAttribute("allbackground", background);
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
		return "success";
	}
	public String AddnewBackground() {
		try {
			int maxId = fileuploadDAO.getMaxId() + 1;
			FileUpload fileupload = new FileUpload();
			
			if (fileUpload != null) {
				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");
				fileupload.setSize(fileUploadSize);
				String fileName = fileUploadFileName;
				fileupload.setPath("/upload/user/" + maxId + "_" + fileName);
				FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId + "_" + fileName);
			} else {
				return ERROR;
			}
			int l = fileUploadFileName.length();
			int split = fileUploadFileName.lastIndexOf('.');
			String name = fileUploadFileName.substring(0, split);
			String type = (String) fileUploadFileName.subSequence(split, l);

			fileupload.setFileId(maxId);
			fileupload.setUserId(userUploadId);
			fileupload.setUserCreate(userUploadCreate);
			fileupload.setName(name);
			fileupload.setType(type);
			fileupload.setUserUpdate(userUploadCreate);
			fileupload.setTimeCreate(DateUtil.getCurrentTime());
			fileupload.setTimeUpdate(DateUtil.getCurrentTime());
			fileuploadDAO.save(fileupload);
			
			FeedPostBackground fbg  = new FeedPostBackground();
			fbg.setBackground_img_file_type(type);
			fbg.setBackground_img_name(name);
			fbg.setBackground_img_path(fileupload.getPath().toString());
			fbg.setUser_upload(userUploadId);
			fbg.setUsed_status("0");
			FeedpostbackgroundDAO.save(fbg);
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
		return null;
	}
	
	public String GetBackground() {
		try {
			List<Map<String,Object>> allbackground = FeedpostbackgroundDAO.GetAllPostBackground();
			//System.out.println("ds");
			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(allbackground));
			out.flush();
			
		}catch(Exception ex){
			ex.printStackTrace();
			return "error";		
		}
		return null;
	}
	
	public String EditBackground() {
		
		return null;
	}
	public String DeleteBackground() {
		try {
			String backgroundid = request.getParameter("backgroundid");
			FeedpostbackgroundDAO.deletebyid(backgroundid);
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
		
		return null;
	}
	
	public String listmap_to_json_string(List<Map<String, Object>> list) throws JSONException
	{       
	    JSONArray json_arr=new JSONArray();
	    for (Map<String, Object> map : list) {
	        JSONObject json_obj=new JSONObject();
	        for (Map.Entry<String, Object> entry : map.entrySet()) {
	            String key = entry.getKey();
	            Object value = entry.getValue();
	            json_obj.put(key,value);                           
	        }
	        json_arr.put(json_obj);
	    }
	    return json_arr.toString();
	}
	public String setUse() {
		try {
			String backgroundid = request.getParameter("backgroundid");
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
		return null;
	}
}
