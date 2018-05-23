package gamelabs;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gamelabs.cart.Cart;
import gamelabs.cart.CartDAO;
import gamelabs.category.category;
import gamelabs.category.categoryDao;
import gamelabs.product.Product;
import gamelabs.product.ProductDAO;
import gamelabs.user.user;
import gamelabs.user.userDao;

@Controller
public class myController
{
	// AUTOWIRED CLASSES //
		@Autowired
		categoryDao cdao;
		
		@Autowired
		ProductDAO pdao;
		
		@Autowired
		CartDAO crtdao;
		
		@Autowired
		userDao udao;
		
		////////////////////////////////////////////////////////////////////////////////////////
		
		// FORM NORMAL CONTROLS //
		@RequestMapping({"/", "/index"})
		public String getHome()
		{
			return "index";
		}
		
		@RequestMapping("/about")
		public String getAbout()
		{
			return "about";
		}
		@RequestMapping("/form")
		public String getform()
		{
			return "form";
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////
		
		// ADD ELEMENTS //
		@RequestMapping("/AddProduct")
		public ModelAndView AddProduct()
		{
			ModelAndView mav = new ModelAndView("AddProduct");
			mav.addObject("pro", new Product());
			return mav;
		}
		
		@RequestMapping("/AddCategory")
		public ModelAndView AddCategory()
		{
			ModelAndView mav = new ModelAndView("AddCategory");
			mav.addObject("cat",new category());
			return mav;
		}
		
		@RequestMapping("/AddUsers")
		public ModelAndView AddUsers()
		{
			ModelAndView mav = new ModelAndView("AddUser");
			mav.addObject("usern", new user());
			return mav;
		}
		
		
		@RequestMapping(value = "/AddProductToCart", method = RequestMethod.POST)
		public ModelAndView AddProductToCart( @RequestParam("id") int id , @RequestParam("qty") int qty )
		{

			ModelAndView mav = new ModelAndView( "redirect:/thecart" );
			
			Cart ca = new Cart();
			
			ca.setCartproductid(id);
			ca.setCartquantity(qty);
			
			
			
			crtdao.insert(ca);
			
			return mav;
		}
		
		@RequestMapping(value = "/singleProduct", method = RequestMethod.GET)
		public ModelAndView singleProduct( @RequestParam("id") int id ) {

			ModelAndView mav = new ModelAndView( "singleProduct" );
			
			mav.addObject("sprod", pdao.getProduct(id));
			
			return mav;
		}

		
		
		
		
		
		
		/////////////Update Elements////////////////////////...... 
		@RequestMapping("/UpdateUsersFromDB")
		public ModelAndView UpdateUserFromDB(@RequestParam("id") int id)
		{
			ModelAndView mv = new ModelAndView("UpdateUser");
			
			user userOb=udao.getuser(id);
			mv.addObject("usr",userOb);
			return mv;
		}
		
		@RequestMapping("/SaveUpdatedUsersToDB")
		public String saveUpdatedUser(@ModelAttribute("usr") user ob)
		{
			System.out.println("Hello.... ");
			udao.update(ob);
			return "redirect:/ViewUsers";
		}
		@RequestMapping("/UpdateCategoryFromDB")
		public ModelAndView UpdateCategoryFromDB(@RequestParam("id") int id)
		{
			ModelAndView mv = new ModelAndView("UpdateCategory");
			
			category categoryOb=cdao.getcategory(id);
			mv.addObject("cate",categoryOb);
			return mv;
		}
		
		@RequestMapping("/SaveUpdatedCategoryToDB")
		public String saveUpdatedCategory(@ModelAttribute("cate") category ob)
		{
			System.out.println("Hello.... ");
			cdao.update(ob);
			return "redirect:/ViewCategory";
		}
		@RequestMapping("/UpdateProductFromDB")
		public ModelAndView UpdateProductFromDB(@RequestParam("id") int id)
		{
			ModelAndView mv = new ModelAndView("UpdateProduct");
			
			Product ProductOb=pdao.getProduct(id);
			mv.addObject("prod",ProductOb);
			return mv;
		}
		
		@RequestMapping("/SaveUpdatedProductToDB")
		public String saveUpdatedProduct(@ModelAttribute("prod") Product ob)
		{
			System.out.println("Hello.... ");
			pdao.update(ob);
			return "redirect:/ViewProduct";
		}
		
		
		
		//////////////////////////////////////////////////////////////////////////////////////////
		
		// DELETE ELEMENTS //
		@RequestMapping("/DeleteCategoryFromDB")
		public String DeleteCategoryFromDB( @RequestParam("id") int id )
		{
			
			cdao.delete(id);
			return "redirect:/ViewCategory";
		}
		@RequestMapping("/DeleteProductFromDB")
		public String DeleteProductFromDB( @RequestParam("id") int id )
		{
			
			pdao.delete(id);
			return "redirect:/ViewProduct";
		}
		@RequestMapping("/DeleteUsersFromDB")
		public String DeleteUsersFromDB( @RequestParam("id") int id )
		{
			
			udao.delete(id);
			return "redirect:/ViewUsers";
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		
		// VIEW ELEMENTS //
		@RequestMapping("/ViewCategory")
		public ModelAndView ViewCategory()
		{
			ModelAndView mav = new ModelAndView("ViewCategory");
			mav.addObject("catlist", cdao.getcategory() );
			return mav;
		}
		
		@RequestMapping("/ViewProduct")
		public ModelAndView ViewProduct()
		{
			ModelAndView mav = new ModelAndView("ViewProduct");
			mav.addObject("prolist", pdao.getProduct() );
			return mav;
		}
		@RequestMapping("/ViewUsers")
		public ModelAndView ViewUsers()
		{
			ModelAndView mav = new ModelAndView("ViewUser");
			mav.addObject("usernlist", udao.getuser() );
			return mav;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////
		
		// ADD ELEMENTS TO DB //

		@RequestMapping(value="/AddCategoryToDB",method=RequestMethod.POST)
		public String AddCategoryToDB( @ModelAttribute("cat") category c )
		{
			
			cdao.insert(c);
			return "redirect:/ViewCategory";
		}
		
		@RequestMapping(value="/AddProductToDB", method=RequestMethod.POST)
		public String AddProductToDB(@ModelAttribute("pro") Product P, @RequestParam CommonsMultipartFile file,HttpSession session)
		{
			pdao.insert(P);
			
			 String path=session.getServletContext().getRealPath("/");  
		     String filename=file.getOriginalFilename(); 
		     
		     System.out.println(path+" "+filename);  
		        try
		        {  
		        byte barr[]=file.getBytes();  
		          
		        BufferedOutputStream bout= new BufferedOutputStream (new FileOutputStream(path+"./resources"+"/"+P.getId()+".jpg"));  
		        bout.write(barr);  
		        bout.flush();  
		        bout.close();  
		       
		        }catch(Exception e)
		        {
		        	System.out.println(e);
		        	}  
		        P.setImageUrl("./resources"+"/"+P.getId()+".jpg");
		        pdao.update(P);
		      	return "redirect:/ViewProduct";
		}
		@RequestMapping(value="/AddUsersToDB", method=RequestMethod.POST)
		public String AddUsersToDB(@ModelAttribute("usern") user u)
		{
			udao.insert(u);
			return "redirect:/ViewUsers";
		}
		
		//////////////////////////////////////////////////////////////////////////////////////
		
		
		// FORM NORMAL CONTROLS //
		
		@RequestMapping("/login")
		public String getlogin()
		{
			return "login";
		}

	}