package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.BrandListDTO;

public interface InterBrandList
{
	public ArrayList<BrandListDTO> brandList();
	public ArrayList<BrandListDTO> brandHotList(String u_id);

}
