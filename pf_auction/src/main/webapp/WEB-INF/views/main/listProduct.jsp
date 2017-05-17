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

<style type="text/css">

html, body {
height: 100%;
font-size: 14px;
}

.pageA {
font-size: 20px;
color:gray;
text-decoration: none;
}


#paging {
list-style: none;
display:inline-block; *display:inline; zoom:1;
}

#pagingDiv {
margin: 0 auto;
text-align: center;
}

#pageLi {
margin: 4px;
width: 26px;
display: inline-block;
font-size: 15px;
border: solid #E888AA 2px;
border-radius: 3px;
vertical-align: middle;
}

table {
text-align: center;
vertical-align: middle;
}

table td {
border: solid white 20px;
padding: 2px;
margin: 20px;

}

#listImg {
width: 220px;
}

#listWrap {
overflow: hidden;
text-align: center;
margin: 0 auto;
padding: 0;
}

.list_div {
float: left;
}

.list_ul {
list-style:none;
display: inline-table; 
float: left;
width: 223px;
border-bottom: solid white 50px;
}

.list_li1 {
height: 190px;
text-align: center;
background-color: #EAF5FF;
border-bottom: solid white 3px;
padding: 2px;
}

.list_li {
background-color: #FFF6EF;
text-align: left;
overflow: hidden; 
text-overflow: ellipsis;
white-space: nowrap; 
width: 223px;
}

.expDate {
background-color: #FFF6EF;
text-align: left;
overflow: hidden; 
text-overflow: ellipsis;
white-space: nowrap; 
width: 223px;
}

.list_li_val {
float: left;
display: inline-block;
}

#li_title {
border-bottom: solid white 3px;
}

.active {
background-color: #DABCFF;
color: red;
}

#timeCalc {
width: 0;
height: 0;
}
</style>

<title>Insert title here</title>
</head>
<body id="listBody">




<div id="listWrap">
<c:forEach items="${list}" var="vo" varStatus="st">
<div class="list_div">
  <ul class="list_ul">
    
    
    <li class="list_li1"><a href="/main/readProduct?pno=${vo.pno}" class="listItem">
    <img src="/main/listImgsPno?pno=${vo.pno}" id="listImg"/></a></li>
    <li class="list_li" id="li_title">&nbsp;${vo.title}</li>
    <li class="list_li">&nbsp;구매방식 &nbsp;&nbsp; ${vo.buytype}</li>
    <li class="list_li">&nbsp;현재가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${vo.nowprice}</li>
    <li class="list_li">&nbsp;즉구가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${vo.i_price}</li>
	
	<fmt:formatDate value="${vo.enddate}" type="both" pattern="yyyyMMddHHmmss" var="d"/>
	
    <%-- <jsp:useBean id="now" class="java.util.Date"/>
    
    <div id="timeCalc">
    <c:set var="date" value="<%=new Date() %>"/>
    <fmt:formatDate value="${date}" type="time" pattern="yyyyMMddHHmmss" var="nowd"/>
    <fmt:formatDate value="${vo.enddate}" type="both" pattern="yyyyMMddHHmmss" var="d"/>
    <fmt:parseDate var="end" value="${d}" pattern="yyyyMMddHHmmss"/>
    
    <c:set var="val" value="${end.time-now.time}"/>
    <fmt:parseNumber var="pval" value="${val}" integerOnly="true"/>
    
    <c:set var="day" value="${val/1000/60/60/24}"/>
    
    <fmt:parseNumber var="pday" value="${val/(1000*60*60*24)}" integerOnly="true" scope="request"/>
    
    
    <c:set var="hour" value="${val/1000/60/60-(24*pday)}"/>
    <fmt:parseNumber var="phour" value="${hour}" integerOnly="true" scope="request"/>
    
    
    <c:set var="min" value="${val/1000/60-(24*60*pday)-(60*phour)}"/>
    <fmt:parseNumber var="pmin" value="${min}" integerOnly="true" scope="request"/>
    
    
    <c:set var="sec" value="${val/1000-(24*60*60*pday)-(60*60*phour)-(60*pmin)}"/>
    <fmt:parseNumber var="psec" value="${sec}" integerOnly="true" scope="request"/>
    
    
    
    </div>
    
    <li class="list_li" id="expDate" data-end="${vo.enddate}">남은시간&nbsp;&nbsp;&nbsp;
    
    <c:if test="${pday>0}">
    ${pday}일
    </c:if>
    
    <c:if test="${phour>0}">
    ${pday}시간
    </c:if>
    
    <c:if test="${pmin>0}">
    ${pday}분
    </c:if>
    
    ${psec}초
    
    </li>  --%>
    
    
    <li class="expDate" id="expDate${vo.pno}" data-pno="${vo.pno}">&nbsp;</li>
    
<%--     <c:forEach var="entry" items="${expMap}" varStatus="st">
    ${entry.key} - ${entry.value}
    </c:forEach> --%>
    
    
    </ul>
</div>
  

</c:forEach>
</div>





<div id="pagingDiv">      <!-- 페이징 처리 -->
  <ul id="paging">
    
    <c:if test="${paging.prev}">
      <li id="pageLi"><a href="listProduct?page=${paging.startPage-1}" class="pageA">&laquo;</a></li>
    </c:if>
    
    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
      <li id="pageLi" <c:out value="${ paging.criteria.page == idx ? 'class=active' : '' }"/>>
          <a href="listProduct?page=${idx}" class="pageA">${idx}</a>
      </li>
    </c:forEach>
    
    <c:if test="${paging.next && paging.endPage > 0 }">
      <li id="pageLi"><a href="listProduct?page=${paging.endPage+1}" class="pageA">&raquo;</a></li>
    </c:if>
    
  </ul>
</div>





<script>

$(document).ready(function () {
$("html body").animate({
scrollTop: $("#top").offset().top
}, 'slow');
});


$(".listItem").click(function(event) {
	
	event.preventDefault();
	
	var t=$(this).attr("href");
	
	/* $("#body_con1").load(t); */
	window.open(t);
	
});


$(".pageA").click(function(event) {
	
	event.preventDefault();
	
	var t=$(this).attr("href");
	
	$("#body_con1").load(t); 
	
});




$(document).ready(function() {
	
	
$(".expDate").each(function() {
	
	var pno=$(this).attr("data-pno");
	
	$.ajax({
		url:'/getExpDate?pno='+pno,
		dataType:'text',
		success: function(result) {
			
			var id="#expDate"+pno;
			
			if(result != null) {
				$(id).append("남은시간 &nbsp;&nbsp;&nbsp;"+result);
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



















