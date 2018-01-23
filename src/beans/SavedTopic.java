package beans;

public class SavedTopic {

	public String subforum;
	public String headline;
	public String type;
	public String author;
	public String date;
	public String content;
	public String follower;
	
	public SavedTopic() {
		// TODO Auto-generated constructor stub
	}

	public SavedTopic(String subforum, String headline, String type, String author, String date, String content,
			String follower) {
		super();
		this.subforum = subforum;
		this.headline = headline;
		this.type = type;
		this.author = author;
		this.date = date;
		this.content = content;
		this.follower = follower;
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

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}
	
	
	
}
