package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TimeInDAOimpl implements TimeInDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Map<String, Object>> TimeInList(String monthh, String yearr, String Useridd) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> TimeInList = null;
		
		try {
			String a = yearr+"-"+monthh+"-";
			String sql = "SELECT timesheet.id as timesheetId, timesheet.project,timesheet.summary,timesheet.timespent,timesheet.user_create,timesheet.time_check_out,timesheet.time_check_in,timesheet.description,timesheet.started_date,"
					+ "timesheet.OT_time_start,timesheet.OT_time_end,timesheet.OT_description,timesheet.team,"
					+ "user.id,user.name,user.work_time_start,user.work_time_end FROM timesheet "
					+ "LEFT JOIN user ON timesheet.user_create = user.id  WHERE (user.id = '"+Useridd+"') AND (started_date LIKE '%"+a+"%')"; 
					//(time_check_in LIKE '%"+a+"%') Group BY time_check_in";
			SQLQuery query = session.createSQLQuery(sql);
			//query.setParameter("Userid", Useridd);
			//query.setParameter("yearmonth", yearr+"-"+monthh+"-");
			//query.setParameter("month", monthh);
			//System.out.println(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			TimeInList = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return TimeInList;
	}
	@Override
	public List<Map<String, Object>> HolidayForTimeinList(String month, String year) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> Holidaylist = null;
		
		try {
			String a = year+"-"+month+"-";
			String sql = "SELECT * FROM holiday where (start_date LIKE '%"+a+"%' OR end_date LIKE '%"+a+"%')";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			//System.out.println(sql);
			Holidaylist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return Holidaylist;
	}
	@Override
	public List<Map<String, Object>> LeaveForTimeinList(String month ,String year ,String Userid) {
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> leavelist = null;
		try {
			String a = year+"-"+month+"-";
			String sql = "SELECT leaves.leave_status_id , leaves.no_day , leaves.user_id , leaves.description , leaves.start_date , leaves.end_date , leave_type.leave_type_name FROM leaves JOIN leave_type where leave_type.leave_type_id = leaves.leave_type_id and user_id = '"+Userid+"' and (start_date Like '%"+a+"%' OR end_date Like '%"+a+"%')";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			//System.out.println(sql);
			leavelist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return leavelist;
	}

}
