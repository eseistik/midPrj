package com.mid.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.mid.dto.RecipeRequestCommentDTO;
import com.mid.dto.RecipeRequestDTO;

public interface IRecipeRequestDAO {
	public ArrayList<RecipeRequestDTO> recipeRequestList();
	public int recipeRequestStu(String rr_id);
	public int recipeRequestCount();
	public ArrayList<RecipeRequestDTO> recipeRequestSearch(String key);
	public RecipeRequestDTO recipeContent(String rr_id);
	public ArrayList<RecipeRequestCommentDTO> recipeRequestCommentList(String rr_id);
	public int recipeRequestCommentCount(String rr_id);
	public void recipeRequestInsert(@Param("inputPoint")String inputPoint, @Param("inputTitle")String inputTitle
			, @Param("inputContent")String inputContent, @Param("u_id")String u_id);
	public void recipeRequestModify(@Param("inputPoint")String inputPoint, @Param("inputTitle")String inputTitle
			, @Param("inputContent")String inputContent, @Param("rr_id")String rr_id);
	public void recipeRequestCommentInsert(@Param("rr_id")String rr_id, @Param("u_id")String u_id
			, @Param("rr_co_content")String rr_co_content, @Param("rr_co_url")String rr_co_url);
	public void recipeRequestCommentSelect(@Param("rr_co_id")String rr_co_id);
	public void recipeRequestCommentLike(@Param("rr_co_id")String rr_co_id);
}
