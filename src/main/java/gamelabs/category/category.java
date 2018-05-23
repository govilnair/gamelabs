 package gamelabs.category;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="gamelabs.category")
public class category 

{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	private String name;
	private String description;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public category(long id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}
	

}
