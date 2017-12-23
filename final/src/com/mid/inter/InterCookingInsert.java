package com.mid.inter;

import java.util.HashMap;

import com.mid.dto.CookingInsertDTO;


public interface InterCookingInsert
{
	public void cookingInsert(HashMap<String, Object> groupTextMap);
	
	public void cookingIngInsert(CookingInsertDTO dto);
	
	public void cookingClInsert(CookingInsertDTO dto);
	
	public void cookingPriceInsert(CookingInsertDTO dto);
	public String cookingSequence();
	public void cookingMidInsert(CookingInsertDTO dto);
	public String cookingMid(String mid_ing_name);
	public void cookingEmptyInsert(CookingInsertDTO dto);
	public String cookingMidId(String mid_ing_id);
	public String cookingUnit(String unit_id);
	
	
	public void cookingEtcInsert(CookingInsertDTO dto);
	public void cookingTimeInsert(CookingInsertDTO dto);

}
