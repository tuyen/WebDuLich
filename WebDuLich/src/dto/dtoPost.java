package dto;

public class dtoPost {
	private String postId;
	private String categoryId;
	private String userId;
	private String title;
	private String content;
	private String postDate;
	private String price;
	private String views;
	private String locationId;
	private String buys = "0";
	private String totalTime = "";
	private String shortContent;
	private String numberPeople = "0";
	
	public String getNumberPeople() {
		return numberPeople;
	}
	public void setNumberPeople(String numberPeople) {
		this.numberPeople = numberPeople;
	}


	public String getShortContent() {
		return shortContent;
	}
	public void setShortContent(String shortContent) {
		this.shortContent = shortContent;
	}
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}
	public String getNumberPerson() {
		return numberPerson;
	}
	public void setNumberPerson(String numberPerson) {
		this.numberPerson = numberPerson;
	}
	private String numberPerson;
	public String getBuys() {
		return buys;
	}
	public void setBuys(String buy) {
		this.buys = buy;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
		this.views = views;
	}
	
}
