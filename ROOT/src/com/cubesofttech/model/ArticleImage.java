package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "article_image")
@NamedQueries({ @NamedQuery(name = "ArticleImage.findAll", query = "SELECT t FROM ArticleImage t") })
public class ArticleImage implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "atc_img_id")
	private Integer atc_img_id;
	
	@Column(name = "atc_user_id")
	private String atc_user_id;
	
	@Column(name = "atc_img_name")
	private String atc_img_name;
	
	@Column(name = "atc_img_type")
	private String atc_img_type;
	
	@Column(name = "atc_img_size")
	private String atc_img_size;
	
	@Column(name = "atc_img_path")
	private String atc_img_path;
	
	@Column(name = "atc_time_upload")
	private Timestamp atc_time_upload;
	
	public ArticleImage() {
		
	}

	public ArticleImage(Integer atc_img_id, String atc_user_id, String atc_img_name, String atc_img_type,
			String atc_img_size, String atc_img_path, Timestamp atc_time_upload) {
		super();
		this.atc_img_id = atc_img_id;
		this.atc_user_id = atc_user_id;
		this.atc_img_name = atc_img_name;
		this.atc_img_type = atc_img_type;
		this.atc_img_size = atc_img_size;
		this.atc_img_path = atc_img_path;
		this.atc_time_upload = atc_time_upload;
	}

	public Integer getAtc_img_id() {
		return atc_img_id;
	}

	public void setAtc_img_id(Integer atc_img_id) {
		this.atc_img_id = atc_img_id;
	}

	public String getAtc_user_id() {
		return atc_user_id;
	}

	public void setAtc_user_id(String atc_user_id) {
		this.atc_user_id = atc_user_id;
	}

	public String getAtc_img_name() {
		return atc_img_name;
	}

	public void setAtc_img_name(String atc_img_name) {
		this.atc_img_name = atc_img_name;
	}

	public String getAtc_img_type() {
		return atc_img_type;
	}

	public void setAtc_img_type(String atc_img_type) {
		this.atc_img_type = atc_img_type;
	}

	public String getAtc_img_size() {
		return atc_img_size;
	}

	public void setAtc_img_size(String atc_img_size) {
		this.atc_img_size = atc_img_size;
	}

	public String getAtc_img_path() {
		return atc_img_path;
	}

	public void setAtc_img_path(String atc_img_path) {
		this.atc_img_path = atc_img_path;
	}

	public Timestamp getAtc_time_upload() {
		return atc_time_upload;
	}

	public void setAtc_time_upload(Timestamp atc_time_upload) {
		this.atc_time_upload = atc_time_upload;
	}
	
	

}
