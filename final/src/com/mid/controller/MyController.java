package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.MyInfoDTO;
import com.mid.inter.IMyDAO;

@Controller
public class MyController {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 수정 전 회원 데이터 출력
	@RequestMapping(value="/infoModify.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myInfoModify(ModelMap model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		model.addAttribute("myInfo", dao.myInfo(u_id));	// 회원 데이터
		model.addAttribute("qList", dao.qList());				// 질문 리스트
		
		return "/WEB-INF/view/07_my/MyInfoModify.jsp";
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/infoUpdate.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myInfoUpdate(ModelMap model, HttpServletRequest request) {
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		
		MyInfoDTO info = new MyInfoDTO();
		
		info.setU_id(request.getParameter("inputId"));
		info.setU_pw(request.getParameter("inputPassword1"));
		info.setU_nickname(request.getParameter("inputNickname"));
		info.setPq_id(request.getParameter("inputPassword3"));
		info.setU_pq_answer(request.getParameter("inputPassword4"));
		info.setF_id(request.getParameter("FavorRecipe"));
		
		dao.myInfoUpdate(info);
		
		model.addAttribute("u_id", request.getParameter("inputId"));
		
		return "redirect:infoModify.action";
	}

	// 회원 탈퇴
	@RequestMapping(value="/infoDrop.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myInfoDrop(ModelMap model, HttpServletRequest request) {
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		dao.myInfoDrop(request.getParameter("inputId"));

		return "/WEB-INF/view/07_my/DropFinally.jsp";
	}
	
	/// My 쿠킹 클래스(수강, 수강 예정)
	@RequestMapping(value="/myCooking.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myReservationCooking(ModelMap model, HttpServletRequest request) {
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		model.addAttribute("cookingclass", dao.myCookingclassList(u_id));
		
		return "/WEB-INF/view/07_my/MyCookingClassViewList.jsp";
	}
	
	/// My 쿠킹 클래스(종료)
	@RequestMapping(value="/myCookingEnd.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myReservationEndCooking(ModelMap model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		model.addAttribute("cookingclass", dao.myCookingclassEndList(u_id));
		
		return "/WEB-INF/view/07_my/MyCookingClassViewEndList.jsp";
	}
	
	// My 쿠킹 클래스(과정 진행, 진행 예정)
	@RequestMapping(value="/myCookingCource.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myCookingCource(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		model.addAttribute("cookingclass", dao.myCookingclassCourceList(u_id));
		
		return "/WEB-INF/view/07_my/MyCookingClassCourceList.jsp";
	}
	
	// My 쿠킹 클래스(과정 종료)
	@RequestMapping(value="/myCookingEndCource.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myCookingEndCource(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		model.addAttribute("cookingclass", dao.myCookingclassEndCourceList(u_id));
		
		return "/WEB-INF/view/07_my/MyCookingClassEndCourceList.jsp";
	}
	
	// My 쿠킹 클래스 팝업
	@RequestMapping(value="/cookingclassInfo.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myCookingInfo(ModelMap model, HttpServletRequest request) {
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		model.addAttribute("cookingInfo", dao.myCookingclassTime(request.getParameter("u_id"), request.getParameter("cc_id")));
		
		return "/WEB-INF/view/07_my/MyCookingClassInfo.jsp";
	}
	
	// My 쿠킹 클래스 팝업
	@RequestMapping(value="/cookingInfo.action")
	public String myReservation(ModelMap model, HttpServletRequest request) {
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		model.addAttribute("cookingInfo", dao.myCookingTime(request.getParameter("cc_id")));
		
		return "/WEB-INF/view/07_my/MyCookingClassInfo.jsp";
	}
	
	// My 포인트
	@RequestMapping(value="/myPoint.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myPonit(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
		
		model.addAttribute("pointList", dao.myPointList(u_id));
		
		return "/WEB-INF/view/07_my/MyPointList.jsp";
	}
	
	// My 쿠폰
	@RequestMapping(value="/myCoupon.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myCoupon(ModelMap model) {
		
		return "/WEB-INF/view/07_my/MyCouponList.jsp";
	}
	
	// My 배너(진행 중)
	@RequestMapping(value="/myBanner.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myBanner(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
	
		model.addAttribute("bannerList", dao.myBannerList(u_id));
		
		return "/WEB-INF/view/07_my/MyBannerViewList.jsp";
	}
	
	// My 배너(예정)
	@RequestMapping(value="/myBannerReservation.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myReservationBanner(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
	
		model.addAttribute("bannerList", dao.myReservationBannerList(u_id));
		
		return "/WEB-INF/view/07_my/MyBannerReservationViewList.jsp";
	}
	
	// My 배너(종료)
	@RequestMapping(value="/myBannerEnd.action", method={RequestMethod.GET, RequestMethod.POST})
	public String myEndBanner(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("id");
		IMyDAO dao = sqlSession.getMapper(IMyDAO.class);
	
		model.addAttribute("bannerList", dao.myEndBannerList(u_id));
		
		return "/WEB-INF/view/07_my/MyBannerEndViewList.jsp";
	}
}
