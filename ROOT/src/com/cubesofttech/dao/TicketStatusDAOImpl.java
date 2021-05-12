package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FAQStatus;
import com.cubesofttech.model.TicketStatus;

@Repository
public class TicketStatusDAOImpl implements TicketStatusDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(TicketStatus ticket_status) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.save(ticket_status);
		session.flush();
		
	}

	@Override
	public void update(TicketStatus ticket_status) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(ticket_status);
		session.flush();
		
	}

	@Override
	public void delete(TicketStatus ticket_status) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(ticket_status);
		session.flush();
		
	}

	@Override
	public List<TicketStatus> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		
		List<TicketStatus> ticketStatus = null;
		
		try {
			String sql = "SELECT * FROM ticket_status;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			ticketStatus = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ticketStatus;
	}

	@Override
	public boolean checkExistByName(String ticket_status_name) throws Exception {
		// TODO Auto-generated method stub
		TicketStatus ticketStatus = null;
		ticketStatus = (TicketStatus) sessionFactory.getCurrentSession()
				.createQuery("from TicketStatus where ticket_status_name = :ticket_status_name").setString("ticket_status_name", ticket_status_name)
				.uniqueResult();
		if (ticket_status_name != null) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public Integer findIdByName(String ticket_status_name) throws Exception {
		// TODO Auto-generated method stub
		TicketStatus ticketStatus = null;
		ticketStatus = (TicketStatus) sessionFactory.getCurrentSession()
				.createQuery("from TicketStatus where ticket_status_name = :ticket_status_name").setString("ticket_status_name", ticket_status_name)
				.uniqueResult();
		
		return ticketStatus.getTicketStatusId();
	}

	@Override
	public TicketStatus findById(Integer ticket_status_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		TicketStatus ticketStatus = (TicketStatus) session.get(TicketStatus.class, ticket_status_id);
		return ticketStatus;
	}

}
