package web.portfolio.dto;

public class LoginDTO {
	
	private String userID;
	private String userPassword;
	private boolean useCookie;
	
	
	
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	
	
	@Override
	public String toString() {
		return "LoginDTO [userID=" + userID + ", userPassword=" + userPassword + ", useCookie=" + useCookie + "]";
	}
	
	
	

}
