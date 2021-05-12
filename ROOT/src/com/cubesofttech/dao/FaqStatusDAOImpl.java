package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FAQStatus;

@Repository
public class FaqStatusDAOImpl implements FaqStatusDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(FAQStatus faq_status) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.save(faq_status);
		session.flush();
		
	}

	@Override
	public void update(FAQStatus faq_status) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(faq_status);
		session.flush();
		
	}

	@Override
	public void delete(FAQStatus faq_status) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(faq_status);
		session.flush();
		
	}

	@Override
	public List<FAQStatus> findAll() throws Exception {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();

		List<FAQStatus> faqStatus = null;
		
		try {
			String sql = "SELECT * FROM faq_status;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqStatus = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return faqStatus;
	}

	@Override
	public boolean checkExistByName(String faq_status_name) throws Exception {
		// TODO Auto-generated method stub
		
		FAQStatus faqStatus = null;
		faqStatus = (FAQStatus) sessionFactory.getCurrentSession()
		.createQuery("from FAQStatus where faq_status_name = :faq_status_name").setString("faq_status_name", faq_status_name)
		.uniqueResult();
		
		if (faqStatus != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Integer findIdByName(String faq_status_name) throws Exception {
		// TODO Auto-generated method stub
		FAQStatus faqStatus = null;
		faqStatus = (FAQStatus) sessionFactory.getCurrentSession()
		.createQuery("from FAQStatus where faq_status_name = :faq_status_name").setString("faq_status_name", faq_status_name)
		.uniqueResult();
		
		
		return faqStatus.getFaq_status_id();
	}

	@Override
	public FAQStatus findById(Integer faq_status_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		FAQStatus faqStatus = (FAQStatus) session.get(FAQStatus.class, faq_status_id);
		
		return faqStatus;
	}

}
