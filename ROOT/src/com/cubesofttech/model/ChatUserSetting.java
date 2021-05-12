package com.cubesofttech.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chat_user_setting")
public class ChatUserSetting {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "chat_user_setting_id")
	private int chat_user_setting_id;
	
	@Column(name = "user_id")
	private String user_id;
	
	@Column(name = "chat_load_limit")
	private String chat_load_limit;

	public int getChat_user_setting_id() {
		return chat_user_setting_id;
	}

	public void setChat_user_setting_id(int chat_user_setting_id) {
		this.chat_user_setting_id = chat_user_setting_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getChat_load_limit() {
		return chat_load_limit;
	}

	public void setChat_load_limit(String chat_load_limit) {
		this.chat_load_limit = chat_load_limit;
	}
	
	
}
