
package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Training;

public interface TrainingDAO {
	public Training findById(Integer trainingid) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;

	public void save(Training train) throws Exception;

	public void update(Training train) throws Exception;

	public void delete(Training train) throws Exception;

	public List<Training> searchBycolumn(String column, String keyword) throws Exception;
	

//	public Training searchbydate(String start, String end) throws Exception;

	public List<Map<String, Object>> searchbydate (String userLogin, String start, String end) throws Exception;
	public List<Map<String, Object>> searchbydate ( String start, String end) throws Exception;

	public List<Map<String, Object>> findAllById(String userid) throws Exception ;

}
