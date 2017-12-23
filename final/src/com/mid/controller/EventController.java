package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.EventDTO;
import com.mid.inter.IEventDAO;


@Controller
public class EventController 
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/event.action", method=RequestMethod.GET)
	public String EventList(ModelMap model)
	{
		IEventDAO dao = sqlSession.getMapper(IEventDAO.class);
		
		try
		{
			model.addAttribute("list", dao.list());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "WEB-INF/view/04_event/EventViewList(con).jsp";
	}
	
	@RequestMapping(value="/eventend.action", method=RequestMethod.GET)
	public String EventEndList(ModelMap model)
	{
		IEventDAO dao = sqlSession.getMapper(IEventDAO.class);
		
		try
		{
			model.addAttribute("endlist", dao.endlist());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "WEB-INF/view/04_event/EventViewList(end).jsp";
	}
	
	@RequestMapping(value="/eventContent.action", method=RequestMethod.GET)
	public String EventContent(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		IEventDAO dao = sqlSession.getMapper(IEventDAO.class);
		
		
		String event_id = request.getParameter("event_id");
		
		
		try
		{	
			EventDTO dto = dao.content(event_id);
			model.addAttribute("eventContent",dto);		
			
			if (session.getAttribute("id") == null || !(session.getAttribute("id").equals(dto.getP_id())))     // 비로그인
			{
				session.setAttribute("btn", 1);
			}
			else 									   // 로그인
				session.setAttribute("btn", 2);
			
			System.out.println(session.getAttribute("id"));
			System.out.println(dto.getP_id());
			System.out.println(session.getAttribute("btn"));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "WEB-INF/view/04_event/EventViewContent.jsp";
	}
	

	
	@RequestMapping(value="/eventContentend.action", method=RequestMethod.GET)
	public String EventContentEnd(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		IEventDAO dao = sqlSession.getMapper(IEventDAO.class);

		String event_id = request.getParameter("endevent_id");
		
		try
		{	
			EventDTO dto = dao.endcontent(event_id);
			model.addAttribute("eventContentend",dto);		
			
			if (session.getAttribute("id") == null || !(session.getAttribute("id").equals(dto.getP_id())))     // 비로그인
			{
				session.setAttribute("btn", 1);
			}
			else 									   // 로그인
				session.setAttribute("btn", 2);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "WEB-INF/view/04_event/EventViewContent(end).jsp";
	}
	
	@RequestMapping(value="/eventinsert.action", method=RequestMethod.GET)
	public String EventInsert(ModelMap model, HttpServletRequest request)
	{
		IEventDAO dao = sqlSession.getMapper(IEventDAO.class);

		try
		{
			HttpSession session = request.getSession();
			
			String p_id = (String)session.getAttribute("id");
			model.addAttribute("bs", dao.bdname(p_id));
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return "WEB-INF/view/04_event/EventInsert.jsp";
	}
	
	
	
	
}