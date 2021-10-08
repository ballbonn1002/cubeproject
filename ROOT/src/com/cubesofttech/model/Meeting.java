package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.sql.Date;
import java.sql.Time;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "meeting")
public class Meeting implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idmeeting")
	private int idmeeting;
	@Column(name = "time_start")
	private Time time_start;
	@Column(name = "time_end")
	private Time time_end;
	@Column(name = "date")
	private java.util.Date date;
	@Column(name = "user_reserve")
	private String user_reserve;
	@Column(name = "idroom")
	private Integer idroom;
	
	public int getIdmeeting() {
		return idmeeting;
	}
	public void setIdmeeting(int idmeeting) {
		this.idmeeting = idmeeting;
	}
	public Time getTime_start() {
		return time_start;
	}
	public void setTime_start(Time time_start) {
		this.time_start = time_start;
	}
	public Time getTime_end() {
		return time_end;
	}
	public void setTime_end(Time time_end) {
		this.time_end = time_end;
	}
	public java.util.Date getDate() {
		return date;
	}
	public void setDate(java.util.Date date) {
		this.date = date;
	}
	public String getUser_reserve() {
		return user_reserve;
	}
	public void setUser_reserve(String user_reserve) {
		this.user_reserve = user_reserve;
	}
	public Integer getIdroom() {
		return idroom;
	}
	public void setIdroom(Integer idroom) {
		this.idroom = idroom;
	}
	
	
}
