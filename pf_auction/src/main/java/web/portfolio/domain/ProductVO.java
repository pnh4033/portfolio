package web.portfolio.domain;

import java.util.Date;

public class ProductVO {
	
	private Integer pID;
	private String title;
	private int i_price;
	private int startPrice;
	private int nowPrice;
	private boolean buyType;
	private int tenderCnt;
	private int quantity;
	private Date createDate;
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getpID() {
		return pID;
	}
	public void setpID(Integer pID) {
		this.pID = pID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public int getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}
	public int getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(int nowPrice) {
		this.nowPrice = nowPrice;
	}
	public boolean isBuyType() {
		return buyType;
	}
	public void setBuyType(boolean buyType) {
		this.buyType = buyType;
	}
	public int getTenderCnt() {
		return tenderCnt;
	}
	public void setTenderCnt(int tenderCnt) {
		this.tenderCnt = tenderCnt;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	@Override
	public String toString() {
		return "ProductsVO [pID=" + pID + ", title=" + title + ", i_price=" + i_price + ", startPrice=" + startPrice
				+ ", nowPrice=" + nowPrice + ", buyType=" + buyType + ", tenderCnt=" + tenderCnt + ", quantity="
				+ quantity + "]";
	}
	
	

}
