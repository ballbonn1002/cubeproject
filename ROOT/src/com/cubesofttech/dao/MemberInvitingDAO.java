package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.MemberInviting;

public interface MemberInvitingDAO {
	public MemberInviting findById(Integer idinviting) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;
	public List<Map<String, Object>> findAll2(Integer idmeeting) throws Exception;
	public List<Map<String, Object>> findmember(String member) throws Exception;
	public List<Map<String, Object>> findmemberId(Integer idmeeting) throws Exception;
	public void save(MemberInviting inviting) throws Exception;

	public void update(MemberInviting inviting) throws Exception;

	public void delete(MemberInviting inviting) throws Exception;
}