package com.cubesofttech.action;

import java.awt.print.Printable;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.CommentDAO;
import com.cubesofttech.dao.FeedDAO;
import com.cubesofttech.dao.FeedpostbackgroundDAO;
import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.listener.SessionListener;
import com.cubesofttech.model.User;
import com.cubesofttech.model.Comment;
import com.cubesofttech.model.FeedNews;
import com.cubesofttech.model.FeedNewsLike;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class FeedAction extends ActionSupport {
	public static final String ONLINEUSER = "onlineUser";
	private static final Logger log = Logger.getLogger(FaqAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private FeedDAO feedDAO;
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private FileUploadDAO fileuploadDAO;
	@Autowired
	private FeedpostbackgroundDAO FeedpostbackgroundDAO;
	private File fileUpload;
	private String test;
	private String fileUploadFileName;
	private String details;
	private String backgroundcolor;
	private String backgroundrgb;
	private String detailsNew;
	private String backgroundpath;
	
	public String getBackgroundpath() {
		return backgroundpath;
	}

	public void setBackgroundpath(String backgroundpath) {
		this.backgroundpath = backgroundpath;
	}

	public String getDetailsNew() {
		return detailsNew;
	}

	public void setDetailsNew(String detailsNew) {
		this.detailsNew = detailsNew;
	}

	public String getBackgroundrgb() {
		return backgroundrgb;
	}

	public void setBackgroundrgb(String backgroundrgb) {
		this.backgroundrgb = backgroundrgb;
	}

	public String getBackgroundcolor() {
		return backgroundcolor;
	}

	public void setBackgroundcolor(String backgroundcolor) {
		this.backgroundcolor = backgroundcolor;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
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

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public List<String> GetActivitylist() {
		SessionListener session = new SessionListener();
		List<String> userOnlineList = new ArrayList<String>();
		userOnlineList = session.getSessionActivitylist();
		User user = (User) request.getSession().getAttribute("onlineUser");
		String userid = user.getId();
		return userOnlineList;
	}

	public String feedList_open() {
		try {
			String limit = request.getParameter("limit");
			Integer limits = 5;
			if (limit != null) {
				int foo = Integer.parseInt(limit);
				limits = limits + foo;

			} else {

			}

			List<Map<String, Object>> feedPost = feedDAO.findAlldetail(limits);

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date(System.currentTimeMillis());

			String nowTime = formatter.format(date);

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			for (int i = 0; i < feedPost.size(); i++) {
				String timepost = feedPost.get(i).get("time_posted").toString();
				String postTime = timepost.substring(0, timepost.length() - 2);

				String fullDate = new SimpleDateFormat("HH:mm:ss dd/MMM/yyyy")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(timepost));
				feedPost.get(i).put("fullDate", fullDate);
				try {
					Date start = df.parse(postTime);
					Date end = df.parse(nowTime);
					long diff = end.getTime() - start.getTime();
					int dayDiff = (int) (diff / (24 * 60 * 60 * 1000));
					int hourDiff = (int) (diff / (60 * 60 * 1000) % 24);
					int minuteDiff = (int) (diff / (60 * 1000) % 60);
					int secondDiff = (int) (diff / 1000 % 60);

					if (dayDiff == 0 && hourDiff == 0 && minuteDiff == 0) {
						feedPost.get(i).put("lastPostTime", "last " + secondDiff + " second");
					} else if (dayDiff == 0 && hourDiff == 0 && minuteDiff != 0) {
						feedPost.get(i).put("lastPostTime", "last " + minuteDiff + " minute");
					} else if (dayDiff == 0 && hourDiff != 0) {
						feedPost.get(i).put("lastPostTime", "last " + hourDiff + " hour");
					} else if (dayDiff != 0) {
						feedPost.get(i).put("lastPostTime", "last " + dayDiff + " day");
					}

				} catch (ParseException e) {
					e.printStackTrace();
				}

			}

			request.setAttribute("feedPost", feedPost);
			List<Map<String,Object>> feedPostMerge = new ArrayList();
			for(Map<String,Object> map : feedPost) {
				Map<String,Object> temp = new HashMap();
				temp.put("feed_id", map.get("feed_id"));
				temp.put("details", map.get("details"));
				temp.put("user_id", map.get("user_id"));
				temp.put("time_posted", map.get("time_posted"));
				temp.put("time_update_post", map.get("time_update_post"));
				temp.put("path_url", map.get("path_url"));
				temp.put("status_post", map.get("status_post"));
				temp.put("backgroundType", map.get("backgroundType"));
				temp.put("backgroundRGB", map.get("backgroundRGB"));
				temp.put("backgroundpathid", map.get("backgroundpathid"));
				temp.put("role", map.get("role"));
				temp.put("path", map.get("path"));
				temp.put("name", map.get("name"));
				temp.put("lastPostTime", map.get("lastPostTime"));
				temp.put("fullDate", map.get("fullDate"));
				if(map.get("backgroundpathid")!= null) {
					List<Map<String, Object>> backgroundupload = FeedpostbackgroundDAO.GetPostBackgroundById(map.get("backgroundpathid").toString());
					for(Map<String, Object> mapinner : backgroundupload) 
					{
						temp.put("post_background_id",mapinner.get("feed_post_background_id").toString());
						temp.put("background_img_path", mapinner.get("background_img_path").toString());
						FeedpostbackgroundDAO.SetUse(mapinner.get("feed_post_background_id").toString());
					}
				}
				feedPostMerge.add(temp);
			}
			request.setAttribute("feedPostMerge", feedPostMerge);
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId().toLowerCase();

			for (int i = 0; i < feedPostMerge.size(); i++) {
				feedPostMerge.get(i).put("countLike", 0);
				feedPostMerge.get(i).put("countLove", 0);
				feedPostMerge.get(i).put("countHaha", 0);
				feedPostMerge.get(i).put("countWow", 0);
				feedPostMerge.get(i).put("countSad", 0);
				feedPostMerge.get(i).put("countAngry", 0);
				feedPostMerge.get(i).put("likeYang", 0);
				feedPostMerge.get(i).put("reactType", "0");

				// vid
				feedPostMerge.get(i).put("linkUrl", null);
				if (feedPostMerge.get(i).get("path_url") == null) {
					feedPostMerge.get(i).put("upload_type", "etc");

					if (feedPostMerge.get(i).get("details").toString().contains("https://www.youtube.com/embed/")) {
						feedPostMerge.get(i).replace("upload_type", "link");
						if (feedPostMerge.get(i).get("details").toString().split(" ").length > 0) {
							String[] splitTest = feedPostMerge.get(i).get("details").toString().split(" ");
							for (int arrInDetail = 0; arrInDetail < splitTest.length; arrInDetail++) {
								if (splitTest[arrInDetail].contains("https://www.youtube")) {
									if (splitTest[arrInDetail].contains("&")) {
										String[] splitAND = splitTest[arrInDetail].split("&");
										feedPostMerge.get(i).replace("linkUrl", splitAND[0]);
									} else {
										feedPostMerge.get(i).replace("linkUrl", splitTest[arrInDetail]);
									}
								}
							}
						}
					}

					if (feedPostMerge.get(i).get("details").toString().contains("https://www.youtube.com/watch?v=")) {
						String newlink = feedPostMerge.get(i).get("details").toString()
								.replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/");
						//feedPost.get(i).replace("details", newlink);
						feedPostMerge.get(i).replace("upload_type", "link");
//						if (feedPost.get(i).get("details").toString().split(" |\\r|\\n").length > 0) {
						if (newlink.split(" |\\r|\\n").length > 0) {
//							String[] splitTest = feedPost.get(i).get("details").toString().split(" |\\r|\\n");
							String[] splitTest = newlink.split(" |\\r|\\n");
							for (int arrInDetail = 0; arrInDetail < splitTest.length; arrInDetail++) {
								if (splitTest[arrInDetail].contains("https://www.youtube")) {
									if (splitTest[arrInDetail].contains("&")) {
										String[] splitAND = splitTest[arrInDetail].split("&");
										feedPostMerge.get(i).replace("linkUrl", splitAND[0]);
									} else {
										feedPostMerge.get(i).replace("linkUrl", splitTest[arrInDetail]);
									}
								}
							}
						}

					}

//					if (feedPost.get(i).get("details").toString().contains("\r")
//							|| feedPost.get(i).get("details").toString().contains("\n")) {
//						String newDetail = feedPost.get(i).get("details").toString().replaceAll("\r", "<br>");
////						newDetail = newDetail.replaceAll("\n", "<br>");
////						System.out.println(newDetail);
//						feedPost.get(i).replace("details", newDetail);
//					}

				} else {
					if (feedPostMerge.get(i).get("path_url").toString().toUpperCase().contains(".mp4".toUpperCase())) {
						feedPostMerge.get(i).put("upload_type", "mp4");
					}
					if (feedPostMerge.get(i).get("path_url").toString().toUpperCase().contains(".jpeg".toUpperCase())
							|| feedPostMerge.get(i).get("path_url").toString().toUpperCase()
									.contains(".png".toUpperCase())) {
						feedPostMerge.get(i).put("upload_type", "img");
					}

				}

				String feed_id = feedPost.get(i).get("feed_id").toString();
				List<Map<String, Object>> countlike = feedDAO.findAllLike(feed_id, "1");
				for(int j =0;j<countlike.size();j++) {
					if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("1")) {
						feedPostMerge.get(i).replace("countLike", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("2")) {
						feedPostMerge.get(i).replace("countLove", countlike.get(j).get("countlike"));
					} else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("3")) {
						feedPostMerge.get(i).replace("countHaha", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("4")) {
						feedPostMerge.get(i).replace("countWow", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("5")) {
						feedPostMerge.get(i).replace("countSad", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("6")) {
						feedPostMerge.get(i).replace("countAngry", countlike.get(j).get("countlike"));
					}
				}
				int likeTeeNai = (int) feedPostMerge.get(i).get("feed_id");

				List<Map<String, Object>> feedlike = feedDAO.findByIdFeed(likeTeeNai, logonUser);

				if (!feedlike.isEmpty()) {
					feedPostMerge.get(i).replace("likeYang", 1);
					feedPostMerge.get(i).replace("reactType", feedlike.get(0).get("reactType"));

				}
			}

			List<Map<String, Object>> topUserComment = commentDAO.topUserComment();
			request.setAttribute("topUserComment", topUserComment);

			List<Map<String, Object>> userpath = feedDAO.userpath(logonUser);
			request.setAttribute("userpath", userpath);
			request.setAttribute("logonUser", logonUser);
			List<Map<String, Object>> commentadd = commentDAO.findAllComment();
			request.setAttribute("comment", commentadd);
			String sender_id = ur.getId();
			String userpath1 = ur.getPath();
			String email = ur.getEmail();
			String theme = "";

			List<String> userOnlinelist = GetActivitylist();
			// System.out.println(userOnlinelist);
			request.setAttribute("Owner_chat_id", sender_id);
			request.setAttribute("email", email);
			request.setAttribute("UserOnlineList", userOnlinelist);
			request.setAttribute("Userpath", userpath1);
			request.setAttribute("theme", theme);
			request.setAttribute("linkfeed", "0");

			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String feedList_open_detail() {
		try {
			String limit = request.getParameter("limit");
			Integer limits = 5;
			if (limit != null) {
				int foo = Integer.parseInt(limit);
				limits = limits + foo;

			} else {

			}

			List<Map<String, Object>> feedPost = feedDAO.findAlldetail(limits);

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date(System.currentTimeMillis());

			String nowTime = formatter.format(date);

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			for (int i = 0; i < feedPost.size(); i++) {
				String timepost = feedPost.get(i).get("time_posted").toString();
				String postTime = timepost.substring(0, timepost.length() - 2);

				String fullDate = new SimpleDateFormat("HH:mm:ss dd/MMM/yyyy")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(timepost));
				feedPost.get(i).put("fullDate", fullDate);
				try {
					Date start = df.parse(postTime);
					Date end = df.parse(nowTime);
					long diff = end.getTime() - start.getTime();
					int dayDiff = (int) (diff / (24 * 60 * 60 * 1000));
					int hourDiff = (int) (diff / (60 * 60 * 1000) % 24);
					int minuteDiff = (int) (diff / (60 * 1000) % 60);
					int secondDiff = (int) (diff / 1000 % 60);

					if (dayDiff == 0 && hourDiff == 0 && minuteDiff == 0) {
						feedPost.get(i).put("lastPostTime", "last " + secondDiff + " second");
					} else if (dayDiff == 0 && hourDiff == 0 && minuteDiff != 0) {
						feedPost.get(i).put("lastPostTime", "last " + minuteDiff + " minute");
					} else if (dayDiff == 0 && hourDiff != 0) {
						feedPost.get(i).put("lastPostTime", "last " + hourDiff + " hour");
					} else if (dayDiff != 0) {
						feedPost.get(i).put("lastPostTime", "last " + dayDiff + " day");
					}

				} catch (ParseException e) {
					e.printStackTrace();
				}

			}

			request.setAttribute("feedPost", feedPost);
			List<Map<String,Object>> feedPostMerge = new ArrayList();
			for(Map<String,Object> map : feedPost) {
				Map<String,Object> temp = new HashMap();
				temp.put("feed_id", map.get("feed_id"));
				temp.put("details", map.get("details"));
				temp.put("user_id", map.get("user_id"));
				temp.put("time_posted", map.get("time_posted"));
				temp.put("time_update_post", map.get("time_update_post"));
				temp.put("path_url", map.get("path_url"));
				temp.put("status_post", map.get("status_post"));
				temp.put("backgroundType", map.get("backgroundType"));
				temp.put("backgroundRGB", map.get("backgroundRGB"));
				temp.put("backgroundpathid", map.get("backgroundpathid"));
				temp.put("role", map.get("role"));
				temp.put("path", map.get("path"));
				temp.put("name", map.get("name"));
				temp.put("lastPostTime", map.get("lastPostTime"));
				temp.put("fullDate", map.get("fullDate"));
				if(map.get("backgroundpathid")!= null) {
					List<Map<String, Object>> backgroundupload = FeedpostbackgroundDAO.GetPostBackgroundById(map.get("backgroundpathid").toString());
					for(Map<String, Object> mapinner : backgroundupload) 
					{
						temp.put("post_background_id",mapinner.get("feed_post_background_id").toString());
						temp.put("background_img_path", mapinner.get("background_img_path").toString());
						FeedpostbackgroundDAO.SetUse(mapinner.get("feed_post_background_id").toString());
					}
				}
				feedPostMerge.add(temp);
			}
			request.setAttribute("feedPostMerge", feedPostMerge);
			User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId().toLowerCase();

			for (int i = 0; i < feedPostMerge.size(); i++) {
				feedPostMerge.get(i).put("countLike", 0);
				feedPostMerge.get(i).put("countLove", 0);
				feedPostMerge.get(i).put("countHaha", 0);
				feedPostMerge.get(i).put("countWow", 0);
				feedPostMerge.get(i).put("countSad", 0);
				feedPostMerge.get(i).put("countAngry", 0);
				feedPostMerge.get(i).put("likeYang", 0);
				feedPostMerge.get(i).put("reactType", "0");

				// vid
				feedPostMerge.get(i).put("linkUrl", null);
				if (feedPostMerge.get(i).get("path_url") == null) {
					feedPostMerge.get(i).put("upload_type", "etc");

					if (feedPostMerge.get(i).get("details").toString().contains("https://www.youtube.com/embed/")) {
						feedPostMerge.get(i).replace("upload_type", "link");
						if (feedPostMerge.get(i).get("details").toString().split(" ").length > 0) {
							String[] splitTest = feedPostMerge.get(i).get("details").toString().split(" ");
							for (int arrInDetail = 0; arrInDetail < splitTest.length; arrInDetail++) {
								if (splitTest[arrInDetail].contains("https://www.youtube")) {
									if (splitTest[arrInDetail].contains("&")) {
										String[] splitAND = splitTest[arrInDetail].split("&");
										feedPostMerge.get(i).replace("linkUrl", splitAND[0]);
									} else {
										feedPostMerge.get(i).replace("linkUrl", splitTest[arrInDetail]);
									}
								}
							}
						}
					}

					if (feedPostMerge.get(i).get("details").toString().contains("https://www.youtube.com/watch?v=")) {
						String newlink = feedPostMerge.get(i).get("details").toString()
								.replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/");
						//feedPost.get(i).replace("details", newlink);
						feedPostMerge.get(i).replace("upload_type", "link");
//						if (feedPost.get(i).get("details").toString().split(" |\\r|\\n").length > 0) {
						if (newlink.split(" |\\r|\\n").length > 0) {
//							String[] splitTest = feedPost.get(i).get("details").toString().split(" |\\r|\\n");
							String[] splitTest = newlink.split(" |\\r|\\n");
							for (int arrInDetail = 0; arrInDetail < splitTest.length; arrInDetail++) {
								if (splitTest[arrInDetail].contains("https://www.youtube")) {
									if (splitTest[arrInDetail].contains("&")) {
										String[] splitAND = splitTest[arrInDetail].split("&");
										feedPostMerge.get(i).replace("linkUrl", splitAND[0]);
									} else {
										feedPostMerge.get(i).replace("linkUrl", splitTest[arrInDetail]);
									}
								}
							}
						}

					}

//					if (feedPost.get(i).get("details").toString().contains("\r")
//							|| feedPost.get(i).get("details").toString().contains("\n")) {
//						String newDetail = feedPost.get(i).get("details").toString().replaceAll("\r", "<br>");
////						newDetail = newDetail.replaceAll("\n", "<br>");
////						System.out.println(newDetail);
//						feedPost.get(i).replace("details", newDetail);
//					}

				} else {
					if (feedPostMerge.get(i).get("path_url").toString().toUpperCase().contains(".mp4".toUpperCase())) {
						feedPostMerge.get(i).put("upload_type", "mp4");
					}
					if (feedPostMerge.get(i).get("path_url").toString().toUpperCase().contains(".jpeg".toUpperCase())
							|| feedPostMerge.get(i).get("path_url").toString().toUpperCase()
									.contains(".png".toUpperCase())) {
						feedPostMerge.get(i).put("upload_type", "img");
					}

				}

				String feed_id = feedPostMerge.get(i).get("feed_id").toString();

				List<Map<String, Object>> countlike = feedDAO.findAllLike(feed_id, "1");
				for(int j =0;j<countlike.size();j++) {
					if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("1")) {
						feedPostMerge.get(i).replace("countLike", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("2")) {
						feedPostMerge.get(i).replace("countLove", countlike.get(j).get("countlike"));
					} else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("3")) {
						feedPostMerge.get(i).replace("countHaha", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("4")) {
						feedPostMerge.get(i).replace("countWow", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("5")) {
						feedPostMerge.get(i).replace("countSad", countlike.get(j).get("countlike"));
					}else if (feedPostMerge.get(i).get("feed_id") == countlike.get(j).get("feed_id")
							&& countlike.get(j).get("reactType").equals("6")) {
						feedPostMerge.get(i).replace("countAngry", countlike.get(j).get("countlike"));
					}
				}

				int likeTeeNai = (int) feedPostMerge.get(i).get("feed_id");

				List<Map<String, Object>> feedlike = feedDAO.findByIdFeed(likeTeeNai, logonUser);

				if (!feedlike.isEmpty()) {
					feedPostMerge.get(i).replace("likeYang", 1);
					feedPostMerge.get(i).replace("reactType", feedlike.get(0).get("reactType"));

				}
			}

			List<Map<String, Object>> topUserComment = commentDAO.topUserComment();
			request.setAttribute("topUserComment", topUserComment);

			List<Map<String, Object>> userpath = feedDAO.userpath(logonUser);
			request.setAttribute("userpath", userpath);
			request.setAttribute("logonUser", logonUser);
			List<Map<String, Object>> commentadd = commentDAO.findAllComment();
			request.setAttribute("comment", commentadd);
			String sender_id = ur.getId();
			String userpath1 = ur.getPath();
			String email = ur.getEmail();
			String theme = "";

			List<String> userOnlinelist = GetActivitylist();
			// System.out.println(userOnlinelist);
			request.setAttribute("Owner_chat_id", sender_id);
			request.setAttribute("email", email);
			request.setAttribute("UserOnlineList", userOnlinelist);
			request.setAttribute("Userpath", userpath1);
			request.setAttribute("theme", theme);
			request.setAttribute("linkfeed", "0");

			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String listmap_to_json_string(List<Map<String, Object>> list) throws JSONException {
		JSONArray json_arr = new JSONArray();
		for (Map<String, Object> map : list) {
			JSONObject json_obj = new JSONObject();
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json_obj.put(key, value);
			}
			json_arr.put(json_obj);
		}
		return json_arr.toString();
	}

	public static String Commentimage_path = "";

	public String CommentImages() {
		User ur = (User) request.getSession().getAttribute(ONLINEUSER);
		String logonUser = ur.getId().toLowerCase();

		try {
			FileUpload fileupload = new FileUpload();

			if (fileUploadFileName != null) {
				int maxId = fileuploadDAO.getMaxId() + 1;
				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");
				String fileName = fileUploadFileName;
				fileupload.setPath("/upload/user/" + maxId + "_" + fileName);
				FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId + "_" + fileName);

				int l = fileUploadFileName.length();
				int split = fileUploadFileName.indexOf('.');
				String name = fileUploadFileName.substring(0, split);
				String type = (String) fileUploadFileName.subSequence(split, l);

				fileupload.setFileId(maxId);
				fileupload.setUserId(logonUser);
				fileupload.setUserCreate(logonUser);
				fileupload.setName(name);
				fileupload.setType(type);
				fileupload.setTimeCreate(DateUtil.getCurrentTime());
				fileuploadDAO.save(fileupload);

				Commentimage_path = "/upload/user/" + maxId + "_" + fileName;
//				System.out.println(Commentimage_path);

				return SUCCESS;
			} else {

				return SUCCESS;

			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String AddCommentnews() {
//		System.out.println("AddCommentnews" + Commentimage_path);
		User ur = (User) request.getSession().getAttribute(ONLINEUSER);
		String logonUser = ur.getId().toLowerCase();
		String detailsa = request.getParameter("details");
		String sticker = request.getParameter("stk");
		String feedId = request.getParameter("feed_id");
		int feedIdInt = Integer.parseInt(feedId);
		try {
	
			Comment comment = new Comment();

			comment.setFeed_id(feedIdInt);

			if (detailsa != "" && sticker == "" && Commentimage_path == "") {

				comment.setDetails(detailsa);
				comment.setSticker_part(null);
				comment.setCommentImage_path(null);
				comment.setTime_comment(DateUtil.getCurrentTime());
				comment.setTime_updated_comment(DateUtil.getCurrentTime());
				comment.setUser_comment(logonUser);
				commentDAO.savecomment(comment);

			} else if (detailsa == "" && sticker != "" && Commentimage_path == "") {
				comment.setDetails(null);
				comment.setSticker_part(sticker);
				comment.setCommentImage_path(null);
				comment.setTime_comment(DateUtil.getCurrentTime());
				comment.setTime_updated_comment(DateUtil.getCurrentTime());
				comment.setUser_comment(logonUser);
				commentDAO.savecomment(comment);
			} else if (detailsa != "" && sticker != "" && Commentimage_path == "") {
				comment.setDetails(detailsa);
				comment.setSticker_part(sticker);
				comment.setCommentImage_path(null);
				comment.setTime_comment(DateUtil.getCurrentTime());
				comment.setTime_updated_comment(DateUtil.getCurrentTime());
				comment.setUser_comment(logonUser);
				commentDAO.savecomment(comment);
			} else if (detailsa == "" && sticker == "" && Commentimage_path != "") {
				comment.setDetails(null);
				comment.setSticker_part(null);
				comment.setCommentImage_path(Commentimage_path);
				comment.setTime_comment(DateUtil.getCurrentTime());
				comment.setTime_updated_comment(DateUtil.getCurrentTime());
				comment.setUser_comment(logonUser);
				commentDAO.savecomment(comment);
			} else if (detailsa != "" && sticker == "" && Commentimage_path != "") {
				comment.setDetails(detailsa);
				comment.setSticker_part(null);
				comment.setCommentImage_path(Commentimage_path);
				comment.setTime_comment(DateUtil.getCurrentTime());
				comment.setTime_updated_comment(DateUtil.getCurrentTime());
				comment.setUser_comment(logonUser);
				commentDAO.savecomment(comment);
			} else {
				//System.out.println(detailsa + " " + sticker + " " + Commentimage_path);
			}

			Commentimage_path = "";
			List<Map<String, Object>> commentadd = commentDAO.findByIdFeed(feedIdInt);
//			 request.setAttribute("comment", commentadd); 

			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(commentadd));
			out.flush();

			//System.out.println(listmap_to_json_string(commentadd));
			return null;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String topCommentnews() {
		String feedId = request.getParameter("feed_id");
		int feedIdInt = Integer.parseInt(feedId);

		try {
			TimeUnit.MILLISECONDS.sleep(1000);
			List<Map<String, Object>> topUserCommentbyId = commentDAO.topUserCommentById(feedIdInt);
//				request.setAttribute("topUserComment", topUserComment);

			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(topUserCommentbyId));
			out.flush();

			return null;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String AddFeednews() {
		User ur = (User) request.getSession().getAttribute(ONLINEUSER);
		String logonUser = ur.getId().toLowerCase();
		String detail = null;
		String backgroundcolors = null;
		String backgroundrgbs = null;
		String backgroundpathid = null;
		Integer radios = 0;
	
		try {
			if (test.equals("officail")) {
				radios = 1;
			} else {
				radios = 0;
			}
			if (detailsNew.equals(null) || detailsNew.equals("")) {
				detail = null;
			} 
			else {
				detailsNew = detailsNew.replaceAll("<", "&lt;");
				detailsNew = detailsNew.replaceAll(">", "&gt;");
				detail = detailsNew;
			}
			if(backgroundcolor.equals(null) || backgroundcolor.equals("")) {
				 backgroundcolors = null;
			}else {
				backgroundcolors = backgroundcolor;
			}
			if(backgroundpath.equals(null) || backgroundpath.equals("")) {
				backgroundpathid = null;
			}else {
				backgroundpathid = this.backgroundpath;
			}
			if(backgroundrgb.equals(null) || backgroundrgb.equals("")) {
				backgroundrgbs = null;
			}else {
				backgroundrgbs = backgroundrgb;
			}

			FileUpload fileupload = new FileUpload();


			if (detail == null && fileUploadFileName == null) {
				return SUCCESS;
			} else {
				if (fileUploadFileName != null) {
					int maxId = fileuploadDAO.getMaxId() + 1;
					ServletContext context = request.getServletContext();
					String fileServerPath = context.getRealPath("/");
					String fileName = fileUploadFileName;
					fileupload.setPath("/upload/user/" + maxId + "_" + fileName);
					FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId + "_" + fileName);

					int l = fileUploadFileName.length();
					int split = fileUploadFileName.indexOf('.');
					String name = fileUploadFileName.substring(0, split);
					String type = (String) fileUploadFileName.subSequence(split, l);

					fileupload.setFileId(maxId);
					fileupload.setUserId(logonUser);
					fileupload.setUserCreate(logonUser);
					fileupload.setName(name);
					fileupload.setType(type);
					fileupload.setTimeCreate(DateUtil.getCurrentTime());
					fileuploadDAO.save(fileupload);

					FeedNews feed = new FeedNews();
					feed.setUser_id(logonUser);
					feed.setDetails(detail);
					feed.setStatus_post(radios);
					feed.setPath_url("/upload/user/" + maxId + "_" + fileName);
					feed.setTime_posted(DateUtil.getCurrentTime());
					feed.setTime_updated_post(DateUtil.getCurrentTime());
					feedDAO.savefeed(feed);
					List<Map<String, Object>> feedPost = feedDAO.findAll();
					request.setAttribute("feedPost", feedPost);
					return SUCCESS;
				} else {
					if(backgroundpath.equalsIgnoreCase("yes")) {
						backgroundpathid = backgroundcolors;
						backgroundcolors = "99";
					}else if(backgroundpath.equalsIgnoreCase("no")) {
						
					}
					FeedNews feed = new FeedNews();
					feed.setUser_id(logonUser);
					feed.setDetails(detail);
					feed.setStatus_post(radios);
					feed.setPath_url(null);
					feed.setTime_posted(DateUtil.getCurrentTime());
					feed.setTime_updated_post(DateUtil.getCurrentTime());
					feed.setBackgroundType(backgroundcolors);
					feed.setBackgroundRGB(backgroundrgbs);
					feed.setBackgroundpathid(backgroundpathid);
					feedDAO.savefeed(feed);
					List<Map<String, Object>> feedPost = feedDAO.findAll();
					List<Map<String,Object>> feedPostMerge = new ArrayList();
					for(Map<String,Object> map : feedPost) {
						Map<String,Object> temp = new HashMap();
						temp.put("feed_id ", map.get("feed_id"));
						temp.put("details", map.get("details"));
						temp.put("user_id", map.get("user_id"));
						temp.put("time_posted", map.get("time_posted"));
						temp.put("time_update_post", map.get("time_update_post"));
						temp.put("path_url", map.get("path_url"));
						temp.put("status_post", map.get("status_post"));
						temp.put("backgroundType", map.get("backgroundType"));
						temp.put("backgroundRGB", map.get("backgroundRGB"));
						temp.put("backgroundpathid", map.get("backgroundpathid"));
						temp.put("role", map.get("role"));
						temp.put("path", map.get("path"));
						temp.put("name", map.get("name"));
						if(map.get("backgroundpathid")!= null) {
							List<Map<String, Object>> backgroundupload = FeedpostbackgroundDAO.GetPostBackgroundById(map.get("backgroundpathid").toString());
							for(Map<String, Object> mapinner : backgroundupload) 
							{
								temp.put("post_background_id",mapinner.get("feed_post_background_id").toString());
								temp.put("background_img_path", mapinner.get("background_img_path").toString());
								FeedpostbackgroundDAO.SetUse(mapinner.get("feed_post_background_id").toString());
							}
						}
						feedPostMerge.add(temp);
					}
					request.setAttribute("feedPostMerge", feedPostMerge);
					return SUCCESS;

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String likeFeednews() {
		User ur = (User) request.getSession().getAttribute(ONLINEUSER);
		String logonUser = ur.getId().toLowerCase();
		String id = request.getParameter("id");
		int idInt = Integer.parseInt(id);
		String reactType = request.getParameter("react");
		try {
			List<Map<String, Object>> feedlike = feedDAO.findByIdFeed(idInt, logonUser);
			request.setAttribute("feedlike", feedlike);
			if (feedlike.isEmpty()) {
				FeedNewsLike like = new FeedNewsLike();
				like.setUser_id(logonUser);
				like.setFeed_id(idInt);
				like.setReactType(reactType);
				feedDAO.savelike(like);
			} else {
				DeleteLike(logonUser, idInt, reactType);
			}
			feedlike = feedDAO.findByIdFeed(idInt, logonUser);

			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(feedlike));
			out.flush();

			return null;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String EditFeednews() {

		String id = request.getParameter("id");
		String details = request.getParameter("detail");
		int idInt = Integer.parseInt(id);

		try {
			FeedNews feed = new FeedNews();
			feed = feedDAO.findById(idInt);
			feed.setDetails(details);
			feed.setFeed_id(idInt);
			feed.setTime_updated_post(DateUtil.getCurrentTime());
			feedDAO.updatepost(feed);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String EditComment() {

		String idcom = request.getParameter("id");
		String detailscom = request.getParameter("details");
		int idInt = Integer.parseInt(idcom);

		String feedid = request.getParameter("feed_id");
		int idIntFeed = Integer.parseInt(feedid);

		try {
			Comment comment = new Comment();
			comment = commentDAO.findByIdComment(idInt);
			comment.setDetails(detailscom);
			comment.setComment_id(idInt);
			comment.setTime_updated_comment(DateUtil.getCurrentTime());
			commentDAO.updatecomment(comment);

			TimeUnit.MILLISECONDS.sleep(500);
			List<Map<String, Object>> commentadd = commentDAO.findByIdFeed(idIntFeed);

			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(commentadd));
			out.flush();
			return null;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String EditCommentTop() {

		String idcom = request.getParameter("id");
		String detailscom = request.getParameter("detail");
		int idInt = Integer.parseInt(idcom);

		String feedid = request.getParameter("feed_id");
		int idIntFeed = Integer.parseInt(feedid);

		try {
			Comment comment = new Comment();
			comment = commentDAO.findByIdComment(idInt);
			comment.setDetails(detailscom);
			comment.setComment_id(idInt);
			comment.setTime_updated_comment(DateUtil.getCurrentTime());
			commentDAO.updatecomment(comment);

			TimeUnit.MILLISECONDS.sleep(500);
			List<Map<String, Object>> topUserCommentbyId = commentDAO.topUserCommentById(idIntFeed);

			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(topUserCommentbyId));
			out.flush();

			return null;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String DeleteFeednews() {
		String id = request.getParameter("id");
		int idInt = Integer.parseInt(id);
		try {
			FeedNews feed = new FeedNews();
			feed = feedDAO.findById(idInt);
			feed.setFeed_id(idInt);
			feedDAO.deletepost(feed);
			List<Map<String, Object>> countlike = feedDAO.findAllLike(id);
			FeedNewsLike like = new FeedNewsLike();
			if (!countlike.isEmpty()) {
				for (int i = 0; i < countlike.size(); i++) {
					like = feedDAO.findByIdLike((Integer) countlike.get(i).get("like_id"));
					feedDAO.deletelike(like);
				}
			}
			Comment comment = new Comment();
			List<Map<String, Object>> Dcomment = commentDAO.findWhereFeednewsId(idInt);
			for (int i = 0; i < Dcomment.size(); i++) {
				String commentId = Dcomment.get(i).get("comment_id").toString();
				int commentIdInt = Integer.parseInt(commentId);

				comment = commentDAO.findByIdComment(commentIdInt);
				commentDAO.deletecomment(comment);
			}

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String DeleteComment() {
		String id = request.getParameter("id");
		String feed = request.getParameter("feedid");
		int idInt = Integer.parseInt(id);
		int idfeedInt = Integer.parseInt(feed);
		try {
			Comment comment = new Comment();
			comment = commentDAO.findByIdComment(idInt);
			comment.setFeed_id(idInt);
			commentDAO.deletecomment(comment);
			TimeUnit.MILLISECONDS.sleep(700);
			List<Map<String, Object>> commentadd = commentDAO.findByIdFeed(idfeedInt);

			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(commentadd));
			out.flush();

			return null;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String DeleteLike(String user, int idInt, String reactType) {
		try {
			FeedNewsLike like = new FeedNewsLike();
			List<Map<String, Object>> feedlike = feedDAO.findIdLike(user, idInt);
			int id = (int) feedlike.get(0).get("like_id");
			like = feedDAO.findByIdLike(id);

			if (reactType.equals(feedlike.get(0).get("reactType"))) {
				feedDAO.deletelike(like);
			} else {
				like.setReactType(reactType);
				like.setFeed_id(idInt);
				like.setUser_id(user);
				feedDAO.updatelike(like);
			}
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String CountRakThur() {
		String feed = request.getParameter("feed_id");
		try {

			List<Map<String, Object>> allLike1 = feedDAO.LikeRuam(feed);
			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(allLike1));
			out.flush();

			return null;

		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

}