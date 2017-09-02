package web.portfolio.domain;

public class PaymentVO {
	
	private String imp_uid;
	private String merchant_uid;
	private int paid_amount;
	private int apply_num;
	private String buyer_name;
	private String buyer_email;
	private String buyer_tel;
	private String buyer_addr;
	private String buyer_postcode;
	private long paid_at;
	private String paymentTime;
	private int pno;
	private String userID;
	
	
	public String getPaymentTime() {
		return paymentTime;
	}
	
	public void setPaymentTime(String paymentTime) {
		this.paymentTime = paymentTime;
	}
	
	public String getImp_uid() {
		return imp_uid;
	}
	
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	
	public String getMerchant_uid() {
		return merchant_uid;
	}
	
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	
	public int getPaid_amount() {
		return paid_amount;
	}
	
	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
	}
	
	public int getApply_num() {
		return apply_num;
	}
	
	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}
	
	public String getBuyer_name() {
		return buyer_name;
	}
	
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	
	public String getBuyer_email() {
		return buyer_email;
	}
	
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	
	public String getBuyer_tel() {
		return buyer_tel;
	}
	
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	
	public String getBuyer_addr() {
		return buyer_addr;
	}
	
	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}
	
	public String getBuyer_postcode() {
		return buyer_postcode;
	}
	
	public void setBuyer_postcode(String buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}
	
	public long getPaid_at() {
		return paid_at;
	}
	
	public void setPaid_at(long paid_at) {
		this.paid_at = paid_at;
	}
	
	public int getPno() {
		return pno;
	}
	
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}

	
	
	@Override
	public String toString() {
		return "PaymentVO [imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", paid_amount=" + paid_amount
				+ ", apply_num=" + apply_num + ", buyer_name=" + buyer_name + ", buyer_email=" + buyer_email
				+ ", buyer_tel=" + buyer_tel + ", buyer_addr=" + buyer_addr + ", buyer_postcode=" + buyer_postcode
				+ ", paid_at=" + paid_at + ", paymentTime=" + paymentTime + ", pno=" + pno + ", userID=" + userID + "]";
	}

	
	
	

}
