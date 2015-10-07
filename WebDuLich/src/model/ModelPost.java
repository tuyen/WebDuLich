package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.dtoPost;

public class ModelPost extends Model{
	
	public ModelPost() {
		super();
	}
	
	public List<dtoPost> getToursPost()
	{
		List<dtoPost> tours = new ArrayList<dtoPost>();
		dtoPost tour = new dtoPost();
		String sql = "select * from post join category on post.CATEGORYID = category.CATEGORYID where category.CATEGORYNAME = 'Tour'";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try {
			while (rs.next())
			{
				tour.setTitle(rs.getString("TITLE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tours;
	}
}
