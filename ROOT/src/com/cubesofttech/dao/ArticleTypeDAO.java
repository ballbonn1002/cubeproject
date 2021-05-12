package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.ArticleType;


public interface ArticleTypeDAO {

	public List<ArticleType> findAll() throws Exception;

	public ArticleType findByArticleTypeId(int articleTypeId) throws Exception;

	public boolean checkExistByName(String faq_cat_name) throws Exception;

	public void save(ArticleType articleType) throws Exception;

	public void update(ArticleType articleType) throws Exception;

	public void delete(ArticleType articleType) throws Exception;


}
