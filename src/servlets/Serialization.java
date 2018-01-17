package servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.StringTokenizer;

import beans.Subforum;
import beans.Topic;
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
		sb.append(user.getRegDate() + "|");
		sb.append(user.getRole() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
	Hashtable<String, User> users = new Hashtable<String, User>();
	
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
					String regDate = st.nextToken().trim();
					String role = st.nextToken().trim();
					
					User u = new User(username, password, firstname, lastname, telephone, email, regDate, role);
					
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
	
	//SUBFORUM
	
	public void addForum(Subforum subforum, String path) throws IOException {
		FileWriter fw = new FileWriter(path + "/subforums.txt", true);
		StringBuilder sb = new StringBuilder();
		
		sb.append("\n");
		sb.append(subforum.getName() + "|");
		sb.append(subforum.getDescription() + "|");
		sb.append(subforum.getIcon() + "|");
		sb.append(subforum.getRules() + "|");
		sb.append(subforum.getModerator() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
	public Hashtable<String, Subforum> listSubforums(String path) {		
		Hashtable<String, Subforum> subforums = new Hashtable<String, Subforum>();
		

		File file = new File(path + "\\subforums.txt");
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				
				while (st.hasMoreTokens()) {
					
					String name = st.nextToken().trim();
					String description = st.nextToken().trim();
					String icon = st.nextToken().trim();
					String rules = st.nextToken().trim();
					String moderator = st.nextToken().trim();
					
					Subforum s = new Subforum(name, description, icon, rules, moderator);
					
					subforums.put(name, s);
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

		return subforums;
	}
	
	public void deleteSubforum(String nameS,String path) throws IOException {
		// TODO Auto-generated method stub

		File file = new File(path+"\\subforums.txt");
		BufferedReader reader = null;
	
		
		File tempFile = new File(path +"\\myTempFile2.txt");
		
		 PrintWriter pw = new PrintWriter(new FileWriter(tempFile));
		 
		
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				while (st.hasMoreTokens()) {
					String name = st.nextToken().trim();
					String description = st.nextToken().trim();
					String icon = st.nextToken().trim();
					String rules = st.nextToken().trim();
					String moderator = st.nextToken().trim();

					Subforum sf = new Subforum(name,description,icon,rules, moderator);
					
					if(nameS != name)
					{
						pw.println(text);
					}
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
		pw.close();
		
		if (!file.delete()) {
	        System.out.println("Could not delete file");
	        return;
	      } 
	      
	      //Rename the new file to the filename the original file had.
	      if (!tempFile.renameTo(file))
	        System.out.println("Could not rename file");
		
		
	}
	
	//TOPIC
	public void addTopic(Topic topic, String path) throws IOException {
		FileWriter fw = new FileWriter(path + "/topics.txt", true);
		StringBuilder sb = new StringBuilder();
		
		sb.append("\n");
		sb.append(topic.getSubforum() + "|");
		sb.append(topic.getHeadline() + "|");
		sb.append(topic.getType() + "|");
		sb.append(topic.getAuthor() + "|");
		sb.append(topic.getDate() + "|");
		sb.append(topic.getContent() + "|");
		sb.append(topic.getLikes() + "|");
		sb.append(topic.getDislikes() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
	public Hashtable<String, Topic> listTopics(String path) {		
		Hashtable<String, Topic> topics = new Hashtable<String, Topic>();
		

		File file = new File(path + "\\topics.txt");
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				
				while (st.hasMoreTokens()) {
					
					String subforum = st.nextToken().trim();
					String headline = st.nextToken().trim();
					String type = st.nextToken().trim();
					String author = st.nextToken().trim();
					String date = st.nextToken().trim();
					String content = st.nextToken().trim();
					//String like = st.nextToken().trim();
					int likes = Integer.parseInt(st.nextToken().trim());
					//String dislike = st.nextToken().trim();
					int dislikes = Integer.parseInt(st.nextToken().trim());
					
					Topic t = new Topic(subforum,headline,type,author,date,content,likes,dislikes);
					
					topics.put(headline, t);
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

		return topics;
	}

	public Hashtable<String, User> getUsers() {
		return users;
	}

	public void setUsers(Hashtable<String, User> users) {
		this.users = users;
	}
	
	
}
