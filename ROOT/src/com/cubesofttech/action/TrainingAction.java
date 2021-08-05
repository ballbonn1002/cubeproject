package com.cubesofttech.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import com.cubesofttech.dao.UserDAO;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.cubesofttech.dao.TrainingDAO;
import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.Training;
import com.cubesofttech.model.TravelList;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class TrainingAction extends ActionSupport {
	/**
	 * 
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private static final Logger log = Logger.getLogger(FaqAction.class);
	List<Map<String, Object>> faqJoin;
	@Autowired
	private TrainingDAO trainingDAO;
	@Autowired
	private UserDAO userDAO;

	public String training_add() {
		try {
			List<Map<String, Object>> userseq = userDAO.sequense();
			request.setAttribute("userseq", userseq);
			List<Map<String, Object>> Traininglist = trainingDAO.findAll();
			request.setAttribute("Traininglist", Traininglist);
			List<User> userlist = userDAO.findAll();
			request.setAttribute("userlist", userlist);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

	public String training_save() {
		try {

			Date date = new Date();
			Training train = new Training();

			String name = request.getParameter("name");
			train.setUser_id(name);
			System.out.println("name " + name);

			String title = request.getParameter("title");
			train.setTitle(title);
			System.out.println("title " + title);

			Integer hours = Integer.parseInt(request.getParameter("hours"));
			train.setHours(hours);
			System.out.println("hours " + hours);

//			System.out.println("testtttttt22222");
//			String Date_Start = request.getParameter("start_date");
//			
//			System.out.println("333333");
//			String Date_End = request.getParameter("end_date");
//			
//			System.out.println("3.55");
//			java.util.Date utilDate = new SimpleDateFormat("dd-MM-yyyy").parse(Date_Start);
//			java.util.Date start_date = new java.util.Date(utilDate.getTime());
//			System.out.println("444444");
//
//			java.util.Date utilDate1 = new SimpleDateFormat("dd-MM-yyyy").parse(Date_End);
//			java.util.Date end_date = new java.util.Date(utilDate1.getTime());
//			System.out.println("55555");
//			train.setStart_date(start_date);
//			train.setEnd_date(end_date);

			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

//			String S_dateInString = request.getParameter("start_date");
//			System.out.println(request.getParameter("start_date")+" sdasdasd");
//			java.sql.Date start_date = Time.valueOf(S_dateInString);
//			System.out.println("333333");
//			String E_dateInString = request.getParameter("end_date");
//			java.sql.Date end_date = formatter.parse(E_dateInString);
//			System.out.println("444444");

			Date a = formatter.parse(request.getParameter("start_date"));
			java.sql.Date start_date = new java.sql.Date(a.getTime());
			System.out.println("start_date : " +request.getParameter("start_date"));
			train.setStart_date(start_date);
			Date b = formatter.parse(request.getParameter("end_date"));
			java.sql.Date end_date = new java.sql.Date(b.getTime());
			System.out.println("end_date : " +request.getParameter("end_date"));
			train.setEnd_date(end_date);
			
//			train.setStart_date(DateUtil.getCurrentTime());
//			train.setEnd_date(DateUtil.getCurrentTime());
			

			String user_update = request.getParameter("user_create");
			train.setUser_update(user_update);
			System.out.println("user_update " + user_update);
			train.setTime_create(DateUtil.getCurrentTime());

			String user_create = request.getParameter("user_create");
			System.out.println(user_create);
			train.setUser_create(user_create);
			System.out.println("user_create " + user_create);
			train.setTime_update(DateUtil.getCurrentTime());

			String location = request.getParameter("location");
			train.setLocation(location);
			System.out.println("location " + location);

			String lecturer = request.getParameter("lecturer");
			train.setLecturer(lecturer);
			System.out.println("lecturer " + lecturer);

			String detail = request.getParameter("detail");
			train.setDetail(detail);
			System.out.println("detail " + detail);

			trainingDAO.save(train);
			return SUCCESS;

		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

//	public String training_delete() {
//		try {
//			int id = Integer.parseInt(request.getParameter("trainingid"));
//			Training train = trainingDAO.findById(id);
//			trainingDAO.delete(train);
//			return SUCCESS;
//		} catch (Exception e) {
//			return ERROR;
//		}
//	}
	
	public String training_delete() throws Exception {
		try {
			String trainingid = request.getParameter("trainingid");
			Integer idValue = Integer.valueOf(trainingid);
			Training train =  trainingDAO.findById(idValue);
			System.out.println(trainingid);
			trainingDAO.delete(train);
			return SUCCESS; 
			
		} catch (Exception e){
			log.error(e.getMessage());
			return ERROR;
		}
	}

	public String training_edit() throws Exception {
		System.out.println("zzz");
		try {
			String Id = request.getParameter("trainingid");
			Integer idedit = Integer.valueOf(Id);
			Training train = trainingDAO.findById(idedit);
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			

			System.out.println("11111");
			
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String lecturer = request.getParameter("lecturer");
			String detail = request.getParameter("detail");
			Date a = formatter.parse(request.getParameter("start_date"));
			java.sql.Date start_date = new java.sql.Date(a.getTime());
			System.out.println("start_date : " +request.getParameter("start_date"));
			train.setStart_date(start_date);
			Date b = formatter.parse(request.getParameter("end_date"));
			java.sql.Date end_date = new java.sql.Date(b.getTime());
			System.out.println("end_date : " +request.getParameter("end_date"));
			train.setEnd_date(end_date);
			String user_update = request.getParameter("user_update");
			train.setTrainingid(idedit);
			train.setTitle(title);
			train.setLocation(location);
			train.setLecturer(lecturer);
			train.setDetail(detail);
			train.setUser_update(user_update);
			train.setTime_update(DateUtil.getCurrentTime());
			trainingDAO.update(train);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			System.out.println("aaaaaaaaa");
			return ERROR;
		}
	}

	public String training_view() {
		try {
			int x = Integer.parseInt(request.getParameter("trainingid"));
			System.out.println(x);
			Training Traininglist = trainingDAO.findById(x);
			
			request.setAttribute("Traininglist", Traininglist);
			
			List<User> userlist = userDAO.findAll();
			request.setAttribute("userlist", userlist);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	
	public String training_list() {
		try {	
			String x = request.getParameter("Id");
			List<Map<String, Object>> Traininglist = trainingDAO.findAllById(x);
			request.setAttribute("Traininglist", Traininglist);
			System.out.println(Traininglist);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String training_Alllist() {
		try {
			List<Map<String, Object>> Traininglist = trainingDAO.findAll();
			request.setAttribute("Traininglist", Traininglist);
			System.out.println(Traininglist);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}

}