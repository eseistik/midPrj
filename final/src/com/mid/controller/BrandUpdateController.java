package com.mid.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.BrandInsertDTO;
import com.mid.dto.BrandUpdateDTO;
import com.mid.inter.IBrandUpdateDAO;
import com.mid.inter.InterBrandInsert;
import com.mid.inter.InterInsertForm;

@Controller
public class BrandUpdateController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/brandupdateform.action", method=RequestMethod.GET)
	public String RecipeUpdateForm(HttpServletRequest request, ModelMap model)
	{
		IBrandUpdateDAO dao = sqlSession.getMapper(IBrandUpdateDAO.class);
		InterInsertForm main = sqlSession.getMapper(InterInsertForm.class);
		
		String b_id = request.getParameter("b_id");
		
		b_id = "1";
		
		model.addAttribute("BingList",main.bingLists());
		model.addAttribute("MingList",main.mingLists());
		model.addAttribute("type",main.typeLists());
		model.addAttribute("stu",main.stuLists());
		model.addAttribute("pp",main.ppLists());
		model.addAttribute("ct",main.ctLists());
		model.addAttribute("dif",main.difLists());
		model.addAttribute("unit",main.unitLists());
		
		model.addAttribute("step",dao.Step(b_id));
		model.addAttribute("mate",dao.Mate(b_id));
		model.addAttribute("cl",dao.Cl(b_id));
		model.addAttribute("main",dao.Main(b_id));
		
		
		
		return "WEB-INF/view/05_brand/BrandUpdateForm.jsp";
	}
	
	
	
	@RequestMapping(value="/brandupdate.action", method=RequestMethod.POST)
	public String RecipeUpdate(HttpServletRequest request, ModelMap model)
	{
		IBrandUpdateDAO dao = sqlSession.getMapper(IBrandUpdateDAO.class);
		InterBrandInsert add = sqlSession.getMapper(InterBrandInsert.class);
		
		String b_id = request.getParameter("b_id");
		
		b_id = "1";
		
		BrandUpdateDTO dto = new BrandUpdateDTO();
		BrandInsertDTO adddto = new BrandInsertDTO(); 
		
		// 대표 이미지
		String b_main_img = "메인이미지.jpg";
		// request.getParameter("recipe_main_file");
		
		String b_title = request.getParameter("brand_title");
		String b_content = request.getParameter("brand_intro");
		String fd_stu_id = request.getParameter("brand_category_1");
		String fd_type_id = request.getParameter("brand_category_2");
		String fd_mid_ing_id = request.getParameter("brand_category_3");
		String pp_id = request.getParameter("brand_people");
		String ct_id = request.getParameter("brand_time");
		String dif_id = request.getParameter("brand_difficulty");
		String b_url = request.getParameter("brand_link");
		String b_img = "이미지";
		
		dto.setB_id(b_id);
		dto.setB_title(b_title);
		dto.setB_content(b_content);
		dto.setFd_stu_id(fd_stu_id);
		dto.setFd_type_id(fd_type_id);
		dto.setFd_mid_ing_id(fd_mid_ing_id);
		dto.setPp_id(pp_id);
		dto.setCt_id(ct_id);
		dto.setDif_id(dif_id);
		dto.setB_url(b_url);
		dto.setB_main_img(b_main_img);
		dto.setB_img(b_img);
		
		dao.MainUpdate(dto);
		
		
		int steplength = dao.StepLength(b_id);
		int matelength = dao.MateLength(b_id);
		int cllength = dao.ClLength(b_id);
		
		ArrayList<BrandUpdateDTO> stepid = dao.StepID(b_id);
		ArrayList<BrandUpdateDTO> mateid = dao.MateID(b_id);
		ArrayList<BrandUpdateDTO> clid = dao.ClID(b_id);
		
		
		
		// 스텝 이미지
		String[] b_step_img = {"스텝이미지1","스텝이미지2","스텝이미지3"};
		// request.getParameter("");
		
		// 완성 이미지
		String[] b_cl_img = {"완성이미지1","완성이미지2","완성이미지3","완성이미지4"};
		// request.getParameter("");
		
		String[] b_step_content = request.getParameterValues("stepText");
		
		
		if (steplength == b_step_content.length)
		{
			for(int i = 0; i<steplength; i++)
			{
				dto.setB_id(b_id);
				dto.setB_step_id(stepid.get(i).getB_step_id());
				dto.setB_step_content(b_step_content[i]);
				dto.setB_step_img(b_step_img[i]);
				
				dao.StepUpdate(dto);
				
			}
		}
		else if (steplength < b_step_content.length)
		{
			for(int i=0; i<b_step_content.length; i++)
			{
				if(i > steplength)
				{
					adddto.setB_id(b_id);
					adddto.setB_step_content(b_step_content[i]);
					adddto.setB_step_img(b_step_img[i]);
					
					add.brandStepInsert(adddto);
				}
				else
				{
					dto.setB_id(b_id);
					dto.setB_step_id(stepid.get(i).getB_step_id());
					dto.setB_step_content(b_step_content[i]);
					dto.setB_step_img(b_step_img[i]);
					
					dao.StepUpdate(dto);
				}
			}
			
		}
		else if (steplength > b_step_content.length)
		{
			for(int i=0; i<steplength; i++)
			{
				if(i>b_step_content.length)
				{
					dto.setB_id(b_id);
					dto.setB_step_id(stepid.get(i).getB_step_id());
					
					dao.StepDelete(dto);
				}
				else
				{
					dto.setB_id(b_id);
					dto.setB_step_id(stepid.get(i).getB_step_id());
					dto.setB_step_content(b_step_content[i]);
					dto.setB_step_img(b_step_img[i]);
					
					dao.StepUpdate(dto);
				}
			}
		}
		
		
		String[] mid_ing_id = request.getParameterValues("mid");
		String[] b_ing_weight = request.getParameterValues("mass");
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
					String mid = add.brandMidId(mid_ing_id[i]);
					String unit = add.brandUnit(unit_id[i]);
					dto.setB_id(b_id);
					dto.setMid_ing_id(mid);
					dto.setB_ing_weight(b_ing_weight[i]);
					dto.setUnit_id(unit);
					dto.setB_ing_id(mateid.get(i).getB_ing_id());
					
					dao.MateUpdate(dto);
				}
				else
				{
					int j = i - mid_ing_id.length;
					adddto.setBig_ing_id(bigEmpty[j]);
					adddto.setMid_ing_name(midEmpty[j]);
					
					add.brandMidInsert(adddto);
					
					String a = add.brandMid(midEmpty[j]);
					dto.setB_id(b_id);
					dto.setMid_ing_id(a);
					dto.setB_ing_weight(massEmpty[j]);
					dto.setUnit_id(unitEmpty[j]);
					dto.setB_ing_id(mateid.get(i).getB_ing_id());
					
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
					dto.setB_id(b_id);
					
					String mid = add.brandMidId(mid_ing_id[i]);
					String unit = add.brandUnit(unit_id[i]);
					
					
					dto.setMid_ing_id(mid);
					dto.setB_ing_weight(b_ing_weight[i]);
					dto.setUnit_id(unit);
					dto.setB_ing_id(mateid.get(i).getB_ing_id());
					
					dao.MateUpdate(dto);
				}
				else if ( i >= mid_ing_id.length && biglength != 0)
				{
					int j = i - mid_ing_id.length;
					adddto.setBig_ing_id(bigEmpty[j]);
					adddto.setMid_ing_name(midEmpty[j]);
					
					add.brandMidInsert(adddto);
					
					String a = add.brandMid(midEmpty[j]);
					dto.setB_id(b_id);
					dto.setMid_ing_id(a);
					dto.setB_ing_weight(massEmpty[j]);
					dto.setUnit_id(unitEmpty[j]);
					dto.setB_ing_id(mateid.get(i).getB_ing_id());
					
					dao.MateUpdate(dto);
				}
				else if (mid_ing_id[i] == null && midEmpty[i] == null)
				{
					dto.setB_id(b_id);
					dto.setB_ing_id(mateid.get(i).getB_ing_id());
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
					dto.setB_id(b_id);
					
					String mid = add.brandMidId(mid_ing_id[i]);
					String unit = add.brandUnit(unit_id[i]);
					
					dto.setMid_ing_id(mid);
					dto.setB_ing_weight(b_ing_weight[i]);
					dto.setUnit_id(unit);
					dto.setB_ing_id(mateid.get(i).getB_ing_id());
					
					dao.MateUpdate(dto);
				}
				else if ( i >= mid_ing_id.length && biglength != 0)
				{
					int j = i - mid_ing_id.length;
					adddto.setBig_ing_id(bigEmpty[j]);
					adddto.setMid_ing_name(midEmpty[j]);
					
					add.brandMidInsert(adddto);
					
					String a = add.brandMid(midEmpty[j]);
					dto.setB_id(b_id);
					dto.setMid_ing_id(a);
					dto.setB_ing_weight(massEmpty[j]);
					dto.setUnit_id(unitEmpty[j]);
					
					dao.MateUpdate(dto);
				}
				else if (i > matelength && i < mid_ing_id.length)
				{
					String mid = add.brandMidId(mid_ing_id[i]);
					String unit = add.brandUnit(unit_id[i]);
					
					
					adddto.setB_id(b_id);
					adddto.setMid_ing_id(mid);
					adddto.setB_ing_weight(b_ing_weight[i]);
					adddto.setUnit_id(unit);
					
					add.brandIngInsert(adddto);
				}
			}
		}
		
		
		int setClLength = 0;
		
		if (b_cl_img != null)
			setClLength = b_cl_img.length;
		
		if (cllength == setClLength)
		{
			for(int i=0; i<setClLength; i++)
			{
				dto.setB_id(b_id);
				dto.setB_cl_id(clid.get(i).getB_cl_id());
				dto.setB_cl_img(b_cl_img[i]);
				
				dao.ClUpdate(dto);
			}
		}
		else if (cllength < setClLength)
		{
			for(int i=0; i<setClLength; i++)
			{
				if(i<cllength)
				{
					dto.setB_id(b_id);
					dto.setB_cl_id(clid.get(i).getB_cl_id());
					dto.setB_cl_img(b_cl_img[i]);
					
					dao.ClUpdate(dto);
				}
				else if (i>=cllength)
				{
					
					adddto.setB_id(b_id);
					adddto.setB_cl_img(b_cl_img[i]);
					
					add.brandClInsert(adddto);
				}
			}
		}
		else if (cllength > setClLength)
		{
			for(int i=0; i<setClLength; i++)
			{
				if(i<cllength)
				{
					dto.setB_id(b_id);
					dto.setB_cl_id(clid.get(i).getB_cl_id());
					dto.setB_cl_img(b_cl_img[i]);
					
					dao.ClUpdate(dto);
				}
				else if (i>=cllength)
				{
					
					dto.setB_id(b_id);
					dto.setB_cl_id(clid.get(i).getB_cl_id());
					
					dao.ClDelete(dto);
				}
			}
		}
		
		return "/brandupdate.action";
	}
	
	
	
	@RequestMapping(value="/branddelete.action", method=RequestMethod.GET)
	public String RecipeDelete(HttpServletRequest request, ModelMap model)
	{
		//IBrandUpdateDAO dao = sqlSession.getMapper(IBrandUpdateDAO.class);
		
		//String b_id = request.getParameter("b_id");
		
		//b_id = "1";
		
		
		
		
		return "WEB-INF/view/05_brand/BrandUpdateForm.jsp";
	}

}
