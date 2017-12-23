package com.mid.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.CookingInsertDTO;

import org.springframework.stereotype.Controller;


@Controller
public class CookingInsertController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/cookinginsert.action", method=RequestMethod.POST)
	public String cookinginsertformlist(HttpServletRequest request)
	{
		com.mid.inter.InterCookingInsert dao = sqlSession.getMapper(com.mid.inter.InterCookingInsert.class);
		
		String cc_id = dao.cookingSequence();
		
		String cc_title = request.getParameter("cooking_title");
		String cc_content = request.getParameter("class_intro");
		String sma_ck_id = request.getParameter("cooking_category_3");
		String pp_id = request.getParameter("cooking_people");
		String ct_id = request.getParameter("cooking_time");
		String dif_id = request.getParameter("cooking_difficulty");
		
		
		String cc_post_num = request.getParameter("postNum");
		String cc_addr = request.getParameter("addr");
		String cc_addr_add = request.getParameter("addr");
		
		String cc_ck_title = request.getParameter("cooking_subTitle");
		String cc_ck_content = request.getParameter("cooking_intro");
		
		String cc_re_start = request.getParameter("cooking_start");
		String cc_re_end = request.getParameter("cooking_end");
		
		String cc_people = request.getParameter("cooking_mozip");
		
		
		String[] mid_ing_id = request.getParameterValues("mid");
		String[] cc_ing_weight = request.getParameterValues("mass");
		String[] unit_id = request.getParameterValues("unit");
		String[] cc_ing_price = request.getParameterValues("price");
		
		String[] cc_time_name = request.getParameterValues("menu");
		String[] cc_time_date = request.getParameterValues("date");
		
		String[] cc_time_starta = request.getParameterValues("CST");
		String[] cc_time_startb = request.getParameterValues("CSH");
		String[] cc_time_startc = request.getParameterValues("CSM");
		String[] cc_time_enda = request.getParameterValues("CET");
		String[] cc_time_endb = request.getParameterValues("CEH");
		String[] cc_time_endc = request.getParameterValues("CEM");
		
		
		// 추가 재료
		String[] bigEmpty = request.getParameterValues("bigEmpty");
		String[] midEmpty = request.getParameterValues("midEmpty");
		String[] massEmpty = request.getParameterValues("massEmpty");
		String[] unitEmpty = request.getParameterValues("unitEmpty");
		String[] priceEmpty = request.getParameterValues("priceEmpty");
		
		String[] cc_etc_content = request.getParameterValues("mt");
		String[] cc_etc_price = request.getParameterValues("mp");
		
		
		String u_id = "coyo4";
		
		
		// 대표 이미지
		String cc_img = "메인이미지.jpg";
		
		// 완성 이미지
		String[] cc_cl_img = {"완성이미지1","완성이미지2","완성이미지3","완성이미지4"};
		
		
		
		HashMap<String, Object> groupTextMap = new HashMap<String, Object>();
        groupTextMap.put("cc_id", cc_id);
        groupTextMap.put("u_id", u_id);
        groupTextMap.put("cc_title", cc_title);
        groupTextMap.put("cc_img", cc_img);
        groupTextMap.put("cc_content", cc_content);
        groupTextMap.put("sma_ck_id", sma_ck_id);
        groupTextMap.put("cc_ck_title", cc_ck_title);
        groupTextMap.put("cc_people", cc_people);
        groupTextMap.put("pp_id", pp_id);
        groupTextMap.put("ct_id", ct_id);
        groupTextMap.put("dif_id", dif_id);
        groupTextMap.put("cc_re_start", cc_re_start);
        groupTextMap.put("cc_re_end", cc_re_end);
        groupTextMap.put("cc_post_num", cc_post_num);
        groupTextMap.put("cc_addr", cc_addr);
        groupTextMap.put("cc_addr_add", cc_addr_add);
        groupTextMap.put("cc_ck_content", cc_ck_content);
        dao.cookingInsert(groupTextMap);
        
        
        // 시간 인서트
        CookingInsertDTO dto = new CookingInsertDTO();
        
        String cc_time_start ="";
		String cc_time_end ="";
		
		if (cc_time_starta != null)
		{
			for (int i = 0 ; i<cc_time_starta.length; i++)
			{
				
				cc_time_start = cc_time_starta[i]+ "_"+cc_time_startb[i]+":"+cc_time_startc[i]; 
				cc_time_end = cc_time_enda[i]+ "_"+cc_time_endb[i]+":"+cc_time_endc[i]; 
				
				dto.setCc_id(cc_id);
				dto.setCc_time_name(cc_time_name[i]);
				dto.setCc_time_date(cc_time_date[i]);
				dto.setCc_time_start(cc_time_start);
				dto.setCc_time_end(cc_time_end);
				
				dao.cookingTimeInsert(dto);
				
			}
		}
		
        
       

		// 재료 인서트
		for (int i = 0 ; i<mid_ing_id.length; i++)
		{
			dto.setCc_id(cc_id);
			
			String mid = dao.cookingMidId(mid_ing_id[i]);
			String unit = dao.cookingUnit(unit_id[i]);
			
			dto.setMid_ing_id(mid);
			dto.setCc_ing_weight(cc_ing_weight[i]);
			dto.setUnit_id(unit);
			dto.setCc_ing_price(cc_ing_price[i]);
			
			dao.cookingIngInsert(dto);
		}
		
		// 추가 재료 인서트
		if (bigEmpty != null)
		{
			for (int i = 0 ; i<bigEmpty.length; i++)
			{
				dto.setBig_ing_id(bigEmpty[i]);
				dto.setMid_ing_name(midEmpty[i]);
				
				dao.cookingMidInsert(dto);
				
				String a = dao.cookingMid(midEmpty[i]);
				dto.setCc_id(cc_id);
				dto.setMid_ing_id(a);
				dto.setCc_ing_weight(massEmpty[i]);
				dto.setUnit_id(unitEmpty[i]);
				dto.setCc_ing_price(priceEmpty[i]);
				
				dao.cookingEmptyInsert(dto);
			}
		}
		
		// 추가 금액 인서트
		if (cc_etc_content != null)
		{
			for (int i = 0 ; i<cc_etc_content.length; i++)
			{
				dto.setCc_id(cc_id);
				dto.setCc_etc_content(cc_etc_content[i]);
				dto.setCc_etc_price(cc_etc_price[i]);
				
				dao.cookingEtcInsert(dto);
			}
		}
		
		
		// 완성 사진 인서트
		for (int i = 0 ; i<cc_cl_img.length; i++)
		{
			dto.setCc_id(cc_id);
			dto.setCc_cl_img(cc_cl_img[i]);
			dao.cookingClInsert(dto);
		}

		return "WEB-INF/view/02_cooking/CookingInsertForm.jsp";
	}


}
