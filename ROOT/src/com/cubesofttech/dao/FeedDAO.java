package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;


import com.cubesofttech.model.FeedNews;
import com.cubesofttech.model.FeedNewsLike;
import com.google.gson.JsonElement;


public interface FeedDAO {
	public void savefeed(FeedNews feed) throws Exception;
	public void updatepost(FeedNews feed) throws Exception;
	public void deletepost(FeedNews feed) throws Exception;
	
	public FeedNews findById(Integer id) throws Exception;
	public FeedNewsLike findByIdLike(Integer id) throws Exception;
	
	public List<Map<String, Object>> userpath(String user_id) throws Exception;
	public List<Map<String, Object>> findAlldetail(Integer limits) throws Exception;
	public List<Map<String, Object>> findAll() throws Exception;
	public void savelike(FeedNewsLike like) throws Exception;
	public List<Map<String, Object>> findByIdFeed(Integer idInt,String logonUser) throws Exception;
	public List<Map<String, Object>> findAllLike(String feed_id, String type) throws Exception;
	public List<Map<String, Object>> findAllLike(String feed_id) throws Exception;
	public void deletelike(FeedNewsLike like) throws Exception;
	public List<Map<String, Object>> findIdLike(String user, int idInt)throws Exception;
	public void updatelike(FeedNewsLike like) throws Exception;
	public List<Map<String, Object>> LikeRuam(String feedid)throws Exception;
}

