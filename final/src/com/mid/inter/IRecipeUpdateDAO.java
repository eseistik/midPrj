package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.RecipeUpdateDTO;
import com.mid.dto.RecipeUpdateFormDTO;

public interface IRecipeUpdateDAO
{
	public RecipeUpdateFormDTO Main(String r_id);
	
	public ArrayList<RecipeUpdateFormDTO> Mate(String r_id);
	
	public ArrayList<RecipeUpdateFormDTO> Step(String r_id);
	
	public ArrayList<RecipeUpdateFormDTO> Cl(String r_id);
	
	public int StepLength(String r_id);
	public int MateLength(String r_id);
	public int ClLength(String r_id);
	
	public ArrayList<RecipeUpdateDTO> StepID(String r_id);
	public ArrayList<RecipeUpdateDTO> MateID(String r_id);
	public ArrayList<RecipeUpdateDTO> ClID(String r_id);
	
	public String[] StepImg(String r_id);
	public String[] ClImg(String r_id);
	
	public void MainUpdate(RecipeUpdateDTO dto);
	public void StepUpdate(RecipeUpdateDTO dto);
	public void MateUpdate(RecipeUpdateDTO dto);
	public void ClUpdate(RecipeUpdateDTO dto);
	
	public void DeleteRecipe(String r_id);
	
	public void StepDelete(RecipeUpdateDTO dto);
	public void MateDelete(RecipeUpdateDTO dto);
	public void ClDelete(RecipeUpdateDTO dto);

}
