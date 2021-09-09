package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.model.Inviting;

public class InvitingDAOImpl implements InvitingDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public Inviting findById(Integer idinviting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Inviting invite = (Inviting) session.get(Inviting.class, idinviting);
		return invite;
	}

	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM inviting";

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
	public List<Map<String, Object>> findAll2() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT inviting.idinvite, inviting.member, meeting.time_start, meeting.time_end FROM inviting INNER JOIN meeting ON inviting.idmeeting = meeting.idmeeting";

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
	public void save(Inviting inviting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(inviting);
		session.flush();
		
	}

	@Override
	public void update(Inviting inviting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(inviting);
		session.flush();
		
	}

	@Override
	public void delete(Inviting inviting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(inviting);
		session.flush();
	}

	

}
