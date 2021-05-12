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

import com.cubesofttech.model.Group_chat_member;

@Repository
public class GroupChatMemberDAOImpl implements GroupChatMemberDAO{

	
	@Autowired
	private  SessionFactory sessionFactory;
	@Override
	public void save(Group_chat_member Group_chat_member) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(Group_chat_member);
		session.flush();
		
	}

	@Override
	public void update(Group_chat_member Group_chat_member) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(Group_chat_member);
		session.flush();
		
	}

	@Override
	public void delete(Group_chat_member Group_chat_member) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(Group_chat_member);
		session.flush();
		
	}

	@Override
	public List<Map<String, Object>> getMember(String Group_chat_id) throws Exception {
		List<Map<String, Object>> memberlist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM `group_chat_member` WHERE Group_chat_id =:id ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", Group_chat_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			memberlist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}

	@Override
	public List<Map<String, Object>> FindMemberByName(String Group_chat_id, String member_name) throws Exception {
		List<Map<String, Object>> memberlist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM `group_chat_member` LEFT JOIN user ON user.id = group_chat_member.member_id WHERE user.id = group_chat_member.member_id AND Group_chat_id =:id AND user.name LIKE '%"+member_name+"%'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", Group_chat_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			memberlist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}

	@Override
	public void delete_by_group_id(String Group_chat_id) throws Exception {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "DELETE FROM `group_chat_member` WHERE Group_chat_id =:group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("group_id", Group_chat_id);
			query.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

	@Override
	public List<Map<String, Object>> getGroupmember(String Group_chat_id, String member_id) throws Exception {
		List<Map<String, Object>> memberlist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT group_chat.Group_chat_id,group_chat.Group_chat_Name,group_chat.Group_Description,group_chat.Group_img_path,"
					+ "group_chat.Group_chat_user_create,group_chat.Group_time_create,group_chat.Group_chat_user_update,group_chat.Group_chat_time_update,"
					+ "group_chat_member.Group_chat_member_id,group_chat_member.member_id,"
					+ "group_chat_member.member_time_create,group_chat_member.favorite_mark,group_chat_member.inviter_member_id  "
					+ "FROM group_chat_member LEFT JOIN group_chat ON group_chat_member.Group_chat_id = group_chat.Group_chat_id "
					+ "WHERE group_chat.Group_chat_id = "+Group_chat_id+" AND group_chat_member.member_id ='"+member_id+"'";
//			String sql = "SELECT * FROM `group_chat_member` WHERE  Group_chat_id =:group_id AND member_id =:member_id";
			SQLQuery query = session.createSQLQuery(sql);
//			query.setParameter("group_id", Group_chat_id);
//			query.setParameter("member_id", member_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			memberlist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}

	@Override
	public void setFav(String Group_id, String member_id,String mark) throws Exception {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "UPDATE `group_chat_member` SET favorite_mark =:mark WHERE  Group_chat_id =:group_id AND member_id =:member_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("mark",mark);
			query.setParameter("group_id", Group_id);
			query.setParameter("member_id", member_id);
			query.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void DeleteByMemberIdAndGroup(String Group_id, String member_id) throws Exception {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "DELETE FROM `group_chat_member` WHERE  Group_chat_id =:group_id AND member_id =:member_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("group_id", Group_id);
			query.setParameter("member_id", member_id);
			query.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Map<String, Object>> getMemberinfo(String Group_chat_member_id, String member_id) throws Exception {
		List<Map<String, Object>> memberlist = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT * FROM `group_chat_member` WHERE Group_chat_member_id =:group_id AND member_id =:member_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("group_id", Group_chat_member_id);
			query.setParameter("member_id", member_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			memberlist = query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}

}
