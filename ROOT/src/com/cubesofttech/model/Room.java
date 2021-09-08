package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;

@Entity
@Table(name = "room")
public class Room implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idroom")
	private int idroom;
	@Column(name = "room_name")
	private String room_name;
	@Column(name = "user_create")
	private String user_create;
	@Column(name = "user_update")
	private String user_update;
	@Column(name = "time_create")
	private Timestamp time_create;
	@Column(name = "time_update")
	private Timestamp time_update;
	
	public int getIdroom() {
		return idroom;
	}
	public void setIdroom(int idroom) {
		this.idroom = idroom;
	}
	public String getRoom_name() {
		return room_name;
	}
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	public Timestamp getTime_create() {
		return time_create;
	}
	public void setTime_create(Timestamp time_create) {
		this.time_create = time_create;
	}
	public Timestamp getTime_update() {
		return time_update;
	}
	public void setTime_update(Timestamp time_update) {
		this.time_update = time_update;
	}
	
}
