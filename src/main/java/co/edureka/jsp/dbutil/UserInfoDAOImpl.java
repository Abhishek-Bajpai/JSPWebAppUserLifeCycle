/**
 * 
 */
package co.edureka.jsp.dbutil;

import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author Abhishek Bajpai
 *
 */
public class UserInfoDAOImpl implements UserInfoDAO {

	private final String connectionURL = "jdbc:oracle:thin:@localhost:1521:XE";
	private final String dbUser = "edureka";
	private final String dbUserPwdString = "Dost!234";
	private String createSQL = "create table student(id number, name varchar2(30), class varchar2(30), marks number(5,3))";
	private String inputString = null;
	
	private Connection connection;
	private Statement statement;

	public UserInfoDAOImpl() {
		try {
			connection = DriverManager.getConnection(connectionURL, dbUser, dbUserPwdString);
			statement = connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}	}

	//Adding getConnection so it can be closed by the calling program once DB processing is done
	public Connection getConnection() {
		return connection;
	}

 	public Statement getStatement() {
		return statement;
	}

	@Override
	public void create() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(UserInfo user) throws SQLException {
		inputString  ="insert into userinfo values('"+ user.getUserName() + "','"+user.getPassword()+"','"+user.getFirstName()+"','"+user.getLastName()+"')";
		System.out.println("\t" + inputString);
		statement.executeUpdate(inputString);
		System.out.println("Record Inserted for { " + user +" } ...!!! ");			
	}

	@Override
	public ArrayList<UserInfo> selectByUserName(String userName) throws SQLException {
		inputString = "select * from userinfo where username='"+userName+"'";
		System.out.println("\n"+inputString+"\n");

		ResultSet resultSet = statement.executeQuery(inputString);
		
		ArrayList<UserInfo> listOfUsers = new ArrayList<>();
		
		UserInfo userInfo=null;
		while(resultSet.next()) {
			String uName = resultSet.getString("USERNAME");
			String pwdString = resultSet.getString("PASSWORD");
			String firstName = resultSet.getString("FIRSTNAME");
			String lastName = resultSet.getString("LASTNAME");
			userInfo=new UserInfo(uName, pwdString, firstName, lastName);
			listOfUsers.add(userInfo);
			System.out.println("Retrieved from database - "  + userInfo);
			System.out.println("----------------------------------------------------------------------------------");
		}
		
		System.out.println("ALERT ALERT ALERT ... No of accounts found = " + listOfUsers.size());
		return listOfUsers;
		
	}

}
