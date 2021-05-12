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

import com.cubesofttech.model.Group_chat_read_like_status;

@Repository
public class GroupChatReadLikeDAOImpl implements GroupChatReadLikeDAO{

	@Autowired
	private  SessionFactory sessionFactory;
	@Override
	public void save(Group_chat_read_like_status Group_chat_read_like_status) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(Group_chat_read_like_status);
		session.flush();
		
	}

	@Override
	public void update(Group_chat_read_like_status Group_chat_read_like_status) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(Group_chat_read_like_status);
		session.flush();
		
	}

	@Override
	public void delete(Group_chat_read_like_status Group_chat_read_like_status) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(Group_chat_read_like_status);
		session.flush();
		
	}

	@Override
	public void set_read(String user_id, String message_group_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			String sql = "UPDATE `group_chat_read_like_status` SET `read_status`='1' WHERE read_status ='0' AND `user_id` =:userid AND `Group_chat_id` =:message_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", user_id);
			query.setParameter("message_id", message_group_id);
			query.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Map<String, Object>> Get_read_count(String chat_id, String message_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> readcount = new ArrayList();
		try {
			String sql = "SELECT COUNT(`read_status`) as readcount FROM `group_chat_read_like_status`WHERE Group_chat_id =:chatid and Group_chat_message_id =:message_id and read_status = '1'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chatid", chat_id);
			query.setParameter("message_id", message_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			readcount = query.list();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return readcount;
	}

	@Override
	public void set_like(String user_id, String message_group_id, String like_status) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			String sql = "UPDATE `group_chat_read_like_status` SET `like_status`=:like_status WHERE `user_id` =:userid AND `Group_chat_message_id` =:message_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("like_status", like_status);
			query.setParameter("userid", user_id);
			query.setParameter("message_id", message_group_id);
			query.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Map<String, Object>> Get_like_count(String chat_id, String message_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> readcount = new ArrayList();
		try {
			String sql = "SELECT COUNT(`like_status`) as likecount FROM `group_chat_read_like_status` WHERE Group_chat_id=:chatid and Group_chat_message_id =:message_id and `like_status` = '1'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chatid", chat_id);
			query.setParameter("message_id", message_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			readcount = query.list();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return readcount;
	}

	@Override
	public void delete_by_group_id(String Group_chat_id) throws Exception {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "DELETE FROM `group_chat_read_like_status` WHERE Group_chat_id =:group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("group_id", Group_chat_id);
			query.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}



}
