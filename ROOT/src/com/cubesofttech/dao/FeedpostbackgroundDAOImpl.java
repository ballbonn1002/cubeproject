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

import com.cubesofttech.model.FeedPostBackground;
@Repository
public class FeedpostbackgroundDAOImpl implements FeedpostbackgroundDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void save(FeedPostBackground FeedBackground) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(FeedBackground);
		session.flush();
		
	}

	@Override
	public void update(FeedPostBackground FeedBackground) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(FeedBackground);
		session.flush();
	}

	@Override
	public void delete(FeedPostBackground FeedBackground) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(FeedBackground);
		session.flush();
		
	}

	@Override
	public List<Map<String, Object>> GetAllPostBackground() throws Exception {
		List<Map<String,Object>> allbackground = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();	
			String sql = "Select *,DATE_FORMAT(time_create , \"%d/%m/%Y %H:%i:%S\") as time from feed_post_background";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			allbackground = query.list();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return allbackground;
	}
	
	public void deletebyid(String backgroundid)throws Exception{
		try {
			Session session = this.sessionFactory.getCurrentSession();	
			String sql = "Delete From feed_post_background WHERE feed_post_background_id =:backgroundid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("backgroundid", backgroundid);
			query.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void SetUse(String bacgroundid) throws Exception {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "Update feed_post_background SET used_status = '1' WHERE feed_post_background_id =:backgroundid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("backgroundid", bacgroundid);
			query.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

	@Override
	public List<Map<String, Object>> GetPostBackgroundById(String background_id) throws Exception {
		List<Map<String,Object>> background = new ArrayList();
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String sql = "SELECT *,DATE_FORMAT(time_create , \"%d/%m/%Y %H:%i:%S\") as time FROM feed_post_background WHERE feed_post_background_id =:backgroundid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("backgroundid", background_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			background = query.list();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return background;
	}
	
	

}
