package com.jsp.hotelmanagementsystem.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.ItemDao;
import com.jsp.hotelmanagementsystem.dao.ProductDao;
import com.jsp.hotelmanagementsystem.entities.Item;
import com.jsp.hotelmanagementsystem.entities.Product;

@Controller
public class ItemController 
{
	@Autowired
	ItemDao idao;
	
	@Autowired
	ProductDao productdao;
	
	@RequestMapping("/additem")
	public ModelAndView addItem(@RequestParam("id") int productid,ModelAndView mav)
	{
		Product product=productdao.findProductById(productid);
		Item item=new Item();
		item.setName(product.getName());
		item.setType(product.getType());
		item.setCost(product.getCost());
		
		mav.addObject("itemobj",item);
		mav.setViewName("Itemform");
		return mav;
	}
	
	@RequestMapping("/saveitemtoorder")
	public ModelAndView saveItemToOrder(@ModelAttribute("itemobj") Item item,ModelAndView mav,HttpSession session)
	{
		item.setCost(item.getQuantity() * item.getCost());
		
		if(session.getAttribute("itemslist")==null)
		{
			List<Item> items=new ArrayList<>();
			items.add(item);
			session.setAttribute("itemslist", items);
		}
		else
		{
			List<Item> items=(List<Item>)session.getAttribute("itemslist");
			items.add(item);			
		}
		
		mav.addObject("message","added successfully");
		mav.setViewName("redirect://fetchallproducts");
		return mav;
	}
	
//	@RequestMapping("/removeitem")
//	public ModelAndView removeItem(ModelAndView mav,@RequestParam("id")int productid)
//	{
//		idao.deleteById(productid);
//		
//	}
	
}
