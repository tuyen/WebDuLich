package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import dto.dtoCategory;
import dto.dtoPost;
import dto.dtoTouristPlace;

public class ModelPost extends Model {

	public ModelPost() {
		super();
	}

	
	public void removeAllPlace(String tourId)
	{
		String sql= "DELETE FROM `touristplace` WHERE `TourId` = "+tourId;
		if(connection.connect())
		{
			connection.write(sql);
			connection.close();
		}
	}
	
	/**
	 * get a number of post by specific category from offset get limit post
	 * 
	 * @param categoryId
	 *            String
	 * @param limit
	 *            int
	 * @param offset
	 *            int
	 * @return listPost List<String>
	 */
	public List<dtoPost> getAllPostByCategory(String categoryId, int limit,
			int offset) {
		List<dtoPost> listPost = new ArrayList<dtoPost>();
		String sql = "select * from post where post.CategoryId = " + categoryId
				+ " order by post.PostId desc limit " + offset + "," + limit;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					dtoPost post = new dtoPost();
					post.setPostId(rs.getString("PostId"));
					post.setCategoryId(rs.getString("CategoryId"));
					post.setLocationId(rs.getString("LocationId"));
					post.setUserId(rs.getString("UserId"));
					post.setTitle(rs.getString("Title"));
					post.setContent(rs.getString("Content"));
					post.setPostDate(rs.getString("Date"));
					post.setPrice(rs.getString("Price"));
					post.setViews(rs.getString("Views"));
					post.setBuys(rs.getString("Buys"));
					post.setNumberPeople(rs.getString("NumberPerson"));
					post.setTotalTime(rs.getString("TotalTime"));
					post.setShortContent(getShortContents(post.getPostId()));
					listPost.add(post);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		connection.close();
		return listPost;
	}		
	
