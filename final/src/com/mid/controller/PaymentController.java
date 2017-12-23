package com.mid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/payment.action", method=RequestMethod.GET)
	public String CcPayment(ModelMap model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		session.getAttribute("id");
		
		if (session.getAttribute("id") == null)
		{
			return "loginmain.action";
		}
		
		return "/WEB-INF/view/10_payment/Payment.jsp";
	}
}
