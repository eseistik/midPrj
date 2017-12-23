package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.InsertFormDTO;
import com.mid.inter.InterInsertForm;

@Controller
public class InsertFormController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/recipeinsertform.action", method= RequestMethod.GET)
	public String recipeinsertformlist(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		if (session.getAttribute("type") == null)
		{
			return "loginmain.action";
		}
		
		InterInsertForm dao = sqlSession.getMapper(InterInsertForm.class);
		
		model.addAttribute("BingList",dao.bingLists());
		model.addAttribute("MingList",dao.mingLists());
		model.addAttribute("type",dao.typeLists());
		model.addAttribute("stu",dao.stuLists());
		model.addAttribute("pp",dao.ppLists());
		model.addAttribute("ct",dao.ctLists());
		model.addAttribute("dif",dao.difLists());
		model.addAttribute("unit",dao.unitLists());
		
		return "WEB-INF/view/01_recipe/RecipeInsertForm.jsp";
	}
	
	
	@RequestMapping(value="/selectbigmaterial.action", method=RequestMethod.GET)
	public String selectbig(HttpServletRequest request)
	{
		InterInsertForm dao = sqlSession.getMapper(InterInsertForm.class);
		String big = request.getParameter("big_ing_id");
		
		
		InsertFormDTO dto = new InsertFormDTO();
		
		dto.setBig_ing_id(big);
		
		request.setAttribute("resultList", dao.selectMingLists(dto));
		
		return "/ajax/AjaxResultXMLMing.jsp";
	}
	
	
	@RequestMapping(value="/brandinsertform.action", method=RequestMethod.GET)
	public String brandinsertformlist(ModelMap model)
	{
		InterInsertForm dao = sqlSession.getMapper(InterInsertForm.class);
		
		model.addAttribute("BingList",dao.bingLists());
		model.addAttribute("MingList",dao.mingLists());
		model.addAttribute("type",dao.typeLists());
		model.addAttribute("stu",dao.stuLists());
		model.addAttribute("pp",dao.ppLists());
		model.addAttribute("ct",dao.ctLists());
		model.addAttribute("dif",dao.difLists());
		model.addAttribute("unit",dao.unitLists());
		
		return "WEB-INF/view/05_brand/BrandInsertForm.jsp";
	}
	
	
	@RequestMapping(value="/cookinginsertform.action", method=RequestMethod.GET)
	public String cookinginsertformlist(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		if (session.getAttribute("type") == null)
		{
			return "loginmain.action";
		}
		
		InterInsertForm dao = sqlSession.getMapper(InterInsertForm.class);
		
		model.addAttribute("BingList",dao.bingLists());
		model.addAttribute("MingList",dao.mingLists());
		model.addAttribute("type",dao.typeLists());
		model.addAttribute("stu",dao.stuLists());
		model.addAttribute("pp",dao.ppLists());
		model.addAttribute("ct",dao.ctLists());
		model.addAttribute("dif",dao.difLists());
		model.addAttribute("unit",dao.unitLists());
		model.addAttribute("bc",dao.bcLists());
		model.addAttribute("mc",dao.mcLists());
		model.addAttribute("sc",dao.scLists());
		
		return "WEB-INF/view/02_cooking/CookingInsertForm.jsp";
	}
	
	

}
