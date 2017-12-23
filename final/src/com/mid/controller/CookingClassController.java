package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.CookingClassDTO;
import com.mid.inter.ICookingClassDAO;

@Controller
public class CookingClassController
{

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/cookingclass.action", method=RequestMethod.GET)
	public String CookingClassList(ModelMap model)
	{
		ICookingClassDAO dao = sqlSession.getMapper(ICookingClassDAO.class);
		
		try
		{
			model.addAttribute("count", dao.countCooking());
			model.addAttribute("list", dao.list());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "WEB-INF/view/02_cookingclass/CookingClassViewList.jsp";
	}
	
	@RequestMapping(value="/cookingclassend.action", method=RequestMethod.GET)
	public String CookingClassListEnd(ModelMap model)
	{
		ICookingClassDAO dao = sqlSession.getMapper(ICookingClassDAO.class);
		
		try
		{
			model.addAttribute("count", dao.countCooking());
			model.addAttribute("list", dao.list());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "WEB-INF/view/02_cookingclass/CookingClassViewList.jsp";
	}
	
	
	@RequestMapping(value="/cookingclasscontent.action", method=RequestMethod.GET)
	public String CookingClassContent(ModelMap model, HttpServletRequest request)
	{
		ICookingClassDAO dao = sqlSession.getMapper(ICookingClassDAO.class);
		HttpSession session = request.getSession();
		
		String cc_id = request.getParameter("cc_id");
		
		try
		{
			CookingClassDTO dto = dao.cookingClassContent(cc_id);
			
			if (session.getAttribute("id") == null || !(session.getAttribute("id").equals(dto.getU_id())))     // 비로그인
			{
				session.setAttribute("btn", 1);
			}
			else 									   // 로그인
				session.setAttribute("btn", 2);
			
			int ingprice = dao.ingPrice(cc_id);
			int etcprice = dao.etcPrice(cc_id);
			int price = ingprice + etcprice;

			model.addAttribute("content", dto);
			model.addAttribute("reCount", dao.reCount(cc_id));
			model.addAttribute("price", price);
			model.addAttribute("timeList", dao.timeList(cc_id));
			model.addAttribute("ingList", dao.ingList(cc_id));
			model.addAttribute("etcList", dao.etcList(cc_id));
			model.addAttribute("clList", dao.clList(cc_id));
			
			model.addAttribute("coList", dao.coList(cc_id));
			
			
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
		return "WEB-INF/view/02_cookingclass/CookingClassViewContent.jsp";
	}
	
}
