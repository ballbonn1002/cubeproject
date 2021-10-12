package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.MemberInviting;
@Repository
public class MemberInvitingDAOImpl implements MemberInvitingDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public MemberInviting findById(Integer idinviting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		MemberInviting invite = (MemberInviting) session.get(MemberInviting.class, idinviting);
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
	public List<Map<String, Object>> findAll2(Integer idmeeting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM member_inviting  idmeeting ='"+idmeeting+"'";

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
	public List<Map<String, Object>> findmember(String member) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> Member = null;
		try {
			String sql = " SELECT member FROM member_inviting WHERE member = '"+member+"' ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Member",Member);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Member = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return Member;		
		
	}
	
	@Override
	public List<Map<String, Object>> findmemberId(Integer idmeeting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> idMeeting = null;
		try {
			String sql = " SELECT idmeeting FROM member_inviting WHERE  idmeeting = '"+idmeeting+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("idmeeting",idmeeting);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			idMeeting = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return idMeeting;		
		
	}
	
	

	@Override
	public void save(MemberInviting inviting) throws Exception {
		System.out.println("test");
		Session session = this.sessionFactory.getCurrentSession();
		session.save(inviting);
		session.flush();
		
	}

	@Override
	public void update(MemberInviting inviting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(inviting);
		session.flush();
		
	}

	@Override
	public void delete(MemberInviting inviting) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(inviting);
		session.flush();
	}

	

}
