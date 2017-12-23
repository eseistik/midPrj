package com.mid.inter;

import java.util.HashMap;

import com.mid.dto.BrandInsertDTO;

public interface InterBrandInsert
{
	public void brandInsert(HashMap<String, Object> groupTextMap);
	public void brandStepInsert(BrandInsertDTO dto);
	public void brandIngInsert(BrandInsertDTO dto);
	public void brandClInsert(BrandInsertDTO dto);
	public String brandSequence();
	public void brandMidInsert(BrandInsertDTO dto);
	public String brandMid(String mid_ing_name);
	public void brandEmptyInsert(BrandInsertDTO dto);
	public String brandMidId(String mid_ing_id);
	public String brandUnit(String unit_id);
	public String brandName(String p_id);

}
