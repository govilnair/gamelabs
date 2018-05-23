package gamelabs.product;

import java.util.List;


public interface ProductDAO {
	
	void insert(Product p);
	void update(Product p);
	void delete(long id);
	
	Product getProduct(long id);
	List<Product> getProduct();
}
