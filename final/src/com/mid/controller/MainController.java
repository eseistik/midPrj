package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.inter.IMainDAO;

@Controller
public class MainController 
{

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value="/main.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String Main(HttpServletRequest request, ModelMap model)
	{
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		HttpSession session = request.getSession();
		
		String f = String.valueOf(session.getAttribute("f"));
		try
		{
			if (f == null)
			{
				model.addAttribute("f_id", f);
			}
			else if (f.equals("1"))
			{
				model.addAttribute("f_id", f);
				model.addAttribute("fList", dao.tRecipe());
			}
			else if (f.equals("2"))
			{
				model.addAttribute("f_id", f);
				model.addAttribute("fList", dao.cRecipe());
			}
			else if (f.equals("3"))
			{
				model.addAttribute("f_id", f);
				model.addAttribute("fList", dao.sRecipe());
			}
			
			model.addAttribute("bList",dao.bRecipe());
			model.addAttribute("bbList", dao.bBRecipe());
			
			model.addAttribute("riceRank", dao.riceRank());
			
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "WEB-INF/view/00_main/Main.jsp";
	}
	
}
