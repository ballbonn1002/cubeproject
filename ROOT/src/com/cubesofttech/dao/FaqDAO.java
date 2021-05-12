package com.cubesofttech.dao;


import java.util.List;
import java.util.Map;

import com.cubesofttech.model.FAQ;

public interface FaqDAO {
	public void save(FAQ faq) throws Exception;
	public void update(FAQ faq) throws Exception;
	public void delete(FAQ faq) throws Exception;
	public List<Map<String, Object>> findAll() throws Exception;
	public FAQ findById(Integer faq_id) throws Exception;
	public List<Map<String, Object>> findByIdJoinCategory(Integer faq_id) throws Exception;


}