	/**
	 * get a number of image source of specific post
	 * 
	 * @param postId
	 *            String
	 * @param limit
	 *            int
	 * @return listSrc List<String>
	 */
	public List<String> getImagesFromPost(String postId, int limit) {
		List<String> listSrc = new ArrayList<String>();
		String sql = "select Content from post where PostId = " + postId;
		int i = 0;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				if (rs.next()) {
					matcher = pattern.matcher(rs.getString("Content"));
					while (matcher.find()) {
						listSrc.add(matcher.group(1));
						if (limit > 0 && ++i > limit)
							break;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (listSrc.isEmpty())
			listSrc.add("view/resource/image/default.jpg");
		connection.close();
		return listSrc;
	}
	
	public List<dtoTouristPlace> getTouristPlace(String postId)
	{
		List<dtoTouristPlace> tours = new ArrayList<dtoTouristPlace>();
		String sql = "SELECT `TourId`, `PlaceId`,`post`.`Title` FROM `touristplace`,`post` WHERE `post`.`PostId` = `touristplace`.`PlaceId` and `TourId` = "+postId;		
		if(this.connection.connect())
		{
			ResultSet rs = this.connection.read(sql);
			try {
				while(rs.next())
				{
					dtoTouristPlace dto = new dtoTouristPlace();					
					dto.setPlaceId( rs.getString("PlaceId"));
					dto.setTitle(rs.getString("Title"));
					dto.setTourId(postId);
					tours.add(dto);					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			this.connection.close();
		}
		return tours;
	}
	
	
	public String getTourFeelingId(String postId)
	{
		dtoTouristPlace tours = new dtoTouristPlace();
		tours.setPlaceId("");
		String sql = "SELECT `PlaceId` FROM `touristplace`,`post` WHERE `post`.`PostId` = `touristplace`.`PlaceId` and `TourId` = "+postId;		
		if(this.connection.connect())
		{
			ResultSet rs = this.connection.read(sql);
			try {
				if(rs.next())
				{
					dtoTouristPlace dto = new dtoTouristPlace();					
					tours.setPlaceId(rs.getString("PlaceId"));
					tours.setTourId(postId);	
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			this.connection.close();
		}
		return tours.getPlaceId();
	}
	
	
	public void insertPlace(String tourId, String[] placeIds) {
		String sql = "INSERT INTO `touristplace`(`TourId`, `PlaceId`) VALUES (?,?)";
		if (this.connection.connect()) {
			for (String s : placeIds) {
				java.sql.PreparedStatement preStatement;
				try {
					preStatement = this.connection.getConnection()
							.prepareStatement(sql);
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

	public String getLastTourId(String userId) throws SQLException {
		String sql = "SELECT COALESCE(max(`PostId`),-1) as `Id` FROM `post` WHERE `CategoryId` = 1 and `UserId` = "
				+ userId;
		String result = "-1";
		if (this.connection.connect()) {
			ResultSet resultSet = this.connection.read(sql);
			resultSet.next();
			result = resultSet.getString("Id");
			this.connection.close();
		}
		return result;

	}
	
	public String getLastFeelingId(String userId) throws SQLException {
		String sql = "SELECT COALESCE(max(`PostId`),-1) as `Id` FROM `post` WHERE `CategoryId` = 3 and `UserId` = "
				+ userId;
		String result = "-1";
		if (this.connection.connect()) {
			ResultSet resultSet = this.connection.read(sql);
			resultSet.next();
			result = resultSet.getString("Id");
			this.connection.close();
		}
		return result;

	}

	public int getCountPost(String categoryId) {
		if (connection.connect()) {
			ResultSet rs = connection
					.read("SELECT COUNT(PostId) as num FROM post WHERE post.CategoryId ="
							+ categoryId);
			try {
				if (rs.next())
					return rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connection.close();
		}
		return 0;
	}

	/**
	 * get all post by specific category
	 * 
	 * @param categoryId
	 *            String
	 * @return listPost List<dtoPost>
	 */
	public List<dtoPost> getAllPostByCategory(String categoryId) {
		List<dtoPost> listPost = new ArrayList<dtoPost>();
		String sql = "select * from post where post.CategoryId = " + categoryId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					dtoPost post = new dtoPost();
					post.setPostId(rs.getString("PostId"));
					post.setCategoryId(rs.getString("CategoryId"));
					post.setLocationId(rs.getString("LocationId"));
					post.setUserId(rs.getString("UserId"));
					post.setTitle(rs.getString("Title"));
					post.setContent(rs.getString("Content"));
					post.setPostDate(rs.getString("Date"));
					post.setPrice(rs.getString("Price"));
					post.setViews(rs.getString("Views"));
					post.setBuys(rs.getString("Buys"));
					post.setNumberPeople(rs.getString("NumberPerson"));
					post.setTotalTime(rs.getString("TotalTime"));
					post.setShortContent(getShortContents(post.getPostId()));
					listPost.add(post);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		connection.close();
		return listPost;
	}

	public String getLastPost(String userId) {
		String ret = null;
		if (this.connection.connect()) {

			try {
				String sql = "SELECT max(`PostId`) as `PostId` FROM `post` WHERE `UserId` = "
						+ userId;
				ResultSet rs = this.connection.read(sql);
				rs.next();
				ret = rs.getString("PostId");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}
		return ret;
	}

	public Boolean updatePost(dtoPost post)
	{
		String sql = "UPDATE `post` SET `LocationId`=?,`Title`=?,`Content`=?,`Price`=?,`NumberPerson`=?,`TotalTime`=? WHERE `PostId`="+post.getPostId();			
		if (this.connection.connect()) {
			try {
				java.sql.PreparedStatement preStatement = this.connection
						.getConnection().prepareStatement(sql);
								
				preStatement.setInt(1,Integer.parseInt( post.getLocationId()));
				preStatement.setString(2, post.getTitle());
				preStatement.setString(3, post.getContent());
				preStatement.setString(4, post.getPrice());
				preStatement.setInt(5, Integer.parseInt(post.getNumberPeople()));
				preStatement.setString(6, post.getTotalTime());								
				preStatement.execute();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}
		return true;
	}
	
	public Boolean addTouristPlace(dtoPost dto) {		
		String sql = "INSERT INTO `post`(`CategoryId`, `UserId`, `Title`, `Content`, `Date`, `Price`, `Views`,`NumberPerson`,`TotalTime`,`Buys`,`LocationId`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
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
				preStatement.setInt(8, Integer.parseInt(dto.getNumberPeople().trim()));
				preStatement.setString(9, dto.getTotalTime());
				preStatement.setInt(10, Integer.parseInt(dto.getBuys().trim()));
				if(dto.getLocationId() !="")
					preStatement.setInt(11, Integer.parseInt(dto.getLocationId().trim()));
				rs = preStatement.execute();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}

		return rs;
	}

	final String regex = "<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>";
	final Pattern pattern = Pattern.compile(regex);
	Matcher matcher;

	/**
	 * get list src of the images in post specific post
	 * 
	 * @return listSrc List<String>
	 */
	public List<String> getImagesFromPost(String postId) {
		List<String> listSrc = new ArrayList<String>();
		String sql = "select Content from post where PostId = " + postId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				if (rs.next()) {
					matcher = pattern.matcher(rs.getString("Content"));
					while (matcher.find()) {
						listSrc.add(matcher.group(1));
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (listSrc.isEmpty())
			listSrc.add("view/resource/image/default.jpg");
		connection.close();
		return listSrc;
	}

	/**
	 * get top 200 words from content of post
	 * 
	 * @param postId
	 *            String
	 * @return String
	 */
	public String getShortContents(String postId) {
		String shortContent = "";
		String sql = "select left(Content, 200) as ShortContent from post where PostId = "
				+ postId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				if (rs.next()) {
					shortContent = rs.getString("ShortContent");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		connection.close();
		return shortContent;
	}

	/**
	 * get all category from database
	 * 
	 * @return listCate List<dtoCategory>
	 */
	public List<dtoCategory> getAllCategory() {
		List<dtoCategory> listCate = new ArrayList<dtoCategory>();
		if (connection.connect()) {
			ResultSet rs = connection.read("select * from category");
			try {
				while (rs.next()) {
					dtoCategory cate = new dtoCategory();
					cate.setCategoryId(rs.getString("CategoryId"));
					cate.setName(rs.getString("CategoryName"));
					listCate.add(cate);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connection.close();
		}
		return listCate;
	}

	/**
	 * get post by post id
	 * @param id String
	 * @return post dtoPost
	 */
	public dtoPost getPostById(String id) {
		dtoPost post = new dtoPost();
		if (connection.connect()) {
			String sql = "select * from post where PostId = ?";
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, id);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				try {
					if (rs.next()) {
						post.setCategoryId(rs.getString("CategoryId"));
						post.setContent(rs.getString("Content"));
						post.setLocationId(rs.getString("LocationId"));
						post.setPostDate(rs.getString("Date"));
						post.setPostId(rs.getString("PostId"));
						post.setPrice(rs.getString("Price"));
						post.setTitle(rs.getString("Title"));
						post.setUserId(rs.getString("UserId"));
						post.setViews(rs.getString("Views"));
						post.setBuys(rs.getString("Buys"));
						post.setNumberPeople(rs.getString("NumberPerson"));
						post.setTotalTime(rs.getString("TotalTime"));
						post.setShortContent(getShortContents(post.getPostId()));
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
		return post;
	}
}
