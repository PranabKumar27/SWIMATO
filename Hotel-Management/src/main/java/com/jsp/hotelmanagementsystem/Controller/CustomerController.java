package com.jsp.hotelmanagementsystem.Controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.CustomerDao;
import com.jsp.hotelmanagementsystem.entities.Admin;
import com.jsp.hotelmanagementsystem.entities.Customer;

@Controller
public class CustomerController
{
	@Autowired
	CustomerDao dao;
	
	@RequestMapping("/addcustomer")
	public ModelAndView addCustomer(ModelAndView mav)
	{
		Customer customer =new Customer();
		mav.addObject("customerobj",customer);
		mav.setViewName("Customerform");
		return mav;
	}
	
	@RequestMapping("/savecustomer")
	//handler used to save admin details into database
	public ModelAndView saveCustomer(@ModelAttribute("customerobj") Customer customer,ModelAndView mav)
	{
		dao.saveCustomer(customer);
		
		mav.addObject("message","Account Created Successfully");
		mav.setViewName("Customerloginform");
		return mav;
	}
	
	@RequestMapping("/customerloginvalidation")
	public ModelAndView customerLogInValidation(ModelAndView mav,HttpSession session,ServletRequest request)
	{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Customer customer=dao.login(email, password);
		
		if(customer != null)
		{
			session.setAttribute("customerid", customer.getId());
			session.setAttribute("customername", customer.getName());
			mav.setViewName("Customeroption");
			return mav;
		}
		else
		{
			mav.addObject("message", "*invalid Credential.Please Enter Correct Credential");
			mav.setViewName("Customerloginform");
			return mav;
		}
	}

}
