package web.portfolio.domain;

public class Criteria {
	
	private int page;
	
	private String searchType;
	private String keyWord;
	
	public Criteria() {
		this.page=1;
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
		return (this.page-1)*10;
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
