package gamelabs.product;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Repository
@Transactional

public class ProductDAOImpl implements ProductDAO
{
	Product ProductOb;
	@Autowired
	SessionFactory sessionFactory;


	public void insert(Product p)
	{
		this.sessionFactory.getCurrentSession().save(p);
		// TODO Auto-generated method stub
		
	}

	public void update(Product p)
	{
		this.sessionFactory.getCurrentSession().update(p);
		// TODO Auto-generated method stub
		
	}

	public void delete(long id)
	{
		sessionFactory.getCurrentSession().createQuery("delete from Product where id=:id").setLong("id", id).executeUpdate();
		// TODO Auto-generated method stub
		
	}

	public Product getProduct(long id) 
	{
	List<Product>allProduct=getProduct();
	for(Product ob:allProduct)
	{
		if(ob.getId()==id)
		{
			ProductOb=new Product(ob.getId(), ob.getName(),ob.getPrice(),ob.getQuantity(), ob.getDescription());
		}
	}
		// TODO Auto-generated method stub
		return ProductOb;
	}

	public List<Product> getProduct() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Product").list();
	}

	
	
}
