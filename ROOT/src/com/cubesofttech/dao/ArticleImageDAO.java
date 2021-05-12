package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.ArticleImage;

public interface ArticleImageDAO {
	public void save(ArticleImage articleImage) throws Exception;

	public void update(ArticleImage articleImage) throws Exception;

	public void delete(ArticleImage articleImage) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;

	public ArticleImage findById(Integer atc_img_id) throws Exception;

	public Integer getMaxId() throws Exception;

	public void deleteByPath(String path) throws Exception;
}
