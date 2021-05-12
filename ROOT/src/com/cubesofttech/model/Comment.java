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
@Table(name = "comment")
public class Comment implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "comment_id")
	private Integer comment_id;

	@Column(name = "details")
	private String details;

	@Column(name = "feed_id")
	private Integer feed_id;

	@Column(name = "time_comment")
	private Timestamp time_comment;

	@Column(name = "time_updated_comment")
	private Timestamp time_updated_comment;
	
	@Column(name = "user_comment")
	private String user_comment;
	
	@Column(name = "sticker_part")
	private String sticker_part;
	
	@Column(name = "commentImage_path")
	private String commentImage_path;
	
	

	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	public Comment(String details, Integer feed_id, Timestamp time_comment, Timestamp time_updated_comment,String user_comment) {
		super();
//		this.feed_id = feed_id;
		this.details = details;
		this.feed_id = feed_id;
		this.time_comment = time_comment;
		this.time_updated_comment = time_updated_comment;
		this.user_comment=user_comment;
	}

	public Integer getComment_id() {
		return comment_id;
	}

	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Integer getFeed_id() {
		return feed_id;
	}

	public void setFeed_id(Integer feed_id) {
		this.feed_id = feed_id;
	}

	public Timestamp getTime_comment() {
		return time_comment;
	}

	public void setTime_comment(Timestamp time_comment) {
		this.time_comment = time_comment;
	}

	public Timestamp getTime_updated_comment() {
		return time_updated_comment;
	}

	public void setTime_updated_comment(Timestamp time_updated_comment) {
		this.time_updated_comment = time_updated_comment;
	}
	
	public String getUser_comment() {
		return user_comment;
	}

	public void setUser_comment(String user_comment) {
		this.user_comment = user_comment;
	}

	public String getSticker_part() {
		return sticker_part;
	}

	public void setSticker_part(String sticker_part) {
		this.sticker_part = sticker_part;
	}

	public String getCommentImage_path() {
		return commentImage_path;
	}

	public void setCommentImage_path(String commentImage_path) {
		this.commentImage_path = commentImage_path;
	}
	
}
