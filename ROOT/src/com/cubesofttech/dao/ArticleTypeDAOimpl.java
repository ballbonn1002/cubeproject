package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.ArticleType;

@Repository
public class ArticleTypeDAOimpl implements ArticleTypeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(ArticleType articleType) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(articleType);
		session.flush();

	}

	@Override
	public void update(ArticleType articleType) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(articleType);
		session.flush();

	}

	@Override
	public void delete(ArticleType articleType) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(articleType);
		session.flush();

	}

	@Override
	public List<ArticleType> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<ArticleType> articleTypeList = null;
		try {
			String sql = " SELECT * FROM article_type ORDER BY article_type_id ASC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			articleTypeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleTypeList;
	}

	@Override
	public ArticleType findByArticleTypeId(int articleTypeId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		ArticleType articleType = null;
		try {
			articleType = (ArticleType) session.get(ArticleType.class, articleTypeId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return articleType;
	}

	@Override
	public boolean checkExistByName(String name) throws Exception {
		ArticleType articleType = null;
		articleType = (ArticleType) sessionFactory.getCurrentSession()
				.createQuery("from ArticleType where name = :name").setString("name", name).uniqueResult();

		if (articleType != null) {
			return true;
		} else {
			return false;
		}

	}

}
