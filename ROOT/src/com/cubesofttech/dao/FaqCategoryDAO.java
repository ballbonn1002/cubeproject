package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.FAQCategory;

public interface FaqCategoryDAO {
	public void save(FAQCategory faq_category) throws Exception;
	public void update(FAQCategory faq_category) throws Exception;
	public void delete(FAQCategory faq_category) throws Exception;
	public List<FAQCategory> findAll() throws Exception;
	public boolean checkExistByName(String faq_cat_name) throws Exception;
	public Integer findIdByName(String faq_cat_name) throws Exception;
	public FAQCategory findById(Integer faq_cat_id) throws Exception;
}
