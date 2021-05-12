package com.cubesofttech.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chat_theme")
public class ChatTheme {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "chat_theme_id")
	private int chat_theme_id;
	
	@Column(name = "Owner_chat_id")
	private String Owner_chat_id;
	
	@Column(name = "theme")
	private String theme;

	public int getChat_theme_id() {
		return chat_theme_id;
	}

	public void setChat_theme_id(int chat_theme_id) {
		this.chat_theme_id = chat_theme_id;
	}

	public String getOwner_chat_id() {
		return Owner_chat_id;
	}

	public void setOwner_chat_id(String owner_chat_id) {
		Owner_chat_id = owner_chat_id;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}
	
	
	
}
