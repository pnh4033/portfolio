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
<link rel="stylesheet" type="text/css" href="/resources/plugins/datePicker/datepicker3.css" />
<script type="text/javascript" src="/resources/plugins/datePicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/plugins/datePicker/bootstrap-datepicker.kr.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>

<style>

html body {
width: 100%;
height: 100%;
}


input[type=text] {
-webkit-transform: scale(0.9);
padding: 2px;
}

#paid-table {
background-color: #EFF8FB;
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

#div-title {
color: #084B8A;
}

</style>

</head>
<body>

	<div class="container">
	  <br/><br/><br/>
	  
	     <div id="div-title">
	     <button class="btn btn-default">MAIN PAGE</button>
	     <span style="text-align: right;"><h1>관리자 페이지</h1></span>
	     </div>
	     <br/><br/>
	     
	         <ul class="nav nav-tabs">
               <li class="active"><a href="#">날짜별 거래 목록</a></li>
 			   <li><a href="#">메뉴 2</a></li>
  			   <li><a href="#">메뉴 3</a></li>
  			   <li><a href="#">메뉴 4</a></li>
			</ul>

	   <br/><br/>
	     
	   <table style="margin:10px; padding: 5px;">
	     
	     <tr>
			  
			  <td style="padding-right: 40px; height: 100%; vertical-align: top;">
			  <div>
			  <div class="alert alert-info" style="width: 200px; padding: 3px; text-align: center;">
              <strong>날짜별 거래목록 검색</strong>
              </div>
			  </div>
			  
			
			
			
			
			  <table>
			    <tr><td></td></tr>
			    <tr>
			    <td style="margin-right: 10px;"><input class="form-control" type="text"  id="calendar" style="width: 140px;" placeholder="날짜 선택"/></td>
			    <td><button type="button" class="btn btn-sm btn-primary" id="dateSearchBtn">검색</button></td>
			    </tr>
			  </table>
			  
			  </td>





			
			<td style="height: 100%; width: 1000px; text-align: center;">
			<div id="table-view">
	        
	        <div class="row"><p class="alert alert-info" style="font-size: 15px;"><strong>샘플 데이터는 2017-09-01, 2017-09-02 에 있습니다.</strong></p></div>
	        
	        <div>
			<c:if test="${empty paidList}">
			<br/><br/><br/><br/><div class='jumbotron'><h3>데이터가 존재 하지 않습니다.</h1></div>
			</c:if>
			</div>
	        
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
	      
			</div>
			
			
			
			</td>	     
	     </tr>
	   </table>
	   
	</div>





<script>

var empty=$("#isEmpty").attr("data-isEmpty");


$(".btn.btn-default").click(function() {
	location.replace("/main/index");
});



function today() {
	

var date = new Date(); 
var year = date.getFullYear(); 
var month = new String(date.getMonth()+1); 
var day = new String(date.getDate()); 
var today="";

// 한자리수일 경우 0을 채워준다. 

	if(month.length == 1){ 

 	    month = "0" + month; 

	} 

	if(day.length == 1){ 

  		day = "0" + day; 

	} 

	return today=year+"-"+month+"-"+day;

}





$(document).ready(function() {
	
	$('#calendar').datepicker({
		 format: "yyyy-mm-dd",
		 language: "kr"
    });
	
	
	if(empty == 'empty') {
		
		$("#isEmpty").append("<br/><br/><br/><br/><div class='jumbotron'><h1>데이터가 존재 하지 않습니다.</h1></div>");
		
	}
	
	
});





$("#dateSearchBtn").click(function() {
	
	var str=$("#calendar").val();
	
	if((str == null) || (str == '')) {
		
		alert("날짜를 선택 해주시기 바랍니다.");
		return;
		
	}
	
	$("#table-view").load('/main/selectPaymentByDate?date='+str);
	
	
});





</script>




</body>
</html>










