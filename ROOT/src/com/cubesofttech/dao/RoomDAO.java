package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Room;

public interface RoomDAO {
	public List<Map<String, Object>> getAmountRoom() throws Exception;
	public List<Map<String, Object>> getAmountRoom1() throws Exception;
	public List<Map<String, Object>> getAmountRoom2() throws Exception;
	public Room findById(Integer idroom) throws Exception;

	public List<Map<String, Object>> findAll() throws Exception;

	public void save(Room room) throws Exception;

	public void update(Room room) throws Exception;

	public void delete(Room room) throws Exception;
}
