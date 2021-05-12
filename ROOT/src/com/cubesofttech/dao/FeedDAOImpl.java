package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FeedNews;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.FeedNewsLike;
import com.google.gson.JsonElement;

@Repository
public class FeedDAOImpl implements FeedDAO {

	@Autowired
	private SessionFactory sessionFactory;
	private static final Logger log = Logger.getLogger(FeedDAOImpl.class);

	@Override
	public List<Map<String, Object>> findAlldetail(Integer limits) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> feedPost = null;

		try {
			String sql = "SELECT user.role_id AS role ,user.path AS path,user.name As name ,feednews.* FROM feednews JOIN user WHERE feednews.user_id=user.id ORDER BY feed_id DESC LIMIT :limits";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("limits", limits);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			feedPost = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return feedPost;
	}
	
	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> feedPost = null;

		try {
			String sql = "SELECT user.role_id AS role ,user.path AS path,user.name As name ,feednews.* FROM feednews JOIN user WHERE feednews.user_id=user.id ORDER BY feed_id DESC LIMIT 100";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			feedPost = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return feedPost;
	}
	
	@Override
	public List<Map<String, Object>> userpath(String user_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> feedPost = null;

		try {
			String sql = "SELECT user.path AS path , user.name AS name , user.role_id AS role_id FROM  user WHERE id=:user_id ";
			SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("user_id", user_id);
//			query.setParameter("month", month);
//			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			feedPost = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return feedPost;
	}
	


	@Override
	public void savefeed(FeedNews feed) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(feed);
		session.flush();

	}

	@Override
	public void updatepost(FeedNews feed) throws Exception {
	
		Session session = this.sessionFactory.getCurrentSession();
		session.update(feed);
		session.flush();

	}

	@Override
	public void deletepost(FeedNews feed) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		session.delete(feed);
		session.flush();

	}

	@Override
	public FeedNews findById(Integer id) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		FeedNews feeds = (FeedNews) session.get(FeedNews.class, id);

		return feeds;
	}
//like code
	
	@Override
	public void savelike(FeedNewsLike like) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(like);
		session.flush();

	}
	
	@Override
	public void deletelike(FeedNewsLike like) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		session.delete(like);
		session.flush();

	}
	
	@Override
	public void updatelike(FeedNewsLike like) throws Exception {
	
		Session session = this.sessionFactory.getCurrentSession();
		session.update(like);
		session.flush();

	}
	
	@Override
	public FeedNewsLike findByIdLike(Integer id) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		FeedNewsLike like = (FeedNewsLike) session.get(FeedNewsLike.class,id);
	
		return like;
	}
	@Override
	public  List<Map<String, Object>> findIdLike(String user, int idInt)throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> like = null;
		try {
			String sql = "SELECT * FROM feednewslike WHERE feed_id =:id AND user_id=:user";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user", user);
			query.setParameter("id", idInt);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			like = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return like;
	}
	
	
	@Override
	public List<Map<String, Object>> findAllLike(String feed_id, String type) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> allLike = null;
		try {
			String sql = "SELECT reactType, COUNT(*) as countlike   FROM feednewslike WHERE feed_id=:feed_id GROUP BY `reactType`";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("feed_id", feed_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			allLike = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return allLike;
	}
	
	@Override
	public List<Map<String, Object>> findAllLike(String feed_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> allLike = null;
		try {
			String sql = "SELECT feednewslike.like_id FROM feednewslike WHERE feed_id=:feed_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("feed_id", feed_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			allLike = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return allLike;
	}
	
	@Override
	public  List<Map<String, Object>> findByIdFeed(Integer idInt,String logonUser) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> like = null;

		try {
			String sql = "SELECT * FROM feednewslike WHERE feed_id=:idInt AND user_id =:logonUser ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("idInt", idInt);
			query.setParameter("logonUser", logonUser);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			like = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}


		return like;
	}
	
	@Override
	public List<Map<String, Object>> LikeRuam(String feedid)throws Exception{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> like = null;

		try {
			String sql = "SELECT count(like_id) as countlike,feed_id,reactType FROM feednewslike WHERE feed_id=:feedid GROUP BY reactType";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("feedid", feedid);
		
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			like = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return like;
	}
	
	
}