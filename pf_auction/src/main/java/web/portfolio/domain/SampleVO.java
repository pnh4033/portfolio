package web.portfolio.domain;

public class SampleVO {
	
	private String samplePath;
	private Integer pno;
	
	
	public String getSamplePath() {
		return samplePath;
	}
	public void setSamplePath(String samplePath) {
		this.samplePath = samplePath;
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	
	
	@Override
	public String toString() {
		return "SampleVO [samplePath=" + samplePath + ", pno=" + pno + "]";
	}
	
	

}
