package com.jsp.hotelmanagementsystem.Controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.AdminDao;
import com.jsp.hotelmanagementsystem.entities.Admin;

@Controller
public class AdminController 
{
	@Autowired
	AdminDao dao;
	
	@RequestMapping("/addAdmin")
	//handler used to create admin object and forward to adminform.
	public ModelAndView addAdmin(ModelAndView mav)
	{
		Admin admin=new Admin();
		mav.addObject("adminobj",admin);
		mav.setViewName("Adminform");
		return mav;
	}
	
	@RequestMapping("/saveAdmin")
	//handler used to save admin details into database
	public ModelAndView saveAdmin(@ModelAttribute("adminobj") Admin admin,ModelAndView mav)
	{
		dao.saveAdmin(admin);
		
		mav.addObject("message","Account Created Successfully");
		mav.setViewName("Adminlogin");
		return mav;
	}
	
	@RequestMapping("/adminValidation")
	//handler used to perform login validation for admin.
	public ModelAndView adminValidation(HttpSession session,ModelAndView mav,ServletRequest request)
	{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Admin admin=dao.login(email, password);
		
		if(admin != null)
		{
			session.setAttribute("admininfo", admin);
			mav.setViewName("Adminoption");
			return mav;
		}
		else
		{
			mav.addObject("message", "*invalid Credential.Please Enter Correct Credential");
			mav.setViewName("Adminlogin");
			return mav;
		}
	}
	
	@RequestMapping("/adminlogout")
	//handler is used to delete the admin data in HttpSession
	public ModelAndView adminLogOut(ModelAndView mav,HttpSession session)
	{
		session.invalidate();
		mav.addObject("message","Log Out Succefully");
		mav.setViewName("adminhome");
		return mav;
	}
}
