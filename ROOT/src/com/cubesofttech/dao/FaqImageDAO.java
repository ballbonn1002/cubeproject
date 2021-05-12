package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.FaqImage;

public interface FaqImageDAO {
	
	public void save(FaqImage faqImage) throws Exception;

	public void update(FaqImage faqImage) throws Exception;

	public void delete(FaqImage faqImage) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;

	public FaqImage findById(Integer faq_img_id) throws Exception;
	
	public Integer getMaxId() throws Exception;
	
	public void deleteByPath(String path) throws Exception;
}
