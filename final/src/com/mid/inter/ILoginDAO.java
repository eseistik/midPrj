package com.mid.inter;

import java.sql.SQLException;

import com.mid.dto.LoginDTO;

public interface ILoginDAO
{
	public int uCheck(LoginDTO dto) throws SQLException;
	public int pCheck(LoginDTO dto) throws SQLException;
	public int fCheck(String u_id) throws SQLException;
}
