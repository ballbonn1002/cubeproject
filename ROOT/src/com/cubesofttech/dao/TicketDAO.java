package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Ticket;

public interface TicketDAO {
	public void save(Ticket ticket) throws Exception;
	public void update(Ticket ticket) throws Exception;
	public void delete(Ticket ticket) throws Exception;
	public List<Map<String, Object>> findAll() throws Exception;
	public Ticket findById(Integer ticket_id) throws Exception;
	public List<Map<String, Object>> findByIdJoinStatus(Integer ticket_id) throws Exception;
}
