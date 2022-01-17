package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Holiday;
import com.cubesofttech.model.Project;
import com.cubesofttech.model.ProjectFunction;

@Repository
public class ProjectFunctionDAOImpl implements ProjectFunctionDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(ProjectFunction projectFunction) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(projectFunction);
		session.flush();

	}

	@Override
	public void update(ProjectFunction projectFunction) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(projectFunction);
		session.flush();

	}

	@Override
	public void delete(ProjectFunction projectFunction) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(projectFunction);
		session.flush();

	}

	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		return sessionFactory.getCurrentSession().createQuery("from ProjectFunction").list();
	}

	@Override
	public ProjectFunction findById(Integer function_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		ProjectFunction projectFunction = session.get(ProjectFunction.class, function_id);
		return projectFunction;
	}

	@Override
	public List<ProjectFunction> findByProject(Integer project_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<ProjectFunction> projectFunctions = null;
		try {
			String sql = "SELECT f.function_id, f.function_name, f.status, f.project_id, "
					+ "f.user_create, f.time_create, f.user_update, f.time_update, " + "p.project_name, p.description "
					+ "from project_function f " + "LEFT JOIN project p " + "ON f.project_id = p.project_id "
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
	public boolean checkExistByName(String function_name) throws Exception {
		ProjectFunction projectFunction = null;
		projectFunction = (ProjectFunction) sessionFactory.getCurrentSession()
				.createQuery("from ProjectFunction where function_name = :function_name").setString("function_name", function_name).setMaxResults(1)
				.uniqueResult();
		return projectFunction != null;

	}

	@Override
	public void deleteByProject(Integer project_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		try {
			String sql = "DELETE f from project_function f LEFT JOIN project p on f.project_id = p.project_id "
					+ "WHERE f.project_id = " + project_id + ";";
			SQLQuery query = session.createSQLQuery(sql);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<ProjectFunction> findFunction(Integer findpfunc) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<ProjectFunction> functions = null;
		try {
			String sql = "SELECT * from project_function WHERE STATUS = '1' AND project_id = " + findpfunc;
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(ProjectFunction.class);
			
			functions = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return functions;
	}

	@Override
	public ProjectFunction findByName(String functionName) throws Exception {
		ProjectFunction projectFunction = null;
		projectFunction = (ProjectFunction) sessionFactory.getCurrentSession()
				.createQuery("from ProjectFunction where function_name = :functionName").setString("functionName", functionName)
				.uniqueResult();
		return projectFunction;
	}
}
