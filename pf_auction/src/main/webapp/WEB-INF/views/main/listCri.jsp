<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

<style>

</style>

<title>Insert title here</title>
</head>
<body>

<table class="prod_table">
<tr>
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
</c:forEach>
</table>


<!-- <table class="prod_table">

  <tr>
	<td></td>	
  </tr>

</table> -->

</body>
</html>



















