package gamelabs.category;

import java.util.List;

public interface categoryDao 
{
	void insert(category c);
	void update(category c);
	void delete(long id);
	
	category getcategory(long id);
	List<category> getcategory();

}
