package com.cubesofttech.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Group_chat_message;

@Repository
public class GroupChatMessageDAOImpl implements GroupChatMessageDAO{

	@Autowired
	private  SessionFactory sessionFactory;
	@Override
	public void save(Group_chat_message Group_chat_message) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(Group_chat_message);
		session.flush();
		
	}

	@Override
	public void update(Group_chat_message Group_chat_message) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(Group_chat_message);
		session.flush();
		
	}

	@Override
	public void delete(Group_chat_message Group_chat_message) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(Group_chat_message);
		session.flush();
		
	}

	@Override
	public List<Map<String, Object>> GetlastestMessage() throws Exception {
		List<Map<String, Object>> messagelist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM `group_chat_message` ORDER BY `Group_chat_message_id` DESC LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			messagelist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return messagelist;
		
	}

	@Override
	public List<Map<String, Object>> GetGroupMessage(String Group_chat_id, String user_id,String limit) throws Exception {
		List<Map<String, Object>> messagelist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_message, '%d/%m/%Y %H:%i:%S') as Chat_time FROM `group_chat_message` AS A"
					+ "LEFT JOIN (SELECT group_chat_read_like_status_id, Group_chat_message_id AS RL_message_id,read_status,like_status,user_id FROM `group_chat_read_like_status`) AS C "
					+ "ON (Group_chat_message_id = C.RL_message_id ) WHERE C.user_id =:user_id AND Group_chat_id =:Group_chat_id ORDER BY Group_chat_message_id DESC LIMIT "+limit+") Preselect "
					+ "ORDER BY Group_chat_message_id ASC";
			/*
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_message, '%d/%m/%Y %H:%i:%S') as Chat_time FROM `group_chat_message` "
					+ "NATURAL JOIN `group_chat` NATURAL JOIN `group_chat_read_like_status` "
					+ "WHERE user_id =:user_id AND Group_chat_id =:Group_chat_id ORDER BY Group_chat_message_id DESC LIMIT "+limit+") Preselect ORDER BY Group_chat_message_id ASC";*/
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user_id", user_id);
			query.setParameter("Group_chat_id", Group_chat_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			messagelist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return messagelist;
		
	}

	@Override
	public void delete_by_group_id(String Group_chat_id) throws Exception {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "DELETE FROM `group_chat_message` WHERE Group_chat_id =:group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("group_id", Group_chat_id);
			query.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

	@Override
	public List<Map<String, Object>> get_file_in_group_chat(String Group_chat_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> fileingroup = null;

		try {
			String sql = "SELECT * FROM `group_chat_message` WHERE (file_message_status = '1' OR image_message_status = '1')AND Group_chat_id =:Group_chat_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Group_chat_id", Group_chat_id); 
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			fileingroup = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileingroup;
	}

	@Override
	public List<Map<String, Object>> get_image_in_group_chat(String Group_chat_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> imgingroup = null;

		try {
			String sql = "SELECT * FROM `group_chat_message` WHERE image_message_status = '1' AND Group_chat_id =:Group_chat_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Group_chat_id", Group_chat_id); 
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			imgingroup = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imgingroup;
	}

	@Override
	public List<Map<String, Object>> get_All_likely_chat_group(String Group_chat_id, String user_id, String text) throws Exception {
		List<Map<String, Object>> messagelist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_message, '%d/%m/%Y %H:%i:%S') as Chat_time FROM `group_chat_message` AS A "
					+ "LEFT JOIN (SELECT group_chat_read_like_status_id, Group_chat_message_id AS RL_message_id,read_status,like_status,user_id FROM `group_chat_read_like_status`) AS C "
					+ "ON (Group_chat_message_id = C.RL_message_id )"
					+ "WHERE Group_chat_id =:Group_chat_id AND (information_message_status IS NULL) AND Group_chat_message LIKE '%"+text+"%' "
					+ "GROUP BY Group_chat_message_id ORDER BY Group_chat_message_id DESC) Preselect ORDER BY Group_chat_message_id DESC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Group_chat_id", Group_chat_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			messagelist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return messagelist;
	}

	@Override
	public List<Map<String, Object>> get_group_chat_at_id(String Group_chat_id, String user_id, String text , String Gmessage_id)
			throws Exception {
		List<Map<String, Object>> messagelist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_message, '%d/%m/%Y %H:%i:%S') as Chat_time FROM `group_chat_message` AS A "
					+ "LEFT JOIN (SELECT group_chat_read_like_status_id, Group_chat_message_id AS RL_message_id,read_status,like_status,user_id FROM `group_chat_read_like_status`) AS C "
					+ "ON (A.Group_chat_message_id = C.RL_message_id )"
					+ "WHERE user_id =:user_id AND Group_chat_id =:Group_chat_id AND (information_message_status IS NULL) AND Group_chat_message_id =:Gmessage_id GROUP BY Group_chat_message_id ORDER BY Group_chat_message_id DESC limit 1) Preselect ORDER BY Group_chat_message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user_id", user_id);
			query.setParameter("Gmessage_id", Gmessage_id);
			query.setParameter("Group_chat_id", Group_chat_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			messagelist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return messagelist;
	}

	@Override
	public List<Map<String, Object>> get_search_in_length_group(String Group_chat_id, String user_id, String text,
			String length, String Gmessage_id) throws Exception {
		List<Map<String, Object>> messagelist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM ((SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM `group_chat_message`  AS A LEFT JOIN (SELECT group_chat_read_like_status_id, Group_chat_message_id AS RL_message_id,read_status,like_status,user_id FROM `group_chat_read_like_status`) AS C ON (A.Group_chat_message_id = C.RL_message_id ) WHERE Group_chat_id =:Group_chat_id AND Group_chat_message_id < "+Gmessage_id+" GROUP BY Group_chat_message_id ORDER BY Group_chat_message_id DESC LIMIT "+length+") Preselect ORDER BY Group_chat_message_id ASC)"
					+"UNION"
					+"(SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM `group_chat_message` AS A LEFT JOIN (SELECT group_chat_read_like_status_id, Group_chat_message_id AS RL_message_id,read_status,like_status,user_id FROM `group_chat_read_like_status`) AS C ON (A.Group_chat_message_id = C.RL_message_id ) WHERE Group_chat_id =:Group_chat_id  AND Group_chat_message_id = "+Gmessage_id+" GROUP BY Group_chat_message_id ORDER BY Group_chat_message_id DESC) Preselect ORDER BY Group_chat_message_id DESC)"
					+"UNION"
					+"(SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM `group_chat_message` AS A LEFT JOIN (SELECT group_chat_read_like_status_id, Group_chat_message_id AS RL_message_id,read_status,like_status,user_id FROM `group_chat_read_like_status`) AS C ON (A.Group_chat_message_id = C.RL_message_id ) WHERE Group_chat_id =:Group_chat_id AND Group_chat_message_id > "+Gmessage_id+" GROUP BY Group_chat_message_id ORDER BY Group_chat_message_id ASC LIMIT "+length+") Preselect ORDER BY Group_chat_message_id ASC)) AS groupmess ORDER BY Group_chat_message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Group_chat_id", Group_chat_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			messagelist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return messagelist;
	}

	@Override
	public List<Map<String, Object>> get_search_group_chat_count(String Group_chat_id, String searchtext) {
		List<Map<String, Object>> messagelist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT *,COUNT(Group_chat_message_id) AS foundcount FROM (SELECT *,DATE_FORMAT(Date_time_message, '%d/%m/%Y %H:%i:%S') as Chat_time FROM `group_chat_message` "
					+ " AS A LEFT JOIN (SELECT group_chat_read_like_status_id, Group_chat_message_id AS RL_message_id,read_status,like_status,user_id FROM `group_chat_read_like_status`) AS C ON (A.Group_chat_message_id = C.RL_message_id ) "
					+ "WHERE  Group_chat_id =:Group_chat_id AND (information_message_status IS NULL) AND Group_chat_message LIKE '%"+searchtext+"%' GROUP BY Group_chat_message_id ORDER BY Group_chat_message_id DESC) Preselect ORDER BY Group_chat_message_id ASC LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Group_chat_id", Group_chat_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			messagelist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return messagelist;
	}

}
