package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.TicketStatus;

public interface TicketStatusDAO {
	public void save(TicketStatus ticket_status) throws Exception;

	public void update(TicketStatus ticket_status) throws Exception;

	public void delete(TicketStatus ticket_status) throws Exception;

	public List<TicketStatus> findAll() throws Exception;

	public boolean checkExistByName(String ticket_status_name) throws Exception;

	public Integer findIdByName(String ticket_status_name) throws Exception;

	public TicketStatus findById(Integer ticket_status_id) throws Exception;
}
