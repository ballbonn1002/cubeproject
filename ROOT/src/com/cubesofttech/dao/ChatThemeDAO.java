package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.ChatTheme;

public interface ChatThemeDAO {
	public void save(ChatTheme ChatTheme) throws Exception;
	public void update(ChatTheme ChatTheme) throws Exception;
	public void delete(ChatTheme ChatTheme) throws Exception;
	public List<Map<String, Object>> Find_theme(String Userid) throws Exception;
	public void Update_theme(String Userid,String themeid) throws Exception;
}
