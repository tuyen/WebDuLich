package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.dtoUser;

public class ModelUser extends Model
{
	public ModelUser()
	{
		super();
	}

	public dtoUser getAccount(String email)
	{
		dtoUser user = new dtoUser();
		String sql = "select * from `account` where `EMAIL` = ?";
		connection.connect();
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, email);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			try
			{
				if (rs.next() != false)
				{
					user.setUserId(rs.getString("USERID"));
					user.setFullName(rs.getString("FULLNAME"));
					user.setBirthday(rs.getString("BIRTHDAY"));
					user.setEmail(rs.getString("EMAIL"));
					user.setPassword(rs.getString("PASSWORD"));
					user.setToken(rs.getString("LOGINTOKEN"));
					user.setAccountType(rs.getString("ACCOUNTTYPE"));					
					user.setPhone(rs.getString("PHONE"));
					user.setAddress(rs.getString("ADDRESS"));					
					user.setCompany(rs.getString("COMPANYNAME"));
					user.setCompanyDescription(rs.getString("COMPANYDESCRIPTION"));
					user.setStatus(rs.getBoolean("STATUS"));					
					user.setConfirmCode(rs.getString("CONFIRMCODE"));
					user.setAvatar(rs.getString("AVATAR"));
					
				} else
					return null;
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		connection.close();
		return user;
	}

	public boolean checkConfirmCode(int accountId, String code)
	{
		String sql = "select * from `account` where `CONFIRMCODE` = ? and `USERID` = ?";
		connection.connect();
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, code);
			stm.setInt(2, accountId);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			try
			{
				if (rs.next() == false)
					return false;
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		connection.close();
		return true;
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
}
