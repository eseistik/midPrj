package com.mid.inter;

import java.sql.SQLException;
import java.util.ArrayList;
import com.mid.dto.EventDTO;

public interface IEventDAO
{
	public ArrayList<EventDTO> list() throws SQLException;
	public ArrayList<EventDTO> endlist() throws SQLException;
	public EventDTO content(String id) throws SQLException;
	public EventDTO endcontent(String id) throws SQLException;
	public String bdname(String id) throws SQLException;
}
