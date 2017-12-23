package com.mid.dto;

public class CommentReplyDTO {

	private String r_co_id, r_reply_id, ind_id;
	private String u_profile_img, grade_img, u_nickname, r_reply_date, r_reply_comment;

	

	public String getR_co_id()
	{
		return r_co_id;
	}

	public void setR_co_id(String r_co_id)
	{
		this.r_co_id = r_co_id;
	}

	public String getR_reply_id()
	{
		return r_reply_id;
	}

	public void setR_reply_id(String r_reply_id)
	{
		this.r_reply_id = r_reply_id;
	}

	public String getInd_id()
	{
		return ind_id;
	}

	public void setInd_id(String ind_id)
	{
		this.ind_id = ind_id;
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

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	public String getR_reply_date() {
		return r_reply_date;
	}

	public void setR_reply_date(String r_reply_date) {
		this.r_reply_date = r_reply_date;
	}

	public String getR_reply_comment() {
		return r_reply_comment;
	}

	public void setR_reply_comment(String r_reply_comment) {
		this.r_reply_comment = r_reply_comment;
	}

}
