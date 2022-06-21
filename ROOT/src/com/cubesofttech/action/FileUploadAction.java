package com.cubesofttech.action;

import java.io.File;
import java.util.Date;
import java.sql.Timestamp;
import java.text.Format;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hpsf.Util;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.Timesheet;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.ibm.icu.text.SimpleDateFormat;
import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport {

	private static final long serialVersionUID = 2280661337420278284L;

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private FileUploadDAO fileuploadDAO;

	@Autowired
	private TimesheetDAO timesheetDAO;
	
	private TimeInReportAction timeinreportAction = new TimeInReportAction();
	
	private User user;

	private String userId;

	private File fileUpload;

	private String fileUploadFileName;

	private String userUploadId;

	private String userUploadCreate;

	private String fileUploadSize;

	private int fileId;

	public String getFileUploadSize() {
		return fileUploadSize;
	}

	public void setFileUploadSize(String fileUploadSize) {
		this.fileUploadSize = fileUploadSize;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public String getUserUploadCreate() {
		return userUploadCreate;
	}

	public void setUserUploadCreate(String userUploadCreate) {
		this.userUploadCreate = userUploadCreate;
	}

	public String getUserUploadId() {
		return userUploadId;
	}

	public void setUserUploadId(String userUploadId) {
		this.userUploadId = userUploadId;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public static final String USERSEQ = "userseq";
	public static final String USERLIST = "userList";
	public static final String FILEUPLOADLIST = "fileuploadList";

	public String list() {
		try {
			request.setAttribute(USERSEQ, userDAO.sequense());
			request.setAttribute(USERLIST, userDAO.findAll());
			request.setAttribute(FILEUPLOADLIST, fileuploadDAO.findAll());
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String upload(){
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
				//log.debug(fileServerPath + "upload/user/" + maxId + "_" + fileName);
			} else {
				return ERROR;
			}
			int l = fileUploadFileName.length();
			int split = fileUploadFileName.indexOf('.');
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
			
			request.setAttribute(USERSEQ, userDAO.sequense());
			request.setAttribute(USERLIST, userDAO.findAll());
			request.setAttribute(FILEUPLOADLIST, fileuploadDAO.findAll());
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	public String uploadexcel(){
		try {
			User onlineuser = (User) request.getSession().getAttribute("onlineUser");
			String logonUser = onlineuser.getId();
			
			List<Map<String, Object>> cubeUser;
			cubeUser = userDAO.sequense();
			
			int maxId = fileuploadDAO.getMaxId() + 1;
			FileUpload fileupload = new FileUpload();
			
			int l = fileUploadFileName.length();
			int split = fileUploadFileName.indexOf('.');
			String name = fileUploadFileName.substring(0, split);
			String type = (String) fileUploadFileName.subSequence(split, l);
			
			if (type.equals(".xlsx") || type.equals(".xls")) {
				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");
				fileupload.setSize(fileUploadSize);
				String fileName = fileUploadFileName;
				
				fileupload.setPath("/upload/user/" + maxId + "_" + fileName);
				FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId + "_" + fileName);
				// log.debug(fileServerPath + "upload/user/" + maxId + "_" + fileName);
				
				fileupload.setFileId(maxId);
				fileupload.setUserId(userUploadId);
				fileupload.setUserCreate(userUploadCreate);
				fileupload.setName(name);
				fileupload.setType(type);
				fileupload.setUserUpdate(userUploadCreate);
				fileupload.setTimeCreate(DateUtil.getCurrentTime());
				fileupload.setTimeUpdate(DateUtil.getCurrentTime());
				fileuploadDAO.save(fileupload);
				String setFileName = maxId + "_" + fileName;
				Workbook workbook = WorkbookFactory.create(new File(fileServerPath + "upload/user/" + setFileName));
				// Retrieving the number of sheets in the Workbook
				/*
				 * ============================================================= Iterating over
				 * all the sheets in the workbook (Multiple ways)
				 * =============================================================
				 */

				// 1. You can obtain a sheetIterator and iterate over it
				Iterator<Sheet> sheetIterator = workbook.sheetIterator();
				while (sheetIterator.hasNext()) {
					Sheet sheet = sheetIterator.next();
				}
				// 2. Or you can use a for-each loop
				for (Sheet sheet : workbook) {
				}
				// 3. Or you can use a Java 8 forEach with lambda
				workbook.forEach(sheet -> {
				});
				/*
				 * ================================================================== Iterating
				 * over all the rows and columns in a Sheet (Multiple ways)
				 * ==================================================================
				 */
				
				// Getting the Sheet at index zero
				Sheet sheet = workbook.getSheetAt(0);
				// Create a DataFormatter to format and get each cell's value as String
				DataFormatter dataFormatter = new DataFormatter();
				// 1. You can obtain a rowIterator and columnIterator and iterate over them
				Iterator<Row> rowIterator = sheet.rowIterator();
				while (rowIterator.hasNext()) {
					Row row = rowIterator.next();
					// Now let's iterate over the columns of the current row
					Iterator<Cell> cellIterator = row.cellIterator();
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						String cellValue = dataFormatter.formatCellValue(cell);
					}
				}
				
				int i = 0;
				String a = null;
				String b = null;
				String c = null;
				String d = null;
				String e = null;
				String f = null;
				String g = null;
				for (Row row : sheet) {
					for (Cell cell : row) {
						String cellValue = dataFormatter.formatCellValue(cell);
						// System.out.print(cellValue + "\t");
						if (i == 0) {
							a = a + "!" + cellValue;
						} else if (i == 1) {
							b = b + "!" + cellValue;
						} else if (i == 2) {
							c = c + "!" + cellValue;
						} else if (i == 3) {
							d = d + "!" + cellValue;
						} else if (i == 4) {
							e = e + "!" + cellValue;
						} else if (i == 5) {
							f = f + "!" + cellValue;
						} else if (i == 6) {
							g = g + "!" + cellValue;
						}
						i++;
					}
					// log.debug();
					i = 0;
				}
				log.debug(a);
				log.debug(b);
				log.debug(c);
				log.debug(d);
				log.debug(e);
				//log.debug(f);
				log.debug(g);
				log.debug("---------------------------------------------------------------------");
				String[] user = a.split("!");
		        String[] date = b.split("!");
		        String[] project = c.split("!");
		        String[] summary = d.split("!");
				String[] desc = e.split("!");
				//String[] timesec = f.split("!");
				String[] timespent = g.split("!");
				for (i = 0; i < date.length - 1; i++) {
					if(i > 2) {
						
						if(user[i] != null) {
							List<Map<String, Object>> chkId = timesheetDAO.wherename(user[i]);
							//log.debug(chkId);
							String uploadId = null;
							String searchyear, searchmonth, searchday;
							
							for (int z = 0; z < chkId.size(); z++) {
								uploadId = ((String) chkId.get(z).get("id"));
								//log.debug(uploadId);
							}
							
							if(userUploadId.equalsIgnoreCase(uploadId) && uploadId != null) {
								searchyear = date[i].substring(6, 10);
								searchmonth = date[i].substring(3, 5);
								searchday = date[i].substring(0, 2);
								
								Timesheet timesheet = new Timesheet();
								int tsmaxid = timesheetDAO.getMaxId() + 1;
								timesheet.setId(tsmaxid);
								timesheet.setProject(project[i]);
								timesheet.setSummary(summary[i]);
								timesheet.setDescription(desc[i]);
								
								Date startdate = new SimpleDateFormat("dd/MM/yyyy").parse(date[i]); 
								timesheet.setStarted_date(startdate);
								
								timesheet.setTimespent(timespent[i]);
								
								
								List<Map<String, Object>> whereworkhour = timesheetDAO.whereworkhour(searchyear,
										searchmonth, searchday, uploadId);
								if (!whereworkhour.isEmpty()) {
									for (int wwh = 0; wwh < whereworkhour.size(); wwh++) {
										char work_hours_type = ((char) whereworkhour.get(wwh).get("work_hours_type"));
										if (work_hours_type == '1') {
											Timestamp startDate = ((Timestamp) whereworkhour.get(wwh)
													.get("work_hours_time_work"));
											timesheet.setTimeCheckIn(startDate);
											// log.debug(startDate);
										} else if (work_hours_type == '2') {
											Timestamp endDate = ((Timestamp) whereworkhour.get(wwh)
													.get("work_hours_time_work"));
											timesheet.setTimeCheckOut(endDate);
											// log.debug(endDate);
										}
									}
								} else {
									/*
									 * String sdate = searchyear + "-" + searchmonth + "-" + searchday +
									 * " 00:00:00"; String edate = searchyear + "-" + searchmonth + "-" + searchday
									 * + " 00:00:00";
									 */
									Timestamp startDate = null;
									Timestamp endDate = null;
									timesheet.setTimeCheckIn(startDate);
									timesheet.setTimeCheckOut(endDate);
								}
			
								timesheet.setStatus("W");
								timesheet.setUserCreate(uploadId);
								timesheet.setUserUpdate(userUploadCreate);
								timesheet.setTimeCreate(DateUtil.getCurrentTime());
								timesheetDAO.save(timesheet);
								
							} else {
								return ERROR;
							}
						
						}
					}
				}
				request.setAttribute("cubeUser", cubeUser);
				request.setAttribute("logonUser", logonUser);
				//timeinreportAction.listTimeInReport();
				/*request.setAttribute(USERSEQ, userDAO.sequense());
				request.setAttribute(USERLIST, userDAO.findAll());
				request.setAttribute(FILEUPLOADLIST, fileuploadDAO.findAll());*/
				return SUCCESS;
			} else {
				return ERROR;
			}
			
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String delete() {
		try {
			FileUpload file = new FileUpload();
			file.setFileId(Integer.valueOf(request.getParameter("fileId")));
			fileuploadDAO.delete(file);
			request.setAttribute(USERSEQ, userDAO.sequense());
			request.setAttribute(USERLIST, userDAO.findAll());
			request.setAttribute(FILEUPLOADLIST, fileuploadDAO.findAll());
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String list2() {
		try {
			request.setAttribute(USERSEQ, userDAO.sequense());
			request.setAttribute(USERLIST, userDAO.findAll());
			request.setAttribute(FILEUPLOADLIST, fileuploadDAO.findByuser(request.getParameter("userId")));
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

}
