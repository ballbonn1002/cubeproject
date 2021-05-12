package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Chat_message;



public interface ChatDAO {

	public void save(Chat_message Chat_message) throws Exception;
	public Chat_message findById(int id) throws Exception;
	public void update(Chat_message Chat_message) throws Exception;
	public void delete(Chat_message Chat_message) throws Exception;
	public List<Map<String, Object>> get_chat_message(String chat_owner,String chat_partner,String limit) throws Exception;
	public List<Map<String, Object>> get_img_for_chat(String chat_owner) throws Exception;
	public List<Map<String, Object>>  get_chat_unread_count(String chat_owner,String chat_partner) throws Exception;
	public List<Map<String, Object>>  get_chat_unread_count_all(String chat_owner,String onlinelist) throws Exception;
	public void set_read(String chat_owner, String chat_partner) throws Exception ;
	public void Set_like(String message_id , String like_status) throws Exception;
	public List<Map<String,Object>> get_offline_unread_user_history(String chat_owner , String onlinelist) throws Exception;
	public List<Map<String,Object>> get_offline_user_history(String chat_owner , String offline_unread_user_id) throws Exception;
	public List<Map<String,Object>> get_last_chat(String chat_owner,String chat_resive) throws Exception;
	public List<Map<String,Object>> chat_unread_count(String chat_owner,String chat_partner) throws Exception;
	public List<Map<String,Object>> get_file_in_chat(String chat_owner,String chat_partner) throws Exception;
	public List<Map<String,Object>> get_image_in_chat(String chat_owner,String chat_partner) throws Exception;
	public void InsertMessage(String message,String Sender_id , String Reciever_id) throws Exception;
	public List<Map<String,Object>> get_chat(String chat_owner,String chat_partner,String text) throws Exception;
	public List<Map<String,Object>> get_chattext(String chat_owner,String chat_partner,String text) throws Exception;
	public List<Map<String,Object>> get_chatlimit(String chat_owner) throws Exception;
	public List<Map<String,Object>> get_chattextfromid(String chat_owner,String chat_partner,String idchat) throws Exception;
	public List<Map<String,Object>> get_chatbefore(String chat_owner,String chat_partner,String idchat,int limitbefore) throws Exception;
	public List<Map<String,Object>> get_chatafter(String chat_owner,String chat_partner,int afterid,int limitafter) throws Exception;
	public List<Map<String,Object>> get_chatnext(String chat_owner,String chat_partner,String text,String idchat) throws Exception;
	public List<Map<String,Object>> get_chatprevious(String chat_owner,String chat_partner,String text,String idchat) throws Exception;
	public List<Map<String,Object>> get_countcchat(String chat_owner,String chat_partner,String text) throws Exception;
	public List<Map<String,Object>> get_last_id(String chat_owner , String chat_partner,String text) throws Exception;
	public List<Map<String,Object>> get_chat_search_count(String chat_owner , String chat_partner , String text) throws Exception;
	public List<Map<String, Object>> get_chat_before_id(String chat_owner, String chat_partner, String length ,String Current_id , String text) throws Exception;
	public List<Map<String, Object>> get_chat_after_id(String chat_owner, String chat_partner, String length ,String Current_id , String text) throws Exception;
	public List<Map<String,Object>> get_chat_at_id(String chat_owner , String chat_partner,String text,String Message_id) throws Exception;
	public List<Map<String,Object>> get_All_likely_chat(String chat_owner , String chat_partner , String text)throws Exception;
	public List<Map<String,Object>> get_serch_in_length(String chat_owner , String chat_partner , String text , String length , String Current_id) throws Exception;
	public List<Map<String,Object>> Check_chat_history(String chat_owner,String not_in_list , String Sender_id)throws Exception;

}
