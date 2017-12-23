package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.BrandDTO;
import com.mid.dto.CategoryBsDTO;
import com.mid.dto.CategoryStateDTO;
import com.mid.dto.CategoryTypeDTO;

public interface IBrandDAO {

	public ArrayList<BrandDTO> brandBest();
	public ArrayList<BrandDTO> brandList();
	public ArrayList<BrandDTO> brandCategory(String categoryName);
	public ArrayList<BrandDTO> bsCategoryList(String categoryName);
	public int brandCount();
	public int brandCategoryCount(String categoryName);
	public int bsCategoryCount(String categoryName);
	public ArrayList<BrandDTO> brandRate();
	public ArrayList<CategoryStateDTO> stuCategory();
	public ArrayList<CategoryTypeDTO> typeCategory();
	public ArrayList<CategoryBsDTO> bsCategory();
}
