package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Group_chat ;

public interface GroupChatDAO {
	public void save(Group_chat Group_chat ) throws Exception;
	public void update(Group_chat  Group_chat ) throws Exception;
	public void delete(Group_chat  Group_chat ) throws Exception;
	public List<Map<String,Object>> GetmyGroup(String userid) throws Exception;
	public List<Map<String , Object>> GetMyGroupSetting(String userid,String Group_id) throws Exception;
	public List<Map<String,Object>> GetLastestGroup() throws Exception;
	public List<Map<String,Object>> GetGroupChatUnread(String userid,String Group_id) throws Exception;
	public List<Map<String,Object>> Findmygroup(String userid , String searchtext) throws Exception;
	public List<Map<String,Object>> get_group_chat(String group_id) throws Exception;
}
