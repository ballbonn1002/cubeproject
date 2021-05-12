package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.FeedPostBackground;

public interface FeedpostbackgroundDAO {
	public void save(FeedPostBackground FeedBackground) throws Exception;
	public void update(FeedPostBackground  FeedBackground) throws Exception;
	public void delete(FeedPostBackground  FeedBackground) throws Exception;
	public List<Map<String,Object>> GetAllPostBackground () throws Exception;
	public void deletebyid(String backgroundid)throws Exception; 
	public void SetUse(String bacgroundid) throws Exception;
	public List<Map<String,Object>> GetPostBackgroundById(String background_id) throws Exception;
}
