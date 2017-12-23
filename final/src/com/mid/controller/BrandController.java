package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.BrandDTO;
import com.mid.inter.IBrandContentDAO;
import com.mid.inter.IBrandDAO;

@Controller
public class BrandController {

	@Autowired
	private SqlSession sqlSession;

	// 브랜드 최신순 리스트 출력
	@RequestMapping(value = "/brand.action", method = RequestMethod.GET)
	public String recipe(ModelMap model) {

		IBrandDAO dao = sqlSession.getMapper(IBrandDAO.class);

		model.addAttribute("brandBest", dao.brandBest());		// 이주의 베스트
		model.addAttribute("brandCount", dao.brandCount());		// 브랜드 총 개수
		model.addAttribute("brandList", dao.brandList());		// 브랜드 리스트

		// 카테고리 출력
		model.addAttribute("typeList", dao.typeCategory());
		model.addAttribute("stateList", dao.stuCategory());
		model.addAttribute("bsList", dao.bsCategory());

		return "/WEB-INF/view/05_brand/BrandViewList.jsp";
	}

	// 브랜드 카테고리별 출력
	@RequestMapping(value = "/brandCategory.action", method = RequestMethod.GET)
	public String recipeCategory(ModelMap model, HttpServletRequest request) {
		
		IBrandDAO dao = sqlSession.getMapper(IBrandDAO.class);
	
		String categoryType = request.getParameter("type");
		String categoryName = request.getParameter("name");
		
		/*System.out.println(categoryType+", "+categoryName);*/
		
		// 카테고리 순서일 경우
		if (categoryType.equals("type") || categoryType.equals("state")) {
			model.addAttribute("brandList", dao.brandCategory(categoryName));
			model.addAttribute("brandCount", dao.brandCategoryCount(categoryName));
		}
		// 브랜드 순서일 경우
		else if (categoryType.equals("bs")) {
			System.out.println("2");
			model.addAttribute("brandList", dao.bsCategoryList(categoryName));
			model.addAttribute("brandCount", dao.bsCategoryCount(categoryName));
		}
		
		model.addAttribute("brandBest", dao.brandBest());		// 이주의 베스트
		
		// 카테고리 출력
		model.addAttribute("typeList", dao.typeCategory());
		model.addAttribute("stateList", dao.stuCategory());
		model.addAttribute("bsList", dao.bsCategory());
		
		return "/WEB-INF/view/05_brand/BrandViewList.jsp";
	}

	// 브랜드 조회
	@RequestMapping(value = "/brandContent.action", method = RequestMethod.GET)
	public String recipeForm(ModelMap model, BrandDTO b, HttpServletRequest request) 
	{

		HttpSession session = request.getSession();
		IBrandContentDAO dao = sqlSession.getMapper(IBrandContentDAO.class);
		
		BrandDTO dto = dao.brandContent(b.getB_id());
		
		if (session.getAttribute("id") == null || !(session.getAttribute("id").equals(dto.getP_id())))     // 비로그인
		{
			session.setAttribute("btn", 1);
		}
		else 									   // 로그인
			session.setAttribute("btn", 2);

		model.addAttribute("brand", dto);
		model.addAttribute("brandStar", dao.brandStar(b.getB_id()));
		model.addAttribute("brandStarJoin", dao.brandStarJoin(b.getB_id()));
		model.addAttribute("brandIng", dao.brandIng(b.getB_id()));
		model.addAttribute("brandStep", dao.brandStep(b.getB_id()));
		model.addAttribute("brandPic", dao.brandPicture(b.getB_id()));
		
		return "/WEB-INF/view/05_brand/BrandViewContent.jsp";
	}

}
