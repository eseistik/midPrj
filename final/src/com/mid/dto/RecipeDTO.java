package com.mid.dto;

public class RecipeDTO {
	private String r_id, u_id;
	private String u_nickname, r_title, r_content, pp_name, ct_name, dif_name, r_tag, r_date, r_main_img, u_profile_img,
			grade_img, dif_id;
	private double taste, creative, simple, total;

	
	public String getDif_id()
	{
		return dif_id;
	}

	public void setDif_id(String dif_id)
	{
		this.dif_id = dif_id;
	}

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

	public String getPp_name() {
		return pp_name;
	}

	public void setPp_name(String pp_name) {
		this.pp_name = pp_name;
	}

	public String getCt_name() {
		return ct_name;
	}

	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}

	public String getDif_name() {
		return dif_name;
	}

	public void setDif_name(String dif_name) {
		this.dif_name = dif_name;
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
	public double getTaste() {
		return taste;
	}

	public void setTaste(double taste) {
		this.taste = taste;
	}

	public double getCreative() {
		return creative;
	}

	public void setCreative(double creative) {
		this.creative = creative;
	}

	public double getSimple() {
		return simple;
	}

	public void setSimple(double simple) {
		this.simple = simple;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

}