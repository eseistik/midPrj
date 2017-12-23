package com.mid.inter;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mid.dto.CookingClassCoDTO;
import com.mid.dto.CookingClassDTO;

public interface ICookingClassDAO
{
	public int countCooking() throws SQLException;
	public ArrayList<CookingClassDTO> list() throws SQLException;
	public CookingClassDTO cookingClassContent(String cc_id) throws SQLException;
	public int reCount(String cc_id) throws SQLException;
	public int ingPrice(String cc_id) throws SQLException;
	public int etcPrice(String cc_id) throws SQLException;
	public ArrayList<CookingClassDTO> timeList(String cc_id) throws SQLException;
	public ArrayList<CookingClassDTO> ingList(String cc_id) throws SQLException;
	public ArrayList<CookingClassDTO> etcList(String cc_id)	throws SQLException;
	public ArrayList<CookingClassDTO> clList(String cc_id) throws SQLException;
	public ArrayList<CookingClassCoDTO> coList(String cc_id) throws SQLException;
	public int replyCount(String cc_co_id) throws SQLException;
}
