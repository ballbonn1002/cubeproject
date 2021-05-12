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

import com.cubesofttech.model.ChatUserSetting;

@Repository
public class ChatUserSettingDAOImpl implements ChatUserSettingDAO{
	@Autowired
	private  SessionFactory sessionFactory;

	@Override
	public void save(ChatUserSetting ChatUserSetting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(ChatUserSetting);
		session.flush();
	}

	@Override
	public void update(ChatUserSetting ChatUserSetting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(ChatUserSetting);
		session.flush();
		
	}

	@Override
	public void delete(ChatUserSetting ChatUserSetting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(ChatUserSetting);
		session.flush();	
	}

	@Override
	public List<Map<String, Object>> GetSettingByUserId(String userid) {
		List<Map<String,Object>> setting = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();	
			String sql = "SELECT * FROM chat_user_setting WHERE user_id=:user_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user_id", userid);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			setting = query.list();
		}catch(Exception Ex) {
			Ex.printStackTrace();
		}
		return setting;
	}

	@Override
	public void setNewChatLimit(String userid, String limit) throws Exception {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "UPDATE chat_user_setting SET chat_load_limit = "+limit+" WHERE user_id=:userid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);
			query.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
}
