package web.portfolio.domain;

import java.util.List;

public class TenderVO {
	
	
	
	
	private int pno;
	private int tenderValueInput;
	private String buyer;
	private String userID;
	
	private List<Integer> myTender;
	private List<Integer> myAspect;
	private int myTenderPrice;

	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
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
	
	public int getMyTenderPrice() {
		return myTenderPrice;
	}
	
	public void setMyTenderPrice(int myTenderPrice) {
		this.myTenderPrice = myTenderPrice;
	}


	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getTenderValueInput() {
		return tenderValueInput;
	}
	public void setTenderValueInput(int tenderValueInput) {
		this.tenderValueInput = tenderValueInput;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	
	
	
	@Override
	public String toString() {
		return "TenderVO [pno=" + pno + ", tenderValueInput=" + tenderValueInput + ", buyer=" + buyer + ", userID="
				+ userID + ", myTender=" + myTender + ", myAspect=" + myAspect + ", myTenderPrice=" + myTenderPrice
				+ "]";
	}

	
	

}
