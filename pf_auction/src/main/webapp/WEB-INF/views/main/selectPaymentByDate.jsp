<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

#paid-table {
background-color: #EFF8FB;
}

#paid-table th {
text-align: center;
}

</style>

</head>
<body>


	<c:if test="${empty paidList}">
	<br/><br/><br/><br/><div class='jumbotron'><h3>데이터가 존재 하지 않습니다.</h1></div>
	</c:if>

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



<script>


</script>


</body>
</html>








