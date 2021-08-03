package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;


@Entity
@Table(name = "training")
public class Training implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "trainingid")
	private int trainingid;
	@Column(name = "hours")
	private Integer hours;
	@Column(name = "user_id")
	private String user_id;
	@Column(name = "title")
	private String title;
	@Column(name = "user_update")
	private String user_update;
	@Column(name = "user_create")
	private String user_create;
	@Column(name = "location")
	private String location;
	@Column(name = "lecturer")
	private String lecturer;
	@Column(name = "detail")
	private String detail;
	@Column(name = "start_date")
	private Date start_date;
	@Column(name = "end_date")
	private Date end_date;
	@Column(name = "time_update")
	private Timestamp time_update;
	@Column(name = "time_create")
	private Timestamp time_create;

	public Timestamp getTime_update() {
		return time_update;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public void setTime_update(Timestamp time_update) {
		this.time_update = time_update;
	}

	public Timestamp getTime_create() {
		return time_create;
	}

	public void setTime_create(Timestamp time_create) {
		this.time_create = time_create;
	}

	public int getTrainingid() {
		return trainingid;
	}

	public void setTrainingid(int trainingid) {
		this.trainingid = trainingid;
	}

	public Integer getHours() {
		return hours;
	}

	public void setHours(Integer hours) {
		this.hours = hours;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser_update() {
		return user_update;
	}

	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}

	public String getUser_create() {
		return user_create;
	}

	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLecturer() {
		return lecturer;
	}

	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	

	public Training() {
		// TODO Auto-generated constructor stub
	}

//	public Training(int id, String user_id, String title, int hours,
//			Date start_date, java.util.Date end_date, String user_update,
//			java.sql.Timestamp time_update, String user_create, java.sql.Timestamp time_create, String location,
//			String lecturer, String detail) {
//		this.id=id;
//		this.user_id=user_id;
//		this.title=title;
//		this.hours=hours;
//		this.start_date=start_date;
//		this.end_date=end_date;
//		this.user_update=user_update;
//		this.time_update=time_update;
//		this.user_create=user_create;
//		this.time_create=time_create;
//		this.location=location;
//		this.lecturer=lecturer;
//		this.detail=detail;
//	}

}
