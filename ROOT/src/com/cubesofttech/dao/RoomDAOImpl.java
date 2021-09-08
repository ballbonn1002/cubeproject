package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Room;
@Repository
public class RoomDAOImpl implements RoomDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public Room findById(Integer idroom) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Room room = (Room) session.get(Room.class, idroom);

		return room;
	}
	@Override
	public List<Map<String, Object>> getAmountRoom1() throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> roomlist = null;
		try {
			String sql = "SELECT * FROM room WHERE idroom%2>0";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			roomlist = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return roomlist;
	}
	@Override
	public List<Map<String, Object>> getAmountRoom2() throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> roomlist = null;
		try {
			String sql = "SELECT * FROM room WHERE idroom%2=0";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			roomlist = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return roomlist;
	}
	@Override
	public List<Map<String, Object>> getAmountRoom() throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> roomlist = null;
		try {
			String sql = "SELECT * FROM room ";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			roomlist = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return roomlist;
	}

	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> roomlist = null;
		try {
			String sql = "SELECT * FROM room";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			roomlist = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return roomlist;
	}

	@Override
	public void save(Room room) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(room);
		session.flush();
	}
		

	@Override
	public void update(Room room) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(room);
		session.flush();
		
	}

	@Override
	public void delete(Room room) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(room);
		session.flush();
	}
	
}
