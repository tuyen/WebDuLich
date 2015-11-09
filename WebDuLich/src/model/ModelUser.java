package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.dtoUser;

public class ModelUser extends Model {
	public ModelUser() {
		super();
	}
	
	
	
	public dtoUser getUserById(String userId) {
		dtoUser user = new dtoUser();
		String sql = "SELECT * FROM `user` WHERE `UserId` = ?";
		if (connection.connect()) {
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, userId);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				try {
					if (rs.next() != false) {
						user.setUserId(rs.getString("UserId"));
						user.setFullName(rs.getString("FullName"));
						user.setBirthday(rs.getString("Birthday"));
						user.setEmail(rs.getString("Enail"));
						user.setPassword(rs.getString("Password"));
						user.setToken(rs.getString("LoginToken"));
						user.setAccountType(rs.getString("AccountType"));
						user.setPhone(rs.getString("PHONE"));
						user.setAddress(rs.getString("Address"));
						user.setCompany(rs.getString("CompanyName"));
						user.setCompanyDescription(rs
								.getString("CompanyDescription"));
						user.setStatus(rs.getBoolean("Status"));
						user.setConfirmCode(rs.getString("ConfirmCode"));
						user.setAvatar(rs.getString("Avatar"));

					} else
						return null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			connection.close();
		}
		return user;
	}

