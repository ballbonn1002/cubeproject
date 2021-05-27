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
import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.Salary_user;
import com.cubesofttech.model.Timesheet;
@Repository
public class SalaryUserDAOImpl implements SalaryUserDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Salary_user> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Salary_user> Salary_user = null;
		try {
			String sql = "SELECT * FROM salary_user";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Salary_user = query.list();
		} catch (Exception e) {

		}
		return Salary_user;

	}
	@Override
	public void save(Salary_user salary_user) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(salary_user);
		session.flush();

	}

	@Override
	public void update(Salary_user salary_user) throws Exception {
	
		Session session = this.sessionFactory.getCurrentSession();
		session.update(salary_user);
		session.flush();

	}

	@Override
	public void delete(Salary_user salary_user) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		session.delete(salary_user);
		session.flush();

	}

	@Override
	public Salary_user findById(Integer id) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		Salary_user salary_user = (Salary_user) session.get(Salary_user.class, id);

		return salary_user;
	}
	@Override
	public List<Map<String, Object>> findAll2() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT  user.*,job_site.name_site FROM user LEFT JOIN job_site ON user.id_sitejob = job_site.id_sitejob";

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
	public List<Map<String, Object>> findAll3() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM salary_user";

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
	public List<Map<String, Object>> findAllbyid(Integer id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM job_site WHERE id_sitejob =:id ";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	@Override
	public List<Map<String, Object>> findUser() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> users = null;
		try {
			String sql = "SELECT USER FROM salary_user";
			
			SQLQuery query = session.createSQLQuery(sql);
			
			
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			users = query.list();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return users;
	}
	
	
}
