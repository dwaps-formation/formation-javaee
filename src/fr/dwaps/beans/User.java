package fr.dwaps.beans;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 890977954987515240L;
	
	private String firstname;
	private String lastname;
	private int age;
	
	public User() {}
	
	public String getFirstname() { return firstname; }
	public String getLastname() { return lastname; }
	public int getAge() { return age; }
	
	public void setFirstname(String p) { firstname = p; }
	public void setLastname(String p) { lastname = p; }
	public void setAge(int p) { age = p; }
}
