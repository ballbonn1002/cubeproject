
package com.cubesofttech.action;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.LeaveDAO;
import com.cubesofttech.dao.NewsDAO;
import com.cubesofttech.dao.RoleAuthorizedObjectDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserRoleDAO;
import com.cubesofttech.dao.UserRpwDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.RoleAuthorizedObject;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserRole;
import com.cubesofttech.model.UserRpw;
import com.cubesofttech.service.LoginService;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

import antlr.Token;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public static final String NODAY = "no_day";
	public static final String EMAIL = "email";
	@Autowired
	private WorkHoursDAO workHoursDAO;

	@Autowired
	private LeaveDAO leaveDAO;

	@Autowired
	private NewsDAO newsDAO;

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserRpwDAO userRpwDAO;

	@Autowired
	private RoleAuthorizedObjectDAO roleAuthorizedObjectDAO;

	@Autowired
	private UserRoleDAO userRoleDAO;

	@Autowired
	private LoginService loginService;

	String username;
	String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String FBbooklogin() throws Exception{
		try {
			String id = request.getParameter("id");
			//log.debug(id);
			HttpSession session = request.getSession();
			if(id != null) {
				User userFblogin = userDAO.findByFbId(id);
				String xxxx = userFblogin.toString();
				String[] vx = xxxx.split("=");
				String[] userloginDB = vx[1].split("}]");
				if(userFblogin != null) {
					log.debug(userloginDB[0]);
					User user = userDAO.findById(userloginDB[0]);
					session.setAttribute("onlineUser", user);
					
				}
			}
			
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String unlinkFace() {  
		try {
			String userId = request.getParameter("userId");
			userDAO.linkFacebook(userId, null);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String autologin() {
		try {
			String userlogin = request.getParameter("username");
			String md5Password = loginService.generateMD5(password);
			if(request.getParameter("remember-me") != null) {
				String remember = request.getParameter("remember-me");
				Cookie cUserlogin = new Cookie("cookuser", userlogin);
				Cookie cMd5Password = new Cookie("cookmd5", md5Password);
				Cookie cRemember = new Cookie("cookrem", remember);
				cUserlogin.setMaxAge(60 * 60 * 24 * 15);
				cMd5Password.setMaxAge(60 * 60 * 24 * 15);
				cRemember.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cUserlogin);
				response.addCookie(cRemember);
				response.addCookie(cMd5Password);
			} else {
				Cookie cUserlogin = new Cookie("cookuser", null);				
				Cookie cMd5Password = new Cookie("cookmd5", null);
				Cookie cRemember = new Cookie("cookrem", null);
				cUserlogin.setMaxAge(0);				
				cMd5Password.setMaxAge(0);
				cRemember.setMaxAge(0);
				response.addCookie(cUserlogin);				
				response.addCookie(cMd5Password);
				response.addCookie(cRemember);
			}
			login();
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}		
	}
	
	public String login() {
		try {
			String userlogin = request.getParameter("username");
			request.setAttribute("userlogin", userlogin);
			HttpSession session = request.getSession();
			User user = userDAO.findById(username);
			String md5Password = loginService.generateMD5(password);
			List<Map<String, Object>> userActive = userDAO.UserEnable(userlogin);
			
			if (user != null && md5Password.equals(user.getPassword()) && !userActive.isEmpty()) {
				String chkLogin = "sc";
				Cookie cSuccess = new Cookie("cooksc", chkLogin);
				cSuccess.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cSuccess);
				Set<String> userAuthority = new HashSet<>();
				Constant.onlineUserList.add(user.getId());

				List<RoleAuthorizedObject> roleAuthorizedObjectList = roleAuthorizedObjectDAO
						.findByRoleId(user.getRoleId());

				userAuthority = loginService.addRoleByUserTable(roleAuthorizedObjectList, userAuthority);

				List<UserRole> userRoleList = userRoleDAO.findByUserId(user.getId());

				userAuthority = loginService.addRoleByUserRoleTabel(userRoleList, userAuthority);

				session.setAttribute("user", user);
				session.setAttribute("onlineUser", user);
				session.setAttribute("userAuthority", userAuthority);

				User ur = (User) request.getSession().getAttribute("onlineUser");
				String logonUser = ur.getId();

				request.setAttribute("sumtravel", newsDAO.sumtravelPrice());

				request.setAttribute("News", newsDAO.dashboardNews());

				request.setAttribute("Goodem", newsDAO.mostcometoWork());

				request.setAttribute("totalborrowNows", newsDAO.sumItem());

				request.setAttribute("myobtainMoney", newsDAO.obtainTravel(logonUser));
				int yearNow = DateUtil.checkCurrentYear();
				if (yearNow > 2500) {
					yearNow = yearNow - 543;
				}

				request.setAttribute("mytravel", newsDAO.totaltravel(logonUser));

				request.setAttribute("myleaves", newsDAO.totallyleaves(logonUser, yearNow));

				List<Map<String, Object>> work = workHoursDAO.checkIn(logonUser);

				if (!work.isEmpty()) {
					Date oldDate = (Date) work.get(0).get("time_create");
					Date datenows = DateUtil.getCurrentTime();
					long daydiff = DateUtil.periodDiff(datenows, oldDate);
					String type = work.get(0).get("work_hours_type").toString();
					if ("2".equals(type) || (daydiff > 1)) {
						List<Map<String, Object>> work2 = workHoursDAO.checkIn(logonUser);
						if (!work.isEmpty()) {
							String beforeType = String.valueOf(work2.get(0).get("work_hours_type"));
							String beforeStamp = String.valueOf(work2.get(0).get("time_create"));
							request.setAttribute("beforeType", beforeType);
							request.setAttribute("beforeStamp", beforeStamp);
						}
						DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
						Date date = new Date();
						String day = dateFormat.format(date);
						String daycut = day.substring(6, 10);
						int foo = Integer.parseInt(daycut);
						if (foo > 2500) {
							int year = foo - 543;
							String strI = Integer.toString(year);
							String daycut2 = day.substring(0, 6);
							String fulldate = daycut2 + strI.trim();
							String time = DateUtil.getTimeNow();
							request.setAttribute("time", time);
							request.setAttribute("fulldate", fulldate);
						} else {
							String strI = Integer.toString(foo);
							String daycut2 = day.substring(0, 6);
							String fulldate = daycut2 + strI.trim();
							String time = DateUtil.getTimeNow();
							request.setAttribute("time", time);
							request.setAttribute("fulldate", fulldate);
						}
						return INPUT;
					}
				}
				BigDecimal x1 = new BigDecimal(0);
				BigDecimal x2 = new BigDecimal(0);
				BigDecimal x3 = new BigDecimal(0);
				BigDecimal x4;
				BigDecimal x5 = new BigDecimal(0);
				BigDecimal x6 = new BigDecimal(0);
				BigDecimal x7 = new BigDecimal(0);
				List<Map<String, Object>> wanla1 = leaveDAO.findleaveallByType(logonUser, 1);
				List<Map<String, Object>> wanla2 = leaveDAO.findleaveallByType(logonUser, 2);
				List<Map<String, Object>> wanla3 = leaveDAO.findleaveallByType(logonUser, 3);
				List<Map<String, Object>> wanla5 = leaveDAO.findleaveallByType(logonUser, 4);
				List<Map<String, Object>> wanla6 = leaveDAO.findleaveallByType(logonUser, 5);
				List<Map<String, Object>> wanla7 = leaveDAO.findleaveallByType(logonUser, 9);
				int n1 = wanla1.size();
				int n2 = wanla2.size();
				int n3 = wanla3.size();
				int n5 = wanla5.size();
				int n6 = wanla6.size();
				int n9 = wanla7.size();
				for (int i = 0; i < n1; i++) {
					BigDecimal a = (BigDecimal) wanla1.get(i).get(NODAY);

					BigDecimal b = a;

					x1 = b.add(x1);

					request.setAttribute("x1", x1);

				}

				for (int i = 0; i < n2; i++) {
					BigDecimal a = (BigDecimal) wanla2.get(i).get(NODAY);

					BigDecimal b = a;

					x2 = b.add(x2);

					request.setAttribute("x2", x2);

				}

				for (int i = 0; i < n3; i++) {
					BigDecimal a = (BigDecimal) wanla3.get(i).get(NODAY);

					BigDecimal b = a;

					x3 = b.add(x3);

					request.setAttribute("x3", x3);

				}
				for (int i = 0; i < n5; i++) {
					BigDecimal a = (BigDecimal) wanla5.get(i).get(NODAY);

					BigDecimal b = a;

					x5 = b.add(x5);

					request.setAttribute("x5", x5);
				}

				for (int i = 0; i < n6; i++) {
					BigDecimal a = (BigDecimal) wanla6.get(i).get(NODAY);

					BigDecimal b = a;

					x6 = b.add(x6);

					request.setAttribute("x6", x6);

				}
				for (int i = 0; i < n9; i++) {
					BigDecimal a = (BigDecimal) wanla7.get(i).get(NODAY);

					BigDecimal b = a;

					x7 = b.add(x7);

					request.setAttribute("x7", x7);

				}
				x4 = x1.add(x2).add(x3).add(x5).add(x6).add(x7);
				request.setAttribute("x4", x4);
				System.out.println(Constant.onlineUserList);
				return SUCCESS;
			} else {
				Cookie cSuccess = new Cookie("cooksc", null);
				cSuccess.setMaxAge(0);
				response.addCookie(cSuccess);
				return ERROR;
			}

		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}

	public String loginForAngular() {
		try {
			List<Map<String,Object>> loginjson = new ArrayList();
			Map<String,Object> m = new HashMap();
			String passwords = request.getParameter("password");						
			String userlogin = request.getParameter("username");
			if(userlogin.equalsIgnoreCase("") || passwords.equalsIgnoreCase("")) {
				return ERROR;
			}
			request.setAttribute("userlogin", userlogin);
			HttpSession session = request.getSession();
			User user = userDAO.findById(userlogin);
			String md5Password = loginService.generateMD5(request.getParameter("password"));//loginService.generateMD5(password);
			if (user != null && md5Password.equals(user.getPassword())) {
				Set<String> userAuthority = new HashSet<>();
				Constant.onlineUserList.add(user.getId());

				List<RoleAuthorizedObject> roleAuthorizedObjectList = roleAuthorizedObjectDAO
						.findByRoleId(user.getRoleId());

				userAuthority = loginService.addRoleByUserTable(roleAuthorizedObjectList, userAuthority);

				List<UserRole> userRoleList = userRoleDAO.findByUserId(user.getId());

				userAuthority = loginService.addRoleByUserRoleTabel(userRoleList, userAuthority);

				session.setAttribute("user", user);
				session.setAttribute("onlineUser", user);
				session.setAttribute("userAuthority", userAuthority);

				User ur = (User) request.getSession().getAttribute("onlineUser");
				String logonUser = ur.getId();

				request.setAttribute("sumtravel", newsDAO.sumtravelPrice());
				m.put("sumtravel", newsDAO.sumtravelPrice());
				request.setAttribute("News", newsDAO.dashboardNews());
				m.put("News", newsDAO.dashboardNews());
				request.setAttribute("Goodem", newsDAO.mostcometoWork());
				m.put("Goodem", newsDAO.mostcometoWork());
				request.setAttribute("totalborrowNows", newsDAO.sumItem());
				m.put("totalborrowNows", newsDAO.sumItem());
				request.setAttribute("myobtainMoney", newsDAO.obtainTravel(logonUser));
				m.put("myobtainMoney", newsDAO.obtainTravel(logonUser));
				int yearNow = DateUtil.checkCurrentYear();
				if (yearNow > 2500) {
					yearNow = yearNow - 543;
				}

				request.setAttribute("mytravel", newsDAO.totaltravel(logonUser));
				m.put("mytravel", newsDAO.totaltravel(logonUser));
				request.setAttribute("myleaves", newsDAO.totallyleaves(logonUser, yearNow));
				m.put("myleaves", newsDAO.totallyleaves(logonUser, yearNow));
				List<Map<String, Object>> work = workHoursDAO.checkIn(logonUser);

				if (!work.isEmpty()) {
					Date oldDate = (Date) work.get(0).get("time_create");
					Date datenows = DateUtil.getCurrentTime();
					long daydiff = DateUtil.periodDiff(datenows, oldDate);
					String type = work.get(0).get("work_hours_type").toString();
					if ("2".equals(type) || (daydiff > 1)) {
						List<Map<String, Object>> work2 = workHoursDAO.checkIn(logonUser);
						if (!work.isEmpty()) {
							String beforeType = String.valueOf(work2.get(0).get("work_hours_type"));
							String beforeStamp = String.valueOf(work2.get(0).get("time_create"));
							request.setAttribute("beforeType", beforeType);
							request.setAttribute("beforeStamp", beforeStamp);
							m.put("beforeType", beforeType);
							m.put("beforeStamp", beforeStamp);
						}
						DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
						Date date = new Date();
						String day = dateFormat.format(date);
						String daycut = day.substring(6, 10);
						int foo = Integer.parseInt(daycut);
						if (foo > 2500) {
							int year = foo - 543;
							String strI = Integer.toString(year);
							String daycut2 = day.substring(0, 6);
							String fulldate = daycut2 + strI.trim();
							String time = DateUtil.getTimeNow();
							request.setAttribute("time", time);
							request.setAttribute("fulldate", fulldate);
							m.put("time", time);
							m.put("fulldate", fulldate);
						} else {
							String strI = Integer.toString(foo);
							String daycut2 = day.substring(0, 6);
							String fulldate = daycut2 + strI.trim();
							String time = DateUtil.getTimeNow();
							request.setAttribute("time", time);
							request.setAttribute("fulldate", fulldate);
							m.put("time", time);
							m.put("fulldate", fulldate);
						}
						return INPUT;
					}
				}
				BigDecimal x1 = new BigDecimal(0);
				BigDecimal x2 = new BigDecimal(0);
				BigDecimal x3 = new BigDecimal(0);
				BigDecimal x4;
				BigDecimal x5 = new BigDecimal(0);
				BigDecimal x6 = new BigDecimal(0);
				BigDecimal x7 = new BigDecimal(0);
				List<Map<String, Object>> wanla1 = leaveDAO.findleaveallByType(logonUser, 1);
				List<Map<String, Object>> wanla2 = leaveDAO.findleaveallByType(logonUser, 2);
				List<Map<String, Object>> wanla3 = leaveDAO.findleaveallByType(logonUser, 3);
				List<Map<String, Object>> wanla5 = leaveDAO.findleaveallByType(logonUser, 4);
				List<Map<String, Object>> wanla6 = leaveDAO.findleaveallByType(logonUser, 5);
				List<Map<String, Object>> wanla7 = leaveDAO.findleaveallByType(logonUser, 9);
				int n1 = wanla1.size();
				int n2 = wanla2.size();
				int n3 = wanla3.size();
				int n5 = wanla5.size();
				int n6 = wanla6.size();
				int n9 = wanla7.size();
				for (int i = 0; i < n1; i++) {
					BigDecimal a = (BigDecimal) wanla1.get(i).get(NODAY);

					BigDecimal b = a;

					x1 = b.add(x1);

					request.setAttribute("x1", x1);
					m.put("x1", x1);
				}

				for (int i = 0; i < n2; i++) {
					BigDecimal a = (BigDecimal) wanla2.get(i).get(NODAY);

					BigDecimal b = a;

					x2 = b.add(x2);

					request.setAttribute("x2", x2);
					m.put("x2", x2);
				}

				for (int i = 0; i < n3; i++) {
					BigDecimal a = (BigDecimal) wanla3.get(i).get(NODAY);

					BigDecimal b = a;

					x3 = b.add(x3);

					request.setAttribute("x3", x3);
					m.put("x3", x3);

				}
				for (int i = 0; i < n5; i++) {
					BigDecimal a = (BigDecimal) wanla5.get(i).get(NODAY);

					BigDecimal b = a;

					x5 = b.add(x5);

					request.setAttribute("x5", x5);
					m.put("x5", x5);
				}

				for (int i = 0; i < n6; i++) {
					BigDecimal a = (BigDecimal) wanla6.get(i).get(NODAY);

					BigDecimal b = a;

					x6 = b.add(x6);

					request.setAttribute("x6", x6);
					m.put("x6", x6);

				}
				for (int i = 0; i < n9; i++) {
					BigDecimal a = (BigDecimal) wanla7.get(i).get(NODAY);

					BigDecimal b = a;

					x7 = b.add(x7);

					request.setAttribute("x7", x7);
					m.put("x7", x7);
				}
				x4 = x1.add(x2).add(x3).add(x5).add(x6).add(x7);
				request.setAttribute("x4", x4);
				m.put("x4", x4);
				//request.setAttribute("externalUrl", "http://localhost:4200/");
				// System.out.println(Constant.onlineUserList);
				loginjson.add(m);
				Gson gson = new GsonBuilder().create();
				String responseJSON = gson.toJson(loginjson);
				request.setAttribute("json", responseJSON);
				System.out.println(Constant.onlineUserList);
				return SUCCESS;
			} else {
				return ERROR;
			}

		} catch (Exception e) {
			log.debug(e);
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String forgetPassword() {

		try {
			String email = request.getParameter(EMAIL);
			List<Map<String, Object>> findEmail = userDAO.findByemail(email);
			
			Map<String, String> obj = new HashMap<>();
			if (!findEmail.isEmpty()) {
				String userEmail = (String) findEmail.get(0).get("email");
				String userId = (String) findEmail.get(0).get("id");
				String userKey = (String) loginService.generateMD5(DateUtil.getTimeNow());
				Timestamp initTime = DateUtil.getCurrentTime();
				Timestamp expired = new Timestamp(initTime.getTime() + (1000 * 60 * 60 * 24));
				
				UserRpw find = userRpwDAO.findByUserId(userId);
				
				if(find == null) {
					UserRpw u = new UserRpw();
					u.setUserId(userId);
					u.setUserKey(userKey);
					u.setExpried(expired);
					userRpwDAO.save(u); 
				} else {
					find.setUserKey(userKey);
					find.setExpried(expired);
					userRpwDAO.update(find);;
				}
				
				// Function RandomPassword 6 number
				/*String ranpassword =loginService.randomPassword(6);
				
				User find = userDAO.findById(userId);
				find.setPassword(loginService.generateMD5(ranpassword));
				userDAO.update(find);*/
				
				loginService.sendmail(userKey, userEmail);
				request.setAttribute("result", "<div class=\"alert alert-success\" style=\"color:green \"><button class=\"close\" data-close=\"alert\"></button>&#x1F6C8; Please check your e-mail and click on the provided link to reset your password.</div>");
		
				/*obj.put("flag", SUCCESS);
				Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
				String jsonObjStr = gson.toJson(obj);
				PrintWriter out = response.getWriter();
				out.print(jsonObjStr);
				out.flush();
				out.close();*/
				return SUCCESS;
			} else {
				/*obj.put("flag", ERROR);
				Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
				String jsonObjStr = gson.toJson(obj);
				PrintWriter out = response.getWriter();
				out.print(jsonObjStr);
				out.flush();
				out.close();*/
				request.setAttribute("result", "<div class=\"alert alert-danger\" style=\"color:red \"><button class=\"close\" data-close=\"alert\"></button>&#x1F6C8; Unable to reset password due to an unknown error. Please try again.</div>");
				return ERROR;
			}

		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}

	public String resetPassword() {
		try {
			Timestamp current_time = DateUtil.getCurrentTime();
			String newpass = request.getParameter("newpassword");
			String repass = request.getParameter("repassword");
			String userkey = request.getParameter("key");
			UserRpw userrpw = userRpwDAO.findByUserKey(userkey);
			
			Map<String, String> obj = new HashMap<>();
			if (userrpw != null && userkey.equals(userrpw.getUserKey()) && newpass.equals(repass) && current_time.before(userrpw.getExpried())) {
				String user_id = userrpw.getUserId();
				
				User find = userDAO.findById(user_id);
				find.setPassword(loginService.generateMD5(newpass));
				userDAO.update(find);
				return SUCCESS;
			} else {
				
				return ERROR;
			}
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}
	
	public String logout() {
		try {
			Cookie cUserlogin = new Cookie("cookuser", null);
			Cookie cMd5Password = new Cookie("cookmd5", null);
			Cookie cRemember = new Cookie("cookrem", null);
			Cookie cSuccess = new Cookie("cooksc", null);
			cUserlogin.setMaxAge(0);
			cMd5Password.setMaxAge(0);
			cRemember.setMaxAge(0);
			cSuccess.setMaxAge(0);
			response.addCookie(cUserlogin);
			response.addCookie(cMd5Password);
			response.addCookie(cRemember);
			response.addCookie(cSuccess);
			request.getSession().invalidate();
			System.out.println(Constant.onlineUserList);
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}
	
	/* Test */
	
	public String onlineUser() {
		try {
			String s1 = "";  
			int i = 0 ;
			for (String temp2 : Constant.onlineUserList) {
				if ( i > 0) {
					s1 = s1+" , ";
				}
				i++;
				s1 =s1+ "'"+temp2+"'";
			}
			log.info(s1);  
			List<Map<String, Object>> sessionOnlineUser  = userDAO.findRoleNameById(s1);
			request.setAttribute("sessionOnlineUser", sessionOnlineUser);
			log.info(sessionOnlineUser); 
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}
}