package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.CategoryStateDTO;
import com.mid.dto.CategoryTypeDTO;
import com.mid.dto.RecipeDTO;

public interface IRecipeDAO {

	public ArrayList<RecipeDTO> recipeBest();
	public ArrayList<RecipeDTO> recipeList();
	public ArrayList<RecipeDTO> recipeCategory(String categoryName);
	public int recipeCount();
	public int recipeCategoryCount(String categoryName);
	public ArrayList<RecipeDTO> recipeRate();
	public ArrayList<CategoryStateDTO> stuCategory();
	public ArrayList<CategoryTypeDTO> typeCategory();
	public void DeleteRecipe(String r_id);
}
