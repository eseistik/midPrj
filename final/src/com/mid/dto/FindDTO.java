package com.mid.dto;

public class FindDTO
{
	private String id, email, joindate;
	private String pq, pq_an;
	private String c_pw;
	
	
	
	public String getC_pw()
	{
		return c_pw;
	}

	public void setC_pw(String c_pw)
	{
		this.c_pw = c_pw;
	}

	public String getPq()
	{
		return pq;
	}

	public void setPq(String pq)
	{
		this.pq = pq;
	}

	public String getPq_an()
	{
		return pq_an;
	}

	public void setPq_an(String pq_an)
	{
		this.pq_an = pq_an;
	}

	public String getJoindate()
	{
		return joindate;
	}

	public void setJoindate(String joindate)
	{
		this.joindate = joindate;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}
	
}
