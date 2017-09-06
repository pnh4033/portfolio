<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/resources/js/getEndDate.js"></script>

<style>

img {
max-width: 200px;
}

</style>

</head>

<body>

<div class="container">

<div id="div_userID" data-userID="${userInfo.userID}"></div>

  
  
  <br/><br/><br/>
  <h2>나의 입찰 목록 관리</h2>
  <br/><br/>
  
  <div id="ifNull" data-isEmpty="${isEmpty}"></div>
  
  
  
  <table class="table table-hover" id="list_table">
      <c:forEach items="${myTenderList}" var="list">
  
      <tr>
  		<td style="width:50px;">${list.pno}</td>
  		<td><img src="/main/listImgsPno?pno=${list.pno}" id="listImg"/></td>
  		<td style="width: 980px; font-size: 24px;" colspan="6">${list.title} &nbsp;
  		<button class="btn btn-primary" style="padding: 2px;" data-pno="${list.pno}" data-buytype="${list.buytype}">입찰</button>&nbsp;
  		<button class="btn btn-warning" style="padding: 2px;" data-pno="${list.pno}" data-finished="${list.finished}" data-buytype="${list.buytype}">바로 구매</button>
  		</td>
  	  </tr>
  	  
  	  <tr>
  		<td class="list_class" colspan="2">상품명 : ${list.pname}</td>
  		<td class="list_class">시작가 : ${list.startprice}</td>
  		<td class="list_class">현재가 : ${list.nowprice}</td>
  		
  		<td class="list_class success" id="myPrice${list.pno}" data-pno="${list.pno}">나의 현재 입찰 금액 : 
            
  		</td>
  		
  		<td class="list_class">수량 : ${list.quantity}</td>
  	  </tr>
  	  
  	  <tr>
  		<td class="list_class" colspan="2">등록일 : <fmt:formatDate value="${list.createdate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		
  		<c:if test="${list.buytype != 'i' }">
  		<td class="list_class">종료일 : <fmt:formatDate value="${list.enddate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		</c:if>
  		
  		<c:if test="${list.buytype == 'i' }">
  		<td class="list_class">종료일 : </td>
  		</c:if>
  		
  		
  		<td class="list_class">구매자 : ${list.buyer}</td>
  		<td class="list_class">입찰횟수 : ${list.tendercnt}</td>
  		<td class="list_class" colspan="2" style="font-size: 17px;">
  		
  		<c:if test="${list.finished == '진행중'}">
  		<span class="label label-primary">${list.finished}</span></td>
  		</c:if>
  		
  		<c:if test="${list.finished == '종료'}">
  		<span class="label label-warning">${list.finished}</span></td>
  		</c:if>
  		
  		
      </tr>
  	  <tr><td style="border:0; height: 40px;"></td></tr>
      </c:forEach>
    </table>

</div>





<script>


$(document).ready(function() {
	
	var data=$("#ifNull").attr("data-isEmpty");
	
	if(data == 'empty') {
		
		$("#ifNull").append("<div class='jumbotron'><h1>현재 입찰 목록에 물품이 없습니다.</h1>"
				+"<p>입찰 등록을 하시면 여기에 추가 됩니다.</p></div>");
		
	}
	
});






//종료 여부 String으로 리턴
function getEndDate(pno) {
	
	return $.ajax({
		
		url:'/getEndDate?pno='+pno,
		dataType:'text',
		async:false,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data) {
			
		}
		
	}).responseText;
	
}







//판매 종료 시간이 지난 물품에 대하여 데이터베이스의 판매 종료 컬럼 업데이트
function setExpire(pno) {
		
		$.ajax({
			
			url:'/main/setExpired',
			data:{	
				pno:pno
			}
		
		});
		
}




$(document).ready(function() {
	
	$(".list_class.success").each(function() {
		
		var pno=$(this).attr("data-pno");
		var userID=$("#div_userID").attr("data-userID");
		var t=$(this);
		
		$.ajax({
			
			url:'/tender/myPrice',
			data:{pno:pno, userID:userID},
			dataType:'text',
			type:'post',
			success:function(result) {
				
				var temp="myPrice"+pno;
				var str="#"+temp;
				
				$(str).append(result);
				
			}
			
			
		});
		
	});
	
});



$(".btn.btn-primary").click(function(e) {
	
	e.preventDefault();
	
	var pno=$(this).attr("data-pno");
	var buytype=$(this).attr("data-buytype");
	
	$.ajax({
		
		url:'/main/isExpired',
		data:{pno:pno},
		type:'GET',
		dataType:'text',
		success:function(result) {
			
			var str=getEndDate(pno);

		    if(str == '판매 종료') {
			
		        alert("판매가 종료된 상품 입니다.");
		        setExpire(pno);
		        return;
			
            }else if(buytype == 'i') {
				
				alert("경매가 포함 되지 않은 상품은 입찰 하실 수 없습니다.");
				return;
				
			}else{
				
				var dispWid=screen.availWidth;
				var dispHei=screen.availHeight;
				
				var winWid=700;
				var winHei=800;
				
				var xloc=(dispWid-winWid)/2;
				var yloc=(dispHei-winHei)/2;
				
				var openWindow=window.open("/tender/tender?pno="+pno, "tender_Window", 'top='+yloc+', left='+xloc+', toolbar=no, location=no, status=no, menubar=no, resizable=no, directories=no, width='+winWid+', height='+winHei);

				
			}
			
		}
		
	});
	
});





$(".btn.btn-warning").click(function() {
	
	var finished=$(this).attr("data-finished");
	var userID=$("#div_userID").attr("data-userID");
	var pno=$(this).attr("data-pno");
	var buytype=$(this).attr("data-buytype");
	
	var str=getEndDate(pno);

    if(str == '판매 종료') {
	
        alert("판매가 종료된 상품 입니다.");
        setExpire(pno);
        return;
	
 	}else{
	
	        window.location.replace("/main/pay?userID="+userID+"&pno="+pno);
	
 	}
	
});


</script>





</body>
</html>















