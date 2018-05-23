package gamelabs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/fetchCartItems")
	public String fetchCartItems() throws Exception
	{
		System.out.println("In fetchcartItems");
		ObjectMapper objectMapper = new ObjectMapper();
//    	objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
		
		List<Cart> crtList = crtdao.getCart();
    	
		for( Cart c : crtList)
		{
		
			c.setProduct( pdao.getProduct(c.getCartproductid()) );
			
		}
		
    	System.out.println( objectMapper.writeValueAsString( crtList ) );
    	
    	return objectMapper.writeValueAsString( crtList );
		
	}
	
}
