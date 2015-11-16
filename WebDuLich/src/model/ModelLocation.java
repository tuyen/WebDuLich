package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.dtoLocation;
import dto.dtoPost;

public class ModelLocation extends Model {

	public ModelLocation() {
		// TODO Auto-generated constructor stub
		super();
	}

	// SELECT * FROM `post` WHERE `CategoryId` = 2

	public List<dtoLocation> getAllLocation() throws SQLException {
		List<dtoLocation> data = new ArrayList<dtoLocation>();
		String sql = "SELECT * FROM `location`";
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			while (rs.next()) {
				dtoLocation location = new dtoLocation();
				location.setLocationId(rs.getString("LocationId"));
				location.setName(rs.getString("Name"));
				location.setDescription(rs.getString("Description"));
				data.add(location);
			}

			this.connection.close();
		}
		return data;
	}
	
	
	public List<dtoPost> getAllPosts() {
		List<dtoPost> data = new ArrayList<dtoPost>();
		String sql = "SELECT * FROM `post` where `CategoryId` != 3";
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			try {
				while (rs.next()) {
					// PostId CategoryId LocationId UserId Title Content Date
					// Price Views
					dtoPost p = new dtoPost();
					p.setPostId(rs.getString("PostId"));
					p.setCategoryId(rs.getString("CategoryId"));
					p.setLocationId(rs.getString("LocationId"));
					p.setUserId(rs.getString("UserId"));
					p.setTitle(rs.getString("Title"));
					p.setContent(rs.getString("Content"));
					p.setPostDate(rs.getString("Date"));
					p.setPrice(rs.getString("Price"));
					p.setViews(rs.getString("Views"));
					data.add(p);
				}
			} catch (Exception e) {
			}

			this.connection.close();
		}
		return data;
	}
	

	public List<dtoPost> getAllTourPlace() {
		List<dtoPost> data = new ArrayList<dtoPost>();
		String sql = "SELECT * FROM `post` WHERE `CategoryId` = 2";
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			try {
				while (rs.next()) {
					// PostId CategoryId LocationId UserId Title Content Date
					// Price Views
					dtoPost p = new dtoPost();
					p.setPostId(rs.getString("PostId"));
					p.setCategoryId(rs.getString("CategoryId"));
					p.setLocationId(rs.getString("LocationId"));
					p.setUserId(rs.getString("UserId"));
					p.setTitle(rs.getString("Title"));
					p.setContent(rs.getString("Content"));
					p.setPostDate(rs.getString("Date"));
					p.setPrice(rs.getString("Price"));
					p.setViews(rs.getString("Views"));
					data.add(p);
				}
			} catch (Exception e) {
			}

			this.connection.close();
		}
		return data;
	}
}
