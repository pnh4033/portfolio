<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

<style>

.pageA {
font-size: 20px;
color:gray;
text-decoration: none;
}


ul {
list-style: none;
display:inline-block; *display:inline; zoom:1;
}

#pagingDiv {
margin: 0 auto;
text-align: center;
}

ul li {
margin: 4px;
width: 26px;
display: inline-block;
font-size: 15px;
border: solid green 2px;
border-radius: 3px;
vertical-align: middle;
}

table {
width:180px;
height: 240px;
border: solid gray 1px;
margin: 3px;
}
</style>

<title>Insert title here</title>
</head>
<body>

<table class="prod_table">
<%-- <tr>
<th>PNO</th><th>TITLE</th><th>I_PRICE</th><th>STARTPRICE</th><th>NOW</th>
<th>BUYTYPE</th><th>TENDERCOUNT</th><th>DESCRIPTION</th><th>QUANTITY</th>
<th>CREATEDATE</th>
</tr>
<c:forEach items="${list}" var="vo">
<tr>
  <td>${vo.pno}</td><td> ${vo.title} </td><td>${vo.i_price}</td> <td>${vo.startprice}</td>
  <td>${vo.nowprice} </td><td>${vo.buytype} </td><td>${vo.tendercnt} </td>
  <td>${vo.desc_product}</td>
  <td>${vo.quantity}</td>
  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.createdate}"/></td>
</tr>
</c:forEach> --%>



  <tr>
<c:forEach items="${list}" var="vo" varStatus="st">
  <td><a href="/main/readProduct?pno=${vo.pno}"><img src="/main/listImgsPno?pno=${vo.pno}"/></a></td>
  <c:if test="${(st.count mod 4) == 0}">
  </tr>
  </c:if>
</c:forEach>

</table>





<div id="pagingDiv">
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

	$(document).ready(function() {
		
	});

</script>

</body>
</html>



















