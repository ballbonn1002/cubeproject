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

import com.cubesofttech.model.Approver;
import com.cubesofttech.model.Comment;
import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.FeedNews;
import com.google.gson.JsonElement;

@Repository

public class CommentDAOImpl implements CommentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private static final Logger log = Logger.getLogger(CommentDAOImpl.class);

	@Override
	public List<Map<String, Object>> findByIdFeed(Integer feed_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> feedPost = null;

		try {
//			String sql = "SELECT * FROM comment WHERE feed_id=:feedid ORDER BY feed_id DESC";
			String sql = "SELECT comment.* , user.path AS path,user.name AS name FROM comment JOIN user  WHERE comment.feed_id=:feedid  AND comment.user_comment=user.id ORDER BY comment.comment_id ASC";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("feedid", feed_id);
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
	public List<Map<String, Object>> findAllComment() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> feedPost = null;

		try {
			String sql = "SELECT  comment.*, user.path AS path,user.name AS name FROM comment JOIN user WHERE comment.user_comment=user.id ORDER BY comment_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			feedPost = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return feedPost;
	}

	@Override
	public List<Map<String, Object>> topUserComment() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> topcom = null;

		try {
//			String sql = "SELECT * FROM (  (SELECT MAX(comment_id) as c_id FROM comment GROUP BY feed_id) t1 JOIN (SELECT * FROM comment) t2 ON t1.c_id = t2.comment_id  JOIN user ON user.id = t2.user_comment)";
			String sql = "SELECT * FROM (SELECT * FROM (SELECT MAX(comment.comment_id) as c_id FROM comment GROUP BY comment.feed_id)t1 JOIN (SELECT * FROM comment)t2 ON t1.c_id = t2.comment_id ) s1 INNER JOIN (SELECT user.id,user.name,user.path FROM user )s2 ON s1.user_comment = s2.id";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			topcom = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return topcom;
	}
	
	@Override
	public List<Map<String, Object>> topUserCommentById(Integer feed_id1) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> topcom = null;

		try {
//			String sql = "SELECT * FROM (  (SELECT MAX(comment_id) as c_id FROM comment GROUP BY feed_id) t1 JOIN (SELECT * FROM comment) t2 ON t1.c_id = t2.comment_id  JOIN user ON user.id = t2.user_comment)";
			String sql = "SELECT * FROM (SELECT * FROM (SELECT MAX(comment.comment_id) as c_id FROM comment GROUP BY comment.feed_id)t1 JOIN (SELECT * FROM comment)t2 ON t1.c_id = t2.comment_id ) s1 INNER JOIN (SELECT user.id,user.name,user.path FROM user )s2 ON s1.user_comment = s2.id WHERE feed_id=:feedid";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("feedid", feed_id1);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			topcom = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return topcom;
	}

	@Override
	public List<Map<String, Object>> findWhereFeednewsId(Integer id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> whereFeed = null;

		try {
			String sql = "SELECT * FROM comment WHERE feed_id =:feedid";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("feedid", id);
			
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			whereFeed = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return whereFeed;
	}

	@Override
	public Comment findByIdComment(Integer id) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		Comment comment = (Comment) session.get(Comment.class, id);

		return comment;
	}

	@Override
	public void deletecomment(Comment comment) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		session.delete(comment);
		session.flush();

	}

	@Override
	public void updatecomment(Comment comment) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		session.update(comment);
		session.flush();

	}

	@Override
	public void savecomment(Comment comment) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(comment);
		session.flush();

	}
}
