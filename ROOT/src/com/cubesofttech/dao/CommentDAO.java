package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Comment;
import com.cubesofttech.model.FeedNews;
import com.google.gson.JsonElement;

public interface CommentDAO {
	public void savecomment(Comment comment) throws Exception;
	public void deletecomment(Comment comment) throws Exception;
	public void updatecomment(Comment comment) throws Exception;
	public List<Map<String, Object>> findByIdFeed(Integer feed_id) throws Exception;
	public List<Map<String, Object>> findAllComment() throws Exception;
	public Comment findByIdComment(Integer id) throws Exception;
	public List<Map<String, Object>> topUserComment() throws Exception;
	public List<Map<String, Object>> topUserCommentById(Integer feed_id1) throws Exception;
	public List<Map<String, Object>> findWhereFeednewsId(Integer feed_idnew) throws Exception;
	
	
	

}
