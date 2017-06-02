package web.portfolio.domain;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class ProductVO {
	
	private Integer pno;
	private String pname;
	private String title;
	private String category;
	private int i_price;
	private int startprice;
	private int nowprice;
	private String buytype;
	private int tendercnt;
	private int quantity;
	private String desc_product;
	private Date createdate;
	private Date enddate;
	
	private String seller;
	private String buyer;
	private boolean finished;
	
	private String[] imgs;
	
	
	
	
	

	public Integer getPno() {
		return pno;
	}

	public void setPno(Integer pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getDesc_product() {
		return desc_product;
	}

	public void setDesc_product(String desc_product) {
		this.desc_product = desc_product;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public boolean isFinished() {
		return finished;
	}

	public void setFinished(boolean finished) {
		this.finished = finished;
	}

	public String[] getImgs() {
		return imgs;
	}

	public void setImgs(String[] imgs) {
		this.imgs = imgs;
	}

	
	
	
	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", pname=" + pname + ", title=" + title + ", category=" + category
				+ ", i_price=" + i_price + ", startprice=" + startprice + ", nowprice=" + nowprice + ", buytype="
				+ buytype + ", tendercnt=" + tendercnt + ", quantity=" + quantity + ", desc_product=" + desc_product
				+ ", createdate=" + createdate + ", enddate=" + enddate + ", seller=" + seller + ", buyer=" + buyer
				+ ", finished=" + finished + ", imgs=" + Arrays.toString(imgs) + "]";
	}



	

}
