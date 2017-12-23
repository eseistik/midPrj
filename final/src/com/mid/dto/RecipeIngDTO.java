package com.mid.dto;

public class RecipeIngDTO {

	private String r_id;
	private String mid_ing_name, r_ing_weight, unit_name;

	
	public String getR_id()
	{
		return r_id;
	}

	public void setR_id(String r_id)
	{
		this.r_id = r_id;
	}

	public String getMid_ing_name() {
		return mid_ing_name;
	}

	public void setMid_ing_name(String mid_ing_name) {
		this.mid_ing_name = mid_ing_name;
	}

	public String getR_ing_weight() {
		return r_ing_weight;
	}

	public void setR_ing_weight(String r_ing_weight) {
		this.r_ing_weight = r_ing_weight;
	}

	public String getUnit_name() {
		return unit_name;
	}

	public void setUnit_name(String unit_name) {
		this.unit_name = unit_name;
	}

}
