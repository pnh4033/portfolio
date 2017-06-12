<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 정보</title>

<style>

html body {
height: 100%;
width: 100%;
}

#wrap {
padding: 30px;
}

#listImg {
max-height: 150px;
max-width: auto;
}

table {
width:70%;
text-align: center;
display: table-cell;
vertical-align: middle;
}

td {
border: solid gray 2px;
border-collapse: collapse;
}


</style>

</head>
<body>

  <div id="wrap">
  
    <div>
         사용자 아이디 : ${userInfo.userID} 
    </div>
    
    <div>
    E-MAIL : ${userInfo.userEmail}
    </div>
    
    <div>
         연락처 : ${userInfo.userCell}
    </div>
    
    <div>
         포인트 : ${userInfo.userPoint}
    </div>
    
    <div>
         가입일 : <fmt:formatDate value="${userInfo.createdDate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/> 
    </div>
    
    
    <div>
         나의 거래 내역
    </div>
    
    <table>
      <c:forEach items="${myList}" var="list">
  
      <tr>
  		<td style="width:50px;">${list.pno}</td>
  		<td><img src="/main/listImgsPno?pno=${list.pno}" id="listImg"/></td>
  		<td style="width:1068px;" colspan="6">${list.title}</td>
  	  </tr>
  	  
  	  <tr>
  		<td colspan="2">상품명 : ${list.pname}</td>
  		<td>즉구가 : ${list.i_price}</td>
  		<td>시작가 : ${list.startprice}</td>
  		<td>현재가 : ${list.nowprice}</td>
  		<td>판매방식 : ${list.buytype}</td>
  		<td>수량 : ${list.quantity}</td>
  	  </tr>
  	  
  	  <tr>
  		<td colspan="2">등록일 : <fmt:formatDate value="${list.createdate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td>종료일 : <fmt:formatDate value="${list.enddate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td>구매자 : ${list.buyer}</td>
  		<td>입찰자수 : ${list.tendercnt}</td>
  		<td>${list.finished}</td>
      </tr>
  
      </c:forEach>
    </table>
    
    
    
  
  </div>


</body>
</html>












