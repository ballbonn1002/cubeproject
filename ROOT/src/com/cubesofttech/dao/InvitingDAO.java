package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Inviting;

public interface InvitingDAO {
	public Inviting findById(Integer idinviting) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;

	public void save(Inviting inviting) throws Exception;

	public void update(Inviting inviting) throws Exception;

	public void delete(Inviting inviting) throws Exception;
}
