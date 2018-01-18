package beans;

import java.io.Serializable;

public class Comment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String topic;
	private String author;
	private String date;
	private String parent;
	private String text;
	private int postivies;
	private int negatives;
	private boolean changed;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(String topic, String author, String date, String parent, String text, int postivies, int negatives) {
		super();
		this.topic = topic;
		this.author = author;
		this.date = date;
		this.parent = parent;
		this.text = text;
		this.postivies = postivies;
		this.negatives = negatives;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getPostivies() {
		return postivies;
	}

	public void setPostivies(int postivies) {
		this.postivies = postivies;
	}

	public int getNegatives() {
		return negatives;
	}

	public void setNegatives(int negatives) {
		this.negatives = negatives;
	}

	public boolean isChanged() {
		return changed;
	}

	public void setChanged(boolean changed) {
		this.changed = changed;
	}

	
	
	
}
