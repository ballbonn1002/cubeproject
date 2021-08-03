//package com.cubesofttech.dao;
//
//import java.util.List;
//import java.util.Map;
//
//import com.cubesofttech.model.Training;
//
//public interface TrainingDAO {
//	public Training findById(int id) throws Exception;
//
//	public List<Map<String, Object>> findAll() throws Exception;
//
//	public void save(Training train) throws Exception;
//
//	public void update(Training train) throws Exception;
//
//	public void delete(Training train) throws Exception;
//
//	public List<Training> searchBycolumn(String column, String keyword) throws Exception;
//}

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
}
