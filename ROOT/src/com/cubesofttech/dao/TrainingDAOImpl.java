package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;
import org.hibernate.HibernateException;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.Training;

@Repository
public class TrainingDAOImpl implements TrainingDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Training findById(Integer trainingid) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		Training train = (Training) session.get(Training.class, trainingid);

		return train;
	}

	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM training";

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
	public void save(Training train) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(train);
		session.flush();

	}

	@Override
	public void update(Training train) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(train);
		session.flush();

	}

	@Override
	public void delete(Training train) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(train);
		session.flush();

	}

	@Override
	public List<Training> searchBycolumn(String column, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> searchbydate (String userLogin, String start, String end) throws Exception {
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> searchbydate = null;
		try {
			String sql = "SELECT trainingid, time_create, user_id, title, DAY(`start_date`) AS Day, MONTH(`start_date`) AS Month, DAY(`end_date`) AS ENDDAY, MONTH(`end_date`) AS ENDMONTH, `hours` FROM training "
					+ "WHERE user_id='"+ userLogin + "'AND start_date='"+ start + "'AND end_date='" + end + "' ORDER BY DATE(`start_date`) ASC";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			searchbydate = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return searchbydate;
	}
}
