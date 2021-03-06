package beans;

public class CommentComplaint {

	public String text;
	public String date;
	public int comment;
	public String author;
	public String admin;
	public String moderator;
	public String status;
	public String warning;
	
	public CommentComplaint() {
		// TODO Auto-generated constructor stub
	}

	public CommentComplaint(String text, String date, int comment, String author, String admin, String moderator, String status, String warning) {
		super();
		this.text = text;
		this.date = date;
		this.comment = comment;
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

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
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
