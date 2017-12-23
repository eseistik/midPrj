package com.mid.dto;

public class BrandListDTO
{
	// 브랜드 목록
	private String  B_ID, B_MAIN_IMG, B_TITLE, BS_NAME;
	
	// 추천 브랜드 목록
	private String AVG, RANK;

	
	public String getB_ID()
	{
		return B_ID;
	}

	public void setB_ID(String b_ID)
	{
		B_ID = b_ID;
	}

	public String getB_MAIN_IMG()
	{
		return B_MAIN_IMG;
	}

	public void setB_MAIN_IMG(String b_MAIN_IMG)
	{
		B_MAIN_IMG = b_MAIN_IMG;
	}

	public String getB_TITLE()
	{
		return B_TITLE;
	}

	public void setB_TITLE(String b_TITLE)
	{
		B_TITLE = b_TITLE;
	}

	public String getBS_NAME()
	{
		return BS_NAME;
	}

	public void setBS_NAME(String bS_NAME)
	{
		BS_NAME = bS_NAME;
	}

	public String getAVG()
	{
		return AVG;
	}

	public void setAVG(String aVG)
	{
		AVG = aVG;
	}

	public String getRANK()
	{
		return RANK;
	}

	public void setRANK(String rANK)
	{
		RANK = rANK;
	}
	
	
	

}
