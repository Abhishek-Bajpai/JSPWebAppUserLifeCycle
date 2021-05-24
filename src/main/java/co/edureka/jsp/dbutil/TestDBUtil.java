/**
 * 
 */
package co.edureka.jsp.dbutil;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author Abhishek Bajpai
 *
 */
public class TestDBUtil {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		UserInfoDAO userInfoDAO = new UserInfoDAOImpl();
		try {
			//userInfo.insert(new UserInfo("cosmoleak@gmail.com", "PopEye", "David", "Warner"));
			ArrayList<UserInfo> listOfUsers = userInfoDAO.selectByUserName("gouri.bajp@gmail.com");
			System.out.println(listOfUsers.size());
			
			for(UserInfo user:listOfUsers) {
				System.out.println(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
