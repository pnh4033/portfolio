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
	
	
	
	
	public Integer getPid() {
		return pid;
	}




	public void setPid(Integer pid) {
		this.pid = pid;
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




	public int getStartprice() {
		return startprice;
	}




	public void setStartprice(int startprice) {
		this.startprice = startprice;
	}




	public int getNowprice() {
		return nowprice;
	}




	public void setNowprice(int nowprice) {
		this.nowprice = nowprice;
	}




	public String getBuytype() {
		return buytype;
	}




	public void setBuytype(String buytype) {
		this.buytype = buytype;
	}




	public int getTendercnt() {
		return tendercnt;
	}




	public void setTendercnt(int tendercnt) {
		this.tendercnt = tendercnt;
	}




	public int getQuantity() {
		return quantity;
	}




	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}




	public Date getCreatedate() {
		return createdate;
	}




	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}




	@Override
	public String toString() {
		return "ProductVO [pid=" + pid + ", title=" + title + ", i_price=" + i_price + ", startprice=" + startprice
				+ ", nowprice=" + nowprice + ", buytype=" + buytype + ", tendercnt=" + tendercnt + ", quantity="
				+ quantity + ", createdate=" + createdate + "]";
	}




}
