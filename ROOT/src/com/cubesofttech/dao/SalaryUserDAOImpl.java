package com.cubesofttech.dao;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.HistorySalary;
import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.Salary;
import com.cubesofttech.model.Salary_user;
import com.cubesofttech.model.Timesheet;
@Repository
public class SalaryUserDAOImpl implements SalaryUserDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Salary_user> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Salary_user> Salary_user = null;
		try {
			String sql = "SELECT * FROM salary_user";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Salary_user = query.list();
		} catch (Exception e) {

		}
		return Salary_user;

	}
	@Override
	public void save(Salary_user salary_user) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(salary_user);
		session.flush();

	}

	@Override
	public void update(Salary_user salary_user) throws Exception {
	
		Session session = this.sessionFactory.getCurrentSession();
		session.update(salary_user);
		session.flush();

	}

	@Override
	public void delete(Salary_user salary_user) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		session.delete(salary_user);
		session.flush();

	}

	@Override
	public Salary_user findById(Integer id) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		Salary_user salary_user = (Salary_user) session.get(Salary_user.class, id);

		return salary_user;
	}
	@Override
	public List<Map<String, Object>> findAll2() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT  user.*,job_site.name_site FROM user LEFT JOIN job_site ON user.id_sitejob = job_site.id_sitejob";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	@Override
	public List<Map<String, Object>> findAll3() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM salary_user";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	@Override
	public List<Map<String, Object>> findAllbyid(Integer id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM job_site WHERE id_sitejob =:id ";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	@Override

	public List<Map<String, Object>> findUser() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> users = null;
		try {
			String sql = "SELECT USER FROM salary_user";
			
			SQLQuery query = session.createSQLQuery(sql);
			
			
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			users = query.list();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return users;
	}
	public List<Map<String, Object>> salarylist(String month, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM salary_user WHERE Year(start_date) =:year  AND MONTH(start_date) =:month";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	
	@Override
	public List<Map<String, Object>> notsatsun (String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> timesheetlist = null;
	
		try {
			String sql = "SELECT user_create, COUNT(DISTINCT(day(time_create))) as time_check_in FROM work_hours WHERE YEAR(work_hours_time_work) = :year AND MONTH(work_hours_time_work) = :month and work_hours.work_hours_type=1 AND DATE_FORMAT(time_create,'%a') != 'sat' AND DATE_FORMAT(time_create,'%a') != 'sun' GROUP BY user_create"; 	
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("userid", userid);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			timesheetlist = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timesheetlist;
	}
	@Override
	public List<Map<String, Object>> workdays(String month,String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> holiday = null;
//		System.out.println("in try workdays ========> " +" "+ year+" "+ month);
		try {
			String sql = "SELECT start_date FROM `holiday` WHERE MONTH(start_date)= :month AND YEAR(start_date)= :year";
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("userid", userid);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			holiday = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return holiday;
	}
	@Override
	public List<Map<String, Object>> latedayall (String month1, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> latedayall = null;
//		System.out.println("in try listtimesheet ========> " +" "+ year+" "+ month1);
		try {
			String sql = "SELECT work_hours.user_create, count(DISTINCT(work_hours.time_create)) as wt,TIME_format(work_hours.time_create,\"%H:%i\"),user.work_time_start FROM work_hours,user WHERE work_hours.work_hours_type=1  AND work_hours.user_create=user.id and (TIME_format(work_hours.time_create,\"%H:%i\") > TIME_format(user.work_time_start,\"%H:%i\")) AND year(work_hours.time_create)=:year AND month(work_hours.time_create)=:month1 GROUP BY user_create"; 
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("month1", month1);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			latedayall = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return latedayall;
	}
	@Override
	public List<Map<String, Object>> leavenotsatsun (String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> leavenotsatsun = null;
	
		try {
			String sql = "select sum(no_day) as no_day , user_id  from (SELECT DISTINCT(start_date),leaves.no_day as no_day, leaves.user_id  FROM leaves WHERE  YEAR(leaves.start_date) =:year AND MONTH(leaves.start_date) =:month AND leave_status_id=1 AND DATE_FORMAT(leaves.start_date,'%a') != 'sat' AND DATE_FORMAT(leaves.start_date,'%a') != 'sun')t1 GROUP by user_id ";	
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("userid", userid);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			leavenotsatsun = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return leavenotsatsun;
	}
	@Override
	public List<Map<String, Object>> leavehalfday (String month1, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> leavenotsatsun = null;
	
		try {
			String sql = "SELECT user_id,SUM(CAST(no_day as CHAR) LIKE '%.125')*0.125 AS hour1,SUM(CAST(no_day as CHAR) LIKE '%.250')*0.250 AS hour2,SUM(CAST(no_day as CHAR) LIKE '%.375')*0.375 AS hour3,SUM(CAST(no_day as CHAR) LIKE '%.500')*0.500 AS hour4,SUM(CAST(no_day as CHAR) LIKE '%.625')*0.625 AS hour5,SUM(CAST(no_day as CHAR) LIKE '%.750')*0.750 AS hour6,SUM(CAST(no_day as CHAR) LIKE '%.875')*0.875 AS hour7 FROM leaves WHERE MONTH(start_date)=:month AND YEAR(start_date)=:year GROUP BY user_create";	
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("userid", userid);
			query.setParameter("month", month1);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			leavenotsatsun = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return leavenotsatsun;
	}
	@Override
	public List<Map<String, Object>> multipleDay(String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> multipleDay = null;
		try {			
			String sql = "SELECT DISTINCT leaves.start_date, sum(leaves.no_day) as no_day,leaves.user_id,work_hours.time_create,work_hours.user_create FROM work_hours,leaves WHERE leaves.leave_status_id AND month(work_hours.time_create)=:month AND year(work_hours.time_create)= :year AND work_hours.work_hours_type=1 AND month(leaves.start_date)=month(work_hours.time_create) AND year(leaves.start_date)=year(work_hours.time_create) AND day(leaves.start_date)=day(work_hours.time_create) AND work_hours.user_create=leaves.user_id GROUP BY work_hours.user_create ";
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("userid", userid);
			query.setParameter("month",month);
			query.setParameter("year",year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			multipleDay = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return multipleDay;
	}
	@Override
	public List<Map<String, Object>> serchnamejob (String userid) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> date1sttonow = null;
	
		try {
			String sql = "SELECT user.name,user.id,user.id_sitejob, job_site.name_site FROM user LEFT JOIN job_site ON user.id_sitejob = job_site.id_sitejob WHERE user.id =:userid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			date1sttonow = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date1sttonow;
	}
	
	@Override
	public void save_history(HistorySalary historysalary) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(historysalary);
		session.flush();
	}
	
	@Override
	public List<Map<String, Object>> find_historybyname(String user,String start_mouth,String today) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user_oldsalary = null;
		try {
			String sql = "SELECT * FROM history_saraly WHERE user = :user AND DATE(time_create) BETWEEN :start_mouth AND :today";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user", user);
			query.setParameter("start_mouth", start_mouth);
			query.setParameter("today", today);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			user_oldsalary = query.list();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return user_oldsalary;
	}
	@Override
	public List<Map<String, Object>> findAll4() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT salary_user.user,salary_user.salary,user.name FROM salary_user,user WHERE salary_user.user =  (user.id  collate utf8_general_ci) ORDER BY id_salary_user ASC";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;
	}
	@Override
	public List<Map<String, Object>> find_late(String user,String start_mouth, String today) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user_late = null;
		try {
			String sql = "SELECT work_hours.user_create,TIME_format(work_hours.work_hours_time_work,\"%H:%i\") as worktime,user.work_time_start FROM work_hours,user WHERE work_hours.work_hours_type=1  AND work_hours.user_create=:user AND user.id = :user and (TIME_format(work_hours.work_hours_time_work,\"%H:%i\") > TIME_format(user.work_time_start,\"%H:%i\")) AND DATE(work_hours.time_create) BETWEEN :start_mouth AND :today";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user", user);
			query.setParameter("start_mouth", start_mouth);
			query.setParameter("today", today);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			user_late = query.list();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return user_late;
	}
	
	@Override
	public void save_salary(Salary salary) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(salary);
		session.flush();
		
	}
	@Override
	public List<Map<String, Object>> finduser_salary(String user, String start_mouth, String today) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> salary_success = null;
		try {
			String sql = "SELECT * FROM `salary` WHERE user = :user AND DATE(time_create) BETWEEN :start_mouth AND :today";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user", user);
			query.setParameter("start_mouth", start_mouth);
			query.setParameter("today", today);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			salary_success = query.list();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return salary_success;
		
	}
}
