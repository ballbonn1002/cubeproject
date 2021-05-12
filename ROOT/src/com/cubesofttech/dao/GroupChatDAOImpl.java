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

import com.cubesofttech.model.Group_chat;
@Repository
public class GroupChatDAOImpl implements GroupChatDAO{

	@Autowired
	private  SessionFactory sessionFactory;
	@Override
	public void save(Group_chat Group_chat) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(Group_chat);
		session.flush();
		
	}

	@Override
	public void update(Group_chat Group_chat) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(Group_chat);
		session.flush();
		
	}

	@Override
	public void delete(Group_chat Group_chat) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(Group_chat);
		session.flush();
		
	}

	@Override
	public List<Map<String, Object>> GetmyGroup(String userid) throws Exception {
		List<Map<String, Object>> grouplist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT  group_chat.Group_chat_id,group_chat.Group_chat_Name,group_chat.Group_Description,group_chat.Group_img_path,"
					+ "group_chat.Group_chat_user_create,group_chat.Group_time_create,group_chat.Group_chat_user_update,group_chat.Group_chat_time_update,"
					+ "group_chat_member.Group_chat_member_id,group_chat_member.member_id,group_chat_member.inviter_member_id,"
					+ "group_chat_member.member_time_create,group_chat_member.favorite_mark "
					+ "FROM group_chat LEFT JOIN group_chat_member ON group_chat.Group_chat_id  = group_chat_member.Group_chat_id "
					+ "WHERE member_id ='"+userid+"' ORDER BY favorite_mark DESC";
//			String sql = "SELECT * FROM group_chat NATURAL JOIN group_chat_member Where member_id =:userid ORDER BY favorite_mark DESC";
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("userid", userid);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			grouplist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return grouplist;
	}

	@Override
	public List<Map<String, Object>> GetLastestGroup() throws Exception {
		List<Map<String, Object>> grouplist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM `group_chat` ORDER BY `Group_chat_id` DESC LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			grouplist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return grouplist;
		
	}

	@Override
	public List<Map<String, Object>> GetGroupChatUnread(String userid,String Group_id) throws Exception {
		List<Map<String, Object>> grouplist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT *,COUNT(read_status) AS unread_count FROM group_chat_read_like_status Where read_status = '0' and user_id ='"+userid+"' AND Group_chat_id ='"+Group_id+"' GROUP BY Group_chat_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			grouplist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return grouplist;
	}

	@Override
	public List<Map<String, Object>> Findmygroup(String userid, String searchtext) throws Exception {
		List<Map<String, Object>> grouplist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql ="SELECT  group_chat.Group_chat_id,group_chat.Group_chat_Name,group_chat.Group_Description,group_chat.Group_img_path,"
					+ "group_chat.Group_chat_user_create,group_chat.Group_time_create,group_chat.Group_chat_user_update,group_chat.Group_chat_time_update,"
					+ "group_chat_member.Group_chat_member_id,group_chat_member.member_id,group_chat_member.inviter_member_id,"
					+ "group_chat_member.member_time_create,group_chat_member.favorite_mark "
					+ "FROM group_chat LEFT JOIN group_chat_member ON group_chat.Group_chat_id  = group_chat_member.Group_chat_id WHERE "
					+ "group_chat.Group_chat_Name LIKE '%"+searchtext+"%' AND group_chat_member.member_id ='"+userid+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			grouplist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return grouplist;
		
	}

	@Override
	public List<Map<String, Object>> GetMyGroupSetting(String userid, String Group_id) throws Exception {
		List<Map<String, Object>> grouplist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql ="SELECT  group_chat.Group_chat_id,group_chat.Group_chat_Name,group_chat.Group_Description,group_chat.Group_img_path,"
					+ "group_chat.Group_chat_user_create,group_chat.Group_time_create,group_chat.Group_chat_user_update,group_chat.Group_chat_time_update,"
					+ "group_chat_member.Group_chat_member_id,group_chat_member.member_id,group_chat_member.inviter_member_id,"
					+ "group_chat_member.member_time_create,group_chat_member.favorite_mark "
					+ "FROM group_chat LEFT JOIN group_chat_member ON group_chat.Group_chat_id  = group_chat_member.Group_chat_id WHERE "
					+ "group_chat.Group_chat_id = "+Group_id+" AND group_chat_member.member_id ='"+userid+"'";
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("userid", userid);
//			query.setParameter("groupid", Group_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			grouplist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return grouplist;
	}

	@Override
	public List<Map<String, Object>> get_group_chat(String group_id) throws Exception {
		List<Map<String,Object>> Group_chat = new ArrayList();
		Session session = this.sessionFactory.getCurrentSession();
		try {
			String sql = "SELECT * FROM group_chat WHERE Group_chat_id =:group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("group_id", group_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Group_chat = query.list();
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return Group_chat;
	}
	
	

}
