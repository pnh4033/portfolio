<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

#listImg {
max-width: 200px;
}

ul {
list-style: none;
}

/* a:LINK {color: gray; text-decoration: none;}
a:VISITED {color: gray; text-decoration: none;}*/
a:HOVER {text-decoration: none;} 

table-hover td {
padding: 2px;
}

#keyWord_input {
font-size:20px;
color: #00398E;
margin:0px;
padding:2px;
padding-left:10px;
height:30px;
border: solid #dcdcdc 0.5px;
border-radius: 5px;
height: 30px;
width: 100%;
} 

#auction {
text-align: center;
padding: 2px;
font-size: 12px;
color: white;
background-color: #007023;
}

#directBuy {
text-align: center;
padding: 2px;
font-size: 12px;
color: white;
background-color: #D32E5A;
}

#nav-ul {
color: #007099;
font-size: 14px;
}


</style>

<title>MAIN PAGE</title>

</head>



<body id="listBody">
  
  
  
  
     <div class="row">
     <div id="top_menu" align="center"><%@ include file="top.jsp" %>
     </div>


  
	<div class="container">
   <div id="top"></div>
  
  	 <div class="row">
  
	  <!-- 검색 -->	
	  <div>
	    <br/><br/>
		<table id="search_table">
		<tr><td><input type="text" name="keyWord" id="keyWord_input" placeholder="Search"
		     value="${criteria.keyWord}"></td><td style="width:60px; text-align: right;">
		<button class="btn btn-sm btn-default" id="search_btn">Submit</button></td></tr>
		</table>
		<p></p>
	  </div>
	    
  	 </div>
  	 
  	 
  	 
  	 
	    <form name="form1" id="formUser" action="/main/myPage" method="post">
	    <input type="hidden" name="userID" value="${login.userID}">
	    </form>
	
	

	<div class="row">
	
	<nav class="navbar navbar-inverse">
    
     <div class="navbar-header">
       <a class="navbar-brand" href="#">Main Page</a>
     </div>
    
     <ul class="nav navbar-nav" id="nav-ul" style="margin-right: 5px;">
       <li><a href="register" target="_blank">판매 등록</a></li>
       <li><a href="/tender/myTender?userID=${login.userID}">나의 입찰 목록</a></li>
       <li><a href="/main/myFavorite?userID=${login.userID}">나의 관심 상품</a></li>
       <li><a href="myPage?userID=${login.userID}" id="myPage_a">My Page</a></li>
       <c:if test="${login.userID == 'admin'}">
       <li style="text-align: right; padding-right: 20px;"><a href="/main/admin">관리자 페이지</a></li>
       </c:if>
     </ul>
     
    </nav>	

	</div>	

	<br/><br/>

<ul style="overflow: hidden;">
	
	
<c:forEach items="${list}" var="vo" varStatus="st">
<li style="float:left;"><br/>
	<table class="table table-hover" style="margin: 20px; width: 230px;">
	<tr><td style="text-align: center; height: 180px;">
		<a href="/main/readProduct${paging.makeSearchQuery(paging.criteria.page)}&pno=${vo.pno}" class="listItem">
		<img src="/main/listImgsPno?pno=${vo.pno}" id="listImg"/></a></td></tr>
		<tr><td>${vo.title}</td></tr>
		<tr><td>
		  <c:if test="${vo.buytype == 'a'}">
          <span>&nbsp;</span><span id="auction">경 매</span>
   		  </c:if>
    
     	  <c:if test="${vo.buytype == 'i'}">
      	  <span>&nbsp;</span><span id="directBuy">즉시구매</span>
    	  </c:if>
    
    	  <c:if test="${vo.buytype == 'ai'}">
      	  <span>&nbsp;</span><span id="auction">경 매</span>&nbsp;<span id="directBuy">즉시구매</span>
    	  </c:if>
		
		</td></tr>
		
		<tr><td>현재가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${vo.nowprice}</td></tr>
		<tr><td>즉구가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${vo.i_price}</td></tr>
		
		<fmt:formatDate value="${vo.enddate}" type="both" pattern="yyyyMMddHHmmss" var="d"/>
		
		<tr><td class="expDate" id="expDate${vo.pno}" data-pno="${vo.pno}" data-finished="${vo.finished}" data-buytype="${vo.buytype}">
		&nbsp;<img src="/resources/image/clock.png" width="18px" style="vertical-align: text-bottom;"/>
		</td></tr>
		
	


	</table>
</li>
</c:forEach>

</ul>	


</div>




<div id="pagingDiv" style="text-align: center;">      <!-- 페이징 처리 -->
  <ul class="pagination">
    
    <c:if test="${paging.prev}">
      <li><a href="index${paging.makeSearchQuery(paging.startPage-1)}"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
    </c:if>
    
    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
      <li <c:out value="${ paging.criteria.page == idx ? 'class=active' : '' }"/>>
          <a href="index${paging.makeSearchQuery(idx)}">${idx}</a>
      </li>
    </c:forEach>
    
    <c:if test="${paging.next && paging.endPage > 0 }">
      <li><a href="index${paging.makeSearchQuery(paging.endPage+1)}" ><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
    </c:if>
    
  </ul>
</div>






  

<div id="footer"><%@ include file="footer.jsp" %></div>




	</div>  <!-- container -->


<script>

/* $(document).ready(function () {
	
  $("html body").animate({
	  
  scrollTop: $("#top").offset().top
  
  }, 'slow');
  
}); */





$(".listItem").click(function(event) {
	
	event.preventDefault();
	
	var t=$(this).attr("href");
	
	/* $("#body_con1").load(t); */
	window.open(t);
	
});



$("#keyWord_input").focus(function() {
	
	$("#keyWord_input").val("");
	
});


search_enter=function() {
	
	${paging.criteria.keyWord=null};
	 self.location="/main/searchedList"
	    + "${paging.makeSearchQuery(1)}"
	    + $("#keyWord_input").val();
	
}



$("input[name=keyWord]").keydown(function(key) {
	
	if(key.keyCode == 13) {
		
		search_enter();
		
	}
	
});




$("#search_btn").click(function(event) {
	
	${paging.criteria.keyWord=null};
	 self.location="/main/searchedList"
	    + "${paging.makeSearchQuery(1)}"
	    + $("#keyWord_input").val();
	    
});




//판매 종료 시간이 지난 물품에 대하여 데이터베이스의 판매 종료 컬럼 업데이트
function setExpire(pno) {
		
		$.ajax({
			
			url:'/main/setExpired',
			data:{	pno:pno}
		
		});
		
}




/* 각 상품 별 남은 시간 표시 */
$(document).ready(function() {
	
	
  $(".expDate").each(function() {
	
	var pno=$(this).attr("data-pno");
	
	$.ajax({
		url:'/getEndDate?pno='+pno,
		dataType:'text',
		success: function(result) {
			
			var id="#expDate"+pno;
			var finished=$(id).attr("data-finished");
			var buytype=$(id).attr("data-buytype");
			
			if(result != null) {
				
				if(buytype == 'i') {
					
					$(id).append("");
					return;
					
				}else	if(finished != '종료') {
					
				  $(id).append("&nbsp;"+result);
				
				}else{
					
					 $(id).append("&nbsp;"+"판매 종료");
					 setExpire(pno);
					
				}
				
			}else{
				
				$(id).append(result);
				
			}
		
		}
		
	});	 
	
  }); 

});

</script>

</body>
</html>



















