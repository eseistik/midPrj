package com.mid.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.inter.IStarDAO;

@Controller
public class StarController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/ratingviewList.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String starviewList(ModelMap model, HttpServletRequest request)
	{
		model.addAttribute("r_id", request.getParameter("r_id"));
		model.addAttribute("u_id", request.getParameter("u_id"));

		return "/WEB-INF/view/11_etc/Rating.jsp";
	}

	@RequestMapping(value = "/ratingFin.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String starInsert(ModelMap model, HttpServletRequest request)
	{
		// 레시피
		IStarDAO dao = sqlSession.getMapper(IStarDAO.class);
	
		dao.starInsert(Integer.parseInt(request.getParameter("r_id")), request.getParameter("u_id"), request.getParameter("taste"), request.getParameter("simple"), request.getParameter("creative"));
		
		return "/WEB-INF/view/11_etc/RatingFin.jsp";
	}	
	
	@RequestMapping(value = "/BratingviewList.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String BstarviewList(ModelMap model, HttpServletRequest request)
	{
		model.addAttribute("b_id", request.getParameter("b_id"));
		model.addAttribute("u_id", request.getParameter("u_id"));

		return "/WEB-INF/view/11_etc/BRating.jsp";
	}

	@RequestMapping(value = "/BratingFin.action", method = {RequestMethod.GET, RequestMethod.POST})
	
	public String BstarInsert(ModelMap model, HttpServletRequest request)
	{
		// 레시피
		IStarDAO dao = sqlSession.getMapper(IStarDAO.class);
	
		dao.BstarInsert(Integer.parseInt(request.getParameter("b_id")), request.getParameter("u_id"), (request.getParameter("b_star_score")));
		
		return "/WEB-INF/view/11_etc/RatingFin.jsp";
	}	
}
