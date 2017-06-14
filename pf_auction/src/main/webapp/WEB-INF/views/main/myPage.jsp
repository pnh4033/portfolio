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
margin-left: 50px;
}

#wrap {
padding: 30px;
}

#listImg {
max-height: 150px;
max-width: auto;
}

#list_table {
width:70%;
text-align: center;
display: table-cell;
vertical-align: middle;
border-collapse: collapse;
}

.list_class {
background-color: #FCF4FF;
}

#info_table {
width: 500px;
padding: 3px;
font-size: 20px;
background-color: #FCF4FF;
border-top: solid #C6173A 2px;
border-bottom: solid #C6173A 2px;
text-align: center;
display: table-cell;
vertical-align: middle;
border-collapse: collapse;
}

.info_td {
width:150px;
border-right: solid #E1E6EF 0.5px;
border-bottom: solid #E1E6EF 0.5px; 
background-color: #FAFFF4;
}

.info_td2 {
width: 350px;
border-bottom: solid #E1E6EF 0.5px; 
}

#list_title {
padding: 3px;
width:200px;
text-align: center;
font-size: 24px; 
background-color: #EA7E19; 
border-radius: 6px; 
color: white;
}

#list_table td {
border: solid #6397CE 2px;
padding: 2px;
}


</style>

</head>
<body>

  <div id="wrap">
  
    <div style="height: 100px; width: 100%"></div>
    
    <table id="info_table">
      <tr><td class="info_td">사용자 ID</td><td class="info_td2">${userInfo.userID}</td></tr>
      <tr><td class="info_td">E-MAIL</td><td class="info_td2">${userInfo.userEmail}</td></tr>
      <tr><td class="info_td">연락처</td><td class="info_td2">${userInfo.userCell}</td></tr>
      <tr><td class="info_td">포인트</td><td class="info_td2">${userInfo.userPoint}</td></tr>
      <tr><td class="info_td">가입일</td>
      <td class="info_td2">
      <fmt:formatDate value="${userInfo.createdDate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/>
      </td></tr>
    </table>
    
    
    
    <div style="height: 100px; width: 100%"></div>
    
    
    
    
    
    
    
    
    
    <div id="list_title">
         나의 거래 내역
    </div>
    <div style="height: 20px; width: 100%"></div>
    
    <table id="list_table">
      <c:forEach items="${myList}" var="list">
  
      <tr>
  		<td style="width:50px;">${list.pno}</td>
  		<td><img src="/main/listImgsPno?pno=${list.pno}" id="listImg"/></td>
  		<td style="width: 980px;" colspan="6">${list.title}</td>
  	  </tr>
  	  
  	  <tr>
  		<td class="list_class" colspan="2">상품명 : ${list.pname}</td>
  		<td class="list_class">즉구가 : ${list.i_price}</td>
  		<td class="list_class">시작가 : ${list.startprice}</td>
  		<td class="list_class">현재가 : ${list.nowprice}</td>
  		<td class="list_class">판매방식 : ${list.buytype}</td>
  		<td class="list_class">수량 : ${list.quantity}</td>
  	  </tr>
  	  
  	  <tr>
  		<td class="list_class" colspan="2">등록일 : <fmt:formatDate value="${list.createdate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td class="list_class">종료일 : <fmt:formatDate value="${list.enddate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td class="list_class">구매자 : ${list.buyer}</td>
  		<td class="list_class">입찰자수 : ${list.tendercnt}</td>
  		<td class="list_class" colspan="2">${list.finished}</td>
      </tr>
  	  <tr><td style="border:0; height: 40px;"></td></tr>
      </c:forEach>
    </table>
    
    
    
  
  </div>


</body>
</html>












