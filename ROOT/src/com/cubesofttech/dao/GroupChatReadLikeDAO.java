package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Group_chat_read_like_status;

public interface GroupChatReadLikeDAO {

	public void save(Group_chat_read_like_status Group_chat_read_like_status) throws Exception;
	public void update(Group_chat_read_like_status  Group_chat_read_like_status) throws Exception;
	public void delete(Group_chat_read_like_status  Group_chat_read_like_status) throws Exception;
	public void set_read(String user_id,String message_id) throws Exception;
	public void set_like(String user_id,String message_group_id,String like_status) throws Exception;
	public List<Map<String,Object>> Get_read_count(String chat_id,String message_id)throws Exception;
	public List<Map<String,Object>> Get_like_count(String chat_id,String message_id) throws Exception;
	public void delete_by_group_id(String Group_chat_id) throws Exception;
}
