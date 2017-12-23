package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.InsertFormDTO;

public interface InterInsertForm
{
	public ArrayList<InsertFormDTO> bingLists();
	public ArrayList<InsertFormDTO> selectMingLists(InsertFormDTO big_ing_id);
	public ArrayList<InsertFormDTO> mingLists();
	public ArrayList<InsertFormDTO> stuLists();
	public ArrayList<InsertFormDTO> typeLists();
	public ArrayList<InsertFormDTO> ppLists();
	public ArrayList<InsertFormDTO> ctLists();
	public ArrayList<InsertFormDTO> difLists();
	public ArrayList<InsertFormDTO> unitLists();
	public ArrayList<InsertFormDTO> bcLists();
	public ArrayList<InsertFormDTO> mcLists();
	public ArrayList<InsertFormDTO> scLists();

}
