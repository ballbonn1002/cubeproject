package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Approver;
import com.cubesofttech.model.User;
import com.google.gson.JsonElement;

public interface ApproverDAO {

	public void save(Approver approver) throws Exception;

	public List<Approver> findAll() throws Exception;

	public void update(Approver approver) throws Exception;

	public void delete(Approver approver) throws Exception;

	public List<Approver> search(String id) throws Exception;

	public List<Map<String, Object>> findApprover() throws Exception;
	
	public String apprListJSON();
	
	public Integer getMaxId() throws Exception;

	List<Map<String, Object>> findApproverById(String id) throws Exception;

	String apprListById(String id);

	Approver findById(Integer id) throws Exception;

	public void deleteApprByRow(String userID, Integer row);

	Approver findByRow(Integer row) throws Exception;

	public void findApprById(String user,String appr_id,String name, Integer row,Integer col) throws Exception;

	void deleteById(String userId, Integer row, Integer col) throws Exception;

	void deleteByRow(String userId, Integer row) throws Exception;

	void UpdateByRow(String userId, Integer row) throws Exception;



	

	


	
			
}