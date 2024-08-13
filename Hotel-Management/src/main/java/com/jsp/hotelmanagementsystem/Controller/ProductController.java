package com.jsp.hotelmanagementsystem.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.HotelDao;
import com.jsp.hotelmanagementsystem.dao.ProductDao;
import com.jsp.hotelmanagementsystem.entities.Hotel;
import com.jsp.hotelmanagementsystem.entities.Product;

@Controller
public class ProductController
{
	@Autowired
	ProductDao productdao;
	
	@Autowired
	HotelDao hoteldao;
	
	@RequestMapping("/addproduct")
	public ModelAndView addProduct(ModelAndView mav)
	{
		Product product=new Product();
		mav.addObject("productobj",product);
		mav.setViewName("productform");
		return mav;
	}
	
	@RequestMapping("/saveproduct")
	//handler is used to save product entity object into database
	public ModelAndView saveProduct(ModelAndView mav,@ModelAttribute("productobj") Product p,HttpSession session)
	{
		Integer hotel_id=(Integer)session.getAttribute("hotelid");
		Hotel hotel=hoteldao.findHotelById(hotel_id);
		List<Product> products=hotel.getProducts();
		
		if(products.size()>0)
		{
			products.add(p);
			hotel.setProducts(products);
		}
		else
		{
			List<Product> productList=new ArrayList<Product>();
			productList.add(p);
			hotel.setProducts(productList);
			
		}
		productdao.saveProduct(p);
		hoteldao.updateHotel(hotel);
		
		mav.addObject("message","added Succefully");
		mav.setViewName("HotelOptions");
		return mav;
	}
	
	@RequestMapping("/viewallproduct")
	//handler is used to fetch all the products of particular hotel and submit to viewAllProducts.jsp.
	public ModelAndView viewAllProduct(ModelAndView mav,HttpSession session)
	{
		Integer hotel_id=(Integer)session.getAttribute("hotelid");
		Hotel hotel=hoteldao.findHotelById(hotel_id);
		List<Product> products=hotel.getProducts();
		
		mav.addObject("allproducts",products);
		mav.setViewName("viewAllProducts");
		return mav;
	}
	
	@RequestMapping("/updateproduct")
	public ModelAndView updateProduct(ModelAndView mav,@RequestParam("id") int id)
	{
		Product product=productdao.findProductById(id);
		mav.addObject("productforupdate",product);
		mav.setViewName("ProductUpdateForm");
		return mav;
	}
	
	@RequestMapping("/saveupdateproduct")
	public ModelAndView saveUpdateProduct(ModelAndView mav,@ModelAttribute("productforupdate") Product product)
	{
		productdao.updateProduct(product);
		
		mav.setViewName("redirect://viewallproduct");
		return mav;
	}
	
	@RequestMapping("/hotellogout")
	//handler is used to delete the admin data in HttpSession
	public ModelAndView adminLogOut(ModelAndView mav,HttpSession session)
	{
		session.invalidate();
		mav.addObject("message","Log Out Succefully");
		mav.setViewName("Hotelhome");
		return mav;
	}
	
	@RequestMapping("/deleteproduct")
	public ModelAndView deleteProduct(ModelAndView mav,@RequestParam("id") int id,HttpSession session)
	{
		Integer hotel_id=(Integer)session.getAttribute("hotelid");
		Hotel hotel=hoteldao.findHotelById(hotel_id);
		List<Product> products=hotel.getProducts();
		
		List<Product> productList=products.stream().filter(product->product.getId() != id).collect(Collectors.toList());
		
		hotel.setProducts(productList);
		
		hoteldao.updateHotel(hotel);
		productdao.deleteById(id);
		
		mav.addObject("message","Product deleted Successfully");
		mav.setViewName("redirect://viewallproduct");
		
		return mav;
	}
	
	@RequestMapping("/fetchproductsbyhotel")
	public ModelAndView fetchProductsByHotel(ServletRequest request,ModelAndView mav)
	{
		String hotelName=request.getParameter("hotelname");
		List<Product> products=productdao.fetchProductsByHotel(hotelName);
		
		mav.addObject("productlist",products);
		mav.setViewName("displayproductstocustomer");
		return mav;
		
	}
	
	@RequestMapping("/fetchallproducts")
	public ModelAndView fetchAllProducts(ModelAndView mav)
	{
		List<Product> products=productdao.findAllProducts();
		
		
		
		mav.addObject("productlist", products);
		mav.setViewName("displayproductstocustomer");
		return mav;
	}
	
	@RequestMapping("/fetchproductbetweenpricerange")
	public ModelAndView productPriceRange(ModelAndView mav,ServletRequest request)
	{
		String minprice=request.getParameter("minprice");
		String maxprice=request.getParameter("maxprice");
		
		List<Product> products=productdao.fetchProductsBetweenPriceRange(Double.parseDouble(minprice), Double.parseDouble(maxprice));
		
		mav.addObject("productlist",products);
		mav.setViewName("displayproductstocustomer");
		return mav;
	}
}
