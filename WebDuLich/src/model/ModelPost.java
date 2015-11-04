package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import dto.dtoPost;

public class ModelPost extends Model {

	public ModelPost() {
		super();
	}

	public void insertPlace(String tourId, String[] placeIds)
	{
		String sql = "INSERT INTO `touristplace`(`TourId`, `PlaceId`) VALUES (?,?)";
		if(this.connection.connect())
		{
			for(String s : placeIds)
			{
				java.sql.PreparedStatement preStatement;
				try {
					preStatement = this.connection
							.getConnection().prepareStatement(sql);
					preStatement.setInt(1, Integer.parseInt(tourId));
					preStatement.setInt(2, Integer.parseInt(s));
					preStatement.execute();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}																			
			
			this.connection.close();
		}
	}
	
	public String getLastTourId(String userId) throws SQLException
	{
		String sql = "SELECT COALESCE(max(`PostId`),-1) as `Id` FROM `post` WHERE `CategoryId` = 1 and `UserId` = " + userId;
		String result = "-1";
		if(this.connection.connect())
		{
			ResultSet resultSet = this.connection.read(sql);
			resultSet.next();
			result = resultSet.getString("Id");
			this.connection.close();			
		}
		return result;
		
	}
	
	public List<dtoPost> getToursPost() {
		List<dtoPost> tours = new ArrayList<dtoPost>();
		dtoPost tour = new dtoPost();
		String sql = "select * from post join category on post.CATEGORYID = category.CATEGORYID where category.CATEGORYNAME = 'Tour'";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try {
			while (rs.next()) {
				tour.setTitle(rs.getString("TITLE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tours;
	}

	public String getLastPost(String userId)
	{		
		String ret = null;
		if(this.connection.connect())
		{
			
			try {
				String sql = "SELECT `POSTID` FROM `post` WHERE `USERID` = " + userId;
				ResultSet rs = this.connection.read(sql);
				rs.next();
				ret = rs.getString("POSTID");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}
		return ret;
	}
	
	public Boolean addTouristPlace(dtoPost dto) {
		String sql = "INSERT INTO `post`(`CategoryId`, `UserId`, `Title`, `Content`, `Date`, `Price`, `Views`) VALUES (?,?,?,?,?,?,?)";
		Boolean rs = false;
		if (this.connection.connect()) {
			try {
				java.sql.PreparedStatement preStatement = this.connection
						.getConnection().prepareStatement(sql);
				preStatement.setInt(1, Integer.parseInt(dto.getCategoryId().trim()));
				preStatement.setInt(2, Integer.parseInt(dto.getUserId().trim()));
				preStatement.setString(3, dto.getTitle());
				preStatement.setString(4, dto.getContent());
				preStatement.setString(5, dto.getPostDate());
				preStatement.setString(6, dto.getPrice().trim());
				preStatement.setInt(7, 0);
				rs = preStatement.execute();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}

		return rs;
	}
}
