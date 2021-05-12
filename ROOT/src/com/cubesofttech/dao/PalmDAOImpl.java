package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.google.gson.JsonElement;

@Repository
public class PalmDAOImpl  implements PalmDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	private static final Logger log = Logger.getLogger(PalmDAOImpl.class);
	
	@Override
	public List<Map<String, Object>> listtimesheet (String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> timesheetlist = null;
	
		try {
			String sql = "SELECT * FROM (SELECT sum(no_day) as no_day,user_id FROM (SELECT DISTINCT(day(leaves.start_date)),leaves.start_date,leaves.user_id,leaves.no_day FROM leaves WHERE  YEAR(leaves.start_date) = :year AND MONTH(leaves.start_date) = :month AND 	leave_status_id='1') t3 GROUP BY user_id ) t1 INNER JOIN (SELECT user_create, COUNT(DISTINCT(day(time_create))) as time_check_in FROM work_hours WHERE YEAR(work_hours_time_work) = :year AND MONTH(work_hours_time_work) = :month and work_hours.work_hours_type=1 GROUP BY user_create) t2 ON t1.user_id = t2.user_create"; 	
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
	public List<Map<String, Object>> spalm(String userid,String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> spalm = null;
		try {
			String sql = "SELECT user_create, COUNT(DISTINCT(day(time_create))) as time_check_in FROM work_hours WHERE user_create =:userid AND YEAR(work_hours_time_work) = :year AND MONTH(work_hours_time_work) = :month and work_hours.work_hours_type=1 AND DATE_FORMAT(time_create,'%a') != 'sat' AND DATE_FORMAT(time_create,'%a') != 'sun' GROUP BY user_create"; 

			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);
			query.setParameter("month",month);
			query.setParameter("year",year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			spalm = query.list();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return spalm;
	}
	@Override
	public List<Map<String, Object>> leavenotsatsun(String userid,String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> spalm = null;
		try {
			String sql = "select sum(no_day) as no_day , user_id  from (SELECT DISTINCT(start_date),leaves.no_day as no_day, leaves.user_id  FROM leaves WHERE user_id=:userid AND YEAR(leaves.start_date) =:year AND MONTH(leaves.start_date) =:month AND leave_status_id=1 AND DATE_FORMAT(leaves.start_date,'%a') != 'sat' AND DATE_FORMAT(leaves.start_date,'%a') != 'sun')t1"; 

			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid",userid);
			query.setParameter("month",month);
			query.setParameter("year",year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			spalm = query.list();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return spalm;
	}
	
	
	
	@Override
	public List<Map<String, Object>> lateday(String userid,String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> lateday = null;
		try {			
			String sql = "SELECT work_hours.user_create, work_hours.time_create,TIME_format(work_hours.time_create,\"%H:%i\"),user.work_time_start FROM work_hours,user\r\n"
					+ "WHERE work_hours.work_hours_type=1 AND work_hours.user_create=:userid AND work_hours.user_create=user.id and (TIME_format(work_hours.time_create,\"%H:%i\") > TIME_format(user.work_time_start,\"%H:%i\"))\r\n"
					+ "AND year(work_hours.time_create)=:year AND month(work_hours.time_create)=:month";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);
			query.setParameter("month",month);
			query.setParameter("year",year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			lateday = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lateday;
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
	public List<Map<String, Object>> multipleDay(String userid,String month, String year) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> multipleDay = null;
		try {			
			String sql = "SELECT DISTINCT leaves.start_date, leaves.no_day,leaves.user_id,work_hours.time_create,work_hours.user_create FROM work_hours,leaves WHERE leaves.leave_status_id AND work_hours.user_create =:userid and month(work_hours.time_create)=:month AND year(work_hours.time_create)= :year AND work_hours.work_hours_type=1 AND month(leaves.start_date)=month(work_hours.time_create) AND year(leaves.start_date)=year(work_hours.time_create) AND day(leaves.start_date)=day(work_hours.time_create) AND work_hours.user_create=leaves.user_id ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);
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
}

