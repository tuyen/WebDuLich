package dto;

public class dtoComment {
	private String userId;
	private String commentId;
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	private String postId;
	private String content;
	private String dateComment;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDateComment() {
		return dateComment;
	}
	public void setDateComment(String dateComment) {
		this.dateComment = dateComment;
	}
}
