package com.mid.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.RecipeRequestDTO;
import com.mid.inter.IRecipeRequestDAO;

@Controller
public class RecipeRequestController {

	@Autowired
	private SqlSession sqlSession;
	
	// 레시피 요청 리스트
	@RequestMapping(value="/recipeRequest.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String recipeRequestList(ModelMap model) {
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		//model.addAttribute("recipeRequestList", dao.recipeRequestList());
		ArrayList<RecipeRequestDTO> recipeList = dao.recipeRequestList();
		ArrayList<Integer> requestStu = new ArrayList<>();
		
		for (RecipeRequestDTO d : recipeList) {
			requestStu.add(Integer.parseInt(d.getRr_id()));
		}
		
		model.addAttribute("recipeRequestList", recipeList);
		model.addAttribute("recipeRequestCount", dao.recipeRequestCount());
		model.addAttribute("recipeStu", requestStu);
		
		return "/WEB-INF/view/01_recipe/RecipeRequestViewList.jsp";
	}
	
	// 레시피 검색 결과
	@RequestMapping(value="/recipeRequestSearch.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeRequestSearch(ModelMap model, HttpServletRequest request) {
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		ArrayList<Integer> requestStu = new ArrayList<>();
		
		String key = "%";
		key += request.getParameter("key");
		key += "%";
		//System.out.println(key);
		ArrayList<RecipeRequestDTO> recipeList = dao.recipeRequestSearch(key);
		
		for (RecipeRequestDTO d : recipeList) {
			requestStu.add(Integer.parseInt(d.getRr_id()));
		}
		
		model.addAttribute("recipeRequestList", recipeList);
		model.addAttribute("recipeRequestCount", recipeList.size());
		model.addAttribute("recipeStu", requestStu);
		
		return "/WEB-INF/view/01_recipe/RecipeRequestViewList.jsp";
	}
	
	// 레시피 요청 조회
	@RequestMapping(value="/recipeRequestContent.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeRequestContent(ModelMap model, HttpServletRequest request) {
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		model.addAttribute("recipeContent", dao.recipeContent(request.getParameter("rr_id")));
		model.addAttribute("recipeRequestCommentList", dao.recipeRequestCommentList(request.getParameter("rr_id")));
		model.addAttribute("CommentCount", dao.recipeRequestCommentCount(request.getParameter("rr_id")));
		model.addAttribute("recipeStu", dao.recipeRequestStu(request.getParameter("rr_id")));
		
		return "/WEB-INF/view/01_recipe/RecipeRequestViewContent.jsp";
	}
	
	// 레시피 요청 작성
	@RequestMapping(value="/recipereqeustinsertform.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeReqeustInsertForm() {

		return "/WEB-INF/view/01_recipe/RecipeRequestInsert.jsp";
	}
	
	// 레시피 입력
	@RequestMapping(value="/requestinsert.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeReqeustInsert(ModelMap model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		dao.recipeRequestInsert(request.getParameter("inputPoint"), request.getParameter("inputTitle")
				, request.getParameter("inputContent"), (String)session.getAttribute("id"));
		
		return "recipeRequest.action";
	}
	
	// 레시피 수정 Form
		@RequestMapping(value="/recipeModifyForm.action", method={RequestMethod.GET, RequestMethod.POST})
		public String recipeReqeustModifyForm(ModelMap model, HttpServletRequest request) {
			
			IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
			
			model.addAttribute("recipeContent", dao.recipeContent(request.getParameter("rr_id")));
			
			return "/WEB-INF/view/01_recipe/RecipeRequestModify.jsp";
		}
	
	// 레시피 수정
	@RequestMapping(value="/recipeModify.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeReqeustModify(ModelMap model, HttpServletRequest request) {
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		dao.recipeRequestModify(request.getParameter("inputPoint"), request.getParameter("inputTitle")
				, request.getParameter("inputContent"), request.getParameter("rr_id"));
		
		return "recipeRequest.action";
	}
	
	
	// 댓글 Insert
	@RequestMapping(value="/recipeRequsetCommentInsert.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeRequestCommentInsert(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		dao.recipeRequestCommentInsert(request.getParameter("rr_id")
				, (String)session.getAttribute("id"), request.getParameter("rr_co_content"), request.getParameter("rr_co_url"));
		
		return "recipeRequestContent.action";
	}
	
	// 댓글 채택
	@RequestMapping(value="/recipeRequestSelect.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeRequestSelect(ModelMap model, HttpServletRequest request) {
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		dao.recipeRequestCommentSelect(request.getParameter("rr_co_id"));
		
		return "recipeRequestContent.action";
	}
	
	// 댓글 공감
	@RequestMapping(value="/recipeRequestLike.action", method={RequestMethod.GET, RequestMethod.POST})
	public String recipeRequestLike(ModelMap model, HttpServletRequest request) {
		
		IRecipeRequestDAO dao = sqlSession.getMapper(IRecipeRequestDAO.class);
		
		dao.recipeRequestCommentLike(request.getParameter("rr_co_id"));
		
		return "recipeRequestContent.action";
	}
}
