package beans;

import java.io.Serializable;
import java.util.ArrayList;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String telephone;
	private String email;
	private String regDate;
	private String role;
	
	public ArrayList<Message> sentMessages;
	public ArrayList<Topic> followedTopics;
	public ArrayList<Subforum> followedSubforums;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String username, String password, String firstname,
			String lastname, String telephone, String email, String regDate, String role) {
		super();
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.telephone = telephone;
		this.email = email;
		this.regDate = regDate;
		this.role = role;
	}

	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public ArrayList<Message> getSentMessages() {
		return sentMessages;
	}

	public void setSentMessages(ArrayList<Message> sentMessages) {
		this.sentMessages = sentMessages;
	}

	public ArrayList<Topic> getFollowedTopics() {
		return followedTopics;
	}

	public void setFollowedTopics(ArrayList<Topic> followedTopics) {
		this.followedTopics = followedTopics;
	}

	public ArrayList<Subforum> getFollowedSubforums() {
		return followedSubforums;
	}

	public void setFollowedSubforums(ArrayList<Subforum> followedSubforums) {
		this.followedSubforums = followedSubforums;
	}

	


}
