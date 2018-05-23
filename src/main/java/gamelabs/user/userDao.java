package gamelabs.user;

import java.util.List;

public interface userDao
{
	void insert(user u);
	void update(user u);
	void delete(long uid);
	
	user getuser(long uid);
	List<user> getuser();

}
