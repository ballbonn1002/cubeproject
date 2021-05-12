package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.ChatUserSetting;

public interface ChatUserSettingDAO {

	public void save(ChatUserSetting ChatUserSetting) throws Exception;
	public void update(ChatUserSetting ChatUserSetting) throws Exception;
	public void delete(ChatUserSetting ChatUserSetting) throws Exception;
	public List<Map<String,Object>> GetSettingByUserId(String userid);
	public void setNewChatLimit (String userid , String limit) throws Exception;
}
