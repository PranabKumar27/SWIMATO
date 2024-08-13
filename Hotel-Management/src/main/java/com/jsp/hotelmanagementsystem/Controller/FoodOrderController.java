package com.jsp.hotelmanagementsystem.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.CustomerDao;
import com.jsp.hotelmanagementsystem.dao.FoodOrderDao;
import com.jsp.hotelmanagementsystem.entities.Customer;
import com.jsp.hotelmanagementsystem.entities.FoodOrder;
import com.jsp.hotelmanagementsystem.entities.Item;

@Controller
public class FoodOrderController 
{
	@Autowired
	CustomerDao cdao;
	
	@Autowired
	FoodOrderDao fdao;
	
	@RequestMapping("/addfoodorder")
	public ModelAndView addFoodOrder(ModelAndView mav,HttpSession session)
	{
		List<Item> items=(List) session.getAttribute("itemslist");
		FoodOrder foodOrder=new FoodOrder();
		foodOrder.setItems(items);
		
			
		mav.addObject("foodOrderObj",foodOrder);
		mav.setViewName("foodorderform");
		return mav;
		
	}
	
	@RequestMapping("/saveFoodOrder")
	public ModelAndView saveFoodOrder(ModelAndView mav,HttpSession session,@ModelAttribute("foodOrderObj") FoodOrder foodOrder)
	{ 	
		List<Item> items=(List<Item>) session.getAttribute("itemslist");
		foodOrder.setItems(items);
		double totalprice= items.stream().map(i->i.getCost()).mapToDouble(Double::new).sum();
		foodOrder.setTotalPrice(totalprice);
		Integer customerId=(Integer)session.getAttribute("customerid");
		Customer customer =cdao.findById(customerId);
		List<FoodOrder> foodOrders=customer.getFoodOders();
		if(foodOrders.size()>0)
		{
			foodOrders.add(foodOrder);
			
		}
		else
		{
			List<FoodOrder> foodOrderList=new ArrayList<>();
			foodOrderList.add(foodOrder);
			customer.setFoodOders(foodOrderList);
			
		}
		fdao.saveFoodOrder(foodOrder);
		cdao.updateCustomer(customer);
		
		session.removeAttribute("itemslist");
		
		mav.addObject("message","Ordered Succefully");
		mav.addObject("foodOrderinfo",foodOrder);
		mav.setViewName("displaybilltocustomer");
		return mav;
	}

}
