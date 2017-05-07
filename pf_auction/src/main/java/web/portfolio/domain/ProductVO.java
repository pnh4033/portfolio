package web.portfolio.domain;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ProductVO {
	
	private Integer pno;
	private String title;
	private int i_price;
	private int startprice;
	private int nowprice;
	private String buytype;
	private int tendercnt;
	private int quantity;
	private String desc_product;
	private Date createdate;
	
	private String[] imgs;
	private List<String> fileList;
	
	
	public List<String> getFileList() {
		return fileList;
	}




	public void setFileList(List<String> fileList) {
		this.fileList = fileList;
	}




	public String[] getImgs() {
		return imgs;
	}




	public void setImgs(String[] imgs) {
		this.imgs = imgs;
	}




	public String getDesc_product() {
		return desc_product;
	}




	public void setDesc_product(String desc_product) {
		this.desc_product = desc_product;
	}




	
	
	
	
	public Integer getPno() {
		return pno;
	}




	public void setPno(Integer pno) {
		this.pno = pno;
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
		return "ProductVO [pno=" + pno + ", title=" + title + ", i_price=" + i_price + ", startprice=" + startprice
				+ ", nowprice=" + nowprice + ", buytype=" + buytype + ", tendercnt=" + tendercnt + ", quantity="
				+ quantity + ", desc_product=" + desc_product + ", createdate=" + createdate + ", imgs="
				+ Arrays.toString(imgs) + ", fileList=" + fileList + "]";
	}




	





}
