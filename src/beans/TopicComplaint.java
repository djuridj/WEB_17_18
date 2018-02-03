package beans;

public class TopicComplaint {

	public String text;
	public String date;
	public String topic;
	public String author;
	public String admin;
	public String moderator;
	public String status;
	public String warning;
	
	public TopicComplaint() {
		// TODO Auto-generated constructor stub
	}

	public TopicComplaint(String text, String date, String topic, String author, String admin, String moderator, String status, String warning) {
		super();
		this.text = text;
		this.date = date;
		this.topic = topic;
		this.author = author;
		this.admin = admin;
		this.moderator = moderator;
		this.status = status;
		this.warning = warning;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getModerator() {
		return moderator;
	}

	public void setModerator(String moderator) {
		this.moderator = moderator;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getWarning() {
		return warning;
	}

	public void setWarning(String warning) {
		this.warning = warning;
	}
	
	
}
