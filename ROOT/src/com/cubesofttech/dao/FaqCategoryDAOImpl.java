package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.FAQCategory;
import com.cubesofttech.model.FaqImage;

@Repository
public class FaqCategoryDAOImpl implements FaqCategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(FAQCategory faq_category) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(faq_category);
		session.flush();

	}

	@Override
	public void update(FAQCategory faq_category) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(faq_category);
		session.flush();

	}

	@Override
	public void delete(FAQCategory faq_category) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(faq_category);
		session.flush();

	}

	@Override
	public List<FAQCategory> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<FAQCategory> faqCategory = null;
		try {
			String sql = "SELECT * FROM faq_category;";
			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqCategory = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqCategory;

	}

	@Override
	public Integer findIdByName(String faq_cat_name) throws Exception {
		FAQCategory faqCategory = null;
		faqCategory = (FAQCategory) sessionFactory.getCurrentSession()
				.createQuery("from FAQCategory where faq_cat_name = :faq_cat_name").setString("faq_cat_name", faq_cat_name)
				.uniqueResult();
		
		//System.out.println("MatchID: " + faqCategory.getFaq_cat_id());
		
		return faqCategory.getFaq_cat_id();
	}

	@Override
	public boolean checkExistByName(String faq_cat_name) throws Exception {
		FAQCategory faqCategory = null;
		faqCategory = (FAQCategory) sessionFactory.getCurrentSession()
				.createQuery("from FAQCategory where faq_cat_name = :faq_cat_name").setString("faq_cat_name", faq_cat_name)
				.uniqueResult();

		if (faqCategory != null) {
			return true;
		} else {
			return false;
		}

	}
	
	@Override
	public FAQCategory findById(Integer faq_cat_id) throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();
		FAQCategory faqCategory = (FAQCategory) session.get(FAQCategory.class, faq_cat_id);
		
		return faqCategory;
		
	}

}
