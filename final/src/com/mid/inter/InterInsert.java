package com.mid.inter;

import java.util.HashMap;

import com.mid.dto.InsertDTO;

public interface InterInsert
{
	public void recipeInsert(HashMap<String, Object> groupTextMap);
	public void recipeStepInsert(InsertDTO dto);
	public void recipeIngInsert(InsertDTO dto);
	public void recipeClInsert(InsertDTO dto);
	public String recipeSequence();
	public void recipeMidInsert(InsertDTO dto);
	public String recipeMid(String mid_ing_name);
	public void recipeEmptyInsert(InsertDTO dto);
	public String recipeMidId(String mid_ing_id);
	public String recipeUnit(String unit_id);
}
