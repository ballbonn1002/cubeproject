package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FaqImage;

@Repository
public class FaqImageDAOImpl implements FaqImageDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(FaqImage faqImage) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(faqImage);
		session.flush();

	}

	@Override
	public void update(FaqImage faqImage) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(faqImage);
		session.flush();

	}

	@Override
	public void delete(FaqImage faqImage) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(faqImage);
		session.flush();

	}

	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FaqImage findById(Integer faq_img_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		FaqImage faqImage = (FaqImage) session.get(FaqImage.class, faq_img_id);
		return faqImage;
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer faq_image_maxID = null;

		try {
			Criteria criteria = session.createCriteria(FaqImage.class).setProjection(Projections.max("faq_img_id"));
			faq_image_maxID = (Integer) criteria.uniqueResult();

			// Log.debug("maxID: " + faq_image_maxID);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (faq_image_maxID != null) {
			return faq_image_maxID;
		} else {
			return new Integer(1);
		}

	}

	@Override
	public void deleteByPath(String path) throws Exception {

		// Select id from path
		FaqImage faqImgs = (FaqImage) sessionFactory.getCurrentSession()
				.createQuery("from FaqImage where faq_img_path = :path").setString("path", path).uniqueResult();

		// System.out.println("DELETE ID: " + faqImgs.getFaq_img_id());
		delete(faqImgs);

	}

}
