package gamelabs;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import gamelabs.cart.Cart;
import gamelabs.cart.CartDAO;
import gamelabs.product.ProductDAO;

@RestController
public class cartrestController 
{

	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CartDAO crtdao;
	
	public String getUser()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth!= null && !auth.getName().equals("anonymousUser"))
		{
			System.out.println(auth.getName());
			return auth.getName();
		
		}
		return null;
	}
	
	@RequestMapping("/fetchCartItems")
	public String fetchCartItems() throws Exception
	{
		System.out.println("In fetchcartItems");
		ObjectMapper objectMapper = new ObjectMapper();
//    	objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
		
		List<Cart> crtList = crtdao.getCart();
		List<Cart> crtlist1 = new ArrayList<Cart>();
    
		for( Cart c : crtList)
		{
			System.out.println(c.getCartid());
			
		if(getUser() !=null && c.getCartuseremail() != null && c.getCartuseremail().equals(getUser()))
		{
			
		
		
			c.setProduct( pdao.getProduct(c.getCartproductid()) );
			crtlist1.add(c);
			
		}
		}
    	System.out.println( objectMapper.writeValueAsString( crtlist1 ) );
    	
    	return objectMapper.writeValueAsString( crtlist1 );
	}
	
@RequestMapping("/removeCartItem")

public String removeCartitem(@RequestParam("id") long id) throws Exception
{
	crtdao.delete(id);
	return "{\"msg\":\"done\"}";
}

     @RequestMapping("/updateAdd")
     public String updateAdd(@RequestParam("bill") String bill, @RequestParam("ship") String ship) throws Exception
     {
    	 for (Cart c: crtdao.getCart())
    	 {
    		 
    		 if (getUser()!=null && c.getCartuseremail().equals(getUser()))
{
	c.setCartshipaddr(ship);
	c.setCartshipaddr(bill);
	
	crtdao.update(c);
}
    	 }
    	 
    	 return "{\"msg\":\"done\"}";
     }
     
     @RequestMapping("/deleteFromCart")
     
     public String deleteFromCart() throws Exception
     {
    	 for (Cart c: crtdao.getCart())
    	 {
    		 if (getUser() !=null && c.getCartuseremail().equals(getUser()))
{
	
	crtdao.delete(c.getCartid());
}
    			 
    	 }
    	 return "{\"msg\":\"done\"}";
    	 
     }

		}


    	
		
	
	
		
	
	



