package servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Hashtable;
import java.util.StringTokenizer;

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
	
	public Hashtable<String, User> listUsers(String path) {		
		Hashtable<String, User> users = new Hashtable<String, User>();
		

		File file = new File(path + "\\users.txt");
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				
				while (st.hasMoreTokens()) {
					
					String username = st.nextToken().trim();
					String password = st.nextToken().trim();
					String firstname = st.nextToken().trim();
					String lastname = st.nextToken().trim();
					String telephone = st.nextToken().trim();
					String email = st.nextToken().trim();
					
					User u = new User(username, password, firstname, lastname, telephone, email);
					
					users.put(username, u);
				}

			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (reader != null) {
					reader.close();
				}
			} catch (IOException e) {
			}
		}

		return users;
	}
	
	
}
