package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "ticket_status")
@NamedQueries({ @NamedQuery(name = "TicketStatus.findAll", query = "SELECT t FROM TicketStatus t") })
public class TicketStatus implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ticket_status_id")
	private Integer ticketStatusId;
	@Column(name = "ticket_status_name")
	private String ticketStatusName;
	
	
	public TicketStatus() {
	}

	public TicketStatus(Integer ticketStatusId, String ticketStatusName) {
		this.ticketStatusId = ticketStatusId;
		this.ticketStatusName = ticketStatusName;
	}

	public Integer getTicketStatusId() {
		return ticketStatusId;
	}

	public void setTicketStatusId(Integer ticketStatusId) {
		this.ticketStatusId = ticketStatusId;
	}

	public String getTicketStatusName() {
		return ticketStatusName;
	}

	public void setTicketStatusName(String ticketStatusName) {
		this.ticketStatusName = ticketStatusName;
	}
	
	
}
