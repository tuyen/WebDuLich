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
}
