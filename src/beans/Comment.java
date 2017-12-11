package beans;

import java.io.Serializable;

public class Comment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private User user;
	private String date;
	private double rating;
	private String comment;
	private String password;
	private int postivies;
	private int negatives;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(User user, String date, double rating, String comment,
			String password, int postivies, int negatives) {
		super();
		this.user = user;
		this.date = date;
		this.rating = rating;
		this.comment = comment;
		this.password = password;
		this.postivies = postivies;
		this.negatives = negatives;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
