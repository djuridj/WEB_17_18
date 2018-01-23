package beans;

public class FollowedSub {
	
	public String name;
	public String description;
	public String icon;
	public String rules;
	public String moderator;
	public String followe;
	
	public FollowedSub() {
		// TODO Auto-generated constructor stub
	}

	public FollowedSub(String name, String description, String icon, String rules, String moderator, String followe) {
		super();
		this.name = name;
		this.description = description;
		this.icon = icon;
		this.rules = rules;
		this.moderator = moderator;
		this.followe = followe;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getRules() {
		return rules;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	public String getModerator() {
		return moderator;
	}

	public void setModerator(String moderator) {
		this.moderator = moderator;
	}

	public String getFollowe() {
		return followe;
	}

	public void setFollowe(String followe) {
		this.followe = followe;
	}
	
	
	
}
