package com.cubesofttech.dao;

import java.util.List;


import com.cubesofttech.model.Article;


public interface ArticleDAO {

	public List<Article> findAll() throws Exception;
	
	public Article findByArticleId(int articleId) throws Exception; 
	
	public List<Article> findAllNews() throws Exception;
	
	public List<Article> joinArticleMS() throws Exception;

	void update(Article article) throws Exception;

	void save(Article article) throws Exception;

	void delete(Article article) throws Exception;

	Integer getMaxId() throws Exception;

	List<Article> writers() throws Exception;

	List<Article> types() throws Exception;

	List<Article> tags() throws Exception;
}
