<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>

<style>

html body {
width: 100%;
height: 100%;
}

#paid-table th {
text-align: center;
}

#title-td {
width: 100%; 
height: 100px; 
vertical-align: middle; 
text-align: center; 
font-size: 35px; 
color: #2A5FB5;
}

#menu-table td {
width:180px;
height:30px;
border-bottom: solid #2E5281 0.5px;
font-size:20px;
text-align:center;
color: white;
}

</style>

</head>
<body>

	<div class="container">
	  <br/><br/><br/>
	  
	   <table style="margin:10px; padding: 5px;">
	     <tr><td id="title-td" colspan="2">관리자 페이지</td></tr>
	     <tr>
			<td style="height: 100%; width: 200px; vertical-align:top; background-color: #233A57; margin: 10px; padding: 5px; border-right: solid white 20px;">
			  
			  <table id="menu-table">
			    <tr><td></td></tr>
			    <tr><td>Menu</td></tr>
			    <tr><td></td></tr>
			  </table>
			  
			</td>
			
			<td style="height: 100%; width: 1000px; text-align: center;">
			
	        
	        <c:forEach items="${paidList}" var="list">
	        
	          <table class="table table-hover"  id="paid-table">
	          
	            <tr>
	            <th>번호</th>
	            <th>상점 거래 ID</th>
	            <th>카드 승인 번호</th>
	            <th>구매자 ID</th>
	            <th>구매자 성명</th>
	            <th>구매자 전화번호</th>
	            <th>구매 가격</th>
	            <th>결제시간</th>
	            </tr>
	            
	            <tr>
	            <td>${list.pno}</td>
	            <td>${list.merchant_uid}</td>
	            <td>${list.apply_num}</td>
	            <td>${list.userID}</td>
	            <td>${list.buyer_name}</td>
	            <td>${list.buyer_tel}</td>
	            <td>${list.paid_amount}</td>
	            <td>${list.paymentTime}</td>
	            </tr>
	            
	          </table>
	          
	          <br/>
	          
	        </c:forEach>
	      
			</td>	     
	     </tr>
	   </table>
	   
	</div>


</body>
</html>