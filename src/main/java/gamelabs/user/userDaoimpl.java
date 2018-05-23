package gamelabs.user;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional

public class userDaoimpl implements userDao
{
	
	user userOb;
	@Autowired
	SessionFactory sessionFactory;

	public void insert(user u)
	{
		this.sessionFactory.getCurrentSession().save(u);
		// TODO Auto-generated method stub
		
	}

	public void update(user u) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().update(u);
		
	}

	public void delete(long id) 
	{
		sessionFactory.getCurrentSession().createQuery("delete from user where id=:id").setLong("id",id).executeUpdate();

		// TODO Auto-generated method stub
		
	}

	public user getuser(long id) {
		// TODO Auto-generated method stub
		
		List <user> allUsers= getuser();
		for(user ob:allUsers)
		{
			if(ob.getId() ==id )
			{
				userOb =new user(ob.getId(), ob.getUsername(), ob.getEmail(), ob.getPassword(), ob.getPhone(), ob.getAddress(), ob.getRole());
			}
		}
		
		return userOb;
	}

	public List<user> getuser() 
	{
		return sessionFactory.getCurrentSession().createQuery("from user").list();

		// TODO Auto-generated method stub
	}

}
