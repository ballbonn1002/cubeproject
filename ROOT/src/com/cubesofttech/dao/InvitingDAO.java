package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Inviting;

public interface InvitingDAO {
	public Inviting findById(Integer idinviting) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;
	public List<Map<String, Object>> findAll2(Integer idmeeting) throws Exception;
	public List<Map<String, Object>> findmember(String member) throws Exception;
	public List<Map<String, Object>> findmemberId(String idmeeting) throws Exception;
	public void save(Inviting inviting) throws Exception;

	public void update(Inviting inviting) throws Exception;

	public void delete(Inviting inviting) throws Exception;
}