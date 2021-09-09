package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Meeting;
@Repository
public class MeetingDAOImpl implements MeetingDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Map<String, Object>> emptyRoom(Timestamp today) throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> ans = null;
		List<Map<String, Object>> hour = hourPerDay();
		try {
			String sql ="SELECT (240000-time_start)-(240000-time_end) AS hour , date FROM meeting GROUP BY date";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ans = query.list();
			int x=0;
			while(x<=ans.size()-1) {
				ans.get(x);
			}
		}catch(Exception e) {e.printStackTrace();}
		return ans;
	}
	@Override
	public List<Map<String, Object>> hourPerDay() throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> ans = null;
		try {
			String sql ="SELECT (COUNT(idroom))*80000 FROM room";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ans = query.list();
		}catch(Exception e) {e.printStackTrace();}
		return ans;
	}

	@Override
	public List<Map<String, Object>> myAllMeet(String userid) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> ans = null;
		try {
			String sql = "SELECT * "
					+ "FROM ((meeting INNER JOIN inviting ON meeting.idmeeting = inviting.idmeeting)"
					+ "INNER JOIN room ON meeting.idroom=room.idroom) "
					+ "WHERE inviting.member='"+userid+"' ORDER BY meeting.date";
			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ans = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return ans;
	}
	
	@Override
	public List<Map<String, Object>> myNowMeet(String userid,Timestamp today) throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> ans = null;
		
		try {
			String sql = "SELECT * "
					+ "FROM ((meeting INNER JOIN inviting ON meeting.idmeeting = inviting.idmeeting)"
					+ "INNER JOIN room ON meeting.idroom=room.idroom) "
					+ "WHERE inviting.member='"+userid+"' AND meeting.date>='"+today+"' ORDER BY meeting.date";
			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ans = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return ans;
	}
	@Override
	public List<Map<String, Object>> checkRoomToday(String today) throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> ans = null;
		
		try {
			String sql = "SELECT time_start,time_end,idroom "
					+ "FROM meeting WHERE date='2021-09-02' ORDER BY time_start";
			 System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ans = query.list();
		} catch (Exception e) {

			System.out.println("SQL: Error2");
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return ans;
	}
	@Override
	public List<Map<String, Object>> myTodayMeet(String userid,String today) throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> ans = null;
		
		try {
			String sql = "SELECT * "
					+ "FROM ((meeting INNER JOIN inviting ON meeting.idmeeting = inviting.idmeeting)"
					+ "INNER JOIN room ON meeting.idroom=room.idroom) "
					+ "WHERE inviting.member='"+userid+"' AND meeting.date='"+today+"' ORDER BY meeting.date";
			 System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ans = query.list();
		} catch (Exception e) {

			System.out.println("SQL: Error");
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return ans;
	}
	@Override
	public Meeting findById(Integer idmeeting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Meeting meet = (Meeting) session.get(Meeting.class, idmeeting);

		return meet;
	}
@Override
	public List<Map<String, Object>> findAllperDay(String today) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();

	List<Map<String, Object>> faqJoin = null;
	try {
		String sql = "SELECT * FROM meeting WHERE date='"+today+"'";

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
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM meeting WHERE date='2021-09-02' ORDER BY time_start";

			System.out.println("SQL: " + sql);
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
	public void save(Meeting meeting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(meeting);
		session.flush();		
	}

	@Override
	public void update(Meeting meeting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(meeting);
		session.flush();
		
	}

	@Override
	public void delete(Meeting meeting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(meeting);
		session.flush();
		
	}

}