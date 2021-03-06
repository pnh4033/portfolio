package web.portfolio.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Paging {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int showPageNum=10;   /*화면에 표시되는 페이지 갯수*/
	private Criteria criteria;
	
	
	
	
	public void setCriteria(Criteria criteria) {
		this.criteria=criteria;
	}
	
	
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		
		CalcPaging();
	}
	
	
	/*페이지 계산*/
	private void CalcPaging() {
		endPage=(int)(Math.ceil(criteria.getPage()/(double)showPageNum)*showPageNum);
		startPage=(endPage-showPageNum)+1;
		
		int addEndPage=(int)(Math.ceil(totalCount/(double)criteria.getPerPageNum()));
		
		if(endPage>addEndPage) {
			endPage=addEndPage;
		}
		
		prev=(startPage == 1) ? false : true;
		next=(endPage*20) >= totalCount ? false : true;
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
	
	
	
	
	/*page를 포함하는 uri 생성*/
	public String makeQuery(int page) {
		UriComponents uriComponents=UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.build();
		
		return uriComponents.toUriString();
	}
	
	
	/*page 와 keyword 를 포함하는 uri 생성*/
	public String makeSearchQuery(int page) {
		UriComponents uriComponents=UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("keyWord", criteria.getKeyWord())
				.build();
		
		return uriComponents.toUriString();
	}

}

















