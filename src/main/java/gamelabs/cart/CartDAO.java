package gamelabs.cart;

import java.util.List;

import gamelabs.cart.Cart;

public interface CartDAO {
	void insert(Cart ca);

	void update(Cart ca);

	void delete(long cartid);

	Cart getCart(long cartid);

	List<Cart> getCart();

}
