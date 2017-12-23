package com.mid.dto;

public class BrandDTO {

	private String b_id, p_id;
	private String b_main_img, p_profile_img, bs_name, b_title, b_content, pp_name, ct_name, dif_img, dif_name, b_url, b_date;
	private double b_star_score, avg;

	public String getP_id()
	{
		return p_id;
	}

	public void setP_id(String p_id)
	{
		this.p_id = p_id;
	}

	public String getB_id()
	{
		return b_id;
	}

	public void setB_id(String b_id)
	{
		this.b_id = b_id;
	}

	public String getB_main_img() {
		return b_main_img;
	}

	public void setB_main_img(String b_main_img) {
		this.b_main_img = b_main_img;
	}

	public String getP_profile_img() {
		return p_profile_img;
	}

	public void setP_profile_img(String p_profile_img) {
		this.p_profile_img = p_profile_img;
	}

	public String getBs_name() {
		return bs_name;
	}

	public void setBs_name(String bs_name) {
		this.bs_name = bs_name;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
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

	public String getDif_img() {
		return dif_img;
	}

	public void setDif_img(String dif_img) {
		this.dif_img = dif_img;
	}

	public String getDif_name() {
		return dif_name;
	}

	public void setDif_name(String dif_name) {
		this.dif_name = dif_name;
	}

	public String getB_url() {
		return b_url;
	}

	public void setB_url(String b_url) {
		this.b_url = b_url;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public double getB_star_score() {
		return b_star_score;
	}

	public void setB_star_score(double b_star_score) {
		this.b_star_score = b_star_score;
	}

}
