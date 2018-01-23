package beans;

import java.io.Serializable;

public class Message implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String sender;
	private String reciever;
	private String content;
	private Boolean red;
	
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(String sender, String reciever, String content,
			Boolean red) {
		super();
		this.sender = sender;
		this.reciever = reciever;
		this.content = content;
		this.red = red;
	}

	
	
	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
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
	
}
