package com.mid.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.BrandInsertDTO;
import com.mid.inter.InterBrandInsert;


@Controller
public class BrandInsertController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/brandinsert.action", method=RequestMethod.POST)
	public String brandinsertformlist(HttpServletRequest request)
	{
		InterBrandInsert dao = sqlSession.getMapper(InterBrandInsert.class);
		
		String b_id = dao.brandSequence();
		
		String b_title = request.getParameter("brand_title");
		String b_content = request.getParameter("brand_intro");
		String fd_stu_id = request.getParameter("brand_category_1");
		String fd_type_id = request.getParameter("brand_category_2");
		String fd_mid_ing_id = request.getParameter("brand_category_3");
		String pp_id = request.getParameter("brand_people");
		String ct_id = request.getParameter("brand_time");
		String dif_id = request.getParameter("brand_difficulty");
		
		
		
		String[] mid_ing_id = request.getParameterValues("mid");
		String[] b_ing_weight = request.getParameterValues("mass");
		String[] unit_id = request.getParameterValues("unit");
		
		
		// 추가 재료
		String[] bigEmpty = request.getParameterValues("bigEmpty");
		String[] midEmpty = request.getParameterValues("midEmpty");
		String[] massEmpty = request.getParameterValues("massEmpty");
		String[] unitEmpty = request.getParameterValues("unitEmpty");
		
		String[] b_step_content = request.getParameterValues("stepText");
		
		String b_url = request.getParameter("brand_link");
		String b_img = "브랜드이미지.jpg";
		
		String p_id = "pcoyo4";
		
		String bs_name = dao.brandName(p_id);
		
		
		
		
		// 대표 이미지
		String b_main_img = "메인이미지.jpg";
		
		// 스텝 이미지
		String[] b_step_img = {"스텝이미지1","스텝이미지2"};
		
		// 완성 이미지
		String[] b_cl_img = {"완성이미지1","완성이미지2","완성이미지3","완성이미지4"};
		
		
		HashMap<String, Object> groupTextMap = new HashMap<String, Object>();
        groupTextMap.put("b_id", b_id);
        groupTextMap.put("p_id", p_id);
        groupTextMap.put("b_title", b_title);
        groupTextMap.put("b_content", b_content);
        groupTextMap.put("fd_stu_id", fd_stu_id);
        groupTextMap.put("fd_type_id", fd_type_id);
        groupTextMap.put("fd_mid_ing_id", fd_mid_ing_id);
        groupTextMap.put("pp_id", pp_id);
        groupTextMap.put("ct_id", ct_id);
        groupTextMap.put("dif_id", dif_id);
        groupTextMap.put("b_main_img", b_main_img);
        groupTextMap.put("b_url", b_url);
        groupTextMap.put("b_img", b_img);
        groupTextMap.put("bs_name", bs_name);
        
        dao.brandInsert(groupTextMap);
		
		
		
		
		
        BrandInsertDTO dto = new BrandInsertDTO();
		
		// 대표 이미지
		dto.setB_main_img(b_main_img);
		dto.setB_id(b_id);
		dto.setB_title(b_title);
		dto.setB_content(b_content);
		dto.setP_id(p_id);
		dto.setFd_stu_id(fd_stu_id);
		dto.setFd_type_id(fd_type_id);
		dto.setFd_mid_ing_id(fd_mid_ing_id);
		dto.setPp_id(pp_id);
		dto.setCt_id(ct_id);
		dto.setDif_id(dif_id);
		dto.setB_url(b_url);
		dto.setB_img(b_img);

		// 재료 인서트
		for (int i = 0 ; i<mid_ing_id.length; i++)
		{
			dto.setB_id(b_id);
			
			String mid = dao.brandMidId(mid_ing_id[i]);
			String unit = dao.brandUnit(unit_id[i]);
			
			dto.setMid_ing_id(mid);
			dto.setB_ing_weight(b_ing_weight[i]);
			dto.setUnit_id(unit);
			
			dao.brandIngInsert(dto);
		}
		
		// 추가 재료 인서트
		if (bigEmpty != null)
		{
			for (int i = 0 ; i<bigEmpty.length; i++)
			{
				dto.setBig_ing_id(bigEmpty[i]);
				dto.setMid_ing_name(midEmpty[i]);
				
				dao.brandMidInsert(dto);
				
				String a = dao.brandMid(midEmpty[i]);
				dto.setB_id(b_id);
				dto.setMid_ing_id(a);
				dto.setB_ing_weight(massEmpty[i]);
				dto.setUnit_id(unitEmpty[i]);
				
				dao.brandEmptyInsert(dto);
			}
		}
		
		
		
		for (int i = 0 ; i<b_step_content.length; i++)
		{
			dto.setB_id(b_id);
			dto.setB_step_content(b_step_content[i]);
			dto.setB_step_img(b_step_img[i]);
			dao.brandStepInsert(dto);
		}

		for (int i = 0 ; i<b_cl_img.length; i++)
		{
			dto.setB_id(b_id);
			dto.setB_cl_img(b_cl_img[i]);
			dao.brandClInsert(dto);
		}

		return "WEB-INF/view/02_cooking/CookingInsertForm.jsp";
	}


}
