package servlets;

import java.io.FileWriter;
import java.io.IOException;

import beans.User;

public class Serialization {
	
	public void addUser(User user, String path) throws IOException {
		FileWriter fw = new FileWriter(path + "/users.txt", true);
		StringBuilder sb = new StringBuilder();
		
		sb.append("\n");
		sb.append(user.getUsername() + "|");
		sb.append(user.getPassword() + "|");
		sb.append(user.getFirstname() + "|");
		sb.append(user.getLastname() + "|");
		sb.append(user.getTelephone() + "|");
		sb.append(user.getEmail() + "|");
		//sb.append(user.getRegDate() + "|");
		//sb.append(user.getRole() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
}
