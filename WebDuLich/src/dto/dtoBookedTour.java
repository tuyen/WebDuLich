package dto;


public class dtoBookedTour {
	private String userId = "";
	private String tourId = "";
	private String time;
	private int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String string) {
		this.time = string;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTourId() {
		return tourId;
	}
	public void setTourId(String tourId) {
		this.tourId = tourId;
	}
}
