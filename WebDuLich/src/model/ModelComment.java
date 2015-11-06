package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.dtoComment;

public class ModelComment extends Model{

	public ModelComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * get all comment belong to specific post
	 * @param postId String
	 * @return listComment List<dtoComment>
	 */
	public List<dtoComment> getAllComment(String postId){
		String sql = "select * from comment where PostId = " + postId;
		List<dtoComment> listComment = new ArrayList<dtoComment>();
		dtoComment comment;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
					comment = new dtoComment();
					comment.setCommentId(rs.getString("CommentId"));
					comment.setContent(rs.getString("CommentContent"));
					comment.setDateComment(rs.getString("DateComment"));
					comment.setPostId(rs.getString("PostId"));
					comment.setUserId(rs.getString("UserId"));
					listComment.add(comment);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listComment;
	}
}
