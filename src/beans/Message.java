package beans;

import java.io.Serializable;

public class Message implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String userSender;
	private String userReceiver;
	private String content;
	private Boolean red;
	
	private User user;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(String userSender, String userReceiver, String content,
			Boolean red, User user) {
		super();
		this.userSender = userSender;
		this.userReceiver = userReceiver;
		this.content = content;
		this.red = red;
		this.user = user;
	}

	public String getUserSender() {
		return userSender;
	}

	public void setUserSender(String userSender) {
		this.userSender = userSender;
	}

	public String getUserReceiver() {
		return userReceiver;
	}

	public void setUserReceiver(String userReceiver) {
		this.userReceiver = userReceiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getRed() {
		return red;
	}

	public void setRed(Boolean red) {
		this.red = red;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
