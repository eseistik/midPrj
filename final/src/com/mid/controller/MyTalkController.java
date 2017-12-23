package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.inter.IMyTalkDAO;

@Controller
public class MyTalkController {

	@Autowired
	private SqlSession sqlSession;
	
	// my 알림
	@RequestMapping(value="/myTalk.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myAlert(ModelMap model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyTalkDAO dao = sqlSession.getMapper(IMyTalkDAO.class);
		
		model.addAttribute("alertList", dao.myAlertList(u_id));
		model.addAttribute("myTalkInfo", dao.myTalkInfo(u_id));
		model.addAttribute("followerCount", dao.followerCount(u_id));
		model.addAttribute("followingCount", dao.followingCount(u_id));
		
		return "/WEB-INF/view/07_my/MyBlogMainViewList.jsp";
	}
	
	// my 레시피
	@RequestMapping(value="/myTalkRecipe.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myTalkRecipe(ModelMap model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyTalkDAO dao = sqlSession.getMapper(IMyTalkDAO.class);
		
		model.addAttribute("myRecipeList", dao.myRecipeList(u_id));
		model.addAttribute("myTalkInfo", dao.myTalkInfo(u_id));
		model.addAttribute("followerCount", dao.followerCount(u_id));
		model.addAttribute("followingCount", dao.followingCount(u_id	));
		
		return "/WEB-INF/view/07_my/MyBlogRecipeViewList.jsp";
	}
	
	// my 댓글
	@RequestMapping(value="/myTalkComment.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myTalkComment(ModelMap model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyTalkDAO dao = sqlSession.getMapper(IMyTalkDAO.class);
		
		model.addAttribute("myTalkInfo", dao.myTalkInfo(u_id));
		
		return "/WEB-INF/view/07_my/MyBlogCommentViewList.jsp";
	}
	
	// my 토크
	@RequestMapping(value="/myTalkTalk.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myTalkTalk(ModelMap model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyTalkDAO dao = sqlSession.getMapper(IMyTalkDAO.class);
		
		model.addAttribute("myTalkList", dao.myTalkList(u_id));
		model.addAttribute("myTalkInfo", dao.myTalkInfo(u_id));
		model.addAttribute("followerCount", dao.followerCount(u_id));
		model.addAttribute("followingCount", dao.followingCount(u_id));
		
		return "/WEB-INF/view/07_my/MyBlogTalkViewList.jsp";
	}
	
	// 팔로워 리스트
	@RequestMapping(value="followerList.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myFollowerList(ModelMap model, HttpServletRequest request) {
		
		IMyTalkDAO dao = sqlSession.getMapper(IMyTalkDAO.class);
	
		model.addAttribute("followerList", dao.myFollowerList(request.getParameter("u_id")));
		model.addAttribute("followerCount", dao.followerCount(request.getParameter("u_id")));
		
		return "/WEB-INF/view/07_my/FollowerList.jsp";
	}
	
	// 팔로잉 리스트
	@RequestMapping(value="followingList.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myFollowingList(ModelMap model, HttpServletRequest request) {
		
		IMyTalkDAO dao = sqlSession.getMapper(IMyTalkDAO.class);
		
		model.addAttribute("followingList", dao.myFollowingList(request.getParameter("u_id")));
		model.addAttribute("followingCount", dao.followingCount(request.getParameter("u_id")));
		
		return "/WEB-INF/view/07_my/FollowingList.jsp";
	}
	
	// 팔로우 Insert
	@RequestMapping(value="", method={RequestMethod.GET, RequestMethod.POST})
	public String myFollowInsert(ModelMap model, HttpServletRequest request) {
		
		IMyTalkDAO dao = sqlSession.getMapper(IMyTalkDAO.class);
		
		// 첫 번째 매개변수에 session의 사용자 id 넣기
		dao.myFollowInsert(request.getParameter("u_id"), request.getParameter("u_id"));
		
		return "redirect:";
	}
}
