package com.mid.dto;

public class SearchRecipeDTO {
	private String r_id, u_id;
	private String u_nickname, r_title, r_content, r_tag, r_date, r_main_img, u_profile_img, grade_img;

	public String getU_id()
	{
		return u_id;
	}
	public void setU_id(String u_id)
	{
		this.u_id = u_id;
	}
	public String getR_id()
	{
		return r_id;
	}
	public void setR_id(String r_id)
	{
		this.r_id = r_id;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_tag() {
		return r_tag;
	}

	public void setR_tag(String r_tag) {
		this.r_tag = r_tag;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_main_img() {
		return r_main_img;
	}

	public void setR_main_img(String r_main_img) {
		this.r_main_img = r_main_img;
	}

	public String getU_profile_img() {
		return u_profile_img;
	}

	public void setU_profile_img(String u_profile_img) {
		this.u_profile_img = u_profile_img;
	}

	public String getGrade_img() {
		return grade_img;
	}

	public void setGrade_img(String grade_img) {
		this.grade_img = grade_img;
	}

}