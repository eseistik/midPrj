package com.mid.dto;

public class RecipeStepDTO {

	private String r_id, r_step_id;
	private String r_step_content, r_step_img;

	public String getR_id()
	{
		return r_id;
	}

	public void setR_id(String r_id)
	{
		this.r_id = r_id;
	}

	public String getR_step_id()
	{
		return r_step_id;
	}

	public void setR_step_id(String r_step_id)
	{
		this.r_step_id = r_step_id;
	}

	public String getR_step_content() {
		return r_step_content;
	}

	public void setR_step_content(String r_step_content) {
		this.r_step_content = r_step_content;
	}

	public String getR_step_img() {
		return r_step_img;
	}

	public void setR_step_img(String r_step_img) {
		this.r_step_img = r_step_img;
	}

}
