package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Article;
import com.cubesofttech.model.Project;
import com.cubesofttech.model.ProjectFunction;

@Repository
public class ProjectDAOImpl implements ProjectDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Project project) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(project);
		session.flush();
	}

	@Override
	public void update(Project project) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(project);
		session.flush();
	}

	@Override
	public void delete(Project project) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(project);
		session.flush();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Project> findProjectAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Project> aa = null;
		try {
			String sql = " SELECT * FROM project ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			aa = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aa;
	}
	
	@Override
	public List<Map<String, Object>> findProjectAndFunctionAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Project findById(Integer project_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Project project = (Project) session.get(Project.class, project_id);
		return project;
	}

	@Override
	public List<Map<String, Object>> findFunctions(Integer project_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> projectFunctions = null;
		try {
			String sql = "SELECT f.function_id, f.function_name, f.status, f.project_id, "
					+ "f.user_create, f.time_create, f.user_update, f.time_update "
					+ "p.project_id, p.project_name, p.description, p.user_create "
					+ "from project_function f " + "INNER JOIN project p " + "ON f.project_id = p.project_id "
					+ "WHERE f.project_id = " + project_id + ";";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			projectFunctions = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return projectFunctions;
	}
	
	@Override
	public List<Map<String, Object>> allproject() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> projecta = null;
		try {
			String sql = "SELECT * from project WHERE STATUS = '1'";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			projecta = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return projecta;
	}
	
	@Override
	public List<Map<String, Object>> allfunction(String listId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> projecta = null;
		try {
			String sql = "SELECT * FROM project_function WHERE project_id=" + listId + "";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			projecta = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return projecta;
	}

	@Override
	public boolean checkExistByName(String projectName) {
		Project project = null;
		project = (Project) sessionFactory.getCurrentSession()
				.createQuery("from Project where project_name = :projectName").setString("projectName", projectName).setMaxResults(1)
				.uniqueResult();
		return project != null;
	}

	@Override
	public Project findByName(String projectName) {
		Project project = null;
		project = (Project) sessionFactory.getCurrentSession()
				.createQuery("from Project where project_name = :projectName").setString("projectName", projectName)
				.uniqueResult();
		return project;
	}
	
	@Override
	public List<Map<String, Object>> projectlist() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> projectlist = null;
		try {
			String sql = "SELECT f.function_id, f.function_name, f.status, f.project_id AS f_projectid, f.user_create, f.time_create, "
						+ "f.user_update, f.time_update, p.project_id AS p_projectid, p.project_name, p.description "
						+ "FROM `project_function` f LEFT JOIN `project` p ON f.project_id = p.project_id "
						+ "ORDER BY f.project_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			projectlist = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return projectlist;
	}
	
	@Override
	public List<Map<String, Object>> functionlist() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> functionlist = null;
		try {
			String sql = "SELECT * FROM `project_function` ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			functionlist = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return functionlist;
	}

}
