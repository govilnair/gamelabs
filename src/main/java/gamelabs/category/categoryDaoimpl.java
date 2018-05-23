 package gamelabs.category;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gamelabs.product.Product;
@Repository
@Transactional

public class categoryDaoimpl implements categoryDao 
{
	category categoryOb;
	@Autowired
	SessionFactory sessionFactory;

	
	public void insert(category c)
	{
		this.sessionFactory.getCurrentSession().save(c);
	}

	public void update(category c)
	{
		this.sessionFactory.getCurrentSession().update(c);
		// TODO Auto-generated method stub
		
	}

	public void delete(long id) 
	
	{
		sessionFactory.getCurrentSession().createQuery("delete from category where id=:id").setLong("id", id).executeUpdate();

		// TODO Auto-generated method stub
		
	}

	public category getcategory(long id)
	{List<category>allcategory=getcategory();
	for(category ob:allcategory)
	{
		if(ob.getId()==id)
		{
			categoryOb=new category(ob.getId(), ob.getName(), ob.getDescription());
		}
	}
		// TODO Auto-generated method stub
		return categoryOb;
		
	}

	public List<category> getcategory() 
	{
		return sessionFactory.getCurrentSession().createQuery("from category").list();

		// TODO Auto-generated method stub
	
	}

}
