package com.mid.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.mid.dto.RecipeCommentDTO;
import com.mid.dto.RecipeDTO;
import com.mid.dto.RecipeIngDTO;
import com.mid.dto.RecipePicDTO;
import com.mid.dto.RecipeStepDTO;

public interface IRecipeContentDAO {
	public RecipeDTO recipeContent(String r_id);
	public RecipeDTO recipeStar(String r_id);
	public int recipeStarJoin(String r_id);
	public ArrayList<RecipeIngDTO> recipeIng(String r_id);
	public ArrayList<RecipeStepDTO> recipeStep(String r_id);
	public ArrayList<RecipePicDTO> recipePicture(String r_id);
	public ArrayList<RecipeCommentDTO> recipeComment(String r_id);
	public void commentInsert(@Param("r_id")String r_id, @Param("u_id") String u_id, @Param("r_co_content")String r_co_content);
}
