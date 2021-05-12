package com.cubesofttech.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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

import com.cubesofttech.dao.ChatDAOImpl;
import com.cubesofttech.dao.ChatThemeDAO;
import com.cubesofttech.dao.GroupChatDAO;
import com.cubesofttech.dao.GroupChatMessageDAO;
import com.cubesofttech.dao.GroupChatMemberDAO;
import com.cubesofttech.dao.GroupChatReadLikeDAO;
import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.ChatUserSettingDAO;
import com.cubesofttech.dao.ChatDAO;
import com.cubesofttech.listener.SessionListener;
import com.cubesofttech.model.ChatTheme;
import com.cubesofttech.model.ChatUserSetting;
import com.cubesofttech.model.Chat_message;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.Group_chat;
import com.cubesofttech.model.Group_chat_member;
import com.cubesofttech.model.Group_chat_message;
import com.cubesofttech.model.Group_chat_read_like_status;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ChatAction extends ActionSupport {
	private static final long serialVersionUID = 2280661337420278284L;

	private static final Integer Interger = null;
	
	@Autowired
	private ChatDAO ChatDAO;

	@Autowired
	private ChatThemeDAO ChatThemeDAO;
	
	@Autowired
	private GroupChatDAO GroupChatDAO;
	
	@Autowired
	private GroupChatMessageDAO GroupChatMessageDAO;
	
	@Autowired
	private GroupChatMemberDAO GroupChatMemberDAO;
	
	@Autowired
	private GroupChatReadLikeDAO GroupChatReadLikeDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ChatUserSettingDAO ChatUserSettingDAO;
	
	@Autowired
	private DepartmentDAO DepartmentDAO;

	@Autowired
	private FileUploadDAO fileuploadDAO;

	private User user;

	private String userId;

	private File fileUpload;

	private String fileUploadFileName;

	private String userUploadId;

	private String userUploadCreate;

	private String fileUploadSize;

	private String reciever_id_hid2;
	
	private String reciever_id_hid3;
	
	private String reciever_id_hid4;
	
	private String[] selectuser;
	
	private String groupname;
	
	private String groupdescription;
	
	private String reciever_id_hid5;
	
	
	
	public String getReciever_id_hid5() {
		return reciever_id_hid5;
	}

	public void setReciever_id_hid5(String reciever_id_hid5) {
		this.reciever_id_hid5 = reciever_id_hid5;
	}

	public String getReciever_id_hid4() {
		return reciever_id_hid4;
	}

	public void setReciever_id_hid4(String reciever_id_hid4) {
		this.reciever_id_hid4 = reciever_id_hid4;
	}

	public String[] getSelectuser() {
		return selectuser;
	}

	public void setSelectuser(String[] selectuser) {
		this.selectuser = selectuser;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getGroupdescription() {
		return groupdescription;
	}

	public void setGroupdescription(String groupdescription) {
		this.groupdescription = groupdescription;
	}

	public String getReciever_id_hid3() {
		return reciever_id_hid3;
	}

	public void setReciever_id_hid3(String reciever_id_hid3) {
		this.reciever_id_hid3 = reciever_id_hid3;
	}

	public String getReciever_id_hid2() {
		return reciever_id_hid2;
	}

	public void setReciever_id_hid2(String reciever_id_hid2) {
		this.reciever_id_hid2 = reciever_id_hid2;
	}

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
	
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public List<String> GetActivitylist () {
		SessionListener session = new SessionListener();
		List<String> userOnlineList = new ArrayList<String>();
		userOnlineList = session.getSessionActivitylist();
		User user = (User) request.getSession().getAttribute("onlineUser");
		String userid = user.getId().toLowerCase();
		List<String> userOnlineListLowerCase = new ArrayList();
		for(String x : userOnlineList) {
			userOnlineListLowerCase.add(x.toString().toLowerCase());
		}
		return removeDuplicatelist(userOnlineListLowerCase);
	}
	
	public List<String> removeDuplicatelist(List<String> onlinelist){
		List<String> userOnlineList = new ArrayList<String>();
		for(String list : onlinelist) {
			if(!(userOnlineList.contains(list))) {
				userOnlineList.add(list);
			}
		}
		return userOnlineList;
	}
	
	public String GetMyGrouplist() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			List<Map<String , Object>> myGroup = new ArrayList();
			String chat_owner = user.getId().toLowerCase();
			List<Map<String,Object>> Group = new ArrayList();
			Group = GroupChatDAO.GetmyGroup(chat_owner.toLowerCase());
			for(Map<String,Object> map : Group) {
				Map<String,Object> temp = new HashMap();
				temp.put("Group_chat_id", map.get("Group_chat_id"));
				temp.put("Group_chat_Name", map.get("Group_chat_Name"));
				temp.put("Group_Description", map.get("Group_Description"));
				temp.put("Group_img_path", map.get("Group_img_path"));
				temp.put("Group_chat_user_create", map.get("Group_chat_user_create"));
				temp.put("Group_time_create", map.get("Group_time_create"));
				temp.put("Group_chat_member_id", map.get("Group_chat_member_id"));
				temp.put("member_id", map.get("member_id"));
				temp.put("favorite_mark", map.get("favorite_mark"));
				temp.put("inviter_member_id", map.get("inviter_member_id"));
				temp.put("member_time_create", map.get("member_time_create"));
				List<Map<String,Object>> unreadcount = GroupChatDAO.GetGroupChatUnread(chat_owner, map.get("Group_chat_id").toString());
				for(Map<String,Object> unreadmap : unreadcount) {
					temp.put("unread_count", unreadmap.get("unread_count").toString());
				}
				myGroup.add(temp);				
			}
			PrintWriter out;
			out = response.getWriter();
			out.println(listmap_to_json_string(myGroup));
			out.flush();
			return null;
		}catch(Exception ex) {
			return "error";
		}
	}
	public String GetOnlineUser() {
		try {
		List<String> userOnlineList = new ArrayList<String>();
		User user = (User) request.getSession().getAttribute("onlineUser");
		String chat_owner = user.getId().toLowerCase();
		userOnlineList = GetActivitylist();
		List<Map<String, Object>> Reciever_info = new ArrayList();
		String String_onlinelist = "";
		int r = 0;
		for(String x : userOnlineList) {	
			if(r == (userOnlineList.size()-1) )
			{
				String_onlinelist += "'"+x.toLowerCase()+"'";
			}else {
				String_onlinelist += "'"+x.toLowerCase()+"'"+",";
			}
			r+=1;
		}
		r=0;
		List<Map<String, Object>> unread_status_count_all = ChatDAO.get_chat_unread_count_all(chat_owner, String_onlinelist);
		if(!(unread_status_count_all == null)) {
		for(int j = 1 ; j < 3 ; j++) {
			if(j == 1) {
				for(Map<String, Object> map : unread_status_count_all) {
					Map<String, Object> userinfo = new HashMap<String , Object>();
					String user_path ="";
					String unread_count="";
					for(String x : userOnlineList) {
						if(map.get("Sender_id").toString().equalsIgnoreCase(x)) {
							List<Map<String, Object>> userimg = ChatDAO.get_img_for_chat(x);
							for(Map<String, Object> imgpath : userimg) {
								if(imgpath.get("path")!=null) {
									user_path = imgpath.get("path").toString();
								}else {
									user_path = null;
								}								
							}
							String user_name = "";
							List<Map<String,Object>> userdata = userDAO.findById2(x);
							for(Map<String,Object> usergetname : userdata) {
								user_name = usergetname.get("name").toString();
							}
							userinfo.put("uname", user_name);
							unread_count = map.get("unread_count").toString();
							userinfo.put("uid", x.toLowerCase());
							userinfo.put("online", "1");
							userinfo.put("img", user_path);
							userinfo.put("unread_count", unread_count);
							Reciever_info.add(userinfo);
						}						
					}
				}
			}
			else if( j == 2 ) {
				for(String x : userOnlineList) {
				Map<String, Object> userinfo = new HashMap<String , Object>();
				String user_path ="";
				String unread_count="";
				boolean match = false;
				if(!unread_status_count_all.isEmpty()) {
					for(Map<String, Object> map : unread_status_count_all) {
					if(j == 1) {
						if(map.get("Sender_id").toString().equalsIgnoreCase(x)) {
							match = true;
							List<Map<String, Object>> userimg = ChatDAO.get_img_for_chat(x);
							for(Map<String, Object> imgpath : userimg) {
								if(imgpath.get("path")!=null) {
									user_path = imgpath.get("path").toString();
								}else {
									user_path = null;
								}
							}
							String user_name = "";
							List<Map<String,Object>> userdata = userDAO.findById2(x);
							for(Map<String,Object> usergetname : userdata) {
								user_name = usergetname.get("name").toString();
							}
							userinfo.put("uname", user_name);
							unread_count = map.get("unread_count").toString();
							userinfo.put("uid", x.toLowerCase());
							userinfo.put("online", "1");
							userinfo.put("img", user_path);
							userinfo.put("unread_count", unread_count);
							Reciever_info.add(userinfo);
						}
					}
					else if(j == 2) {
						if(x.equalsIgnoreCase(map.get("Sender_id").toString())) {							
							match = true;
						}
						if(match == false && !(x.equalsIgnoreCase(map.get("Sender_id").toString())) && unread_status_count_all.indexOf(map) == unread_status_count_all.size() -1 ) {
							List<Map<String, Object>> userimg = ChatDAO.get_img_for_chat(x);
							for(Map<String, Object> imgpath : userimg) {
								if(imgpath.get("path")!=null) {
									user_path = imgpath.get("path").toString();
								}else {
									user_path = null;
								}		
							}
							String user_name = "";
							List<Map<String,Object>> userdata = userDAO.findById2(x);
							for(Map<String,Object> usergetname : userdata) {
								user_name = usergetname.get("name").toString();
							}
							userinfo.put("uname", user_name);
							unread_count = map.get("unread_count").toString();
							userinfo.put("uid", x.toLowerCase());
							userinfo.put("online", "1");
							userinfo.put("img", user_path);
							userinfo.put("unread_count", null);
							Reciever_info.add(userinfo);
						}
					}
				}
				}else {
					List<Map<String, Object>> userimg = ChatDAO.get_img_for_chat(x);
					for(Map<String, Object> imgpath : userimg) {
						if(imgpath.get("path")!=null) {
							user_path = imgpath.get("path").toString();
						}else {
							user_path = null;
						}	
					}	
					String user_name = "";
					List<Map<String,Object>> userdata = userDAO.findById2(x);
					for(Map<String,Object> usergetname : userdata) {
						user_name = usergetname.get("name").toString();
					}
					userinfo.put("uname", user_name);
					userinfo.put("uid", x.toLowerCase());
					userinfo.put("online", "1");
					userinfo.put("img",  user_path);
					userinfo.put("unread_count", null);
					Reciever_info.add(userinfo);	
				}	
			}
			}	
		}
		}
		if(!String_onlinelist.equalsIgnoreCase("") && String_onlinelist != null) {			
		
		List<Map<String,Object>> OffLineUnread = ChatDAO.get_offline_unread_user_history(chat_owner, String_onlinelist);
		String offlineunreadlist = "";
		List<String> offlineunread = new ArrayList();
		int a = 0;
		if(OffLineUnread != null) {for(Map<String,Object> offunread : OffLineUnread) {
			String uid = offunread.get("Sender_id").toString().toLowerCase();
			offlineunread.add(offunread.get("Sender_id").toString().toLowerCase());
			if(a == (OffLineUnread.size()-1) )
			{
				offlineunreadlist += "'"+offunread.get("Sender_id").toString().toLowerCase()+"'";
			}else {
				offlineunreadlist += "'"+offunread.get("Sender_id").toString().toLowerCase()+"'"+",";
			}
			a+=1;
			Map<String,Object> userinfo = new HashMap();
			String user_path = "";
			List<Map<String, Object>> userimg = ChatDAO.get_img_for_chat(uid);
			for(Map<String, Object> imgpath : userimg) {
				if(imgpath.get("path")!=null) {
					user_path = imgpath.get("path").toString();
				}else {
					user_path = null;
				}	
			}
			String user_name = "";
			List<Map<String,Object>> userdata = userDAO.findById2(uid);
			for(Map<String,Object> usergetname : userdata) {
				user_name = usergetname.get("name").toString();
			}
			userinfo.put("uname",user_name);
			userinfo.put("uid", offunread.get("Sender_id").toString().toLowerCase());
			userinfo.put("online", "0");
			userinfo.put("img", user_path);
			userinfo.put("unread_count", offunread.get("unread_count").toString());
			Reciever_info.add(userinfo);
		}
		}
		
		a=0;
		if(offlineunreadlist == "" || offlineunreadlist == null) {
			offlineunreadlist = String_onlinelist;
		}else {
			offlineunreadlist += ","+String_onlinelist;
		}
		//System.out.println(offlineunreadlist);
		
		if(!offlineunreadlist.equalsIgnoreCase("") && offlineunreadlist != null) {
			List<Map<String,Object>> AllUserenableid = new ArrayList();
			AllUserenableid =userDAO.AllUserEnable(chat_owner);
			for(Map<String,Object> map : AllUserenableid) {
				String not_in_list = "'"+map.get("id")+"'";
				List<Map<String,Object>> OffLine = ChatDAO.Check_chat_history(chat_owner, offlineunreadlist, map.get("id").toString());
				if(OffLine != null) {
					for(Map<String,Object> mapx : OffLine) {
						String uid = mapx.get("Sender_id").toString().toLowerCase();
						Map<String,Object> userinfo = new HashMap();
						String user_path = "";
						List<Map<String, Object>> userimg = ChatDAO.get_img_for_chat(uid);
						for(Map<String, Object> imgpath : userimg) {
							if(imgpath.get("path")!=null) {
								user_path = imgpath.get("path").toString();
							}else {
								user_path = null;
							}	
						}
						String user_name = "";
						List<Map<String,Object>> userdata = userDAO.findById2(uid);
						for(Map<String,Object> usergetname : userdata) {
							user_name = usergetname.get("name").toString();
						}
						userinfo.put("uname",user_name);
						userinfo.put("uid", mapx.get("Sender_id").toString().toLowerCase());
						userinfo.put("online", "0");
						userinfo.put("img", user_path);
						userinfo.put("unread_count", null);
						Reciever_info.add(userinfo);
						
					}
				}else {
					
				}
				
			}
		}
		
		/*
		if(!offlineunreadlist.equalsIgnoreCase("") && offlineunreadlist != null) {
			List<Map<String,Object>> OffLine = ChatDAO.get_offline_user_history(chat_owner, offlineunreadlist);
			//System.out.println(OffLine);
			if(OffLine != null) {
			for(Map<String,Object> map : OffLine) {
				String uid = map.get("Sender_id").toString().toLowerCase();
				Map<String,Object> userinfo = new HashMap();
				String user_path = "";
				List<Map<String, Object>> userimg = ChatDAO.get_img_for_chat(uid);
				for(Map<String, Object> imgpath : userimg) {
					if(imgpath.get("path")!=null) {
						user_path = imgpath.get("path").toString();
					}else {
						user_path = null;
					}	
				}
				String user_name = "";
				List<Map<String,Object>> userdata = userDAO.findById2(uid);
				for(Map<String,Object> usergetname : userdata) {
					user_name = usergetname.get("name").toString();
				}
				userinfo.put("uname",user_name);
				userinfo.put("uid", map.get("Sender_id").toString().toLowerCase());
				userinfo.put("online", "0");
				userinfo.put("img", user_path);
				userinfo.put("unread_count", null);
				Reciever_info.add(userinfo);
				
			}
			}
		}
		*/
		}
		PrintWriter out;
		out = response.getWriter();
		out.println(listmap_to_json_string(Reciever_info));
		//request.setAttribute("json", listmap_to_json_string(Reciever_info));
		out.flush();
		return null;
		} catch (IOException e) {
			//e.printStackTrace();
			return "error";
		} catch (JSONException e) {
			//e.printStackTrace();
			return "error";
		} catch (Exception e) {

			//e.printStackTrace();
			return "error";
		}
	}
	
	public String set_theme() {
		String theme = request.getParameter("theme").toString();
		String userid = request.getParameter("userid").toString();
		try {
			List<Map<String,Object>> gettheme = ChatThemeDAO.Find_theme(userid);
			if(gettheme.size() >= 1) {
				ChatThemeDAO.Update_theme(userid, theme);
			}else {
				ChatTheme ct = new ChatTheme();
				ct.setOwner_chat_id(userid);
				ct.setTheme(theme);
				ChatThemeDAO.save(ct);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";		
		}
		return null;
	}
	public String set_read() {
		try {
		User user = (User) request.getSession().getAttribute("onlineUser");
		String chat_partner = request.getParameter("Reciever").toLowerCase();
		String chat_owner = user.getId().toLowerCase();
		ChatDAO.set_read(chat_owner, chat_partner);
		return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	public String set_read_group() {
		try {
		User user = (User) request.getSession().getAttribute("onlineUser");
		String chat_id = request.getParameter("messageid").toLowerCase();
		String chat_owner = user.getId().toLowerCase();
		GroupChatReadLikeDAO.set_read(chat_owner, chat_id);
		return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	public String GetMessage () {
		try {
		User user = (User) request.getSession().getAttribute("onlineUser");
		String chat_partner = request.getParameter("Reciever");
		String chat_owner = user.getId().toLowerCase();
		String chat_owner_name = user.getName();
		String chat_owner_nick_name = user.getNickName();
		String limit = request.getParameter("limit");
		if(limit==null || limit == "") {
			limit ="10";
		}
		List<Map<String, Object>> message;
		message = ChatDAO.get_chat_message(chat_owner.toLowerCase(), chat_partner.toLowerCase(),limit);
		List<String> userOnlinelist = GetActivitylist();
		request.setAttribute("UserOnlineList", userOnlinelist);
		request.setAttribute("message", message);
		request.setAttribute("Owner_chat_id", chat_owner);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();		
		out.println(listmap_to_json_string(message));
		out.flush();
		return null;		
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String checknullString(String Strings) {
		if(Strings == null) {
			return null;
		}else {
			return Strings;
		}
	}
	public String GetGroupMessage() {
		try {
		User user = (User) request.getSession().getAttribute("onlineUser");
		String chat_id = request.getParameter("GroupReciever");
		String chat_owner = request.getParameter("Owner_chat_id"); 
		String limit = request.getParameter("limit");
		//System.out.println(limit);
		if(limit == null || limit == "") {
			limit = "10";
		}
		List<Map<String, Object>> message = new ArrayList() ;
		List<Map<String , Object>> getdata = GroupChatMessageDAO.GetGroupMessage(chat_id, chat_owner,limit);
		
		for(Map data : getdata) {
			Map<String,Object> temp = new HashMap<>();
			temp.put("Group_chat_message_id", data.get("Group_chat_message_id"));
			temp.put("Group_chat_id", data.get("Group_chat_id"));
			temp.put("Sender_id",data.get("Sender_id"));
			temp.put("Date_time_message", data.get("Date_time_message"));
			temp.put("image_message_status",data.get("image_message_status"));
			temp.put("image_path",data.get("image_path"));
			temp.put("file_message_status", data.get("file_message_status"));
			temp.put("file_path", data.get("file_path"));
			temp.put("file_name", data.get("file_name"));
			temp.put("sticker_message_status", data.get("sticker_message_status"));
			temp.put("sticker_path", data.get("sticker_path"));
			temp.put("Group_chat_message", data.get("Group_chat_message"));
			temp.put("Group_chat_Name", data.get("Group_chat_Name"));
			temp.put("Group_Description", data.get("Group_Description"));
			temp.put("Group_img_path", data.get("Group_img_path"));
			temp.put("Group_chat_user_create", data.get("Group_chat_user_create"));
			temp.put("Group_time_create", data.get("Group_time_create"));
			temp.put("Group_chat_read_like_status_id", data.get("Group_chat_read_like_status_id"));
			temp.put("read_status", data.get("read_status"));
			temp.put("like_status", data.get("like_status"));
			temp.put("user_id", data.get("user_id"));
			temp.put("Chat_time", data.get("Chat_time"));
			temp.put("information_message_status", data.get("information_message_status"));
			temp.put("information_message", data.get("information_message"));
			//System.out.println(data.get("Sender_id").toString());
			List<Map<String,Object>> userinfo = userDAO.findById2(data.get("Sender_id").toString());
			String path = "";
			for(Map map : userinfo) {
				if(map.get("path") != null) {
					path = map.get("path").toString();
				}else {
					path = null;
				}
				
			}
			List<Map<String,Object>> readcount = GroupChatReadLikeDAO.Get_read_count(data.get("Group_chat_id").toString(), data.get("Group_chat_message_id").toString());
			int readcountnumber = 0;
			for(Map map : readcount) {
				readcountnumber = Integer.parseInt(map.get("readcount").toString())-1;
			}
			List<Map<String,Object>> likecount = GroupChatReadLikeDAO.Get_like_count(data.get("Group_chat_id").toString(), data.get("Group_chat_message_id").toString());
			int likecountnumber = 0;
			for(Map map :likecount) {
				likecountnumber = Integer.valueOf(map.get("likecount").toString());
			}
			temp.put("likecount", String.valueOf(likecountnumber));
			temp.put("readcount", String.valueOf(readcountnumber));
			temp.put("path", path);
			//System.out.println(temp);
			message.add(temp);	
			//System.out.println(message);
		}
		
		
		PrintWriter out = response.getWriter();		
		out.println(listmap_to_json_string(message));
		out.flush();
		return null;		
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	
	public String set_like_status() {
		try {
			String message_id = request.getParameter("message_id");
			String like_status = request.getParameter("like_status");
			ChatDAO.Set_like(message_id,like_status);
			PrintWriter out = response.getWriter();
			out.println("DONE");
			out.flush();
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String GetCurrentMember() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String User_id = user.getId().toLowerCase();
			String group_id = request.getParameter("group_id");
			List<Map<String,Object>> CurrentMember = new ArrayList();
			List<Map<String,Object>> Member_in_group = GroupChatMemberDAO.getMember(group_id);
			for(Map<String,Object> map : Member_in_group) {
				Map<String,Object> temp = new HashMap();
				temp.put("Group_chat_member_id", map.get("Group_chat_member_id"));
				temp.put("Group_chat_id", map.get("Group_chat_id"));
				temp.put("member_id", map.get("member_id"));
				temp.put("inviter_member_id", map.get("inviter_member_id"));
				temp.put("member_time_create", map.get("member_time_create"));
				List<Map<String , Object>> userdata = new ArrayList();
				userdata = userDAO.findById2(map.get("member_id").toString());
				for(Map<String , Object> mapx : userdata) {
					temp.put("department_id", mapx.get("department_id"));
					temp.put("name", mapx.get("name"));
					temp.put("id", mapx.get("id"));
					temp.put("email", mapx.get("email"));
					temp.put("path", mapx.get("path"));					
				}
				CurrentMember.add(temp);
			}
			
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(CurrentMember));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String FindMember() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String User_id = user.getId().toLowerCase();
			String group_id = request.getParameter("group_id");
			String member_name = request.getParameter("member_name");
			List<Map<String,Object>> CurrentMember = new ArrayList();
			List<Map<String,Object>> Member_in_group = GroupChatMemberDAO.FindMemberByName(group_id, member_name);
			for(Map<String,Object> map : Member_in_group) {
				Map<String,Object> temp = new HashMap();
				temp.put("Group_chat_member_id", map.get("Group_chat_member_id"));
				temp.put("Group_chat_id", map.get("Group_chat_id"));
				temp.put("member_id", map.get("member_id"));
				temp.put("inviter_member_id", map.get("inviter_member_id"));
				temp.put("member_time_create", map.get("member_time_create"));
				List<Map<String , Object>> userdata = new ArrayList();
				userdata = userDAO.findById2(map.get("member_id").toString());
				for(Map<String , Object> mapx : userdata) {
					temp.put("department_id", mapx.get("department_id"));
					temp.put("name", mapx.get("name"));
					temp.put("id", mapx.get("id"));
					temp.put("email", mapx.get("email"));
					temp.put("path", mapx.get("path"));					
				}
				CurrentMember.add(temp);
			}
			
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(CurrentMember));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String set_Group_like_status() {
		User user = (User) request.getSession().getAttribute("onlineUser");
		String userid = user.getId().toLowerCase();
		try {
			String group_id = request.getParameter("group_id");
			String message_id = request.getParameter("message_id");
			String like_status = request.getParameter("like_status");
			GroupChatReadLikeDAO.set_like(userid, message_id, like_status);
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	public String GetEnablelistdata() {
		try {
			String searchtype = request.getParameter("searchtype");
			String searchtext = request.getParameter("searchtxt");
			String depart = request.getParameter("depart");
			List<Map<String,Object>> userlist = new ArrayList();
			//System.out.println(searchtype);
			User user = (User) request.getSession().getAttribute("onlineUser");
			String userid = user.getId().toLowerCase();
			if(searchtype.equalsIgnoreCase("all")) {
				userlist = userDAO.AllUserEnable(userid);
			}else if(searchtype.equalsIgnoreCase("both")) {
				userlist = userDAO.findUserEnablebyIdAndDepartment(depart, searchtext);
			}else if(searchtype.equalsIgnoreCase("name")) {
				userlist = userDAO.findUserEnablebyNameOrId(searchtext);
			}else if(searchtype.equalsIgnoreCase("depart")){
				userlist = userDAO.findUserEnablebyDepartment(depart);
			}
			
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(userlist));
			out.flush();
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
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
	
	public String SendMassage() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String reciever_id = request.getParameter("Reciever");
			String sender_id = user.getId().toLowerCase();
			String message_text = request.getParameter("chat_text");
			String sender_read_status = "1";
			String reciever_read_status = "0";
			ChatDAO.InsertMessage(message_text, sender_id, reciever_id);
			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	public String SendGroupMassage() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String reciever_id = request.getParameter("GroupReciever_id");
			String sender_id = user.getId().toLowerCase();
			String message_text = request.getParameter("chat_text");
			if(!message_text.equalsIgnoreCase("")) {
			Group_chat_message gcm = new Group_chat_message();
			gcm.setGroup_chat_id(Integer.valueOf(reciever_id));
			gcm.setSender_id(sender_id);
			gcm.setImage_message_status('0');
			gcm.setFile_message_status('0');
			gcm.setSticker_message_status('0');
			gcm.setGroup_chat_message(message_text);
			GroupChatMessageDAO.save(gcm);
			List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
			String groupmessageid = "";
			for(Map map : lastMessageList) {
				groupmessageid = map.get("Group_chat_message_id").toString();
			}
			List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(reciever_id);
			for(Map map : memberlist) {
				if(map.get("member_id").toString().equalsIgnoreCase(sender_id)) {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('1');
					grl.setGroup_chat_id(Integer.valueOf(reciever_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}else {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('0');
					grl.setGroup_chat_id(Integer.valueOf(reciever_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}
				
			}
			}
			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}	
	}
	
	public String set_sticker() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String reciever_id = request.getParameter("Reciever");
			String send_sticker = request.getParameter("SendSticker");
			String message = "";
			String sender_id = user.getId().toLowerCase();
			String sender_read_status = "1";
			String reciever_read_status = "0";
			String sticker_status = "1";
			Chat_message cm = new Chat_message ();
			cm.setSticker_path(send_sticker);
			cm.setMessage_text(message);
			cm.setSticker_status(sticker_status);
			cm.setSender_id(sender_id.toLowerCase());
			cm.setReciever_id(reciever_id.toLowerCase());
			cm.setSender_read_status(sender_read_status);
			cm.setReciever_read_status(reciever_read_status);	
				ChatDAO.save(cm);
			
			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	public String set_group_sticker() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String reciever_id = request.getParameter("GroupReciever_id");
			String sender_id = user.getId().toLowerCase();
			String send_sticker = request.getParameter("SendSticker");
			String message_text = "";
			
			Group_chat_message gcm = new Group_chat_message();
			gcm.setGroup_chat_id(Integer.valueOf(reciever_id));
			gcm.setSender_id(sender_id);
			gcm.setImage_message_status('0');
			gcm.setFile_message_status('0');
			gcm.setSticker_message_status('1');
			gcm.setSticker_path(send_sticker);
			if(!message_text.equalsIgnoreCase("")) {
			//gcm.setGroup_chat_message(message_text);
			}
			GroupChatMessageDAO.save(gcm);
			List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
			String groupmessageid = "";
			for(Map map : lastMessageList) {
				groupmessageid = map.get("Group_chat_message_id").toString();
			}
			List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(reciever_id);
			for(Map map : memberlist) {
				if(map.get("member_id").toString().equalsIgnoreCase(sender_id)) {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('1');
					grl.setGroup_chat_id(Integer.valueOf(reciever_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}else {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('0');
					grl.setGroup_chat_id(Integer.valueOf(reciever_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}
				
			}

			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String OpenChat() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
		String sender_id = user.getId().toLowerCase();
		String userpath = user.getPath();
		String email = user.getEmail();
		String theme = "";
		String load_limit = "";
		List<Map<String,Object>> gettheme = ChatThemeDAO.Find_theme(sender_id);
		List<Map<String,Object>> alldepartment = DepartmentDAO.sequense();
		List<Map<String,Object>> alluserenable = userDAO.AllUserEnable();
		List<Map<String,Object>> setting = ChatUserSettingDAO.GetSettingByUserId(sender_id);
		if(setting.size() >=1) {
			 for(Map<String,Object> map : setting) {
				 load_limit = map.get("chat_load_limit").toString();
			 }
		}else {
			load_limit = "10";
			ChatUserSetting cus = new ChatUserSetting();
			cus.setChat_load_limit(load_limit);
			cus.setUser_id(sender_id);
			ChatUserSettingDAO.save(cus);
		}
		if(gettheme.size()>=1) {
			for(Map<String,Object> map : gettheme) {
				theme = map.get("theme").toString();
			} 
		}else {
			theme = null;
		}
		List<String> userOnlinelist = GetActivitylist();
		//System.out.println(userOnlinelist);
		request.setAttribute("Owner_chat_id", sender_id);
		request.setAttribute("chat_load_limit", load_limit);
		request.setAttribute("email", email);
		request.setAttribute("UserOnlineList", userOnlinelist);
		request.setAttribute("alldepartment", alldepartment);
		request.setAttribute("alluserenable", alluserenable);
		request.setAttribute("Userpath", userpath);
		request.setAttribute("theme", theme);
		request.setAttribute("linkfeed", "0");
		return "success";
			
			
		}catch(Exception e) {
			log.error(e);
			return "error";
		}
		
	}
	
	public String OpenChat_FromFeed() {
		try {
			User user= (User) request.getSession().getAttribute("onlineUser");
			String sender_id = user.getId().toLowerCase();
			String userpath = user.getPath();
			String email = user.getEmail();
			String theme = "";
			String load_limit ="";
			List<Map<String,Object>> gettheme = ChatThemeDAO.Find_theme(sender_id);
			List<Map<String,Object>> alldepartment = DepartmentDAO.sequense();
			List<Map<String,Object>> alluserenable = userDAO.AllUserEnable();
			List<Map<String,Object>> setting = ChatUserSettingDAO.GetSettingByUserId(sender_id);
			if(setting.size() >=1) {
				 for(Map<String,Object> map : setting) {
					 load_limit = map.get("chat_load_limit").toString();
				 }
			}else {
				load_limit = "10";
				ChatUserSetting cus = new ChatUserSetting();
				cus.setChat_load_limit(load_limit);
				cus.setUser_id(sender_id);
				ChatUserSettingDAO.save(cus);
			}
			if(gettheme.size()>=1) {
				for(Map<String,Object> map : gettheme) {
					theme = map.get("theme").toString();
				} 
			}else {
				theme = null;
			}
			String Receiver_img = "";
			List<String> userOnlinelist = GetActivitylist();
			String reciever_id = request.getParameter("Reciever_id");
			List<Map<String, Object>> message;
			message = ChatDAO.get_chat_message(sender_id.toLowerCase(), reciever_id.toLowerCase(),load_limit);
			List<Map<String , Object>> reciever_img = ChatDAO.get_img_for_chat(reciever_id);
			//System.out.println(reciever_img);
			if(reciever_img != null) {
				for(Map<String, Object> recieve_img_path : reciever_img) {
				if(!(recieve_img_path.get("path")==null)) {
					Receiver_img = recieve_img_path.get("path").toString();
				}else {
					Receiver_img = null;
				}
				
			}
			}else {
				Receiver_img = null;
			}
			
			request.setAttribute("Owner_chat_id", sender_id.toLowerCase());
			request.setAttribute("email", email);
			request.setAttribute("chat_load_limit", load_limit);
			request.setAttribute("UserOnlineList", userOnlinelist);
			request.setAttribute("alldepartment", alldepartment);
			request.setAttribute("alluserenable", alluserenable);
			request.setAttribute("Userpath", userpath);
			request.setAttribute("message", message);
			request.setAttribute("theme", theme);
			request.setAttribute("reciever_id", reciever_id.toLowerCase());
			request.setAttribute("Reciever_pro_img", Receiver_img);
			request.setAttribute("linkfeed", "1");
			return "success";							 
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	public String set_chat_load_limit() {
		try {
			String limit = request.getParameter("limit");
			User user= (User) request.getSession().getAttribute("onlineUser");
			String user_id = user.getId().toLowerCase();
			ChatUserSettingDAO.setNewChatLimit(user_id, limit);
		}catch(Exception Ex) {
			Ex.printStackTrace();
			return "error";
		}
		return null;
	}
	public String Send_file() {
		
		try {
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
				User user = (User) request.getSession().getAttribute("onlineUser");
				String reciever_id = reciever_id_hid3;
				String sender_id = user.getId().toLowerCase();
				String message_text = "";
				String sender_read_status = "1";
				String reciever_read_status = "0";
				String img_message_status = "0";
				String like_status = "0";
				String file_message_status = "1";
				String file_name = name+type;
				Chat_message cm = new Chat_message ();
				cm.setSender_id(sender_id.toLowerCase());
				cm.setReciever_id(reciever_id.toLowerCase());
				cm.setSender_read_status(sender_read_status);
				cm.setReciever_read_status(reciever_read_status);
				cm.setMessage_text(message_text);
				cm.setImg_message_status(img_message_status);	
				cm.setLike_status(like_status);
				cm.setFile_name(file_name);
				cm.setFile_path(fileupload.getPath().toString());
				cm.setFile_message_status(file_message_status);
				ChatDAO.save(cm);
				
				return null;
				}catch(Exception ex) {
					log.error(ex);
					return "error";
				}
		}catch(Exception e) {
			log.error(e);
			return "error";
		}
	}
	
public String Send_group_file() {
		
		try {
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
				User user = (User) request.getSession().getAttribute("onlineUser");
				String reciever_id = reciever_id_hid3;
				String sender_id = user.getId().toLowerCase();
				
				
				String message_text = "";
				String sender_read_status = "1";
				String reciever_read_status = "0";
				String img_message_status = "0";
				String like_status = "0";
				String file_message_status = "1";
				String file_name = name+type;
				Group_chat_message gcm = new Group_chat_message();
				gcm.setGroup_chat_id(Integer.valueOf(reciever_id));
				gcm.setSender_id(sender_id);
				gcm.setImage_message_status('0');
				gcm.setFile_message_status('1');
				gcm.setFile_path(fileupload.getPath().toString());
				gcm.setSticker_message_status('0');
				gcm.setFile_name(file_name);
				if(!message_text.equalsIgnoreCase("")) {
				gcm.setGroup_chat_message(message_text);
				}
				GroupChatMessageDAO.save(gcm);
				List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
				String groupmessageid = "";
				for(Map map : lastMessageList) {
					groupmessageid = map.get("Group_chat_message_id").toString();
				}
				List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(reciever_id);
				for(Map map : memberlist) {
					if(map.get("member_id").toString().equalsIgnoreCase(sender_id)) {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('1');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}else {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('0');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}
					
				}
				
				return null;
				}catch(Exception ex) {
					log.error(ex);
					return "error";
				}
		}catch(Exception e) {
			log.error(e);
			return "error";
		}
}
	
	public String CreateNewChatGroup() {

		try {
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
					
				} else {
					//System.out.println("ERRRORRRR");
				}
				
				User user = (User) request.getSession().getAttribute("onlineUser");
				String reciever_id = reciever_id_hid4;
				String create_id = user.getId().toLowerCase();
				String message_text = "";
				String sender_read_status = "1";
				String reciever_read_status = "0";
				String img_message_status = "1";
				
				Group_chat gc = new Group_chat();
				gc.setGroup_chat_Name(groupname.trim());
				gc.setGroup_Description(groupdescription.trim());
				gc.setGroup_chat_user_create(create_id);
				if (fileUpload != null) {
				gc.setGroup_img_path(fileupload.getPath().toString());
				}
				GroupChatDAO.save(gc);
				//String member_invite_list[]  = request.getParameter("selectuser");
				List<Map<String , Object>> lastestgroup = new ArrayList();
				lastestgroup = GroupChatDAO.GetLastestGroup();
				String lastgroupid = "";
				for(Map<String, Object> x : lastestgroup) {
					lastgroupid = x.get("Group_chat_id").toString();
				}
				Group_chat_member gcma = new Group_chat_member();
				gcma.setGroup_chat_id(Integer.valueOf(lastgroupid));
				gcma.setMember_id(create_id.toLowerCase());
				gcma.setInviter_member_id(null);
				GroupChatMemberDAO.save(gcma);
				for(String x : selectuser) {
					if(!(x.equalsIgnoreCase("")) && !(x == null)) {
						Group_chat_member gcmr = new Group_chat_member();
						gcmr.setGroup_chat_id(Integer.valueOf(lastgroupid));
						gcmr.setMember_id(x.toLowerCase());
						gcmr.setInviter_member_id(create_id);
						GroupChatMemberDAO.save(gcmr);
						Group_chat_message gcm = new Group_chat_message();
						gcm.setSender_id(create_id);
						gcm.setGroup_chat_id(Integer.valueOf(lastgroupid));
						gcm.setImage_message_status('0');
						gcm.setSticker_message_status('0');
						gcm.setFile_message_status('0');
						gcm.setInformation_message(create_id + " ADD " + x.toLowerCase() + " To Group");
						gcm.setInformation_message_status("1");
						GroupChatMessageDAO.save(gcm);
						List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
						String groupmessageid = "";
						for(Map map : lastMessageList) {
							groupmessageid = map.get("Group_chat_message_id").toString();
						}
						List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(lastgroupid);
						for(Map map : memberlist) {
							if(map.get("member_id").toString().equalsIgnoreCase(create_id)) {
								Group_chat_read_like_status grl = new Group_chat_read_like_status();
								grl.setLike_status('0');
								grl.setRead_status('1');
								grl.setGroup_chat_id(Integer.valueOf(lastgroupid));
								grl.setUser_id(map.get("member_id").toString());
								grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
								GroupChatReadLikeDAO.save(grl);
							}else {
								Group_chat_read_like_status grl = new Group_chat_read_like_status();
								grl.setLike_status('0');
								grl.setRead_status('0');
								grl.setGroup_chat_id(Integer.valueOf(lastgroupid));
								grl.setUser_id(map.get("member_id").toString());
								grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
								GroupChatReadLikeDAO.save(grl);
							}
							
						}
					}
					
				}
				
				return null;
				}catch(Exception ex) {
					ex.printStackTrace();
					return "error";
				}
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	public String Send_image() {		
		try {
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
			
			User user = (User) request.getSession().getAttribute("onlineUser");
			String reciever_id = reciever_id_hid2;
			String sender_id = user.getId().toLowerCase();
			String message_text = "";
			String sender_read_status = "1";
			String reciever_read_status = "0";
			String img_message_status = "1";
			Chat_message cm = new Chat_message ();
			cm.setSender_id(sender_id.toLowerCase());
			cm.setReciever_id(reciever_id.toLowerCase());
			cm.setSender_read_status(sender_read_status);
			cm.setReciever_read_status(reciever_read_status);
			cm.setMessage_text(message_text);
			cm.setImg_path(fileupload.getPath().toString());
			cm.setImg_message_status(img_message_status);			
			ChatDAO.save(cm);
			
			return null;
			}catch(Exception ex) {
				log.error(ex);
				return "error";
			}
		} catch (Exception e) {
			log.error(e);
			return "error";
		}
	}
	public String Send_Group_image() {		
		//System.out.println("do this");
		try {
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
					//System.out.println("errror");
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
				User user = (User) request.getSession().getAttribute("onlineUser");
				String reciever_id = reciever_id_hid2;
				String sender_id = user.getId().toLowerCase();
				//System.out.println("do thisss");
				
				String message_text = "";
				String sender_read_status = "1";
				String reciever_read_status = "0";
				String img_message_status = "1";
				String like_status = "0";
				String file_message_status = "0";
				String file_name = name+type;
				Group_chat_message gcm = new Group_chat_message();
				gcm.setGroup_chat_id(Integer.valueOf(reciever_id));
				gcm.setSender_id(sender_id);
				gcm.setImage_message_status('1');
				gcm.setFile_message_status('0');
				gcm.setImage_path(fileupload.getPath().toString());
				gcm.setSticker_message_status('0');
				gcm.setFile_name(file_name);
				if(!message_text.equalsIgnoreCase("")) {
				gcm.setGroup_chat_message(message_text);
				}
				GroupChatMessageDAO.save(gcm);
				List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
				String groupmessageid = "";
				for(Map map : lastMessageList) {
					groupmessageid = map.get("Group_chat_message_id").toString();
				}
				List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(reciever_id);
				for(Map map : memberlist) {
					if(map.get("member_id").toString().equalsIgnoreCase(sender_id)) {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('1');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}else {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('0');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}
					
				}
				
				return null;
				}catch(Exception ex) {
					ex.printStackTrace();
					return "error";
				}
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String SearchUser() {
		try {
			String searchtext = request.getParameter("searchuser");
			String owner      = request.getParameter("owner");
			String unreadc ="";
			String chatlast ="";
			String pathuser ="";
			String iduser ="".toLowerCase();
			String nameuser = "";
			String Sticker = "";
			String Picture = "";
			String File = "";
			List<Map<String, Object>> Senddata = new ArrayList();
			List<Map<String, Object>> userfround = new ArrayList();
			userfround = userDAO.findUserChat(searchtext);
			for (Map<String, Object> map : userfround) {
				Object path = map.get("path");
				if(path == null) {pathuser = "";}
				else {pathuser = path.toString();}
				Object id = map.get("id");
				iduser = id.toString().toLowerCase();
				Object name = map.get("name");
				nameuser = name.toString();
				List<Map<String, Object>> unread = new ArrayList();
				unread = ChatDAO.chat_unread_count(owner, iduser);
				for (Map<String, Object> map1 : unread) {
					Object ly = map1.get("unread_count");
					unreadc = ly.toString();
				}
				List<Map<String, Object>> lastchat = new ArrayList();
				lastchat = ChatDAO.get_last_chat(owner, iduser);
				if(lastchat.size()>0) {for (Map<String, Object> map2 : lastchat) {	
					Object lc = map2.get("Message_text");
					if(lc == null) {chatlast = "";}
					else {chatlast = lc.toString();}
					Object stk = map2.get("sticker_status");
					if(stk == null) {Sticker = ""; }
					else {Sticker = stk.toString();}
					Object pt = map2.get("img_message_status");
					if(pt == null) {Picture = ""; }
					else if(pt != null) {Picture = pt.toString(); }
					Object fl = map2.get("file_message_status");
					if(fl == null) {File = ""; }
					else {File = fl.toString();}
				}}
				else {chatlast = "";}
				if(Sticker != "" && Picture == "" && File == "") 
				{chatlast = "Send a Sticker.";}
				else if(Sticker == "" && Picture != "" && File == "") 
				{chatlast = "Send a Picture.";}
				else if(Sticker == "" && Picture != "" && File != "") 
				{chatlast = "Send a Attachment.";}
				SessionListener session = new SessionListener();
				List<String> userOnlineList = new ArrayList<String>();
				userOnlineList = session.getSessionActivitylist();
				String data = String.valueOf(userOnlineList).toLowerCase();
				boolean online = data.matches("(.*)"+iduser+"(.*)");
				Map<String, Object>searchuser = new HashMap<String , Object>();
					searchuser.put("path", pathuser);
					searchuser.put("id", iduser);
					searchuser.put("name", nameuser);
					searchuser.put("onlinedata", online);
					searchuser.put("Message_text", chatlast);
					searchuser.put("unread_count", unreadc);
				Senddata.add(searchuser);
			}	
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(Senddata));
			out.flush();
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String SearchGroupChat() {
		try {
			String searchtext = request.getParameter("searchtext");
			User user = (User) request.getSession().getAttribute("onlineUser");
			String userid = user.getId().toLowerCase();
			List<Map<String,Object>> searchgroup = new ArrayList();
			searchgroup = GroupChatDAO.Findmygroup(userid, searchtext);
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(searchgroup));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String RemoveMember() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String userid = user.getId().toLowerCase();
			String group_id = request.getParameter("group_id");
			String member_id = request.getParameter("member_id");
			
			String group_chat_id = "";
			List<Map<String , Object>> getrealgroupid = GroupChatMemberDAO.getMemberinfo(group_id, member_id);
			for(Map<String,Object> map : getrealgroupid) {
				group_chat_id = map.get("Group_chat_id").toString();
			}
			Group_chat_member gcmr = new Group_chat_member();
			gcmr.setGroup_chat_member_id(Integer.valueOf(group_id));
			gcmr.setMember_id(member_id);
			GroupChatMemberDAO.delete(gcmr);
			
			Group_chat_message gcm = new Group_chat_message();
			gcm.setSender_id(userid);
			gcm.setGroup_chat_id(Integer.valueOf(group_chat_id));
			gcm.setImage_message_status('0');
			gcm.setSticker_message_status('0');
			gcm.setFile_message_status('0');
			gcm.setInformation_message(member_id + " Remove From Group by " + userid);
			gcm.setInformation_message_status("1");
			GroupChatMessageDAO.save(gcm);
			
			List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
			String groupmessageid = "";
			for(Map map : lastMessageList) {
				groupmessageid = map.get("Group_chat_message_id").toString();
			}
			
			List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(group_chat_id);
			for(Map map : memberlist) {
				if(map.get("member_id").toString().equalsIgnoreCase(userid)) {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('1');
					grl.setGroup_chat_id(Integer.valueOf(group_chat_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
					
				}else {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('0');
					grl.setGroup_chat_id(Integer.valueOf(group_chat_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
					
				}
				
			}
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String SetFavoriteGroup() {
		try {
			String group_id = request.getParameter("group_id");
			String member_id = request.getParameter("member_id");
			String favorite = request.getParameter("fav_id");
			GroupChatMemberDAO.setFav(group_id, member_id, favorite);
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String LeaveGroup() {
		try {
			String group_id = request.getParameter("group_id");
			String member_id = request.getParameter("member_id");
			GroupChatMemberDAO.DeleteByMemberIdAndGroup(group_id, member_id);
			Group_chat_message gcm = new Group_chat_message();
			gcm.setSender_id(member_id);
			gcm.setGroup_chat_id(Integer.valueOf(group_id));
			gcm.setImage_message_status('0');
			gcm.setSticker_message_status('0');
			gcm.setFile_message_status('0');
			gcm.setInformation_message(member_id + " Leave the Group");
			gcm.setInformation_message_status("1");
			GroupChatMessageDAO.save(gcm);
			List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
			String groupmessageid = "";
			for(Map map : lastMessageList) {
				groupmessageid = map.get("Group_chat_message_id").toString();
			}
			List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(group_id);
			for(Map map : memberlist) {
				if(map.get("member_id").toString().equalsIgnoreCase(member_id)) {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('1');
					grl.setGroup_chat_id(Integer.valueOf(group_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}else {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('0');
					grl.setGroup_chat_id(Integer.valueOf(group_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}
				
			}
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String DeleteGroup() {
		try {
			String group_id = request.getParameter("group_id");
			Group_chat gc = new Group_chat();
			gc.setGroup_chat_id(Integer.parseInt(group_id));
			GroupChatDAO.delete(gc);
			GroupChatMemberDAO.delete_by_group_id(group_id);
			GroupChatMessageDAO.delete_by_group_id(group_id);
			GroupChatReadLikeDAO.delete_by_group_id(group_id);
			return null;
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String Addnewmember() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String user_ids= user.getId().toLowerCase();
			String group_id = request.getParameter("group_id");
			String user_id = request.getParameter("member_id");
			String inviter_id = user_ids;
			Group_chat_member gcmr = new Group_chat_member();
			gcmr.setGroup_chat_id(Integer.valueOf(group_id));
			gcmr.setInviter_member_id(inviter_id);
			gcmr.setMember_id(user_id);
			GroupChatMemberDAO.save(gcmr);
			Group_chat_message gcm = new Group_chat_message();
			gcm.setSender_id(inviter_id);
			gcm.setGroup_chat_id(Integer.valueOf(group_id));
			gcm.setImage_message_status('0');
			gcm.setSticker_message_status('0');
			gcm.setFile_message_status('0');
			gcm.setInformation_message(inviter_id + " ADD " + user_id + " To Group");
			gcm.setInformation_message_status("1");
			GroupChatMessageDAO.save(gcm);
			List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
			String groupmessageid = "";
			for(Map map : lastMessageList) {
				groupmessageid = map.get("Group_chat_message_id").toString();
			}
			List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(group_id);
			for(Map map : memberlist) {
				if(map.get("member_id").toString().equalsIgnoreCase(inviter_id)) {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('1');
					grl.setGroup_chat_id(Integer.valueOf(group_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}else {
					Group_chat_read_like_status grl = new Group_chat_read_like_status();
					grl.setLike_status('0');
					grl.setRead_status('0');
					grl.setGroup_chat_id(Integer.valueOf(group_id));
					grl.setUser_id(map.get("member_id").toString());
					grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
					GroupChatReadLikeDAO.save(grl);
				}
				
			}
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String checkfavbox() {
		try {
			String group_id = request.getParameter("group_id");
			String Owner_id = request.getParameter("Owner_id");
			List<Map<String,Object>> member_info = GroupChatMemberDAO.getGroupmember(group_id, Owner_id);	
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(member_info));
			//System.out.println(listmap_to_json_string(member_info));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	public String SelectFile() {
		try {
			String group_id = request.getParameter("group_id");
			User user = (User) request.getSession().getAttribute("onlineUser");
			String user_id = user.getId().toLowerCase();
			String ChatType = request.getParameter("ChatType");
			List<Map<String , Object>> allmyfile = new ArrayList();
			if(ChatType.equalsIgnoreCase("p")) {
				allmyfile = ChatDAO.get_file_in_chat(user_id.toLowerCase(), group_id.toLowerCase());
			}else if(ChatType.equalsIgnoreCase("g")) {
				allmyfile = GroupChatMessageDAO.get_file_in_group_chat(group_id);
			}
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(allmyfile));
			
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	public String ChangeGroupimage() {
		String Gname = "";
		String Gdesc = "";
		String Gpath = "";
		String Usercreate = "";
		String reciever_id = "";
		String sender_id = "";
		String time_create = "";
		int newimg = 0;
		try {
		User user = (User) request.getSession().getAttribute("onlineUser");
		reciever_id = reciever_id_hid5;
		sender_id = user.getId().toLowerCase();
		List<Map<String,Object>> Old_value = new ArrayList();		
			Old_value = GroupChatDAO.GetMyGroupSetting(sender_id, reciever_id);
		for(Map<String,Object> ov : Old_value) {
			Gname = ov.get("Group_chat_Name").toString();
			Gdesc = ov.get("Group_Description").toString();
			if(ov.get("Group_img_path") != null) {
				Gpath = ov.get("Group_img_path").toString();
			}else {
				Gpath = "";
			}
			
			Usercreate = ov.get("Group_chat_user_create").toString();
			//System.out.println(Usercreate);
			time_create = ov.get("Group_time_create").toString();
		}
		//System.out.println(Gpath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			int maxId = fileuploadDAO.getMaxId() + 1;
			FileUpload fileupload = new FileUpload();
			//System.out.println(fileUpload);
			if (fileUpload != null) {
				newimg = 1;
				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");
				fileupload.setSize(fileUploadSize);
				String fileName = fileUploadFileName;
				fileupload.setPath("/upload/user/" + maxId + "_" + fileName);
				FileUtil.upload(fileUpload, fileServerPath + "upload/user/", maxId + "_" + fileName);
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
				//System.out.println(fileupload.getPath() + "   dq");
				//System.out.println(Gpath + "   d");
				if(!(Gpath.equalsIgnoreCase(fileupload.getPath().toLowerCase())) ) {
					Group_chat_message gcm = new Group_chat_message();
					gcm.setSender_id(sender_id);
					gcm.setGroup_chat_id(Integer.valueOf(reciever_id_hid5));
					gcm.setImage_message_status('0');
					gcm.setSticker_message_status('0');
					gcm.setFile_message_status('0');
					gcm.setInformation_message(sender_id + " Change Group Chat Image");
					gcm.setInformation_message_status("1");
					GroupChatMessageDAO.save(gcm);
					List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
					String groupmessageid = "";
					for(Map map : lastMessageList) {
						groupmessageid = map.get("Group_chat_message_id").toString();
					}
					List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(reciever_id_hid5);
					for(Map map : memberlist) {
						if(map.get("member_id").toString().equalsIgnoreCase(sender_id)) {
							Group_chat_read_like_status grl = new Group_chat_read_like_status();
							grl.setLike_status('0');
							grl.setRead_status('1');
							grl.setGroup_chat_id(Integer.valueOf(reciever_id_hid5));
							grl.setUser_id(map.get("member_id").toString());
							grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
							GroupChatReadLikeDAO.save(grl);
						}else {
							Group_chat_read_like_status grl = new Group_chat_read_like_status();
							grl.setLike_status('0');
							grl.setRead_status('0');
							grl.setGroup_chat_id(Integer.valueOf(reciever_id_hid5));
							grl.setUser_id(map.get("member_id").toString());
							grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
							GroupChatReadLikeDAO.save(grl);
						}
						
					}
				}
			} else {
				newimg = 0;
			}
			//System.out.println(newimg);
			
			
			Group_chat gc = new Group_chat();
			gc.setGroup_chat_id(Integer.valueOf(reciever_id));
			if(newimg == 0) {
				//System.out.println(true);
				gc.setGroup_img_path(Gpath);
			}else {
				gc.setGroup_img_path(fileupload.getPath().toString());
				//System.out.println(false);
			}		
			gc.setGroup_chat_user_update(sender_id);
			gc.setGroup_chat_time_update(DateUtil.getCurrentTime());
			gc.setGroup_chat_Name(groupname.trim());
			gc.setGroup_Description(groupdescription.trim());
			gc.setGroup_chat_user_create(Usercreate);
			GroupChatDAO.update(gc);
			if(!Gname.equalsIgnoreCase(groupname.trim())) {
				//System.out.println("name" + true);
				Group_chat_message gcm = new Group_chat_message();
				gcm.setSender_id(sender_id);
				gcm.setGroup_chat_id(Integer.valueOf(reciever_id));
				gcm.setImage_message_status('0');
				gcm.setSticker_message_status('0');
				gcm.setFile_message_status('0');
				gcm.setInformation_message(sender_id + " Change Group Name To " + groupname);
				gcm.setInformation_message_status("1");
				GroupChatMessageDAO.save(gcm);
				List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
				String groupmessageid = "";
				for(Map map : lastMessageList) {
					groupmessageid = map.get("Group_chat_message_id").toString();
				}
				List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(reciever_id);
				for(Map map : memberlist) {
					if(map.get("member_id").toString().equalsIgnoreCase(sender_id)) {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('1');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}else {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('0');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}
					
				}
			}
			if(!Gdesc.equalsIgnoreCase(groupdescription.trim())) {
				//System.out.println("desc" + true);
				Group_chat_message gcm = new Group_chat_message();
				gcm.setGroup_chat_id(Integer.valueOf(reciever_id));
				gcm.setSender_id(sender_id);
				gcm.setImage_message_status('0');
				gcm.setSticker_message_status('0');
				gcm.setFile_message_status('0');
				gcm.setInformation_message(sender_id + " Change Group Description To " + groupdescription);
				gcm.setInformation_message_status("1");
				GroupChatMessageDAO.save(gcm);
				List<Map<String, Object>> lastMessageList = GroupChatMessageDAO.GetlastestMessage();
				String groupmessageid = "";
				for(Map map : lastMessageList) {
					groupmessageid = map.get("Group_chat_message_id").toString();
				}
				List<Map<String,Object>> memberlist = GroupChatMemberDAO.getMember(reciever_id);
				for(Map map : memberlist) {
					if(map.get("member_id").toString().equalsIgnoreCase(sender_id)) {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('1');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}else {
						Group_chat_read_like_status grl = new Group_chat_read_like_status();
						grl.setLike_status('0');
						grl.setRead_status('0');
						grl.setGroup_chat_id(Integer.valueOf(reciever_id));
						grl.setUser_id(map.get("member_id").toString());
						grl.setGroup_chat_message_id(Integer.valueOf(groupmessageid));
						GroupChatReadLikeDAO.save(grl);
					}
					
				}
			}
			PrintWriter out = response.getWriter();
			if(newimg == 1) {
				out.println(fileupload.getPath().toString());
			}else {
				out.println(Gpath);
			}
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return ERROR;
		}
	}
	public String SelectImage() {
		try {
			String group_id = request.getParameter("group_id");
			String user_id = request.getParameter("Sender_id");
			String ChatType = request.getParameter("ChatType");			
			List<Map<String,Object>> allimage = new ArrayList();
			if(ChatType.equalsIgnoreCase("p")) {
				allimage = ChatDAO.get_image_in_chat(user_id,group_id);
			}else if(ChatType.equalsIgnoreCase("g")) {
				allimage = GroupChatMessageDAO.get_image_in_group_chat(group_id);
			}			
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	public String refresh_group_img() {
		try {
			User user = (User) request.getSession().getAttribute("onlineUser");
			String group_id = request.getParameter("group_chat_id");
			String userid = user.getId().toLowerCase();
			List<Map<String,Object>> Groupimage = new ArrayList();
			Groupimage = GroupChatDAO.get_group_chat(group_id);
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(Groupimage));			
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}		
	}
	public String SearchChat() {
		try {
			String Reciver = request.getParameter("Reciver");
			String Owner = request.getParameter("Sender");
			String Chattext = request.getParameter("Text");
			String idchat ="";
			String limitchat ="";
			String Textchat = "";
			String Textbefore="";
			String Textafter="";
			int afterid=0;
			int limitbefore=0;
			int limitafter=0;
			int limitcount =0;
			List<Map<String,Object>> Sendchatdata = new ArrayList();
			List<Map<String,Object>> getchattext = new ArrayList();
			getchattext = ChatDAO.get_chattext(Owner, Reciver, Chattext);
			for (Map<String, Object> map : getchattext) {
				Object idchatlast = map.get("Message_id");
				idchat = idchatlast.toString();
			}
			
			List<Map<String,Object>> chatlimit = new ArrayList();
			chatlimit = ChatDAO.get_chatlimit(Owner);
			for (Map<String, Object> map : chatlimit) {
				Object limitinchat = map.get("chat_load_limit");
				limitchat = limitinchat.toString();
				limitcount = Integer.valueOf(limitchat)/2;
				limitbefore = Integer.valueOf(idchat)-limitcount;
				afterid = Integer.valueOf(idchat)+1;
				limitafter = Integer.valueOf(afterid)+limitcount;
			}
			
			List<Map<String,Object>> textinchat = new ArrayList();
			textinchat = ChatDAO.get_chattextfromid(Owner, Reciver, idchat);
			for (Map<String, Object> map : textinchat) {
				Object textfromchat = map.get("Message_text");
				Textchat = textfromchat.toString();

			}
			List<Map<String,Object>> chatbefore = new ArrayList();
			chatbefore = ChatDAO.get_chatbefore(Owner, Reciver, idchat, limitbefore);
			for (Map<String, Object> map : chatbefore) {
				Object textbefore = map.get("Message_text");
				Textbefore = textbefore.toString();
				Map<String, Object>data4 = new HashMap<>();
				data4.put("Message_id",map.get("Message_id"));
				data4.put("Sender_id",map.get("Sender_id"));
				data4.put("Reciever_id",map.get("Reciever_id"));
				data4.put("Date_time_Message",map.get("Date_time_Message"));
				data4.put("Message_text",map.get("Message_text"));
				data4.put("Sender_read_status",map.get("Sender_read_status"));
				data4.put("Reciever_read_status",map.get("Reciever_read_status"));
				data4.put("img_path",map.get("img_path"));
				data4.put("img_message_status",map.get("img_message_status"));
				data4.put("like_status",map.get("like_status"));
				data4.put("file_name",map.get("file_name"));
				data4.put("file_path",map.get("file_path"));
				data4.put("file_message_status",map.get("file_message_status"));
				data4.put("sticker_path",map.get("sticker_path"));
				data4.put("sticker_status",map.get("sticker_status"));
				Sendchatdata.add(data4);
			}
			List<Map<String,Object>> chatafter = new ArrayList();
			chatafter = ChatDAO.get_chatafter(Owner, Reciver,afterid, limitafter);
			for (Map<String, Object> map : chatafter) {
				Object textafter = map.get("Message_text");
				Textafter = textafter.toString();
				Map<String, Object>data5 = new HashMap<>();
				data5.put("Message_id",map.get("Message_id"));
				data5.put("Sender_id",map.get("Sender_id"));
				data5.put("Reciever_id",map.get("Reciever_id"));
				data5.put("Date_time_Message",map.get("Date_time_Message"));
				data5.put("Message_text",map.get("Message_text"));
				data5.put("Sender_read_status",map.get("Sender_read_status"));
				data5.put("Reciever_read_status",map.get("Reciever_read_status"));
				data5.put("img_path",map.get("img_path"));
				data5.put("img_message_status",map.get("img_message_status"));
				data5.put("like_status",map.get("like_status"));
				data5.put("file_name",map.get("file_name"));
				data5.put("file_path",map.get("file_path"));
				data5.put("file_message_status",map.get("file_message_status"));
				data5.put("sticker_path",map.get("sticker_path"));
				data5.put("sticker_status",map.get("sticker_status"));
				Sendchatdata.add(data5);
			}
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(Sendchatdata));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	public String SearchPreviousChat() {
		try {
			String Reciver = request.getParameter("Reciver");
			String Owner = request.getParameter("Sender");
			String Chattext = request.getParameter("Text");
			String idchat ="";
			String limitchat ="";
			String Textchat = "";
			String Textbefore="";
			String Textafter="";
			String idchatpreviuos="";
			String textforsearch="";
			String chatcountnew =""; 
			int afterid=0;
			int limitbefore=0;
			int limitafter=0;
			int limitcount =0;
			List<Map<String,Object>> Sendchatdata = new ArrayList();
			List<Map<String,Object>> getchattext = new ArrayList();
			getchattext = ChatDAO.get_chattext(Owner, Reciver, Chattext);
			for (Map<String, Object> map : getchattext) {
				Object idchatlast = map.get("Message_id");
				idchat = idchatlast.toString();
				Object textchat = map.get("Message_text");
				textforsearch = textchat.toString();
			}
			List<Map<String,Object>> getnewchattext = new ArrayList();
			getnewchattext = ChatDAO.get_chatprevious(Owner, Reciver, textforsearch, idchat);
			for (Map<String, Object> map : getnewchattext) {
				Object idchatlastnew = map.get("Message_id");
				idchatpreviuos = idchatlastnew.toString();
			}
			List<Map<String,Object>> chatlimit = new ArrayList();
			chatlimit = ChatDAO.get_chatlimit(Owner);
			for (Map<String, Object> map : chatlimit) {
				Object limitinchat = map.get("chat_load_limit");
				limitchat = limitinchat.toString();
				limitcount = Integer.valueOf(limitchat)/2;
				limitbefore = Integer.valueOf(idchatpreviuos)-limitcount;
				afterid = Integer.valueOf(idchatpreviuos)+1;
				limitafter = Integer.valueOf(afterid)+limitcount;
			}
			List<Map<String,Object>> chatbefore = new ArrayList();
			chatbefore = ChatDAO.get_chatbefore(Owner, Reciver, idchatpreviuos, limitbefore);
			for (Map<String, Object> map : chatbefore) {
				Object textbefore = map.get("Message_text");
				Textbefore = textbefore.toString();
				Map<String, Object>data4 = new HashMap<>();
				data4.put("NewID",idchatpreviuos);
				data4.put("Message_id",map.get("Message_id"));
				data4.put("Sender_id",map.get("Sender_id"));
				data4.put("Reciever_id",map.get("Reciever_id"));
				data4.put("Date_time_Message",map.get("Date_time_Message"));
				data4.put("Message_text",map.get("Message_text"));
				data4.put("Sender_read_status",map.get("Sender_read_status"));
				data4.put("Reciever_read_status",map.get("Reciever_read_status"));
				data4.put("img_path",map.get("img_path"));
				data4.put("img_message_status",map.get("img_message_status"));
				data4.put("like_status",map.get("like_status"));
				data4.put("file_name",map.get("file_name"));
				data4.put("file_path",map.get("file_path"));
				data4.put("file_message_status",map.get("file_message_status"));
				data4.put("sticker_path",map.get("sticker_path"));
				data4.put("sticker_status",map.get("sticker_status"));
				Sendchatdata.add(data4);
			}
			List<Map<String,Object>> chatafter = new ArrayList();
			chatafter = ChatDAO.get_chatafter(Owner, Reciver,afterid, limitafter);
			for (Map<String, Object> map : chatafter) {
				Object textafter = map.get("Message_text");
				Textafter = textafter.toString();
				Map<String, Object>data5 = new HashMap<>();
				data5.put("NewID",idchatpreviuos);
				data5.put("Message_id",map.get("Message_id"));
				data5.put("Sender_id",map.get("Sender_id"));
				data5.put("Reciever_id",map.get("Reciever_id"));
				data5.put("Date_time_Message",map.get("Date_time_Message"));
				data5.put("Message_text",map.get("Message_text"));
				data5.put("Sender_read_status",map.get("Sender_read_status"));
				data5.put("Reciever_read_status",map.get("Reciever_read_status"));
				data5.put("img_path",map.get("img_path"));
				data5.put("img_message_status",map.get("img_message_status"));
				data5.put("like_status",map.get("like_status"));
				data5.put("file_name",map.get("file_name"));
				data5.put("file_path",map.get("file_path"));
				data5.put("file_message_status",map.get("file_message_status"));
				data5.put("sticker_path",map.get("sticker_path"));
				data5.put("sticker_status",map.get("sticker_status"));
				Sendchatdata.add(data5);
			}
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(Sendchatdata));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	public String SearchNextChat() {
		try {
			String Reciver = request.getParameter("Reciver");
			String Owner = request.getParameter("Sender");
			String Chattext = request.getParameter("Text");
			String idchat ="";
			String limitchat ="";
			String Textchat = "";
			String Textbefore="";
			String Textafter="";
			String idchatpreviuos="";
			String idchatnext="";
			String textforsearch = "";
			int afterid=0;
			int limitbefore=0;
			int limitafter=0;
			int limitcount =0;
			List<Map<String,Object>> Sendchatdata = new ArrayList();
			List<Map<String,Object>> getchattext = new ArrayList();
			getchattext = ChatDAO.get_chattext(Owner, Reciver, Chattext);
			for (Map<String, Object> map : getchattext) {
				Object idchatlast = map.get("Message_id");
				idchat = idchatlast.toString();
				Object textchat = map.get("Message_text");
				textforsearch = textchat.toString();
			}
			List<Map<String,Object>> getnewchattext = new ArrayList();
			getnewchattext = ChatDAO.get_chatprevious(Owner, Reciver, textforsearch, idchat);
			for (Map<String, Object> map : getnewchattext) {
				Object idchatlastnew = map.get("Message_id");
				idchatpreviuos = idchatlastnew.toString();
			}
			List<Map<String,Object>> getnextchattext = new ArrayList();
			getnextchattext = ChatDAO.get_chatnext(Owner, Reciver, textforsearch, idchatpreviuos);
			for (Map<String, Object> map : getnextchattext) {
				Object idchatnew = map.get("Message_id");
				idchatnext = idchatnew.toString();
			}
			List<Map<String,Object>> chatlimit = new ArrayList();
			chatlimit = ChatDAO.get_chatlimit(Owner);
			for (Map<String, Object> map : chatlimit) {
				Object limitinchat = map.get("chat_load_limit");
				limitchat = limitinchat.toString();
				limitcount = Integer.valueOf(limitchat)/2;
				limitbefore = Integer.valueOf(idchatnext)-limitcount;
				afterid = Integer.valueOf(idchatnext)+1;
				limitafter = Integer.valueOf(afterid)+limitcount;
			}
			
			List<Map<String,Object>> textinchat = new ArrayList();
			textinchat = ChatDAO.get_chattextfromid(Owner, Reciver, idchatnext);
			for (Map<String, Object> map : textinchat) {
				Object textfromchat = map.get("Message_text");
				Textchat = textfromchat.toString();
			}
			List<Map<String,Object>> chatbefore = new ArrayList();
			chatbefore = ChatDAO.get_chatbefore(Owner, Reciver, idchatnext, limitbefore);
			for (Map<String, Object> map : chatbefore) {
				Object textbefore = map.get("Message_text");
				Textbefore = textbefore.toString();
				Map<String, Object>data4 = new HashMap<>();
				data4.put("Message_id",map.get("Message_id"));
				data4.put("Sender_id",map.get("Sender_id"));
				data4.put("Reciever_id",map.get("Reciever_id"));
				data4.put("Date_time_Message",map.get("Date_time_Message"));
				data4.put("Message_text",map.get("Message_text"));
				data4.put("Sender_read_status",map.get("Sender_read_status"));
				data4.put("Reciever_read_status",map.get("Reciever_read_status"));
				data4.put("img_path",map.get("img_path"));
				data4.put("img_message_status",map.get("img_message_status"));
				data4.put("like_status",map.get("like_status"));
				data4.put("file_name",map.get("file_name"));
				data4.put("file_path",map.get("file_path"));
				data4.put("file_message_status",map.get("file_message_status"));
				data4.put("sticker_path",map.get("sticker_path"));
				data4.put("sticker_status",map.get("sticker_status"));
				Sendchatdata.add(data4);
			}
			List<Map<String,Object>> chatafter = new ArrayList();
			chatafter = ChatDAO.get_chatafter(Owner, Reciver,afterid, limitafter);
			for (Map<String, Object> map : chatafter) {
				Object textafter = map.get("Message_text");
				Textafter = textafter.toString();
				Map<String, Object>data5 = new HashMap<>();
				data5.put("Message_id",map.get("Message_id"));
				data5.put("Sender_id",map.get("Sender_id"));
				data5.put("Reciever_id",map.get("Reciever_id"));
				data5.put("Date_time_Message",map.get("Date_time_Message"));
				data5.put("Message_text",map.get("Message_text"));
				data5.put("Sender_read_status",map.get("Sender_read_status"));
				data5.put("Reciever_read_status",map.get("Reciever_read_status"));
				data5.put("img_path",map.get("img_path"));
				data5.put("img_message_status",map.get("img_message_status"));
				data5.put("like_status",map.get("like_status"));
				data5.put("file_name",map.get("file_name"));
				data5.put("file_path",map.get("file_path"));
				data5.put("file_message_status",map.get("file_message_status"));
				data5.put("sticker_path",map.get("sticker_path"));
				data5.put("sticker_status",map.get("sticker_status"));
				Sendchatdata.add(data5);
			}
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(Sendchatdata));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	public String findChat() {
		try {
			String loadlimit = request.getParameter("loadlimit");
			String searchtext = request.getParameter("search_text");
			String CurrentArrayResult = request.getParameter("CurrentArrayResult");
			String reciever_id = request.getParameter("reciver_id");
			String Owner_id = request.getParameter("Owner_id");
			List<Map<String,Object>> foundlist = new ArrayList();
			//all search list
			
			if(CurrentArrayResult.equalsIgnoreCase("no")) {
				foundlist = ChatDAO.get_last_id(Owner_id, reciever_id, searchtext);
			}				
			else {
				foundlist = ChatDAO.get_chat_at_id(Owner_id, reciever_id, searchtext, CurrentArrayResult);
			}
			String last_id = "";
			
			List<Map<String,Object>> foundlistAll = new ArrayList();
			for(Map<String,Object> map : foundlist) {
				last_id = map.get("Message_id").toString();
			}
			
			
			int length = Integer.valueOf(loadlimit)/2;
			String divide_length = String.valueOf(length);
			List<Map<String,Object>> foundcount = ChatDAO.get_chat_search_count(Owner_id, reciever_id, searchtext);
			
			// all result count
			
			List<Map<String,Object>> chat_search_in_length = ChatDAO.get_serch_in_length(Owner_id, reciever_id,searchtext, divide_length,last_id);
			//System.out.println(chat_search_in_length);
			if(chat_search_in_length != null) {
				for(Map<String,Object> mapinside : chat_search_in_length) {
					Map<String,Object> foundmap = new HashMap();
					List<Map<String,Object>> profileimg = ChatDAO.get_img_for_chat(mapinside.get("Sender_id").toString());
					for(Map<String,Object> mape : profileimg) {
						foundmap.put("path", mape.get("path"));
					}
				foundmap.put("Message_id", mapinside.get("Message_id"));
				foundmap.put("Sender_id", mapinside.get("Sender_id"));
				foundmap.put("Reciever_id", mapinside.get("Reciever_id"));
				foundmap.put("Date_time_Message", mapinside.get("Date_time_Message"));
				foundmap.put("Message_text", mapinside.get("Message_text"));
				foundmap.put("Sender_read_status", mapinside.get("Sender_read_status"));
				foundmap.put("Reciever_read_status", mapinside.get("Reciever_read_status"));
				foundmap.put("img_path", mapinside.get("img_path"));
				foundmap.put("img_message_status", mapinside.get("img_message_status"));
				foundmap.put("like_status", mapinside.get("like_status"));
				foundmap.put("file_path", mapinside.get("file_path"));
				foundmap.put("file_message_status", mapinside.get("file_message_status"));
				foundmap.put("sticker_path", mapinside.get("sticker_path"));
				foundmap.put("sticker_status", mapinside.get("sticker_status"));
				foundmap.put("file_name", mapinside.get("file_name"));
				foundmap.put("Chat_time", mapinside.get("Chat_time"));
				for(Map<String,Object> mapinner : foundcount) {
					foundmap.put("foundcount", mapinner.get("foundcount"));
				}
				foundlistAll.add(foundmap);
				}
			}
			//get chat between
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(foundlistAll));
			out.flush();
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}
	
	
	public String get_found_count() {
		try {
			String chat_owner = request.getParameter("Owner_id");
			String chat_partner = request.getParameter("reciever_id");
			String text = request.getParameter("search_text");
			List<Map<String,Object>> count = ChatDAO.get_All_likely_chat(chat_owner, chat_partner, text);
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(count));
			out.flush();		
			return null;
		}catch(Exception ex) {
			ex.printStackTrace();
			return "error";
		}
		
		
	}
	
	public String get_found_count_group() {
		try {
			String user_id = request.getParameter("Owner_id");
			String Group_chat_id = request.getParameter("chat_id");
			String text = request.getParameter("search_text");
			List<Map<String,Object>> count = GroupChatMessageDAO.get_All_likely_chat_group(Group_chat_id, user_id, text);
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(count));
			out.flush();		
			return  null;
		}catch(Exception Ex) {
			Ex.printStackTrace();
			return "error";
		}
	}
	
	public String groupfindChat() {
		try {
			String loadlimit = request.getParameter("loadlimit");
			String searchtext = request.getParameter("search_text");
			String CurrentArrayResult = request.getParameter("CurrentArrayResult");
			String reciever_id = request.getParameter("reciver_id");
			String Owner_id = request.getParameter("Owner_id");
			List<Map<String,Object>> foundlist = new ArrayList();
			//all search list
			if(CurrentArrayResult.equalsIgnoreCase("no")) {
				
			}				
			else {
				foundlist = GroupChatMessageDAO.get_group_chat_at_id(reciever_id, Owner_id, searchtext, CurrentArrayResult);
			}
			String last_id = "";
			
			List<Map<String,Object>> foundlistAll = new ArrayList();
			for(Map<String,Object> map : foundlist) {
				last_id = map.get("Group_chat_message_id").toString();
			}

			int length = Integer.valueOf(loadlimit)/2;
			String divide_length = String.valueOf(length);
			List<Map<String,Object>> foundcount = GroupChatMessageDAO.get_search_group_chat_count(reciever_id, searchtext);
			
			// all result count
			
			List<Map<String,Object>> chat_search_in_length = GroupChatMessageDAO.get_search_in_length_group(reciever_id, Owner_id, searchtext, divide_length, last_id);
			if(chat_search_in_length != null) {
				for(Map<String,Object> mapinside : chat_search_in_length) {
					
					Map<String,Object> foundmap = new HashMap();
				foundmap.put("Group_chat_id", mapinside.get("Group_chat_id"));
				foundmap.put("Group_chat_message_id", mapinside.get("Group_chat_message_id"));
				foundmap.put("Sender_id", mapinside.get("Sender_id"));
				foundmap.put("Date_time_message", mapinside.get("Date_time_message"));
				foundmap.put("image_message_status", mapinside.get("image_message_status"));
				foundmap.put("image_path", mapinside.get("image_path"));
				foundmap.put("file_message_status", mapinside.get("file_message_status"));
				foundmap.put("file_path", mapinside.get("file_path"));
				foundmap.put("file_name", mapinside.get("file_name"));
				foundmap.put("sticker_message_status", mapinside.get("sticker_message_status"));
				foundmap.put("sticker_path", mapinside.get("sticker_path"));
				foundmap.put("Group_chat_message", mapinside.get("Group_chat_message"));
				foundmap.put("information_message_status", mapinside.get("information_message_status"));
				foundmap.put("information_message", mapinside.get("information_message"));
				foundmap.put("Group_chat_Name", mapinside.get("Group_chat_Name"));
				foundmap.put("Group_Description", mapinside.get("Group_Description"));
				foundmap.put("Group_img_path", mapinside.get("Group_img_path"));
				foundmap.put("Group_chat_user_create", mapinside.get("Group_chat_user_create"));
				foundmap.put("Group_time_create", mapinside.get("Group_time_create"));
				foundmap.put("Group_chat_user_update", mapinside.get("Group_chat_user_update"));
				foundmap.put("Group_chat_time_update", mapinside.get("Group_chat_time_update"));
				foundmap.put("group_chat_read_like_status_id", mapinside.get("group_chat_read_like_status_id"));
				foundmap.put("read_status", mapinside.get("read_status"));
				foundmap.put("like_status", mapinside.get("like_status"));
				foundmap.put("user_id", mapinside.get("user_id"));
				foundmap.put("Chat_time", mapinside.get("Chat_time"));
				
				for(Map<String,Object> mapinner : foundcount) {
					foundmap.put("foundcount", mapinner.get("foundcount"));
				}
				List<Map<String,Object>> userinfo = userDAO.findById2(mapinside.get("Sender_id").toString());
				String path = "";
				for(Map map : userinfo) {
					if(map.get("path") != null) {
						path = map.get("path").toString();
					}else {
						path = null;
					}
					
				}
				List<Map<String,Object>> readcount = GroupChatReadLikeDAO.Get_read_count(mapinside.get("Group_chat_id").toString(), mapinside.get("Group_chat_message_id").toString());
				int readcountnumber = 0;
				for(Map map : readcount) {
					readcountnumber = Integer.parseInt(map.get("readcount").toString())-1;
				}
				List<Map<String,Object>> likecount = GroupChatReadLikeDAO.Get_like_count(mapinside.get("Group_chat_id").toString(), mapinside.get("Group_chat_message_id").toString());
				int likecountnumber = 0;
				for(Map map :likecount) {
					likecountnumber = Integer.valueOf(map.get("likecount").toString());
				}
				foundmap.put("likecount", String.valueOf(likecountnumber));
				foundmap.put("readcount", String.valueOf(readcountnumber));
				foundmap.put("path", path);
				foundlistAll.add(foundmap);
				}
			}
			
			PrintWriter out = response.getWriter();
			out.println(listmap_to_json_string(foundlistAll));
			out.flush();
			
			
			
			return null;
		}catch(Exception Ex) {
			Ex.printStackTrace();
			return "error";
		}
	}


}
