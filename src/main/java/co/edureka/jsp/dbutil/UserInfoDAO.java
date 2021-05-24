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
public interface UserInfoDAO {

	void create() throws SQLException;
	void insert(UserInfo user) throws SQLException;
	ArrayList<UserInfo> selectByUserName(String userName) throws SQLException;
	
}
