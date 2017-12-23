package com.mid.inter;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mid.dto.SignDTO;

public interface ISignDAO
{
	public ArrayList<SignDTO> pqList() throws SQLException;
	public ArrayList<SignDTO> fList() throws SQLException;
	public int uCheckId(String u_id);
	public int uCheckNick(String u_nick);
}
