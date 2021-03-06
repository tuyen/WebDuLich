package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import dto.dtoBookedTour;

public class ModelBookedTour extends Model {

	public ModelBookedTour() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * add a tour has already booked by a user
	 * 
	 * @param bookedTour
	 */
	public void addBookedTour(dtoBookedTour bookedTour) {
		if (connection.connect()) {
			String sql = "insert into bookedtour values (?, ?, ?, ?)";
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, bookedTour.getUserId());
				stm.setString(2, bookedTour.getTourId());
				stm.setInt(3, bookedTour.getStatus());
				stm.setString(4, bookedTour.getTime());
				connection.setPrepareStatement(stm);
				connection.writeSecure();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			connection.close();
		}
	}

	/**
	 * update booked tour
	 * 
	 * @param bookedTour
	 */
	public void updateBookedTour(dtoBookedTour bookedTour) {
		if (connection.connect()) {
			String sql = "update bookedtour set Time = ?, Status = ? where UserId = "
					+ bookedTour.getUserId()
					+ " and TourId = "
					+ bookedTour.getTourId();
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, bookedTour.getTime());
				stm.setInt(2, bookedTour.getStatus());
				connection.setPrepareStatement(stm);
				connection.writeSecure();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			connection.close();
		}
	}

	/**
	 * check if a user has booked a tour or not
	 * 
	 * @param userId
	 * @param tourId
	 * @return
	 */
	public int checkBookedTour(String userId, String tourId) {
		int booked = 0;
		if (connection.connect()) {
			String sql = "select * from bookedtour where TourId = ? and UserId = ?";
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, tourId);
				stm.setString(2, userId);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				try {
					if (rs.next()) {
						if (rs.getInt("Status") == 1)
							booked = 1;
						else
							booked = -1;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			connection.close();
		}
		return booked;
	}

	public boolean checkBookedTourStatus(String userId, String tourId) {
		boolean booked = false;
		if (connection.connect()) {
			String sql = "select * from bookedtour where TourId = ? and UserId = ?";
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, tourId);
				stm.setString(2, userId);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				try {
					if (rs.next()) {
						if (rs.getInt("Status") == 1)
							booked = true;
						else
							booked = false;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			connection.close();
		}
		return booked;
	}

	/**
	 * check if user can book a tour or not
	 * 
	 * @param userId
	 * @param tourId
	 * @return
	 */
	Calendar cal;
	Date currentDate;

	public boolean checkUserCanBookTour(String userId, String tourId) {
		boolean canBook = true;
		if (connection.connect()) {
			String sql = "select * from bookedtour where TourId = ? and UserId = ?";
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, tourId);
				stm.setString(2, userId);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				try {
					if (rs.next()) {
						Date time = rs.getDate("Time");
						cal = Calendar.getInstance();
						currentDate = new Date(cal.getTimeInMillis());
						// if user has already cancel this tour at least one day
						// before
						String t1 = time.toString();
						String t2 = currentDate.toString();
						if (rs.getInt("Status") == 0)
							if (!t1.equals(t2))
								canBook = true;
							else
								canBook = false;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			connection.close();
		}
		return canBook;
	}
}