	/**
	 * get account by email
	 * @param email String
	 * @return user dtoUser
	 */	
	public dtoUser getAccountByEmail(String email) {
		dtoUser user = new dtoUser();
		String sql = "select * from `account` where `Email` = ?";
		connection.connect();
		try {
			PreparedStatement stm = connection.getConnection()
					.prepareStatement(sql);
			stm.setString(1, email);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			try {
				if (rs.next() != false) {
					user.setUserId(rs.getString("UserId"));
					user.setFullName(rs.getString("FullName"));
					user.setBirthday(rs.getString("Birthday"));
					user.setEmail(rs.getString("Email"));
					user.setPassword(rs.getString("Password"));
					user.setToken(rs.getString("LoginToken"));
					user.setAccountType(rs.getString("AccountType"));
					user.setPhone(rs.getString("Phone"));
					user.setAddress(rs.getString("Address"));
					user.setCompany(rs.getString("CompanyName"));
					user.setCompanyDescription(rs
							.getString("CompanyDescription"));
					user.setStatus(rs.getBoolean("Status"));
					user.setConfirmCode(rs.getString("ConfirmCode"));
					user.setAvatar(rs.getString("Avatar"));

				} else
					return null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		connection.close();
		return user;
	}
	
	/**
	 * get account by UserId
	 * @param id String
	 * @return user dtoUser
	 */
	public dtoUser getAccountByUserId(String id) {
		dtoUser user = new dtoUser();
		String sql = "select * from `account` where `UserId` = ?";
		connection.connect();
		try {
			PreparedStatement stm = connection.getConnection()
					.prepareStatement(sql);
			stm.setString(1, id);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			try {
				if (rs.next() != false) {
					user.setUserId(rs.getString("UserId"));
					user.setFullName(rs.getString("FullName"));
					user.setBirthday(rs.getString("Birthday"));
					user.setEmail(rs.getString("Email"));
					user.setPassword(rs.getString("Password"));
					user.setToken(rs.getString("LoginToken"));
					user.setAccountType(rs.getString("AccountType"));
					user.setPhone(rs.getString("Phone"));
					user.setAddress(rs.getString("Address"));
					user.setCompany(rs.getString("CompanyName"));
					user.setCompanyDescription(rs
							.getString("CompanyDescription"));
					user.setStatus(rs.getBoolean("Status"));
					user.setConfirmCode(rs.getString("ConfirmCode"));
					user.setAvatar(rs.getString("Avatar"));

				} else
					return null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		connection.close();
		return user;
	}

	public boolean checkConfirmCode(int accountId, String code) {
		String sql = "select * from `account` where `CONFIRMCODE` = ? and `USERID` = ?";
		connection.connect();
		try {
			PreparedStatement stm = connection.getConnection()
					.prepareStatement(sql);
			stm.setString(1, code);
			stm.setInt(2, accountId);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			try {
				if (rs.next() == false)
					return false;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		connection.close();
		return true;
	}

	public String getCompanyNameById(String userId) {
		String sql = "select CompanyName from `user` where `UserId` = ?";
		if (connection.connect()) {
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, userId);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				try {
					if (rs.next())
						return rs.getString("CompanyName");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			connection.close();
		}
		return "";
	}
	
	public void createAccount(String userName, String email, String password, String accountType,int code) throws SQLException
	{
		//dtoUser user = new dtoUser();
		String sql = "insert into user(FullName,Email,Password,AccountType,Status,ConfirmCode) "
				+ "values(?,?,?,?,'No',?)";		
		if (connection.connect())
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, userName);
			stm.setString(2, email);
			stm.setString(3, password);
			stm.setString(4, accountType);
			stm.setInt(5,code);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
			connection.close();
		}
		
	}
	public boolean checkMailExist(String email) throws SQLException
	{
		String sql = "select Email from user where Email= ?";
		if(connection.connect())
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, email);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			if (rs.next())
			{
				connection.close();
				return true;
			}
		}
		connection.close();
		return false;
	}
	public boolean checkCode(String code, String email) throws SQLException
	{
		String sql = "SELECT `Email` FROM `user` WHERE Email= ? and ConfirmCode = ?";
		if(connection.connect())
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, code);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			if (rs.next())
			{
				connection.close();
				return true;
			}
		}
		connection.close();
		return false;
	}
	public void activeAccount(String email) throws SQLException
	{
		String sql = "UPDATE `user` SET `Status`='Yes' WHERE Email = ?";
		if (connection.connect())
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, email);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
			connection.close();
		}
	}
	
	public boolean checkSignIn(String email,String password)
	{
		String sql = "SELECT * FROM `user` WHERE Email= ? and Password = ? and Status = 'No'";
		if (connection.connect())
		{
			try {
				PreparedStatement stm = connection.getConnection().prepareStatement(sql);
				stm.setString(1, email);
				stm.setString(2, password);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				if (rs.next())
				{
					connection.close();
					return true;
				}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		connection.close();
		return false;
	}
	
	
	public String getUserPassword(String userId) throws SQLException
	{
		String sql = "SELECT `Password` FROM `user` WHERE `UserId` = "+ userId;
		String password= "";
		if(this.connection.connect())
		{
			ResultSet rs = this.connection.read(sql);
			if(rs.next())
			{
				password = rs.getString("Password");
			}
			this.connection.close();
		}
		return password;
	}


	public void updateUserPassword(String userId, String userPassword)
	{
		String sql = "UPDATE `user` SET `Password`= '"+userPassword+"' WHERE `UserId` = "+ userId;
		if(this.connection.connect())
		{
			this.connection.write(sql);
			this.connection.close();
		}
	}
	
	public boolean updateUserProfile(dtoUser user) {
		String sql = "UPDATE `user` SET `FullName`=?,`Birthday`=?,`Enail`=?,`PHONE`=?,`Address`=?,`CompanyName`=?,`CompanyDescription`=? WHERE `UserId`="
				+ user.getUserId();
		boolean result = false;
		if (connection.connect()) {
			java.sql.PreparedStatement preStatement;
			try {
				preStatement = this.connection.getConnection()
						.prepareStatement(sql);
				preStatement.setString(1, user.getFullName());
				preStatement.setString(2, user.getBirthday());
				preStatement.setString(3, user.getEmail());
				preStatement.setString(4, user.getPhone());
				preStatement.setString(5, user.getAddress());
				preStatement.setString(6, user.getCompany());
				preStatement.setString(7, user.getCompanyDescription());
				preStatement.execute();
				result =  true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result = false;
			}
			connection.close();
		}
		return result;
	}
}
