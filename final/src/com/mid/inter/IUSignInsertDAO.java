package com.mid.inter;

import java.sql.SQLException;

import com.mid.dto.USignInsertDTO;

public interface IUSignInsertDAO
{
	public void uSignInsert(USignInsertDTO dto) throws SQLException;
}
