package web.portfolio.domain;

import java.util.Date;

public class ProductVO {
	
	private Integer pid;
	private String title;
	private int i_price;
	private int startprice;
	private int nowprice;
	private String buytype;
	private int tendercnt;
	private int quantity;
	private Date createdate;
	
	public Date getCreateDate() {
		return createdate;
	}
	public void setCreateDate(Date createDate) {
		this.createdate = createDate;
	}
	public Integer getpID() {
		return pid;
	}
	public void setpID(Integer pID) {
		this.pid = pID;
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
		return startprice;
	}
	public void setStartPrice(int startPrice) {
		this.startprice = startPrice;
	}
	public int getNowPrice() {
		return nowprice;
	}
	public void setNowPrice(int nowPrice) {
		this.nowprice = nowPrice;
	}
	public String isBuyType() {
		return buytype;
	}
	public void setBuyType(String buyType) {
		this.buytype = buyType;
	}
	public int getTenderCnt() {
		return tendercnt;
	}
	public void setTenderCnt(int tenderCnt) {
		this.tendercnt = tenderCnt;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	@Override
	public String toString() {
		return "ProductsVO [pID=" + pid + ", title=" + title + ", i_price=" + i_price + ", startPrice=" + startprice
				+ ", nowPrice=" + nowprice + ", buyType=" + buytype + ", tenderCnt=" + tendercnt + ", quantity="
				+ quantity + "]";
	}
	
	

}
