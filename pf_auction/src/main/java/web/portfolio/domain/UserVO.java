package web.portfolio.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class UserVO {
	
	private String userID;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userCell;
	private Date createdDate;
	private int userPoint;
	
	private List<Integer> myTender;
	private List<Integer> myAspect;
	private int myTenderPrice;
	
	
	
	public int getMyTenderPrice() {
		return myTenderPrice;
	}

	public void setMyTenderPrice(int myTenderPrice) {
		this.myTenderPrice = myTenderPrice;
	}

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
	
	public String getUserCell() {
		return userCell;
	}
	
	public void setUserCell(String userCell) {
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
	
	public List<Integer> getMyTender() {
		return myTender;
	}
	
	public void setMyTender(List<Integer> myTender) {
		this.myTender = myTender;
	}
	
	public List<Integer> getMyAspect() {
		return myAspect;
	}
	
	public void setMyAspect(List<Integer> myAspect) {
		this.myAspect = myAspect;
	}

	
	
	@Override
	public String toString() {
		return "UserVO [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userCell=" + userCell + ", createdDate=" + createdDate + ", userPoint=" + userPoint
				+ ", myTender=" + myTender + ", myAspect=" + myAspect + ", myTenderPrice=" + myTenderPrice + "]";
	}

	
	
}
