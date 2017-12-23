package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.RecipeDTO;
import com.mid.inter.IRecipeContentDAO;
import com.mid.inter.IRecipeDAO;

@Controller
public class RecipeController {

	@Autowired
	private SqlSession sqlSession;

	// 레시피 최신순 리스트 출력
	@RequestMapping(value = "/recipe.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String recipe(ModelMap model, HttpServletRequest request) 
	{
		IRecipeDAO dao = sqlSession.getMapper(IRecipeDAO.class);
		
		model.addAttribute("recipeBest", dao.recipeBest());
		model.addAttribute("recipeCount", dao.recipeCount());
		model.addAttribute("recipeList", dao.recipeList());
		
		// 카테고리 출력
		model.addAttribute("typeList", dao.typeCategory());
		model.addAttribute("stateList", dao.stuCategory());

		return "/WEB-INF/view/01_recipe/RecipeViewList.jsp";
	}

	// 레시피 추천순 출력
	@RequestMapping(value = "/recipeRecommend.action", method = RequestMethod.GET)
	public String recipeRecommend(ModelMap model) {

		IRecipeDAO dao = sqlSession.getMapper(IRecipeDAO.class);

		model.addAttribute("recipeBest", dao.recipeBest());
		model.addAttribute("recipeCount", dao.recipeCount());
		model.addAttribute("recipeList", dao.recipeRate());

		// 카테고리 출력
		model.addAttribute("typeList", dao.typeCategory());
		model.addAttribute("stateList", dao.stuCategory());

		return "/WEB-INF/view/01_recipe/RecipeViewList.jsp";
	}
	
	// 레시피 카테고리별 출력
	@RequestMapping(value = "/recipeCategory.action", method = RequestMethod.GET)
	public String recipeCategory(ModelMap model, HttpServletRequest request) {
		
		IRecipeDAO dao = sqlSession.getMapper(IRecipeDAO.class);
	
		/*String categoryType = request.getParameter("type");*/
		String categoryName = request.getParameter("name");
		
		//테스트
		/*System.out.println(categoryType+", "+categoryName);*/
		
		model.addAttribute("recipeList", dao.recipeCategory(categoryName));
		
		model.addAttribute("recipeBest", dao.recipeBest());
		model.addAttribute("recipeCount", dao.recipeCategoryCount(categoryName));
		
		// 카테고리 출력
		model.addAttribute("typeList", dao.typeCategory());
		model.addAttribute("stateList", dao.stuCategory());
		
		return "/WEB-INF/view/01_recipe/RecipeViewList.jsp";
	}

	// 레시피 조회
	@RequestMapping(value = "/recipeContent.action", method = RequestMethod.GET)
	public String recipeForm(ModelMap model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		IRecipeContentDAO dao = sqlSession.getMapper(IRecipeContentDAO.class);

		String r_id = request.getParameter("r_id");
		RecipeDTO recipe = dao.recipeContent(r_id);
		
		if (session.getAttribute("id") == null || !(session.getAttribute("id").equals(recipe.getU_id() ) ) )     // 비로그인
		{
			session.setAttribute("btn", 1);
		}
		else 									   // 로그인
			session.setAttribute("btn", 2);
		
		if (recipe.getR_tag() == null)
		{
			recipe.setR_tag("");
		}
		else
			recipe.setR_tag("#" + recipe.getR_tag().replaceAll(", ", ",#"));
		

		
		model.addAttribute("recipe", recipe);
		model.addAttribute("recipeContent", dao.recipeContent(r_id));
		model.addAttribute("recipeStar", dao.recipeStar(r_id));
		model.addAttribute("recipeStarJoin", dao.recipeStarJoin(r_id));
		model.addAttribute("recipeIng", dao.recipeIng(r_id));
		model.addAttribute("recipeStep", dao.recipeStep(r_id));
		model.addAttribute("recipePic", dao.recipePicture(r_id));
		model.addAttribute("recipeComment", dao.recipeComment(r_id));

		return "/WEB-INF/view/01_recipe/RecipeViewContent.jsp";
	}

	// 댓글 Insert
	@RequestMapping(value = "/recipeCommentInsert.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String CommentInsert(ModelMap model, HttpServletRequest request) {

		IRecipeContentDAO dao = sqlSession.getMapper(IRecipeContentDAO.class);
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		
		dao.commentInsert(request.getParameter("r_id"), u_id ,request.getParameter("r_co_content"));

		return "recipeContent.action";
	}

}