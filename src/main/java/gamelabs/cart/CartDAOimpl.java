package gamelabs.cart;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CartDAOimpl implements CartDAO

{
	@Autowired
	SessionFactory sessionFactory;

	Cart CartOb;

	
	

	public void insert(Cart ca) {
		this.sessionFactory.getCurrentSession().save(ca);

		// TODO Auto-generated method stub
		
	}

	public void update(Cart ca) {
		this.sessionFactory.getCurrentSession().update(ca);
		// TODO Auto-generated method stub
		
	}

	public void delete(long cartid) {
		sessionFactory.getCurrentSession().createQuery("delete from Cart where id=:id").setLong("id", cartid).executeUpdate();

		// TODO Auto-generated method stub
		
	}

	public Cart getCart(long cartid) {
		
		List<Cart> allCart = getCart();
		for(Cart ob:allCart)
		{
			if(ob.getCartid() == cartid)
			{
				CartOb = new Cart(ob.getCartid(), ob.getCartproductid(), ob.getCartbilladdr(), ob.getCartshipaddr(), ob.getCartuseremail(), ob.getCartquantity(), ob.getProduct());
			}
		// TODO Auto-generated method stub
		}
		return CartOb;
		
	}

	public List<Cart> getCart() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Cart").list();
	}

}
