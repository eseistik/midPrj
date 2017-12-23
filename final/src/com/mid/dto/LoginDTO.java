package com.mid.dto;

public class LoginDTO
{
	private String u_id, u_pw;
	private String p_id, p_pw, f_id;

	
	public String getF_id()
	{
		return f_id;
	}

	public void setF_id(String f_id)
	{
		this.f_id = f_id;
	}

	public String getP_id()
	{
		return p_id;
	}

	public void setP_id(String p_id)
	{
		this.p_id = p_id;
	}

	public String getP_pw()
	{
		return p_pw;
	}

	public void setP_pw(String p_pw)
	{
		this.p_pw = p_pw;
	}

	public String getU_id()
	{
		return u_id;
	}

	public void setU_id(String u_id)
	{
		this.u_id = u_id;
	}

	public String getU_pw()
	{
		return u_pw;
	}

	public void setU_pw(String u_pw)
	{
		this.u_pw = u_pw;
	}
	
}
