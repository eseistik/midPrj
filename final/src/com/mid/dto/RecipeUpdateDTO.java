package com.mid.dto;

public class RecipeUpdateDTO
{
	// 프로시저 정보
	private String r_id, u_id, r_title, r_content, fd_type_id, fd_stu_id, fd_mid_ing_id, pp_id, ct_id, dif_id, r_main_img, r_tag;
	// 재료 정보
	private String mid_ing_id, r_ing_weight, unit_id;
	// 순서 정보
	private String r_step_content, r_step_img;
	// 완성 사진
	private String r_cl_img;
	
	private int r_step_id, r_ing_id, r_cl_id;
	
	// 추가 재료 정보
	private String big_ing_id, mid_ing_name;
	
	
	public int getR_step_id()
	{
		return r_step_id;
	}
	public void setR_step_id(int r_step_id)
	{
		this.r_step_id = r_step_id;
	}
	public int getR_ing_id()
	{
		return r_ing_id;
	}
	public void setR_ing_id(int r_ing_id)
	{
		this.r_ing_id = r_ing_id;
	}
	public int getR_cl_id()
	{
		return r_cl_id;
	}
	public void setR_cl_id(int r_cl_id)
	{
		this.r_cl_id = r_cl_id;
	}
	public String getMid_ing_name()
	{
		return mid_ing_name;
	}
	public void setMid_ing_name(String mid_ing_name)
	{
		this.mid_ing_name = mid_ing_name;
	}
	public String getBig_ing_id()
	{
		return big_ing_id;
	}
	public void setBig_ing_id(String big_ing_id)
	{
		this.big_ing_id = big_ing_id;
	}
	public String getR_id()
	{
		return r_id;
	}
	public void setR_id(String r_id)
	{
		this.r_id = r_id;
	}
	public String getU_id()
	{
		return u_id;
	}
	public void setU_id(String u_id)
	{
		this.u_id = u_id;
	}
	public String getR_title()
	{
		return r_title;
	}
	public void setR_title(String r_title)
	{
		this.r_title = r_title;
	}
	public String getR_content()
	{
		return r_content;
	}
	public void setR_content(String r_content)
	{
		this.r_content = r_content;
	}
	public String getFd_type_id()
	{
		return fd_type_id;
	}
	public void setFd_type_id(String fd_type_id)
	{
		this.fd_type_id = fd_type_id;
	}
	public String getFd_stu_id()
	{
		return fd_stu_id;
	}
	public void setFd_stu_id(String fd_stu_id)
	{
		this.fd_stu_id = fd_stu_id;
	}
	public String getFd_mid_ing_id()
	{
		return fd_mid_ing_id;
	}
	public void setFd_mid_ing_id(String fd_mid_ing_id)
	{
		this.fd_mid_ing_id = fd_mid_ing_id;
	}
	public String getPp_id()
	{
		return pp_id;
	}
	public void setPp_id(String pp_id)
	{
		this.pp_id = pp_id;
	}
	public String getCt_id()
	{
		return ct_id;
	}
	public void setCt_id(String ct_id)
	{
		this.ct_id = ct_id;
	}
	public String getDif_id()
	{
		return dif_id;
	}
	public void setDif_id(String dif_id)
	{
		this.dif_id = dif_id;
	}
	public String getR_main_img()
	{
		return r_main_img;
	}
	public void setR_main_img(String r_main_img)
	{
		this.r_main_img = r_main_img;
	}
	public String getR_tag()
	{
		return r_tag;
	}
	public void setR_tag(String r_tag)
	{
		this.r_tag = r_tag;
	}

	public String getMid_ing_id()
	{
		return mid_ing_id;
	}
	public void setMid_ing_id(String mid_ing_id)
	{
		this.mid_ing_id = mid_ing_id;
	}
	public String getR_ing_weight()
	{
		return r_ing_weight;
	}
	public void setR_ing_weight(String r_ing_weight)
	{
		this.r_ing_weight = r_ing_weight;
	}
	public String getUnit_id()
	{
		return unit_id;
	}
	public void setUnit_id(String unit_id)
	{
		this.unit_id = unit_id;
	}
	public String getR_step_content()
	{
		return r_step_content;
	}
	public void setR_step_content(String r_step_content)
	{
		this.r_step_content = r_step_content;
	}
	public String getR_step_img()
	{
		return r_step_img;
	}
	public void setR_step_img(String r_step_img)
	{
		this.r_step_img = r_step_img;
	}
	public String getR_cl_img()
	{
		return r_cl_img;
	}
	public void setR_cl_img(String r_cl_img)
	{
		this.r_cl_img = r_cl_img;
	}

	
	

}
