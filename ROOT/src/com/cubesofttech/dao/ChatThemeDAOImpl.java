package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.ChatTheme;
@Repository
public class ChatThemeDAOImpl implements ChatThemeDAO {

	@Autowired
	private  SessionFactory sessionFactory;
	@Override
	public void save(ChatTheme ChatTheme) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(ChatTheme);
		session.flush();
	}

	@Override
	public void update(ChatTheme ChatTheme) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(ChatTheme);
		session.flush();		
	}

	@Override
	public void delete(ChatTheme ChatTheme) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(ChatTheme);
		session.flush();		
	}

	@Override
	public List<Map<String, Object>> Find_theme(String Userid) throws Exception {
		List<Map<String, Object>> theme = null;
		try {
			Session session = this.sessionFactory.getCurrentSession();	
			String sql = "SELECT * FROM chat_theme WHERE Owner_chat_id=:Userid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Userid", Userid);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			theme = query.list();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return theme;
	}
	
	@Override
	public void Update_theme(String Userid,String themeid) throws Exception {
		List<Map<String, Object>> theme = null;
		try {
			Session session = this.sessionFactory.getCurrentSession();	
			String sql = "Update chat_theme SET theme =:themeid WHERE Owner_chat_id=:Userid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("themeid", themeid);
			query.setParameter("Userid", Userid);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	}
	
	

}
