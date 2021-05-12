package com.cubesofttech.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chat_message")
public class Chat_message {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "Message_id")
	private int Message_id;
	
	@Column(name= "Sender_id")
	private String Sender_id;
	
	@Column(name= "Reciever_id")
	private String Reciever_id;
	
	@Column(name= "Date_time_Message")
	private Timestamp Date_time_Message;
	
	@Column(name= "Message_text")
	private String Message_text;
	
	@Column(name= "Sender_read_status")
	private String Sender_read_status;
	
	@Column(name= "Reciever_read_status")
	private String Reciever_read_status;
	
	@Column(name= "img_path")
	private String img_path;
	
	@Column(name = "img_message_status")
	private String img_message_status;
	
	@Column(name = "like_status")
	private String like_status;
	
	@Column(name = "file_path")
	private String file_path;
	
	@Column(name = "file_message_status")
	private String file_message_status;
	
	@Column(name = "file_name")
	private String file_name;
	
	@Column(name = "sticker_path")
	private String sticker_path;
	
	@Column(name = "sticker_status")
	private String sticker_status;
	
	
	
	public String getSticker_path() {
		return sticker_path;
	}

	public void setSticker_path(String sticker_path) {
		this.sticker_path = sticker_path;
	}

	public String getSticker_status() {
		return sticker_status;
	}

	public void setSticker_status(String sticker_status) {
		this.sticker_status = sticker_status;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_message_status() {
		return file_message_status;
	}

	public void setFile_message_status(String file_message_status) {
		this.file_message_status = file_message_status;
	}

	public String getLike_status() {
		return like_status;
	}

	public void setLike_status(String like_status) {
		this.like_status = like_status;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getImg_message_status() {
		return img_message_status;
	}

	public void setImg_message_status(String img_message_status) {
		this.img_message_status = img_message_status;
	}

	public int getMessage_id() {
		return Message_id;
	}

	public String getSender_read_status() {
		return Sender_read_status;
	}

	public void setSender_read_status(String sender_read_status) {
		Sender_read_status = sender_read_status;
	}

	public String getReciever_read_status() {
		return Reciever_read_status;
	}

	public void setReciever_read_status(String reciever_read_status) {
		Reciever_read_status = reciever_read_status;
	}

	public void setMessage_id(int message_id) {
		Message_id = message_id;
	}

	public String getSender_id() {
		return Sender_id;
	}

	public void setSender_id(String sender_id) {
		Sender_id = sender_id;
	}

	public String getReciever_id() {
		return Reciever_id;
	}

	public void setReciever_id(String reciever_id) {
		Reciever_id = reciever_id;
	}

	public Timestamp getDate_time_Message() {
		return Date_time_Message;
	}

	public void setDate_time_Message(Timestamp date_time_Message) {
		Date_time_Message = date_time_Message;
	}

	public String getMessage_text() {
		return Message_text;
	}

	public void setMessage_text(String message_text) {
		Message_text = message_text;
	}
}
