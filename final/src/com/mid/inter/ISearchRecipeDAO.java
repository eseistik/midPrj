package com.mid.inter;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mid.dto.SearchRecipeDTO;

public interface ISearchRecipeDAO
{
	public ArrayList<SearchRecipeDTO>searchList(String search) throws SQLException;
	public int searchCount(String search) throws SQLException;
}
