package hack.fields;

import org.springframework.data.annotation.Id;

public class Person {
	@Id
	public String id;
	public String name;
	public String phone;
	public String password;
	public String state;
	public String district;
	public String role;
}
