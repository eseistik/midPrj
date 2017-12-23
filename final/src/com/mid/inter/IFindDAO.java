package com.mid.inter;

import java.sql.SQLException;

import com.mid.dto.FindDTO;

public interface IFindDAO
{
	public FindDTO ufindInfo(String email) throws SQLException;
	public FindDTO pfindInfo(String email) throws SQLException;
	public FindDTO pqCheck(String id) throws SQLException;
	public void pwChange(FindDTO dto);

}
