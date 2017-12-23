package com.mid.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.inter.IReportDAO;

@Controller
public class ReportController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/reportviewList.action", method = RequestMethod.GET)
	public String reportviewList(ModelMap model, HttpServletRequest request)
	{
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);
		
		
		model.addAttribute("viewLists", dao.reportviewList());
		model.addAttribute("u_id", request.getParameter("u_id"));
		model.addAttribute("report_u_id", request.getParameter("report_u_id"));
		
		return "/WEB-INF/view/11_etc/Declare.jsp";
	}
	
	@RequestMapping(value = "/reportFin.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String reportInsert(ModelMap model, HttpServletRequest request)
	{
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);
		
		dao.reportInsert(request.getParameter("u_id"), request.getParameter("re_type_id"), request.getParameter("report_u_id"));
		
		return "/WEB-INF/view/11_etc/DeclareFin.jsp";
	}
	
	
}
