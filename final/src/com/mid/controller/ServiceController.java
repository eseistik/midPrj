package com.mid.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.QnaCommentDTO;
import com.mid.dto.ServiceDTO;
import com.mid.inter.IServiceDAO;


@Controller
public class ServiceController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 고객센터 메인
	@RequestMapping(value="/customermain.action", method=RequestMethod.GET)
	public String customerMain(ModelMap model) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		model.addAttribute("faqList", dao.faqList());
		
		return "/WEB-INF/view/06_service/CustomerServiceMain.jsp";
	}
	
	// 이용약관
	@RequestMapping(value="/customeragreelist.action", method=RequestMethod.GET)
	public String customerAgree(ModelMap model) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		model.addAttribute("tmList", dao.tmList());
		
		return "/WEB-INF/view/06_service/CustomerAgreeList.jsp";
	}
	
	// 쿠킹 클래스 절차
	@RequestMapping(value="/customercookingclassinfo.action", method=RequestMethod.GET)
	public String customerCookingclassInfo() {
		
		return "/WEB-INF/view/06_service/CustomerServiceCookingClass.jsp";
	}
	
	// 배너 광고
	@RequestMapping(value="/customerbannerinfo.action", method=RequestMethod.GET)
	public String customerBannerInfo() {
		
		return "/WEB-INF/view/06_service/";
	}
	
	// 사업자 등록 절차
	@RequestMapping(value="/customerpartnerinfo.action", method=RequestMethod.GET)
	public String customerPartnerInfo() {
		
		return "/WEB-INF/view/06_service/CustomerServiceEP.jsp";
	}
	
	// 1:1 문의 리스트
	@RequestMapping(value="/customertablelist.action", method=RequestMethod.GET)
	public String lists(ModelMap model) 
	{
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		ArrayList<ServiceDTO> qnaList = dao.list();
		ArrayList<Integer> qnaStateList = new ArrayList<>();
		
		for (ServiceDTO qna : qnaList) {
			qnaStateList.add(dao.qnaContentState(qna.getQna_id()));
		}
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", qnaList);
		model.addAttribute("state", qnaStateList);
		
		return "/WEB-INF/view/06_service/CustomerTableList.jsp";
	}
	
	// 1:1 문의 제목 검색
	@RequestMapping(value="/customerresearch.action", method={RequestMethod.GET, RequestMethod.POST})
	public String qnaResearch(ModelMap model, HttpServletRequest request) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		String research = request.getParameter("researchInput");
		
		String key = "%";
		if (research == null) {
			key += "";
		}
		else {
			key += research;
		}
		key += "%";
		//System.out.println(key);
		
		model.addAttribute("list", dao.qnaResearch(key));
		model.addAttribute("count", dao.qnaResearch(key).size());
		
		return "/WEB-INF/view/06_service/CustomerTableList.jsp";
	}
	
	// 1:1 문의 조회
	@RequestMapping(value="/customercontent.action", method={RequestMethod.GET, RequestMethod.POST})
	public String qnaContent(ModelMap model, HttpServletRequest request) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		model.addAttribute("qnaContent", dao.qnaContent(request.getParameter("qna_id")));
		model.addAttribute("qnaComment", dao.qnaComment(request.getParameter("qna_id")));
		model.addAttribute("qnaState", dao.qnaContentState(request.getParameter("qna_id")));
		
		return "/WEB-INF/view/06_service/CustmomerViewContent.jsp";
	}
	
	// 문의 댓글 입력
	@RequestMapping(value="/customercommentinesert.action", method={RequestMethod.GET, RequestMethod.POST})
	public String qnaCommentInsert(QnaCommentDTO d) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		dao.qnaCommentInsert(d);
		
		return "redirect:customercontent.action";
	}
	
	// 1:1 문의 입력 폼
	@RequestMapping(value="/customerinsertform.action", method={RequestMethod.GET, RequestMethod.POST})
	public String qnaInsertForm(ModelMap model) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		model.addAttribute("typeList", dao.qnaTypeList());
		
		return "/WEB-INF/view/06_service/CustomerInsert.jsp";
	}
	
	// 1:1 문의 입력
	@RequestMapping(value="/customerinsert.action", method={RequestMethod.GET, RequestMethod.POST})
	public String qnaInsert(ModelMap model, ServiceDTO dto) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		if (dto.getQna_url() == null || dto.getQna_url() == "")
			dto.setQna_url("");
		if (dto.getQna_file() == null || dto.getQna_file() == "")
			dto.setQna_file("");
		
		
		dao.qnaInsert(dto);
		
		return "redirect:customertablelist.action";
	}
	
	@RequestMapping(value="/customerdelete.action", method={RequestMethod.GET, RequestMethod.POST})
	public String qnadelete(ModelMap model, HttpServletRequest request) {
		
		IServiceDAO dao = sqlSession.getMapper(IServiceDAO.class);
		
		dao.qnaDelete(request.getParameter("qna_id"));
		
		return "redirect:customertablelist.action";
	}
		
	
	
	
	
}
