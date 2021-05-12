package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Group_chat_message;

public interface GroupChatMessageDAO {
	public void save(Group_chat_message Group_chat_message) throws Exception;
	public void update(Group_chat_message  Group_chat_message) throws Exception;
	public void delete(Group_chat_message  Group_chat_message) throws Exception;
	public List<Map<String,Object>> GetlastestMessage() throws Exception;
	public List<Map<String,Object>> GetGroupMessage(String Group_chat_id , String user_id,String limit) throws Exception;
	public void delete_by_group_id(String Group_chat_id) throws Exception;
	public List<Map<String,Object>> get_file_in_group_chat(String Group_chat_id) throws Exception;
	public List<Map<String,Object>> get_image_in_group_chat(String Group_chat_id) throws Exception;
	public List<Map<String,Object>> get_All_likely_chat_group(String Group_chat_id,String user_id, String text) throws Exception;
	public List<Map<String,Object>> get_group_chat_at_id(String Group_chat_id , String user_id , String text,String Gmessage_id) throws Exception;
	public List<Map<String,Object>> get_search_in_length_group(String Group_chat_id , String user_id ,String text , String length , String Gmessage_id) throws Exception ;
	public List<Map<String,Object>> get_search_group_chat_count(String Group_chat_id,String searchtext);
}
