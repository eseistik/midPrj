package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mid.dto.FindDTO;
import com.mid.dto.LSignInsertDTO;
import com.mid.dto.LoginDTO;
import com.mid.dto.USignInsertDTO;
import com.mid.inter.IFindDAO;
import com.mid.inter.ILSignInsertDAO;
import com.mid.inter.ILoginDAO;
import com.mid.inter.ISignDAO;
import com.mid.inter.IUSignInsertDAO;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/loginmain.action", method=RequestMethod.GET)
	public String Main(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		if (session.getAttribute("id") == null)
		{
			return "WEB-INF/view/08_login/LoginMain.jsp";
		};

		
		return "WEB-INF/view/00_main/Main.jsp";
	}
	
	@RequestMapping(value="/ulogin.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String ULoginCheck(ModelMap model, HttpServletRequest request)
	{
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		HttpSession session = request.getSession();
		String u_id = request.getParameter("i_id");
		String u_pw = request.getParameter("i_pw");
		String type = request.getParameter("radio");
		
		try
		{
			LoginDTO dto = new LoginDTO();
			dto.setU_id(u_id);
			dto.setU_pw(u_pw);
			
			int ch =  dao.uCheck(dto);
			
			if (ch != 1)
			{
				return "WEB-INF/view/08_login/LoginMain.jsp";
			}
			else if (ch == 1)
			{
				session.setAttribute("f", dao.fCheck(u_id));
				session.setAttribute("type", type);
				session.setAttribute("id", u_id);
				
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/main.action";
	}
	
	@RequestMapping(value="/plogin.action", method=RequestMethod.POST)
	public String PLoginCheck(ModelMap model, HttpServletRequest request)
	{
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		
		String p_id = request.getParameter("i_id");
		String p_pw = request.getParameter("i_pw");
		String type = request.getParameter("radio");
		try
		{
			LoginDTO dto = new LoginDTO();
			
			dto.setP_id(p_id);
			dto.setP_pw(p_pw);
			
			int ch =  dao.pCheck(dto);
			
			if (ch != 1)
			{
				return "WEB-INF/view/00_main/LoginMain.jsp";
			}
			else if (ch == 1)
			{
				HttpSession session = request.getSession();
				session.setAttribute("type", type);
				session.setAttribute("id", p_id);
				System.out.println(session.getAttribute("type"));
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return "WEB-INF/view/00_main/Main.jsp";
	}
	
	
	// 회원가입 종류 선택
	@RequestMapping(value="/membershipselect.action", method=RequestMethod.GET)
	public String mSelect(HttpServletRequest request) 
	{
		return "/WEB-INF/view/08_login/MembershipSelect.jsp";
	}
	
	// 일반 이용약관 동의
	@RequestMapping(value="/generalAgree.action", method=RequestMethod.GET)
	public String agree(HttpServletRequest request)
	{
		return "/WEB-INF/view/08_login/GeneralAgree.jsp";
	}
	
	// 사업자 이용약관 동의
	@RequestMapping(value="/licenseeAgree.action", method=RequestMethod.GET)
	public String liAgree(HttpServletRequest request)
	{
		return "/WEB-INF/view/08_login/LicenseeAgree.jsp";
	}
	
	// 일반회원가입 양식
	@RequestMapping(value="/signup.action", method=RequestMethod.GET)
	public String signup(ModelMap model, HttpServletRequest request)
	{
		
		ISignDAO dao = sqlSession.getMapper(ISignDAO.class);
		
		try
		{
			model.addAttribute("pqList", dao.pqList());
			model.addAttribute("fList", dao.fList());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/08_login/Signup.jsp";
	}
	
	@RequestMapping(value = "/signinsert.action", method=RequestMethod.POST)
	public String signupinsert(ModelMap model, HttpServletRequest request)
	{
		
		IUSignInsertDAO dao = sqlSession.getMapper(IUSignInsertDAO.class);

		String u_id = request.getParameter("inputId");
		String u_pw = request.getParameter("inputPassword1");
		String pq_id = request.getParameter("inputPassword3");
		String pq_an = request.getParameter("inputPassword4");
		String u_email = request.getParameter("inputEmail")+"@"+ request.getParameter("backEmail");  
		String u_nickname = request.getParameter("inputNickname");
		String u_phone = request.getParameter("phoneNum1")+"-"+request.getParameter("inputPhoneNum1")+"-"+ request.getParameter("inputPhoneNum2");
		String f_id = request.getParameter("FavorRecipe");

		System.out.println(f_id);
		USignInsertDTO dto = new USignInsertDTO();
		
		dto.setU_id(u_id);
		dto.setU_pw(u_pw);
		dto.setPq_id(pq_id);
		dto.setPq_an(pq_an);
		dto.setU_email(u_email);
		dto.setU_nickname(u_nickname);
		dto.setU_phone(u_phone);
		dto.setF_id(f_id);
		
		try
		{
			dao.uSignInsert(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/08_login/SignupFin.jsp";
	}
	
	// 사업자회원가입 양식
	@RequestMapping(value="/lsignup.action", method=RequestMethod.GET)
	public String lsignup(HttpServletRequest request)
	{
		
		return "/WEB-INF/view/login/LSignup.jsp";
	}
	
	// 사업자회원가입 끝?
	@RequestMapping(value="/lsignupFin.action", method=RequestMethod.GET)
	public String lsignupFin(HttpServletRequest request)
	{
		
		return "/WEB-INF/view/login/LSignupFin.jsp";
	}
	
	
	// 아이디 확인
	@RequestMapping(value="/ucheckid.action", method=RequestMethod.GET)
	public String ucheckid(HttpServletRequest request)
	{
		ISignDAO dao = sqlSession.getMapper(ISignDAO.class);
		
		String u_id = request.getParameter("u_id");
		
		request.setAttribute("u_id", dao.uCheckId(u_id));
		
		return "/ajax/AjaxResultXMLCheck.jsp";
	}
	
	// 닉네임 확인
	@RequestMapping(value="/uchecknick.action", method=RequestMethod.GET)
	public String ucheckNick(HttpServletRequest request)
	{
		ISignDAO dao = sqlSession.getMapper(ISignDAO.class);
		
		String u_nickname = request.getParameter("u_nick");
		
		request.setAttribute("u_nickname", dao.uCheckNick(u_nickname));
		
		return "/ajax/AjaxResultXMLCheckNick.jsp";
	}

	@RequestMapping(value="/findmembershipselect.action", method=RequestMethod.GET)
	public String findIdMember(HttpServletRequest request)
	{
		String findid = request.getParameter("findid");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("findid", findid);
		
		return "/WEB-INF/view/08_login/FindMembershipSelect.jsp";
	}
	
	@RequestMapping(value="/findkind.action", method=RequestMethod.GET)
	public String findkind(HttpServletRequest request)
	{
		String type = request.getParameter("type");

		HttpSession session = request.getSession();
		
		session.setAttribute("type", type);
		
		if (session.getAttribute("findid").equals("1"))
		{
			return "/WEB-INF/view/08_login/FindId1.jsp";
		}
		else
		
		return "/WEB-INF/view/08_login/FindPw1.jsp";
	}
	
/*	@RequestMapping(value="/emailcheck.action", method=RequestMethod.GET)
	public String emailCheck(ModelMap model, HttpServletRequest request)
	{
		IFindIdDAO dao = sqlSession.getMapper(IFindIdDAO.class);

		HttpSession session = request.getSession();
		String type = (String) session.getAttribute("type");
		
		String email1 = request.getParameter("inputEmail");
		String email2 = request.getParameter("emailSelect");
		
		String email = email1 + "@" + email2;

		return "/WEB-INF/view/08_login/FindId1.jsp";
	}*/
	
	@RequestMapping(value="/findidnext.action", method=RequestMethod.GET)
	public String findIdnext(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		IFindDAO dao = sqlSession.getMapper(IFindDAO.class);
		
		String type = (String) session.getAttribute("type");
		
		String email1 = request.getParameter("inputEmail");
		String email2 = request.getParameter("emailSelect");
		String email = null;
		email = email1 + "@" + email2;
		
		try
		{
			
			if (type.equals("1"))
			{
				FindDTO dto = dao.ufindInfo(email);
				model.addAttribute("infoList",dto);
			}
			else if (type.equals("2"))
			{
				FindDTO dto = dao.pfindInfo(email);
				model.addAttribute("infoList",dto);
			}
			
			session.invalidate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/08_login/FindId2.jsp";
	}
	
	@RequestMapping(value="/findcancel.action", method=RequestMethod.GET)
	public String findCancel(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return "/loginmain.action";
	}
	
	
	@RequestMapping(value="/findpwnext.action", method=RequestMethod.GET)
	public String findPwnext(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String id = request.getParameter("inputid");
		
		session.setAttribute("id", id);
		
		return "/WEB-INF/view/08_login/FindPw2.jsp";
	}

	@RequestMapping(value="/findpwkind.action", method=RequestMethod.GET)
	public String findPwKind(ModelMap model, HttpServletRequest request)
	{
		String kind = request.getParameter("select");
		
		if (kind.equals("1"))
		{
			return "/WEB-INF/view/08_login/FindPw2.jsp";
		}
		else 
			return "/findpwpq.action";
		
	}
	
	@RequestMapping(value="/findpwpq.action", method=RequestMethod.GET)
	public String findPwPq(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		ISignDAO sdao = sqlSession.getMapper(ISignDAO.class);
		IFindDAO fdao = sqlSession.getMapper(IFindDAO.class);
		
		try
		{
			fdao.pqCheck(id);
			model.addAttribute("pqList", sdao.pqList());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/08_login/FindPw3.jsp";
	}
	
	
	@RequestMapping(value="/findpwchange.action", method=RequestMethod.POST)
	public String findPwChange(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		try
		{
			model.addAttribute("id", id);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/08_login/FindPw4.jsp";
	}

	@RequestMapping(value="/pwchange.action", method=RequestMethod.POST)
	public String pwChange(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String c_pw = request.getParameter("inputPw1");
		
		IFindDAO dao = sqlSession.getMapper(IFindDAO.class);
		FindDTO dto = new FindDTO();
		
		try
		{
			dto.setId(id);
			dto.setC_pw(c_pw);
			
			dao.pwChange(dto);
			session.invalidate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return "/WEB-INF/view/08_login/ChangePw.jsp";
	}
	
	@RequestMapping(value="/logout.action", method=RequestMethod.GET)
	public String logOut(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "main.action";
	}
	
	@RequestMapping(value="/lsigninsert.action", method=RequestMethod.POST)
	   public String lsignupinsert(ModelMap model, HttpServletRequest request)
	   {
	      
	      ILSignInsertDAO dao = sqlSession.getMapper(ILSignInsertDAO.class);

	      String p_id = request.getParameter("inputId");
	      String p_pw = request.getParameter("inputPassword1");
	      String pq_id = request.getParameter("inputPassword3");
	      String p_pq_answer = request.getParameter("inputPassword4");
	      String p_info_email = request.getParameter("inputEmail")+"@"+ request.getParameter("backEmail");  
	      String p_name = request.getParameter("inputNickname");
	      String p_info_phone = request.getParameter("phoneNum")+"-"+request.getParameter("inputPhoneNum1")+"-"+ request.getParameter("inputPhoneNum2");
	      String p_info_name = request.getParameter("pName");
	      String p_info_num = request.getParameter("pNum");
	      String p_info_ssn1 = request.getParameter("ssn1");
	      String p_info_ssn2 = request.getParameter("ssn2");
	      

	      LSignInsertDTO dto = new LSignInsertDTO();
	      
	      int bs_id = dao.getBs_id(p_name);
	      dto.setBs_id(bs_id);
	      dto.setP_id(p_id);
	      dto.setP_pw(p_pw);
	      dto.setPq_id(pq_id);
	      dto.setP_pq_answer(p_pq_answer);
	      dto.setP_info_email(p_info_email);
	      dto.setP_info_phone(p_info_phone);
	      dto.setP_info_name(p_info_name);
	      dto.setP_info_num(p_info_num);
	      dto.setP_info_ssn1(p_info_ssn1);
	      dto.setP_info_ssn2(p_info_ssn2);
	      
	      
	      dao.lSignInfoInsert(dto);
	      int p_info_id = dao.getInfo_id();
	      dto.setP_info_id(p_info_id);
	      dao.lSignInsert(dto);

	      return "/WEB-INF/view/08_login/LSignupFin.jsp";
	   }

}
