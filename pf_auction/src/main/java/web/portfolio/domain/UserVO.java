package web.portfolio.domain;

import java.util.Date;

public class UserVO {
	
	private String userID;
	private String userPassword;
	private String userName;
	private String userEmail;
	private int userCell;
	private Date createdDate;
	private int userPoint;

	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserCell() {
		return userCell;
	}
	public void setUserCell(int userCell) {
		this.userCell = userCell;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	
	@Override
	public String toString() {
		return "UserVO [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userCell=" + userCell + ", userAddress=" + ", createdDate=" + createdDate
				+ ", userPoint=" + userPoint + "]";
	}
	
}
