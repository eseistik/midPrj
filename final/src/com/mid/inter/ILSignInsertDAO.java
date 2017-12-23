package com.mid.inter;


import com.mid.dto.LSignInsertDTO;

public interface ILSignInsertDAO
{
	public void lSignInsert(LSignInsertDTO dto);
	public void lSignInfoInsert(LSignInsertDTO dto);
	public int getBs_id(String p_name);
	public int getInfo_id();
}
