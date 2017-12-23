package com.mid.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.InsertDTO;
import com.mid.inter.InterInsert;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class InsertController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/recipeinsert.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String recipeinsertformlist(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		
		
		String root = request.getServletContext().getRealPath("/");
		
		String path = root + "recipe" + File.separator + "images";
		String cp = "recipe" + File.separator + "images";

		File dir = new File(path);

		if(!dir.exists())
		{	
			dir.mkdirs();
		}
		String encType= "UTF-8";

		int maxFileSize = 5 * 1024 * 1024;

		MultipartRequest req = null;
		
		
		try
		{
			req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());		
			
			
				
			InterInsert dao = sqlSession.getMapper(InterInsert.class);
			
			String r_id = dao.recipeSequence();
			
			String u_id = (String) session.getAttribute("id");
			
			String r_title = req.getParameter("recipe_title");
			String r_content = req.getParameter("recipe_intro");
			String fd_stu_id = req.getParameter("recipe_category_1");
			String fd_type_id = req.getParameter("recipe_category_2");
			String fd_mid_ing_id = req.getParameter("recipe_category_3");
			String pp_id = req.getParameter("recipe_people");
			String ct_id = req.getParameter("recipe_time");
			String dif_id = req.getParameter("recipe_difficulty");
			
			String[] mid_ing_id = req.getParameterValues("mid");
			String[] r_ing_weight = req.getParameterValues("mass");
			String[] unit_id = req.getParameterValues("unit");
			
			// 추가 재료
			String[] bigEmpty = req.getParameterValues("bigEmpty");
			String[] midEmpty = req.getParameterValues("midEmpty");
			String[] massEmpty = req.getParameterValues("massEmpty");
			String[] unitEmpty = req.getParameterValues("unitEmpty");
			
			String[] r_step_content = req.getParameterValues("stepText");
			String r_tag = req.getParameter("tag_txet");
			
			// 대표 이미지
			String r_main_img = cp + File.separator + req.getFilesystemName("recipe_main_file");

			
			// 스텝 이미지
			String[] r_step_img = new String[r_step_content.length];
			
			for (int i=0; i<r_step_content.length; i++)
			{
				r_step_img[i]  =  cp + File.separator + req.getFilesystemName("step_file_"+(i+1));
			}
			
			// 완성 이미지
			String[] r_cl_img = new String[4];
			
			for (int i= 0; i<4; i++)
			{
				
				if (req.getFilesystemName("com_pic_"+ (i+1)) != null)
				{
					r_cl_img[i] = cp + File.separator + req.getFilesystemName("com_pic_"+ (i+1));
				}
				else 
					continue;
			}
	
			HashMap<String, Object> groupTextMap = new HashMap<String, Object>();
	        groupTextMap.put("r_id", r_id);
	        groupTextMap.put("u_id", u_id);
	        groupTextMap.put("r_title", r_title);
	        groupTextMap.put("r_content", r_content);
	        groupTextMap.put("fd_stu_id", fd_stu_id);
	        groupTextMap.put("fd_type_id", fd_type_id);
	        groupTextMap.put("fd_mid_ing_id", fd_mid_ing_id);
	        groupTextMap.put("pp_id", pp_id);
	        groupTextMap.put("ct_id", ct_id);
	        groupTextMap.put("dif_id", dif_id);
	        groupTextMap.put("r_main_img", r_main_img);
	        groupTextMap.put("r_tag", r_tag);
	        
	        dao.recipeInsert(groupTextMap);
			
			InsertDTO dto = new InsertDTO();
			
			// 대표 이미지
			dto.setR_main_img(r_main_img);
			dto.setR_id(r_id);
			dto.setR_title(r_title);
			dto.setR_content(r_content);
			dto.setU_id(u_id);
			dto.setFd_stu_id(fd_stu_id);
			dto.setFd_type_id(fd_type_id);
			dto.setFd_mid_ing_id(fd_mid_ing_id);
			dto.setPp_id(pp_id);
			dto.setCt_id(ct_id);
			dto.setDif_id(dif_id);
			dto.setR_tag(r_tag);

			// 재료 인서트
			for (int i = 0 ; i<mid_ing_id.length; i++)
			{
				dto.setR_id(r_id);
				
				String mid = dao.recipeMidId(mid_ing_id[i]);
				String unit = dao.recipeUnit(unit_id[i]);
				
				dto.setMid_ing_id(mid);
				dto.setR_ing_weight(r_ing_weight[i]);
				dto.setUnit_id(unit);
				
				dao.recipeIngInsert(dto);
			}
			
			// 추가 재료 인서트
			if (bigEmpty != null)
			{
				for (int i = 0 ; i<bigEmpty.length; i++)
				{
					dto.setBig_ing_id(bigEmpty[i]);
					dto.setMid_ing_name(midEmpty[i]);
					
					dao.recipeMidInsert(dto);
					
					String a = dao.recipeMid(midEmpty[i]);
					dto.setR_id(r_id);
					dto.setMid_ing_id(a);
					dto.setR_ing_weight(massEmpty[i]);
					dto.setUnit_id(unitEmpty[i]);
					
					dao.recipeEmptyInsert(dto);
				}
			}
			
			
			
			for (int i = 0 ; i<r_step_content.length; i++)
			{
				dto.setR_id(r_id);
				dto.setR_step_content(r_step_content[i]);
				dto.setR_step_img(r_step_img[i]);
				dao.recipeStepInsert(dto);
			}
	
			for (int i = 0 ; i<r_cl_img.length; i++)
			{
				dto.setR_id(r_id);
				dto.setR_cl_img(r_cl_img[i]);
				dao.recipeClInsert(dto);
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
			return "/recipe.action";
	}


}


	
































