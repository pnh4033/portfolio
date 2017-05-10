package web.portfolio.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyWord;
	
	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}


	
	public Criteria() {
		this.page=1;
		this.perPageNum=20;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		
		this.page=page;
	}
	
	public int getStartPage() {
		return (this.page-1)*20;
	}
	
	
	
	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyWord() {
		return keyWord;
	}
	
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", searchType=" + searchType + ", keyWord=" + keyWord + "]";
	}


}
