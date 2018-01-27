package beans;

import java.io.Serializable;

public class Comment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String topic;
	private String author;
	private String date;
	private int parent;
	private String text;
	private int positives;
	private int negatives;
	private boolean changed;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int id, String topic, String author, String date, int parent, String text, int positives, int negatives) {
		super();
		this.id = id;
		this.topic = topic;
		this.author = author;
		this.date = date;
		this.parent = parent;
		this.text = text;
		this.positives = positives;
		this.negatives = negatives;
	}
	
	public Comment(int id, String topic, String author, String date, int parent, String text, int postivies, int negatives, boolean changed) {
		super();
		this.id = id;
		this.topic = topic;
		this.author = author;
		this.date = date;
		this.parent = parent;
		this.text = text;
		this.positives = postivies;
		this.negatives = negatives;
		this.changed = changed;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getPositives() {
		return positives;
	}

	public void setPositives(int positives) {
		this.positives = positives;
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
