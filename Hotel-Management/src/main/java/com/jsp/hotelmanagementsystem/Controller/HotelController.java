package com.jsp.hotelmanagementsystem.Controller;

import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.HotelDao;
import com.jsp.hotelmanagementsystem.entities.Hotel;

@Controller
public class HotelController
{
	@Autowired
	HotelDao dao;
	
	@RequestMapping("/addhotel")
	//handler used to create hotel class object and pass it to Hotelform.jsp
	public ModelAndView addHotel(ModelAndView mav)
	{
		Hotel hotel=new Hotel();
		mav.addObject("hotelobj",hotel);
		mav.setViewName("HotelForm");
		return mav;
	}
	
	@RequestMapping("/savehotel")
	//handler used to save Hotel Information in database.
	public ModelAndView saveHotel(ModelAndView mav,@ModelAttribute("hotelobj") Hotel hotel)
	{
		hotel.setStatus("Not approved");
		dao.saveHotel(hotel);
		
		mav.addObject("message","your account is in review,please wait for some time");
		mav.setViewName("HotelLogIn");
		return mav;
	}
	
	@RequestMapping("/loginvalidation")
	//handler used perform hotel login operation and erurns appropriate response
	public ModelAndView hotelLoginValidation(ServletRequest request, HttpSession session,ModelAndView mav) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Hotel hotel = dao.login(email, password);
		if (hotel != null) {
			if (hotel.getStatus().equals("Not approved"))
			{
			
				mav.addObject("message", "your account is in review, please wait for sometime");
				mav.setViewName("displaymessage");
				return mav;
			}
			else if (hotel.getStatus().equals("blocked")) 
			{
				
				mav.addObject("message", "your account is blocked");
				mav.setViewName("displaymessage");
				return mav;
			}
			else {
				//storing hotel entity object into session
				//storing the loggedin hotel into session
				session.setAttribute("hotelid", hotel.getId());
				session.setAttribute("hotelname", hotel.getName());
				
			    mav.addObject("message", "logged in successfully");
				mav.setViewName("HotelOptions");
				return mav;
			}
		}
		else {
			mav.addObject("message", "invalid credentials");
			mav.setViewName("HotelLogIn");
			return mav;
		}
	}
	
	@RequestMapping("/fetchunapprovedhotels")
	//handler is used to find unapproved hotels.
	public ModelAndView fetchUnapproveHotels(ModelAndView mav)
	{
		List<Hotel> hotels=dao.findUnapprovedhotels();
		mav.addObject("unapprovedhotels",hotels);
		mav.setViewName("displayunapprovedhotels");
		return mav;
	}
	
	@RequestMapping("/approvehotel")
	//handler is used to modify the hotel status as approved
	public ModelAndView approveHotel(@RequestParam("id") int id,ModelAndView mav)
	{
		Hotel hotel=dao.findHotelById(id);
		hotel.setStatus("approved");
		dao.updateHotel(hotel);
		
		mav.setViewName("redirect://fetchunapprovedhotels");
		return mav;
	}

}

