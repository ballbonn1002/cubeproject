package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Group_chat_member;

public interface GroupChatMemberDAO {
	public void save(Group_chat_member Group_chat_member ) throws Exception;
	public void update(Group_chat_member  Group_chat_member ) throws Exception;
	public void delete(Group_chat_member  Group_chat_member ) throws Exception;
	public List<Map<String,Object>> getMember(String Group_chat_id)throws Exception;
	public List<Map<String,Object>> FindMemberByName(String Group_chat_id , String member_name) throws Exception;	
	public void delete_by_group_id(String Group_chat_id) throws Exception;
	public List<Map<String,Object>> getGroupmember(String Group_chat_id , String member_id)throws Exception;
	public void setFav(String Group_id , String member_id,String mark)throws Exception;
	public void DeleteByMemberIdAndGroup(String Group_id,String member_id)throws Exception;
	public List<Map<String,Object>> getMemberinfo(String Group_chat_member_id , String member_id)throws Exception;
}
