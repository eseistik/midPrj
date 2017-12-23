package com.mid.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.inter.ITalkDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.mid.dto.TalkDTO;

@Controller
public class TalkController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/talkviewlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String talkViewList(ModelMap model)
	{
		ITalkDAO dao = sqlSession.getMapper(ITalkDAO.class);
		ArrayList<TalkDTO> viewLists = dao.talkviewLists();
		ArrayList<Integer> countList = new ArrayList<>();

		for (TalkDTO dto : viewLists)
		{
			countList.add(dao.talkcommentCounts(dto.getT_id()));
		}

		model.addAttribute("viewLists", viewLists);
		model.addAttribute("countList", countList);

		return "/WEB-INF/view/03_talk/TalkViewList.jsp";
	}

	@RequestMapping(value = "/talkInsertForm.action", method = RequestMethod.GET)
	public String talkInsert(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		if (session.getAttribute("id") == null)
		{
			return "/loginmain.action";
		}
		
		return "/WEB-INF/view/03_talk/TalkInsert.jsp";
	}

	@RequestMapping(value = "/inserttalk.action", method = RequestMethod.POST)
	public String insert(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		String root = request.getServletContext().getRealPath("/");
		String path = root + "talk" + File.separator + "images";
		String cp = "talk" + File.separator + "images";
		File dir = new File(path);

		if(!dir.exists())
		{	
			dir.mkdirs();
		}
		String encType= "UTF-8";

		int maxFileSize = 5 * 1024 * 1024;

		MultipartRequest req = null;
		String t_img = "";
		
		try
		{
			req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());		
		
			if (req.getFilesystemName("t_img") == null)
			{
				t_img = "";
			}
			else
			{
				t_img = cp + File.separator + req.getFilesystemName("t_img");
			}
				
			System.out.println(t_img);
		
			ITalkDAO dao = sqlSession.getMapper(ITalkDAO.class);
	
			dao.talkInsert((String)session.getAttribute("id"), req.getParameter("t_content"), t_img );

		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return "/talkviewlist.action";
	}

	
	@RequestMapping(value = "/talkViewContent.action", method = RequestMethod.GET)
	public String talkViewContent(ModelMap model, HttpServletRequest request)
	{
		ITalkDAO dao = sqlSession.getMapper(ITalkDAO.class);
		TalkDTO viewContents = dao.talkviewContents(Integer.parseInt(request.getParameter("t_id")));
		ArrayList<TalkDTO> viewComments = dao.talkviewComments(Integer.parseInt(request.getParameter("t_id")));
		
		model.addAttribute("viewContents", viewContents);
		model.addAttribute("viewComments", viewComments);

		return "/WEB-INF/view/03_talk/TalkViewContent.jsp";
	}
	
	@RequestMapping(value = "/talkCommentInsert.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String commentInsert(ModelMap model, HttpServletRequest request) 
	{
		ITalkDAO dao = sqlSession.getMapper(ITalkDAO.class);

		dao.talkcommentInsert(Integer.parseInt(request.getParameter("t_id")), request.getParameter("u_id"),
				request.getParameter("t_co_content"));

		return "/talkViewContent.action";
	}
	
	@RequestMapping(value = "/talkmodifyContent.action", method = RequestMethod.GET)
	public String modifyContent(ModelMap model, HttpServletRequest request)
	{
		ITalkDAO dao = sqlSession.getMapper(ITalkDAO.class);
		TalkDTO viewContents = dao.talkviewContents(Integer.parseInt(request.getParameter("t_id")));
		
		model.addAttribute("viewContents", viewContents);
		
		return "/WEB-INF/view/03_talk/TalkmodifyContent.jsp";
	}
	
	@RequestMapping(value = "/talkmodify.action", method = RequestMethod.GET)
	public String modify(HttpServletRequest request)
	{
		ITalkDAO dao = sqlSession.getMapper(ITalkDAO.class);
		
		dao.talkmodifyContent(Integer.parseInt(request.getParameter("t_id")), request.getParameter("u_id"),
				request.getParameter("t_co_content"));
		
		return "/WEB-INF/view/03_talk/TalkViewContent.jsp";
	}
}
