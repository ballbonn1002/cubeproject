package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.FAQStatus;


public interface FaqStatusDAO {
	
	public void save(FAQStatus faq_status) throws Exception;
	public void update(FAQStatus faq_status) throws Exception;
	public void delete(FAQStatus faq_status) throws Exception;
	public List<FAQStatus> findAll() throws Exception;
	public boolean checkExistByName(String faq_status_name) throws Exception;
	public Integer findIdByName(String faq_status_name) throws Exception;
	public FAQStatus findById(Integer faq_status_id) throws Exception;

}
