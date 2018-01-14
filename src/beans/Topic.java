package beans;

import java.io.Serializable;

public class Topic implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public String subforum;
	public String headline;
	public String type;
	public String author;
	public String date;
	public String content;
	public int likes;
	public int dislikes;
	
	public Topic(String subforum, String headline, String type, String author, String date, String content, int likes,
			int dislikes) {
		super();
		this.subforum = subforum;
		this.headline = headline;
		this.type = type;
		this.author = author;
		this.date = date;
		this.content = content;
		this.likes = likes;
		this.dislikes = dislikes;
	}

	public String getSubforum() {
		return subforum;
	}

	public void setSubforum(String subforum) {
		this.subforum = subforum;
	}

	public String getHeadline() {
		return headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getDislikes() {
		return dislikes;
	}

	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}
	
	
	

}
