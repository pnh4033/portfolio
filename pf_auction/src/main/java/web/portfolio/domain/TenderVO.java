package web.portfolio.domain;

public class TenderVO {
	
	
	
	
	private int pno;
	private int tenderValueInput;
	private String buyer;
	
	
	
	
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
		return "TenderVO [pno=" + pno + ", tenderValueInput=" + tenderValueInput + ", buyer=" + buyer + "]";
	}
	
	
	

}
