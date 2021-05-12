package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FAQ;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(FAQ faq) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(faq);
		session.flush();

	}

	@Override
	public void update(FAQ faq) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(faq);
		session.flush();

	}

	@Override
	public void delete(FAQ faq) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(faq);
		session.flush();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT f1.faq_id, f1.topic, f1.details, f1.author, f1.time_posted, f1.faq_cat_id, "
					+ "f1.faq_status_id, f2.faq_cat_name, f3.faq_status_name "
					+ "FROM faq f1 " + "INNER JOIN faq_category f2 " + "ON f1.faq_cat_id = f2.faq_cat_id "
					+ "INNER JOIN faq_status f3 " + "ON f1.faq_status_id = f3.faq_status_id;";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	
	@Override
	public List<Map<String, Object>> findByIdJoinCategory(Integer faq_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqs = null;
		try {
			String sql = "SELECT f1.faq_id, f1.topic, f1.details, f1.author, f1.time_posted, f1.faq_cat_id,"
					+ " f1.daq_status_id, f2.faq_cat_name f3.faq_status_name "
					+ "FROM faq f1 " + "INNER JOIN faq_category f2 " + "ON f1.faq_cat_id = f2.faq_cat_id" 
					+ " INNER JOIN faq_status f3 " + "ON f1.faq_status_id = f3.faq_status_id"
					+" WHERE f1.faq_id = " + faq_id + ";";
			//System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqs = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqs;

	}

	@Override
	public FAQ findById(Integer faq_id) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		FAQ faqs = (FAQ) session.get(FAQ.class, faq_id);

		return faqs;
	}

	
	
}
