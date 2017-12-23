package com.mid.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.inter.ISearchRecipeDAO;

@Controller
public class SearchRecipeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/searchrecipe.action", method=RequestMethod.GET)
	public String searchRecipe(ModelMap model, HttpServletRequest request)
	{	
		ISearchRecipeDAO dao = sqlSession.getMapper(ISearchRecipeDAO.class);
		String search = "%";
		search += request.getParameter("input-search");
		search += "%";
		
		try
		{
			model.addAttribute("searchcount", dao.searchCount(search));
			model.addAttribute("searchList", dao.searchList(search));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/00_main/SearchResultViewList.jsp";
	}
}
