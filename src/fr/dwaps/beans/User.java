package fr.dwaps.beans;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 890977954987515240L;
	
	private String firstname;
	private String lastname;
	private int age;
	
	public User() {}
	
	public String getFirstName() { return firstname; }
	public String getLastName() { return lastname; }
	public int getAge() { return age; }
	
	public void setFirstName(String p) { firstname = p; }
	public void setLastName(String p) { lastname = p; }
	public void setAge(int p) { age = p; }
}
