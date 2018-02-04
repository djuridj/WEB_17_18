package beans;

import java.io.Serializable;

public class Message implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String sender;
	private String reciever;
	private String content;
	private Boolean red;
	
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(int id, String sender, String reciever, String content,
			Boolean red) {
		super();
		this.id = id;
		this.sender = sender;
		this.reciever = reciever;
		this.content = content;
		this.red = red;
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
