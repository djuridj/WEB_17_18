package beans;

import java.io.Serializable;

public class Subforum implements Serializable {

	private static final long serialVersionUID = 1L;
	
	String name;
	String description;
	String icon;
	String rules;
	String mod;
	// ostali moderatori
	
	public Subforum() {
		// TODO Auto-generated constructor stub
	}

	public Subforum(String name, String description, String icon, String rules,
			String mod) {
		super();
		this.name = name;
		this.description = description;
		this.icon = icon;
		this.rules = rules;
		this.mod = mod;
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

	public String getMod() {
		return mod;
	}

	public void setMod(String mod) {
		this.mod = mod;
	}
	
	
	
}
