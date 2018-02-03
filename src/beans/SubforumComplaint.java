package beans;

public class SubforumComplaint {

	public String text;
	public String date;
	public String subforum;
	public String author;
	public String admin;
	public String status;
	public String warning;
	
	public SubforumComplaint() {
		// TODO Auto-generated constructor stub
	}

	public SubforumComplaint(String text, String date, String subforum, String author, String admin, String status, String warning) {
		super();
		this.text = text;
		this.date = date;
		this.subforum = subforum;
		this.author = author;
		this.admin = admin;
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

	public String getSubforum() {
		return subforum;
	}

	public void setSubforum(String subforum) {
		this.subforum = subforum;
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
