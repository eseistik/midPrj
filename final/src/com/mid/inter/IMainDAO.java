package com.mid.inter;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mid.dto.MainRankDTO;
import com.mid.dto.MainRecipeDTO;

public interface IMainDAO
{
	public ArrayList<MainRecipeDTO> tRecipe() throws SQLException;
	public ArrayList<MainRecipeDTO> cRecipe() throws SQLException;
	public ArrayList<MainRecipeDTO> sRecipe() throws SQLException;
	public ArrayList<MainRecipeDTO> bRecipe() throws SQLException;
	public ArrayList<MainRecipeDTO> bBRecipe() throws SQLException;
	
	public ArrayList<MainRankDTO> riceRank() throws SQLException;
	
}
