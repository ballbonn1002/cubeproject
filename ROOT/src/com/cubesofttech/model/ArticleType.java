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
@Table(name = "article_type")
@NamedQueries({ @NamedQuery(name = "ArticleType.findAll", query = "SELECT t FROM ArticleType t") })
public class ArticleType implements Serializable {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "article_type_id")
	private Integer articleTypeId;

	@Column(name = "name")
	private String articleTypeName;

	@Column(name = "description")
	private String articleTypeDescription;

	@Column(name = "user_create")
	private String userCreate;

	@Column(name = "time_create")
	private java.sql.Timestamp timeCreate;

	@Column(name = "user_update")
	private String userUpdate;

	@Column(name = "time_update")
	private java.sql.Timestamp timeUpdate;
	
	public ArticleType() {
		
	}
	public ArticleType(Integer articleTypeId, String articleTypeName, String articleTypeDescription, String userCreate,
			Timestamp timeCreate, String userUpdate, Timestamp timeUpdate) {
		super();
		this.articleTypeId = articleTypeId;
		this.articleTypeName = articleTypeName;
		this.articleTypeDescription = articleTypeDescription;
		this.userCreate = userCreate;
		this.timeCreate = timeCreate;
		this.userUpdate = userUpdate;
		this.timeUpdate = timeUpdate;
	}
	public Integer getArticleTypeId() {
		return articleTypeId;
	}
	public void setArticleTypeId(Integer articleTypeId) {
		this.articleTypeId = articleTypeId;
	}
	public String getArticleTypeName() {
		return articleTypeName;
	}
	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}
	public String getArticleTypeDescription() {
		return articleTypeDescription;
	}
	public void setArticleTypeDescription(String articleTypeDescription) {
		this.articleTypeDescription = articleTypeDescription;
	}
	public String getUserCreate() {
		return userCreate;
	}
	public void setUserCreate(String userCreate) {
		this.userCreate = userCreate;
	}
	public java.sql.Timestamp getTimeCreate() {
		return timeCreate;
	}
	public void setTimeCreate(java.sql.Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}
	public String getUserUpdate() {
		return userUpdate;
	}
	public void setUserUpdate(String userUpdate) {
		this.userUpdate = userUpdate;
	}
	public java.sql.Timestamp getTimeUpdate() {
		return timeUpdate;
	}
	public void setTimeUpdate(java.sql.Timestamp timeUpdate) {
		this.timeUpdate = timeUpdate;
	}
	





	
	
}
