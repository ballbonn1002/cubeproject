package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "ticket")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Ticket implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ticket_id")
	@JsonProperty("ticket_id")
	private Integer ticketId;
	
	@Column(name="ticket_name")
	@JsonProperty("ticket_name")
	private String ticketName;
	
	@Column(name="user_create")
	@JsonProperty("user_create")
	private String userCreate;
	
	@Column(name="time_create")
	@JsonProperty("time_create")
	private Timestamp timeCreate;
	
	@Column(name="ticket_url")
	@JsonProperty("ticket_url")
	private String ticketURL;
	
	@Column(name="description")
	@JsonProperty("description")
	private String description;
	
	@Column(name="expected_result")
	@JsonProperty("expected_result")
	private String expectedResult;
	
	@Column(name="actual_result")
	@JsonProperty("actual_result")
	private String actualResult;
	
	@Column(name="file_id")
	@JsonProperty("file_id")
	private Integer fileId;
	
	@Column(name="ticket_status_id")
	@JsonProperty("ticket_status_id")
	private Integer ticketStatus_Id;
	
	@Column(name="user_assigned")
	@JsonProperty("user_assigned")
	private String userAssigned;
	
	@Column(name="time_assigned")
	@JsonProperty("time_assigned")
	private Timestamp timeAssigned;
	
	@Column(name="time_success")
	@JsonProperty("time_success")
	private Timestamp timeSuccess;
	
	public Ticket() {	}

	public Ticket(Integer ticketId, String ticketName, String userCreate, Timestamp timeCreate, String ticketURL,
			String description, String expectedResult, String actualResult, Integer fileId, Integer ticketStatus_Id) {
		this.ticketId = ticketId;
		this.ticketName = ticketName;
		this.userCreate = userCreate;
		this.timeCreate = timeCreate;
		this.ticketURL = ticketURL;
		this.description = description;
		this.expectedResult = expectedResult;
		this.actualResult = actualResult;
		this.fileId = fileId;
		this.ticketStatus_Id = ticketStatus_Id;
	}

	public Ticket(Integer ticketId, String ticketName, String userCreate, Timestamp timeCreate, String ticketURL,
			String description, String expectedResult, String actualResult, Integer fileId, Integer ticketStatus_Id,
			String userAssigned, Timestamp timeAssigned, Timestamp timeSuccess) {
		super();
		this.ticketId = ticketId;
		this.ticketName = ticketName;
		this.userCreate = userCreate;
		this.timeCreate = timeCreate;
		this.ticketURL = ticketURL;
		this.description = description;
		this.expectedResult = expectedResult;
		this.actualResult = actualResult;
		this.fileId = fileId;
		this.ticketStatus_Id = ticketStatus_Id;
		this.userAssigned = userAssigned;
		this.timeAssigned = timeAssigned;
		this.timeSuccess = timeSuccess;
	}

	public Integer getTicketId() {
		return ticketId;
	}

	public void setTicketId(Integer ticketId) {
		this.ticketId = ticketId;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}

	public String getUserCreate() {
		return userCreate;
	}

	public void setUserCreate(String userCreate) {
		this.userCreate = userCreate;
	}

	public Timestamp getTimeCreate() {
		return timeCreate;
	}

	public void setTimeCreate(Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public String getTicketURL() {
		return ticketURL;
	}

	public void setTicketURL(String ticketURL) {
		this.ticketURL = ticketURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExpectedResult() {
		return expectedResult;
	}

	public void setExpectedResult(String expectedResult) {
		this.expectedResult = expectedResult;
	}

	public String getActualResult() {
		return actualResult;
	}

	public void setActualResult(String actualResult) {
		this.actualResult = actualResult;
	}

	public Integer getFileId() {
		return fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public Integer getTicketStatus_Id() {
		return ticketStatus_Id;
	}

	public void setTicketStatus_Id(Integer ticketStatus_Id) {
		this.ticketStatus_Id = ticketStatus_Id;
	}

	public String getUserAssigned() {
		return userAssigned;
	}

	public void setUserAssigned(String userAssigned) {
		this.userAssigned = userAssigned;
	}

	public Timestamp getTimeAssigned() {
		return timeAssigned;
	}

	public void setTimeAssigned(Timestamp timeAssigned) {
		this.timeAssigned = timeAssigned;
	}

	public Timestamp getTimeSuccess() {
		return timeSuccess;
	}

	public void setTimeSuccess(Timestamp timeSuccess) {
		this.timeSuccess = timeSuccess;
	}
	
	
	
}
