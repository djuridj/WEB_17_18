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

import beans.Comment;
import beans.FollowedSub;
import beans.Message;
import beans.SavedTopic;
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
	
	@SuppressWarnings("unused")
	public void deleteSubforum(String name,String path) throws IOException {
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
					
					String names = st.nextToken().trim();
					String description = st.nextToken().trim();
					String icon = st.nextToken().trim();
					String rules = st.nextToken().trim();
					String moderator = st.nextToken().trim();
					
					
					if(!names.equals(name))
					{
						pw.write(text + "\n");
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
		reader.close();
		
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

	@SuppressWarnings("unused")
	public void deleteTopic(String headline,String path) throws IOException {
		// TODO Auto-generated method stub

		File file = new File(path+"\\topics.txt");
		BufferedReader reader = null;
	
		
		File tempFile = new File(path +"\\myTempFile1.txt");
		
		 PrintWriter pw = new PrintWriter(new FileWriter(tempFile));
		 
		
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				while (st.hasMoreTokens()) {
					
					String subforum = st.nextToken().trim();
					String headlines = st.nextToken().trim();
					String type = st.nextToken().trim();
					String author = st.nextToken().trim();
					String date = st.nextToken().trim();
					String content = st.nextToken().trim();
					int likes = Integer.parseInt(st.nextToken().trim());
					int dislikes = Integer.parseInt(st.nextToken().trim());
					
					
					if(!headlines.equals(headline))
					{
						pw.write(text + "\n");
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
		reader.close();
		
		if (!file.delete()) {
	        System.out.println("Could not delete file");
	        return;
	      } 
	      
	      //Rename the new file to the filename the original file had.
	      if (!tempFile.renameTo(file))
	        System.out.println("Could not rename file");
		
	}
	
	//COMMENTS
	
	public void addComment(Comment comment, String path) throws IOException {
		FileWriter fw = new FileWriter(path + "/comments.txt", true);
		StringBuilder sb = new StringBuilder();
		
		sb.append("\n");
		sb.append(comment.getId() + "|");
		sb.append(comment.getTopic() + "|");
		sb.append(comment.getAuthor() + "|");
		sb.append(comment.getDate() + "|");
		sb.append(comment.getParent() + "|");
		sb.append(comment.getText() + "|");
		sb.append(comment.getPostivies() + "|");
		sb.append(comment.getNegatives() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
	public Hashtable<String, Comment> listComments(String path) {		
		Hashtable<String, Comment> comments = new Hashtable<String, Comment>();
		

		File file = new File(path + "\\comments.txt");
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				
				while (st.hasMoreTokens()) {
					
					int id = Integer.parseInt(st.nextToken().trim());
					String topic = st.nextToken().trim();
					String author = st.nextToken().trim();
					String date = st.nextToken().trim();
					int parent = Integer.parseInt(st.nextToken().trim());
					String textt = st.nextToken().trim();
					int positives = Integer.parseInt(st.nextToken().trim());
					int negatives = Integer.parseInt(st.nextToken().trim());
					
					Comment c = new Comment(id, topic, author, date, parent, textt, positives, negatives);
					
					comments.put(textt, c);
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

		return comments;
	}

	
	@SuppressWarnings("unused")
	public void deleteComment(int id,String path) throws IOException {
		// TODO Auto-generated method stub

		File file = new File(path+"\\comments.txt");
		BufferedReader reader = null;
	
		
		File tempFile = new File(path +"\\myTempFile3.txt");
		
		 PrintWriter pw = new PrintWriter(new FileWriter(tempFile));
		 
		
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				while (st.hasMoreTokens()) {
					
					int ids = Integer.parseInt(st.nextToken().trim());
					String topic = st.nextToken().trim();
					String author = st.nextToken().trim();
					String date = st.nextToken().trim();
					int parent = Integer.parseInt(st.nextToken().trim());
					String textt = st.nextToken().trim();
					int positives = Integer.parseInt(st.nextToken().trim());
					int negatives = Integer.parseInt(st.nextToken().trim());
					
					
					if(!(ids==id))
					{
						pw.write(text + "\n");
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
		reader.close();
		
		if (!file.delete()) {
	        System.out.println("Could not delete file");
	        return;
	      } 
	      
	      //Rename the new file to the filename the original file had.
	      if (!tempFile.renameTo(file))
	        System.out.println("Could not rename file");
		
	}
	
	
	public Hashtable<String, User> getUsers() {
		return users;
	}

	public void setUsers(Hashtable<String, User> users) {
		this.users = users;
	}
	
	//MESSAGES
	public void addMessage(Message message, String path) throws IOException {
		FileWriter fw = new FileWriter(path + "/messages.txt", true);
		StringBuilder sb = new StringBuilder();
		
		sb.append("\n");
		sb.append(message.getSender() + "|");
		sb.append(message.getReciever() + "|");
		sb.append(message.getContent() + "|");
		sb.append(message.getRed() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
	public Hashtable<String, Message> listMessages(String path) {		
		Hashtable<String, Message> messages = new Hashtable<String, Message>();
		

		File file = new File(path + "\\messages.txt");
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			while ((text = reader.readLine()) != null) {

				StringTokenizer st = new StringTokenizer(text, "|");
				
				while (st.hasMoreTokens()) {
					
					String sender = st.nextToken().trim();
					String reciever = st.nextToken().trim();
					String content = st.nextToken().trim();
					//String red = st.nextToken().trim();
					boolean red = Boolean.parseBoolean(st.nextToken().trim());
					
					Message m = new Message(sender, reciever, content, red);
					
					messages.put(text, m);
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

		return messages;
	}
	
	
	//FOLLOWED SUBFORUMS
	public void addFollowed(FollowedSub fs, String path) throws IOException {
		FileWriter fw = new FileWriter(path + "/followedsubs.txt", true);
		StringBuilder sb = new StringBuilder();
		
		sb.append("\n");
		sb.append(fs.getName() + "|");
		sb.append(fs.getDescription() + "|");
		sb.append(fs.getIcon() + "|");
		sb.append(fs.getRules() + "|");
		sb.append(fs.getModerator() + "|");
		sb.append(fs.getFollowe() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
	public Hashtable<String, FollowedSub> listFollowed(String path) {		
		Hashtable<String, FollowedSub> fs = new Hashtable<String, FollowedSub>();
		

		File file = new File(path + "\\followedsubs.txt");
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
					String followe = st.nextToken().trim();
					
					FollowedSub followedsub = new FollowedSub(name, description, icon, rules, moderator, followe);
					
					fs.put(name, followedsub);
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

		return fs;
	}
	
	public void addSavedTopic(SavedTopic st, String path) throws IOException {
		FileWriter fw = new FileWriter(path + "/savedtopics.txt", true);
		StringBuilder sb = new StringBuilder();
		
		sb.append("\n");
		sb.append(st.getSubforum() + "|");
		sb.append(st.getHeadline() + "|");
		sb.append(st.getType() + "|");
		sb.append(st.getAuthor() + "|");
		sb.append(st.getDate() + "|");
		sb.append(st.getContent() + "|");
		sb.append(st.getFollower() + "|");
		fw.write(sb.toString());
		fw.close();
	}
	
	public Hashtable<String, SavedTopic> listSavedTopics(String path) {		
		Hashtable<String, SavedTopic> stc = new Hashtable<String, SavedTopic>();
		

		File file = new File(path + "\\savedtopics.txt");
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
					String follower = st.nextToken().trim();
					
					SavedTopic sat = new SavedTopic(subforum, headline, type, author, date, content, follower);
					
					stc.put(headline, sat);
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

		return stc;
	}
	
}
