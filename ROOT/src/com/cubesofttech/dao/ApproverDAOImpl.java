package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Approver;
import com.cubesofttech.model.Borrow;
import com.cubesofttech.model.Leaves;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;


@Repository
public class ApproverDAOImpl implements ApproverDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Approver approver) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(approver);
		session.flush();
		// session.close();
		
	}

	@Override
	public List<Approver> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Approver> apprList = null;
		try {
			String sql = " SELECT * FROM approver ORDER BY id DESC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			apprList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return apprList;
	}

	@Override
	public void update(Approver approver) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(approver);
		session.flush();
		// session.close();
	}

	@Override
	public void delete(Approver approver) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(approver);
		session.flush();
		// session.close();
	}

	@Override
	public List<Approver> search(String id) throws Exception {
		return null;
	}

	@Override
	public List<Map<String, Object>> findApprover() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		try {

			String sql = "SELECT approver.appr_name, approver.status, approver.row, approver.appr_no FROM approver \n"
					+ "LEFT JOIN user ON user.id = approver.user_id \n"
					+ "GROUP BY approver.appr_name \n" 
					+ "ORDER BY approver.row,approver.appr_no \n";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public String apprListJSON() {
		Session session = this.sessionFactory.getCurrentSession();
		String result = null;
		List<Map<String,String>> list = null;
		try {
			String hql = "SELECT new map (a.userId as userId, a.apprId as apprId, a.apprName as apprName, a.row as row, a.apprNo as apprNo) FROM Approver a \n"
					+ "ORDER BY a.userId, a.row, a.apprNo \n";
			list = session.createQuery(hql).list();
			result = new Gson().toJson(list);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Approver> list = null;
		Integer maxId;

		try {

			Criteria criteria = session.createCriteria(Approver.class).setProjection(Projections.max("id"));
			maxId = (Integer) criteria.uniqueResult();
			
			if(maxId == null){
				maxId = 0;	
			}
			else{
				return maxId;	
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new Integer(0);

		} finally {

		}
		if (maxId != null) {
			return maxId;
		} else{
			return new Integer(0);
		}
	
	}
	
	@Override
	public String apprListById(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		String result = null;
		List<Map<String,String>> list = null;
		try {
			String hql = "SELECT new map (a.id as id, a.apprId as apprId, a.apprName as apprName, a.row as row, a.apprNo as apprNo) FROM Approver a WHERE a.userId = '"+id+"' ORDER BY row ,appr_no ASC";
			list = session.createQuery(hql).list();
			result = new Gson().toJson(list);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return result;
	}
@Override
	public List<Map<String, Object>> findApproverById(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		//String user = request.getParameter("user");
		try {

			String sql = "SELECT id, appr_id as apprId, appr_name as apprName,row , appr_no as apprNo FROM Approver WHERE user_Id = '"+id+"' ORDER BY row ,appr_no ASC";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

@Override
public Approver findById(Integer id) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	Approver Approver = null;
	try {
		Approver = (Approver) session.get(Approver.class, id);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		// session.close();
	}
	return Approver;
}
@Override
public void deleteApprByRow(String userID,Integer row) {
	Session session = this.sessionFactory.getCurrentSession();
	String result = null;
	List<Approver> apprList = null;
	try {
//		String sql = "DELETE FROM approver WHERE user_id = '"+userID+"' AND row ='"+row+"'";
//		SQLQuery query = session.createSQLQuery(sql);
//		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
//		//apprList = query.list();
		Approver approver = new Approver();
		approver.setUserId(userID);
		approver.setRow(row);
		session.delete(approver);
		session.flush();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

@Override
public Approver findByRow(Integer row) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	Approver Approver = null;
	try {
		Approver = (Approver) session.get(Approver.class, row);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		// session.close();
	}
	return Approver;
}
@Override
public void findApprById(String user,String appr_id,String name , Integer row,Integer col) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	List<Map<String, Object>> list = null;
	//String user = request.getParameter("user");
	try {

		String sql = "UPDATE Approver SET appr_id = '"+appr_id+"',appr_name = '"+name+"' WHERE user_id = '"+user+"' AND row = '"+row+"' AND appr_no = '"+col+"'";
		System.out.println("KKKKKKKKK"+row+"   "+col);
		SQLQuery query = session.createSQLQuery(sql);
		//query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		query.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
@Override
public void deleteById(String userId,Integer row, Integer col) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	List<Map<String, Object>> list = null;
	//String user = request.getParameter("user");
	try {

		String sql = "DELETE FROM approver WHERE user_id='"+userId+"' AND row = '"+row+"' AND appr_no= '"+col+"'";
		System.out.println("Delete"+row+"   "+col);
		SQLQuery query = session.createSQLQuery(sql);
		//query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		query.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
	
	@Override
	public void UpdateByRow(String userId,Integer row) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		//String user = request.getParameter("user");
		try {
			System.out.println("fffff"+row+"   "+row);
			String sql = "UPDATE approver SET row = '"+(row-1)+"' WHERE user_id='"+userId+"' AND row='"+row+"'";
			System.out.println("Update "+userId+"   "+row);
			SQLQuery query = session.createSQLQuery(sql);
			//query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
}
	@Override
	public void deleteByRow(String userId,Integer row) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		//String user = request.getParameter("user");
		try {
			String sql = "DELETE FROM approver WHERE user_id='"+userId+"' AND row = '"+row+"'";
			System.out.println("Delete "+userId+"   "+row);
			SQLQuery query = session.createSQLQuery(sql);
			//query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
}



}