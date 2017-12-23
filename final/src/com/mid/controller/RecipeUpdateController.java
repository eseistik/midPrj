package com.mid.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.InsertDTO;
import com.mid.dto.RecipeUpdateDTO;
import com.mid.inter.IRecipeDAO;
import com.mid.inter.IRecipeUpdateDAO;
import com.mid.inter.InterInsert;
import com.mid.inter.InterInsertForm;

@Controller
public class RecipeUpdateController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/recipeupdateform.action", method=RequestMethod.GET)
	public String RecipeUpdateForm(HttpServletRequest request, ModelMap model)
	{
		IRecipeUpdateDAO dao = sqlSession.getMapper(IRecipeUpdateDAO.class);
		InterInsertForm main = sqlSession.getMapper(InterInsertForm.class);
		
		
		String r_id = request.getParameter("r_id");
		
		
		model.addAttribute("BingList",main.bingLists());
		model.addAttribute("MingList",main.mingLists());
		model.addAttribute("type",main.typeLists());
		model.addAttribute("stu",main.stuLists());
		model.addAttribute("pp",main.ppLists());
		model.addAttribute("ct",main.ctLists());
		model.addAttribute("dif",main.difLists());
		model.addAttribute("unit",main.unitLists());
		
		model.addAttribute("step",dao.Step(r_id));
		model.addAttribute("mate",dao.Mate(r_id));
		model.addAttribute("cl",dao.Cl(r_id));
		model.addAttribute("main",dao.Main(r_id));
		model.addAttribute("r_id",r_id);
		
		
		
		return "WEB-INF/view/01_recipe/RecipeUpdateForm.jsp";
	}
	
	@RequestMapping(value = "/recipedeleteform.action", method = {RequestMethod.GET, RequestMethod.POST})
	   public String recipeDelete(ModelMap model, HttpServletRequest request) 
	   {
	      IRecipeDAO dao = sqlSession.getMapper(IRecipeDAO.class);
	      
	      String r_id = request.getParameter("r_id");
	      
	      dao.DeleteRecipe(r_id);

	      return "/recipe.action";
	   }
	
	
	
	@RequestMapping(value="/recipeupdate.action", method=RequestMethod.POST)
	public String RecipeUpdate(HttpServletRequest request, ModelMap model)
	{
		IRecipeUpdateDAO dao = sqlSession.getMapper(IRecipeUpdateDAO.class);
		InterInsert add = sqlSession.getMapper(InterInsert.class);
		
		String r_id = request.getParameter("r_id");
		
		
		RecipeUpdateDTO dto = new RecipeUpdateDTO();
		InsertDTO adddto = new InsertDTO();
		
		
		// String r_main_img = request.getParameter("recipe_main_file");
		
		String r_title = request.getParameter("recipe_title");
		String r_content = request.getParameter("recipe_intro");
		String fd_stu_id = request.getParameter("recipe_category_1");
		String fd_type_id = request.getParameter("recipe_category_2");
		String fd_mid_ing_id = request.getParameter("recipe_category_3");
		String pp_id = request.getParameter("recipe_people");
		String ct_id = request.getParameter("recipe_time");
		String dif_id = request.getParameter("recipe_difficulty");
		String r_tag = request.getParameter("tag_txet");
		
		dto.setR_id(r_id);
		dto.setR_title(r_title);
		dto.setR_content(r_content);
		dto.setFd_stu_id(fd_stu_id);
		dto.setFd_type_id(fd_type_id);
		dto.setFd_mid_ing_id(fd_mid_ing_id);
		dto.setPp_id(pp_id);
		dto.setCt_id(ct_id);
		dto.setDif_id(dif_id);
		dto.setR_tag(r_tag);
		// dto.setR_main_img(r_main_img);
		
		dao.MainUpdate(dto);
		
		
		int steplength = dao.StepLength(r_id);
		int matelength = dao.MateLength(r_id);
		// int cllength = dao.ClLength(r_id);
		
		ArrayList<RecipeUpdateDTO> stepid = dao.StepID(r_id);
		ArrayList<RecipeUpdateDTO> mateid = dao.MateID(r_id);
		// ArrayList<RecipeUpdateDTO> clid = dao.ClID(r_id);
		
		
		// 스텝 이미지
		// String[] r_step_img = dao.StepImg(r_id);
		
		// 완성 이미지
		
		// String[] r_cl_img = dao.ClImg(r_id);
		
		String[] r_step_content = request.getParameterValues("stepText");
		
		
		if (steplength == r_step_content.length)
		{
			for(int i = 0; i<steplength; i++)
			{
				dto.setR_id(r_id);
				dto.setR_step_id(stepid.get(i).getR_step_id());
				dto.setR_step_content(r_step_content[i]);
				// dto.setR_step_img(r_step_img[i]);
				
				dao.StepUpdate(dto);
				
			}
		}
		else if (steplength < r_step_content.length)
		{
			for(int i=0; i<r_step_content.length; i++)
			{
				if(i > steplength)
				{
					adddto.setR_id(r_id);
					adddto.setR_step_content(r_step_content[i]);
					// adddto.setR_step_img(r_step_img[i]);
					
					add.recipeStepInsert(adddto);
				}
				else
				{
					dto.setR_id(r_id);
					dto.setR_step_id(stepid.get(i).getR_step_id());
					dto.setR_step_content(r_step_content[i]);
					// dto.setR_step_img(r_step_img[i]);
					
					dao.StepUpdate(dto);
				}
			}
			
		}
		else if (steplength > r_step_content.length)
		{
			for(int i=0; i<steplength; i++)
			{
				if(i>r_step_content.length)
				{
					dto.setR_id(r_id);
					dto.setR_step_id(stepid.get(i).getR_step_id());
					
					dao.StepDelete(dto);
				}
				else
				{
					dto.setR_id(r_id);
					dto.setR_step_id(stepid.get(i).getR_step_id());
					dto.setR_step_content(r_step_content[i]);
					// dto.setR_step_img(r_step_img[i]);
					
					dao.StepUpdate(dto);
				}
			}
		}
		
		
		String[] mid_ing_id = request.getParameterValues("mid");
		String[] r_ing_weight = request.getParameterValues("mass");
		String[] unit_id = request.getParameterValues("unit");
		
		// 추가 재료
		String[] bigEmpty = request.getParameterValues("bigEmpty");
		String[] midEmpty = request.getParameterValues("midEmpty");
		String[] massEmpty = request.getParameterValues("massEmpty");
		String[] unitEmpty = request.getParameterValues("unitEmpty");
		
		
		int biglength = 0;
		
		if (bigEmpty == null)
			biglength =0;
		else
			biglength = bigEmpty.length;
		
		
		if (matelength == (mid_ing_id.length + biglength))
		{
			for(int i=0; i<matelength; i++)
			{
				if( i < mid_ing_id.length)
				{
					String mid = add.recipeMidId(mid_ing_id[i]);
					String unit = add.recipeUnit(unit_id[i]);
					dto.setR_id(r_id);
					dto.setMid_ing_id(mid);
					dto.setR_ing_weight(r_ing_weight[i]);
					dto.setUnit_id(unit);
					dto.setR_ing_id(mateid.get(i).getR_ing_id());
					
					dao.MateUpdate(dto);
				}
				else
				{
					int j = i - mid_ing_id.length;
					adddto.setBig_ing_id(bigEmpty[j]);
					adddto.setMid_ing_name(midEmpty[j]);
					
					add.recipeMidInsert(adddto);
					
					String a = add.recipeMid(midEmpty[j]);
					dto.setR_id(r_id);
					dto.setMid_ing_id(a);
					dto.setR_ing_weight(massEmpty[j]);
					dto.setUnit_id(unitEmpty[j]);
					dto.setR_ing_id(mateid.get(i).getR_ing_id());
					
					dao.MateUpdate(dto);
				}
				
			}
		}
		else if (matelength > (mid_ing_id.length + biglength))
		{
			for (int i=0; i<matelength; i++)
			{
				if( i < mid_ing_id.length)
				{
					dto.setR_id(r_id);
					
					String mid = add.recipeMidId(mid_ing_id[i]);
					String unit = add.recipeUnit(unit_id[i]);
					
					
					dto.setMid_ing_id(mid);
					dto.setR_ing_weight(r_ing_weight[i]);
					dto.setUnit_id(unit);
					dto.setR_ing_id(mateid.get(i).getR_ing_id());
					
					dao.MateUpdate(dto);
				}
				else if ( i >= mid_ing_id.length && biglength != 0)
				{
					int j = i - mid_ing_id.length;
					adddto.setBig_ing_id(bigEmpty[j]);
					adddto.setMid_ing_name(midEmpty[j]);
					
					add.recipeMidInsert(adddto);
					
					String a = add.recipeMid(midEmpty[j]);
					dto.setR_id(r_id);
					dto.setMid_ing_id(a);
					dto.setR_ing_weight(massEmpty[j]);
					dto.setUnit_id(unitEmpty[j]);
					dto.setR_ing_id(mateid.get(i).getR_ing_id());
					
					dao.MateUpdate(dto);
				}
				else if (mid_ing_id[i] == null && midEmpty[i] == null)
				{
					dto.setR_id(r_id);
					dto.setR_ing_id(mateid.get(i).getR_ing_id());
					dao.MateDelete(dto);
				}
			}
		}
		else if (matelength < (mid_ing_id.length + biglength))
		{
			for (int i=0; i<(mid_ing_id.length + biglength); i++)
			{
				if( i < mid_ing_id.length)
				{
					dto.setR_id(r_id);
					
					String mid = add.recipeMidId(mid_ing_id[i]);
					String unit = add.recipeUnit(unit_id[i]);
					
					dto.setMid_ing_id(mid);
					dto.setR_ing_weight(r_ing_weight[i]);
					dto.setUnit_id(unit);
					dto.setR_ing_id(mateid.get(i).getR_ing_id());
					
					dao.MateUpdate(dto);
				}
				else if ( i >= mid_ing_id.length && biglength != 0)
				{
					int j = i - mid_ing_id.length;
					adddto.setBig_ing_id(bigEmpty[j]);
					adddto.setMid_ing_name(midEmpty[j]);
					
					add.recipeMidInsert(adddto);
					
					String a = add.recipeMid(midEmpty[j]);
					dto.setR_id(r_id);
					dto.setMid_ing_id(a);
					dto.setR_ing_weight(massEmpty[j]);
					dto.setUnit_id(unitEmpty[j]);
					dto.setR_ing_id(mateid.get(i).getR_ing_id());
					
					dao.MateUpdate(dto);
				}
				else if (i > matelength && i < mid_ing_id.length)
				{
					String mid = add.recipeMidId(mid_ing_id[i]);
					String unit = add.recipeUnit(unit_id[i]);
					
					
					adddto.setR_id(r_id);
					adddto.setMid_ing_id(mid);
					adddto.setR_ing_weight(r_ing_weight[i]);
					adddto.setUnit_id(unit);
					
					add.recipeIngInsert(adddto);
				}
			}
		}
		
		/*
		int setClLength = 0;
		
		if (r_cl_img != null)
			setClLength = r_cl_img.length;

		if (cllength == setClLength)
		{
			for(int i=0; i<setClLength; i++)
			{
				dto.setR_id(r_id);
				dto.setR_cl_id(clid.get(i).getR_cl_id());
				// dto.setR_cl_img(r_cl_img[i]);
				
				dao.ClUpdate(dto);
			}
		}
		else if (cllength < setClLength)
		{
			for(int i=0; i<setClLength; i++)
			{
				if(i<cllength)
				{
					dto.setR_id(r_id);
					dto.setR_cl_id(clid.get(i).getR_cl_id());
					// dto.setR_cl_img(r_cl_img[i]);
					
					dao.ClUpdate(dto);
				}
				else if (i>=cllength)
				{
					
					adddto.setR_id(r_id);
					// adddto.setR_cl_img(r_cl_img[i]);
					
					add.recipeClInsert(adddto);
				}
			}
		}
		else if (cllength > setClLength)
		{
			for(int i=0; i<setClLength; i++)
			{
				if(i<cllength)
				{
					dto.setR_id(r_id);
					dto.setR_cl_id(clid.get(i).getR_cl_id());
					// dto.setR_cl_img(r_cl_img[i]);
					
					dao.ClUpdate(dto);
				}
				else if (i>=cllength)
				{
					
					dto.setR_id(r_id);
					dto.setR_cl_id(clid.get(i).getR_cl_id());
					
					dao.ClDelete(dto);
				}
			}
		}*/
		
		return "/recipeupdate.action";
	}

	
	
	
}
