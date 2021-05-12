package com.cubesofttech.dao;

import java.util.List;

import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.ArticleImage;

@Repository
public class ArticleImageDAOImpl implements ArticleImageDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(ArticleImage articleImage) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(articleImage);
		session.flush();

	}

	@Override
	public void update(ArticleImage articleImage) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(articleImage);
		session.flush();

	}

	@Override
	public void delete(ArticleImage articleImage) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(articleImage);
		session.flush();

	}

	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArticleImage findById(Integer atc_img_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		ArticleImage articleImage = (ArticleImage) session.get(ArticleImage.class, atc_img_id);
		return articleImage;
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer atc_image_maxID = null;

		try {
			Criteria criteria = session.createCriteria(ArticleImage.class).setProjection(Projections.max("atc_img_id"));
			atc_image_maxID = (Integer) criteria.uniqueResult();

			// Log.debug("maxID: " + atc_image_maxID);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (atc_image_maxID != null) {
			return atc_image_maxID;
		} else {
			return new Integer(1);
		}

	}

	@Override
	public void deleteByPath(String path) throws Exception {
		// Select id from path
		ArticleImage articleImage = (ArticleImage) sessionFactory.getCurrentSession()
				.createQuery("from ArticleImage where atc_img_path = :path").setString("path", path).uniqueResult();

		// System.out.println("DELETE ID: " + faqImgs.getFaq_img_id());
		delete(articleImage);

	}

}
