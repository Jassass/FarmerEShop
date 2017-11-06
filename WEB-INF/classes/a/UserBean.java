package a;
import java.io.Serializable;
import java.sql.*;

public class UserBean implements Serializable {

	transient static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	transient static final String DB_URL = "jdbc:mysql://localhost/farmereshop";

	// Database credentials
	transient static final String USER = "root";
	transient static final String PASS = "";

	private String fName;
	private String lName;
	private String password;
	private String location;
	private String city;
	private String state;
	private String type;
	private String contactNumber;

	public UserBean() {
 
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String registerUser() {

		String error = "";
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName(this.JDBC_DRIVER);

			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			stmt = conn.createStatement();
			String sql;

			sql = "Insert into users values('" + this.contactNumber + "', '" 
											 + this.password + "', '" 
											 + this.fName + "', '"
											 + this.lName + "', '"
											 + this.location + "', '" 
											 + this.city + "', '" 
											 + this.state + "', '"
											 + this.type + "');";

			stmt.executeUpdate(sql);
			
		} catch (SQLException se) {
			error = se.toString();
			se.printStackTrace();
		} catch (Exception e) {
			error = e.toString();
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return error;

	}
	public String updateProfile(String x) {

		String error = "";
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName(this.JDBC_DRIVER);

			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			stmt = conn.createStatement();
			String sql;

			sql = "Update users set contactNumber='" +this.contactNumber + "',"
									+ "password='" +this.password + "',"
									+ "fName='" +this.fName + "',"
									+ "lName='" +this.lName + "',"
									+ "location='" +this.location + "',"
									+ "city='" +this.city + "'," 
								    + "state='" + this.state + "'"
									+ " where contactNumber='"+ x +"' ;";

			stmt.executeUpdate(sql);
						
		} catch (SQLException se) {
			error = se.toString();
			se.printStackTrace();
		} catch (Exception e) {
			error = e.toString();
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return error;

	}


public String verifyUser() {

	
		String result = "";
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName(this.JDBC_DRIVER);

			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			stmt = conn.createStatement();
			String sql;

			sql = "Select * from users where contactNumber='" +this.contactNumber+"' and password= '"+this.password+"';";
            
			ResultSet rs= stmt.executeQuery(sql);
			if(rs.next()){
				result="true";
			}
			else{
				result="false";
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return result;

	}

}
