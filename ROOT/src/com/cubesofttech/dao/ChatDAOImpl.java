package com.cubesofttech.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Chat_message;

@Repository
public class ChatDAOImpl implements ChatDAO{

	@Autowired
	private  SessionFactory sessionFactory;

	@Override
	public void save(Chat_message Chat_message) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(Chat_message);
		session.flush();
		
	}

	@Override
	public Chat_message findById(int id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Chat_message Chat_message = null;
		try {
			Chat_message = (Chat_message) session.get(Chat_message.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return Chat_message;
	}

	@Override
	public void update(Chat_message Chat_message) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(Chat_message);
		session.flush();
		
	}

	@Override
	public void delete(Chat_message Chat_message) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(Chat_message);
		session.flush();
		
	}

	@Override
	public List<Map<String, Object>> get_chat_message(String chat_owner, String chat_partner,String limit) throws Exception{
		List<Map<String, Object>> chat_message = null;
		try {
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') and (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') ORDER BY Message_id DESC LIMIT "+limit+") Preselect ORDER BY Message_id ASC";
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		chat_message = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chat_message;
	}

	@Override
	public List<Map<String, Object>> get_img_for_chat(String user_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> img = null;

		try {
			String sql = "SELECT user.path AS path FROM  user WHERE id=:user_id ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user_id", user_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			img = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return img;
	}
	
	@Override
	public List<Map<String, Object>> get_chat_unread_count(String chat_owner, String chat_partner) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> read_stat = null;

		try {
			String sql = "SELECT COUNT(`Reciever_read_status`) as unread_count FROM `chat_message` WHERE Reciever_id =:chat_owner AND Reciever_read_status = '0' AND Sender_id =:chat_partner";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setParameter("chat_partner", chat_partner);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			read_stat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return read_stat;
	}
	
	@Override
	public List<Map<String, Object>> get_chat_unread_count_all(String chat_owner, String onlinelist) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> read_stat = null;

		try {
			String sql = "SELECT *,COUNT(`Reciever_read_status`) as unread_count FROM `chat_message` WHERE Reciever_id =:chat_owner AND Reciever_read_status = '0' AND Sender_id IN ("+onlinelist+") GROUP BY Sender_id order by Sender_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			read_stat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return read_stat;
	}
	
	public void set_read(String chat_owner, String chat_partner) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		try {
			String sql = "UPDATE `chat_message` SET `Reciever_read_status`= '1' WHERE Reciever_id =:chat_owner AND Reciever_read_status = '0' AND Sender_id =:chat_partner";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setParameter("chat_partner", chat_partner);
			query.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void Set_like(String message_id , String like_status) throws Exception{
		try {
		Session session = this.sessionFactory.getCurrentSession();	
		String sql ="Update chat_message SET like_status =:like_status WHERE Message_id =:message_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("like_status", like_status);
		query.setParameter("message_id", message_id);
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Map<String, Object>> get_offline_unread_user_history(String chat_owner, String onlinelist)
			throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> read_stat = null;
		try {
			String sql = "SELECT *,COUNT(`Reciever_read_status`) as unread_count FROM `chat_message` WHERE Reciever_id =:chat_owner AND `Reciever_read_status` = '0' AND Sender_id NOT IN ("+onlinelist+") GROUP BY Sender_id order by Sender_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			read_stat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return read_stat;
	}

	@Override
	public List<Map<String, Object>> get_offline_user_history(String chat_owner, String offline_unread_user_id)
			throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> read_stat = null;

		try {
			String sql = "SELECT * FROM `chat_message` WHERE `Reciever_id` =:chat_owner AND `Sender_id` NOT IN ("+offline_unread_user_id+") LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			read_stat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return read_stat;
	}
	@Override
	public List<Map<String,Object>> get_last_chat(String chat_owner,String chat_resive) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> lastchat = null;
		try {
			String sql = "SELECT * FROM `chat_message` WHERE (Sender_id = '"+chat_resive+"' OR Reciever_id = '"+chat_resive+"') and (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') ORDER BY `chat_message`.`Message_id` DESC LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			lastchat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastchat;
	}
	@Override
	public List<Map<String, Object>> get_image_in_chat(String chat_owner, String chat_partner) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> imageinchat = null;

		try {
			String sql = "SELECT * FROM `chat_message` WHERE img_message_status = '1' AND Sender_id =:chat_owner AND Reciever_id =:chat_partner";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setParameter("chat_partner", chat_partner); 
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			imageinchat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imageinchat;
	}

	@Override
	public List<Map<String, Object>> get_file_in_chat(String chat_owner, String chat_partner) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> fileinchat = null;
		try {
			String sql = "SELECT * FROM `chat_message` WHERE (file_message_status = '1' OR img_message_status = '1') AND (Sender_id =:chat_owner AND Reciever_id =:chat_partner) OR (Sender_id =:chat_partner AND Reciever_id =:chat_owner)";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setParameter("chat_partner", chat_partner); 
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			fileinchat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileinchat;
	}
	@Override
	public List<Map<String, Object>> chat_unread_count(String chat_owner, String chat_partner) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> read_stat = null;
		try {
			String sql = "SELECT COUNT(`Reciever_read_status`) as unread_count FROM `chat_message` WHERE Reciever_id LIKE '"+chat_owner+"' AND Reciever_read_status = '0' AND Sender_id LIKE '%"+chat_partner+"%'";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			read_stat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return read_stat;
	}

	@Override
	public void InsertMessage(String message, String Sender_id, String Reciever_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			String sql = "INSERT INTO `chat_message` (`Message_id`, `Sender_id`, `Reciever_id`, `Date_time_Message`, `Message_text`, `Sender_read_status`, `Reciever_read_status`, `img_path`, `img_message_status`, `like_status`, `file_path`, `file_message_status`, `sticker_path`, `sticker_status`, `file_name`) "
					+ "VALUES (NULL, :Sender_id , :Reciever_id , current_timestamp() , :Message , '1', '0', NULL, '0', '0', NULL, '0', NULL, '0', NULL)";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("Sender_id", Sender_id);
			query.setParameter("Reciever_id", Reciever_id);
			query.setParameter("Message", message);
			query.executeUpdate();
		}catch(Exception Ex) {
			Ex.printStackTrace();
		}
		
	}

	@Override
	public List<Map<String, Object>> get_chat(String chat_owner, String chat_partner ,String text) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM `chat_message` WHERE Sender_id LIKE '%"+chat_owner+"%' AND Reciever_id LIKE '%"+chat_partner+"%' AND Message_text LIKE '"+text+"%' OR Sender_id LIKE '%"+chat_partner+"%' AND Reciever_id LIKE '%"+chat_owner+"%' AND Message_text LIKE '"+text+"%'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_chattext(String chat_owner, String chat_partner ,String text) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM `chat_message` WHERE Sender_id LIKE '%"+chat_owner+"%' AND Reciever_id LIKE '%"+chat_partner+"%' AND Message_text LIKE '"+text+"%' OR Sender_id LIKE '%"+chat_partner+"%' AND Reciever_id LIKE '%"+chat_owner+"%' AND Message_text LIKE '"+text+"%' ORDER BY Message_id DESC LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_chatlimit(String chat_owner) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM `chat_user_setting` where user_id = '"+chat_owner+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_chattextfromid(String chat_owner, String chat_partner ,String idchat) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM `chat_message` WHERE Sender_id LIKE '%"+chat_owner+"%' AND Reciever_id LIKE '%"+chat_partner+"%' AND Message_id = '"+idchat+"' OR Sender_id LIKE '%"+chat_partner+"%' AND Reciever_id LIKE '%"+chat_owner+"%' AND Message_id = '"+idchat+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_chatbefore(String chat_owner,String chat_partner,String idchat,int limitbefore) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM (SELECT * FROM chat_message WHERE (Sender_id = '"+chat_owner+"' AND Reciever_id = '"+chat_partner+"') OR (Sender_id = '"+chat_partner+"' AND Reciever_id ='"+chat_owner+"') )AS a WHERE Message_id BETWEEN '"+limitbefore+"' AND '"+idchat+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_chatafter(String chat_owner,String chat_partner,int afterid,int limitafter)throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM (SELECT * FROM chat_message WHERE (Sender_id = '"+chat_owner+"' AND Reciever_id = '"+chat_partner+"') OR (Sender_id = '"+chat_partner+"' AND Reciever_id ='"+chat_owner+"') )AS a WHERE Message_id BETWEEN '"+afterid+"' AND '"+limitafter+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_chatnext(String chat_owner, String chat_partner ,String text,String idchat) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM (SELECT * FROM chat_message WHERE (Sender_id = '"+chat_owner+"' AND Reciever_id = '"+chat_partner+"' AND Message_text LIKE '"+text+"%') OR (Sender_id = '"+chat_partner+"' AND Reciever_id ='"+chat_owner+"'AND Message_text LIKE '"+text+"%' ) )AS a WHERE Message_id > "+idchat+" ORDER BY Message_id DESC LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_chatprevious(String chat_owner, String chat_partner ,String text,String idchat) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT * FROM (SELECT * FROM chat_message WHERE (Sender_id = '"+chat_owner+"' AND Reciever_id = '"+chat_partner+"' AND Message_text LIKE '"+text+"%') OR (Sender_id = '"+chat_partner+"' AND Reciever_id ='"+chat_owner+"'AND Message_text LIKE '"+text+"%' ) )AS a WHERE Message_id < "+idchat+" ORDER BY Message_id DESC LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}
	@Override
	public List<Map<String, Object>> get_countcchat(String chat_owner, String chat_partner ,String text) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> getchat = null;
		try {
			String sql = "SELECT COUNT(MESSAGE_TEXT) AS countchat FROM chat_message WHERE (Sender_id = '"+chat_owner+"' AND Reciever_id = '"+chat_partner+"' AND Message_text LIKE '"+text+"%') OR (Sender_id = '"+chat_partner+"' AND Reciever_id ='"+chat_owner+"'AND Message_text LIKE '"+text+"%' )";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getchat = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getchat;
	}

	@Override
	public List<Map<String, Object>> get_last_id(String chat_owner, String chat_partner,String text) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> getlastid = null;
		try {
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') and (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_text LIKE '%"+text+"%' ORDER BY Message_id DESC limit 1) Preselect ORDER BY Message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getlastid = query.list();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return getlastid;
	}


	@Override
	public List<Map<String, Object>> get_chat_search_count(String chat_owner, String chat_partner, String text)
			throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> getlastid = null;
		try {
			String sql = "SELECT * FROM (SELECT *,COUNT(Message_id) as foundcount FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') and (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_text LIKE '%"+text+"%' ORDER BY Message_id DESC) Preselect ORDER BY Message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getlastid = query.list();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return getlastid;
	}

	@Override
	public List<Map<String, Object>> get_chat_before_id(String chat_owner, String chat_partner, String length ,String Current_id , String text)
			throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> getlastid = null;
		try {
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_Message,  \"%d/%m/%Y %H:%i:%S\") as Chat_time  FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') and (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_text LIKE '%"+text+"%' AND Message_id < "+Current_id+" ORDER BY Message_id DESC limit "+length+") Preselect ORDER BY Message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getlastid = query.list();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return getlastid;
	}

	@Override
	public List<Map<String, Object>> get_chat_after_id(String chat_owner, String chat_partner, String length,
			String Current_id, String text) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> getlastid = null;
		try {
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time  FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') and (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_text LIKE '%"+text+"%' AND Message_id > "+Current_id+" ORDER BY Message_id DESC limit "+length+") Preselect ORDER BY Message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getlastid = query.list();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return getlastid;
	}

	@Override
	public List<Map<String, Object>> get_chat_at_id(String chat_owner, String chat_partner, String text,
			String Message_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> getlastid = null;
		try {
			String sql = "SELECT * FROM (SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') and (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_id = '"+Message_id+"' ORDER BY Message_id DESC limit 1) Preselect ORDER BY Message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getlastid = query.list();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return getlastid;
	}

	@Override
	public List<Map<String, Object>> get_All_likely_chat(String chat_owner, String chat_partner, String text)
			throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> getlastid = null;
		try {
			String sql = "SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') and (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_text LIKE '%"+text+"%' ORDER BY Message_id DESC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			getlastid = query.list();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return getlastid;
	}

	@Override
	public List<Map<String, Object>> get_serch_in_length(String chat_owner, String chat_partner, String text,
			String length, String Current_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String,Object>> search_in_length = null;
		try {
			String sql ="SELECT * FROM"+
			"("+
			"(SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') AND (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_id < "+Current_id+" ORDER BY Message_id DESC LIMIT "+length+")"+
			"UNION"+
			"(SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') AND (Sender_id ='"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_id = "+Current_id+")"+
			 "UNION"+
			"(SELECT *,DATE_FORMAT(Date_time_Message, \"%d/%m/%Y %H:%i:%S\") as Chat_time FROM chat_message WHERE (Sender_id = '"+chat_owner+"' OR Reciever_id = '"+chat_owner+"') AND (Sender_id = '"+chat_partner+"' OR Reciever_id = '"+chat_partner+"') AND Message_id > "+Current_id+" ORDER BY Message_id ASC LIMIT "+length+")"+
			") AS search_in_length ORDER BY Message_id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			search_in_length = query.list();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return search_in_length;
	}

	@Override
	public List<Map<String, Object>> Check_chat_history(String chat_owner, String not_in_list, String Sender_id)
			throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> read_stat = null;

		try {
			String sql = "SELECT * FROM `chat_message` WHERE `Reciever_id` =:chat_owner AND `Sender_id` NOT IN ("+not_in_list+") AND `Sender_id`=:Sender_id LIMIT 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("chat_owner", chat_owner);
			query.setParameter("Sender_id", Sender_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			read_stat = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return read_stat;
	}

	

}
