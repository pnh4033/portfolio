package web.portfolio.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Paging {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int showPageNum=10;
	private Criteria criteria;
	
	public void setCriteria(Criteria criteria) {
		this.criteria=criteria;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		
		CalcPaging();
	}
	
	private void CalcPaging() {
		endPage=(int)(Math.ceil(criteria.getPage()/(double)showPageNum)*showPageNum);
		startPage=(endPage-showPageNum)+1;
		
		int addEndPage=(int)(Math.ceil(totalCount/(double)10));
		
		if(endPage>addEndPage) {
			endPage=addEndPage;
		}
		
		prev=(startPage == 1) ? false : true;
		next=(endPage*10) >= totalCount ? false : true;
	}

	
	
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getShowPageNum() {
		return showPageNum;
	}

	public void setShowPageNum(int showPageNum) {
		this.showPageNum = showPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCriteria() {
		return criteria;
	}
	
	
	
	public String makeQuery(int page) {
		UriComponents uriComponents=UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String makeSearchQuery(int page) {
		UriComponents uriComponents=UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("searchType", criteria.getSearchType())
				.queryParam("keyWord", criteria.getKeyWord())
				.build();
		
		return uriComponents.toUriString();
	}

}

















