package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cubesofttech.model.Ticket;

@Repository
public class TicketDAOImpl implements TicketDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.save(ticket);
		session.flush();
	}

	@Override
	public void update(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(ticket);
		session.flush();
	}

	@Override
	public void delete(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(ticket);
		session.flush();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> tickets = null;
		try {
			String sql = "SELECT t1.ticket_id, t1.ticket_name, t1.user_create, t1.time_create, "
					+ "t1.ticket_url, t1.description, t1.expected_result, t1.actual_result, "
					+ "t1.file_id, t1.ticket_status_id, t1.user_assigned, t1.time_assigned, t1.time_success, "
					+ "t2.ticket_status_name"
					+ " FROM ticket t1" + " INNER JOIN ticket_status t2 " + "ON t1.ticket_status_id = t2.ticket_status_id;";
			
			System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			tickets = query.list();
			
		} catch (Exception e) {
			// Log.debug("Method findAll in [TicketDAOImpl] Error!");
			e.printStackTrace();
		}
		return tickets;
	}

	@Override
	public Ticket findById(Integer ticket_id) throws Exception {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		Ticket ticket = (Ticket) session.get(Ticket.class, ticket_id);

		return ticket;
	}

	@Override
	public List<Map<String, Object>> findByIdJoinStatus(Integer ticket_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> ticketsId = null;
		try {
			String sql = "SELECT t1.ticket_id, t1.ticket_name, t1.user_creat, t1.time_create, "
					+ "t1.ticket_url, t1.description, t1.expected_result, t1.actual_result, "
					+ "t1.file_id, t1.ticket_status_id, t1.user_assigned, t1.time_assigned, t1.time_success, "
					+ "t2.ticket_status_name"
					+ " FROM ticket t1" + "INNER JOIN ticket_status t2 " + "ON t1.ticket_status_id = t2.ticket_status_id"
					+" WHERE t1.ticket_id = " + ticket_id + ";";
			
			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ticketsId = query.list();
			
		} catch (Exception e) {
			// Log.debug("Method findAll in [TicketDAOImpl] Error!");
			e.printStackTrace();
		}
		return ticketsId;
	}

}
