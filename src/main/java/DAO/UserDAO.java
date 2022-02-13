package DAO;

import model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.lang.String;
import java.io.IOException;
import java.util.*;

public class UserDAO {
		
	     private String hostName = "192.168.100.104";
	     private String dbName = "postgresdb";
	     private String userName = "postgres";
	     private String password = "postgres";
	 
	     private static final String SQL_SELECT_ALL_USERS = "SELECT * FROM users;";
	     private static final String SQL_INSERT_USER = "INSERT INTO users" + " (name, surname, age) VALUES " + " (?, ?, ?);";
	     private static final String SQL_DELETE_USER = "DELETE FROM users where name = ?;";
	     private static final String SQL_UPDATE_USER = "UPDATE users SET name= ?, surname= ?, age= ? where name= ?;";
	     
	     protected Connection getConnection() {
		 
		 Connection connection = null;
		 try {
			 	Class.forName("org.postgresql.Driver");	 
			 	String connectionURL = "jdbc:postgresql://" + hostName + ":5432/" + dbName;
			 	connection = DriverManager.getConnection(connectionURL, userName, password);
		 } catch (SQLException e) {
			 e.printStackTrace(); 
		 } catch (ClassNotFoundException e) {
				 e.printStackTrace();
		}
		 return connection;
	 }
	     
	     public void insertUser(User user) throws SQLException {
	    	 
	    	 try(Connection connection = getConnection(); 
	    			 PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_USER);) {
	    		 		preparedStatement.setString(1, user.getName());
	    		 		preparedStatement.setString(2, user.getSurname());
	    		 		preparedStatement.setInt(3, user.getAge());
	    		 		preparedStatement.executeUpdate();
	    	 } catch (Exception e) {
	    		 e.printStackTrace();
	    	 }
	     }
	     
	     public boolean updateUser(User user) throws SQLException {
	    	 
	    	 boolean rowUpdated;
	    	 try(Connection connection = getConnection(); 
	    			 PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_USER);) {
	    		 		statement.setString(1, user.getName());
	    		 		statement.setString(2, user.getSurname());
	    		 		statement.setInt(3, user.getAge());

	    		 		rowUpdated = statement.executeUpdate() > 0;
	    	 } 
	    		 return rowUpdated;
	    	 }
	     
	     public List<User> selectAllUsers() {
	    	 List<User> users = new ArrayList<>();
	    	 try(Connection connection = getConnection(); 
	    			 PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_ALL_USERS);) {
	    		 	System.out.println(preparedStatement);
	    		 	ResultSet rs = preparedStatement.executeQuery();
	    		 	
	    		 	while(rs.next()) {
	    		 		int id = rs.getInt("id");
	    		 		String name = rs.getString("name");
	    		 		String surname = rs.getString("surname");
	    		 		int age = rs.getInt("age");
	    		 		users.add(new User(id, name, surname, age));
	    	 	 	}
	    	 } catch (SQLException e) {
	    		 e.printStackTrace();
	    	 }
	    	 return users;
	     }
	     
	     public boolean deleteUser(String name) throws SQLException {
	    	 boolean rowDeleted;
	    	 try(Connection connection = getConnection(); 
	    			 PreparedStatement statement = connection.prepareStatement(SQL_DELETE_USER);) {
	    		 	statement.setString(1, name);
	    		 	rowDeleted = statement.executeUpdate() > 0;
	    		 }
	    	 return rowDeleted;
	     }
}


