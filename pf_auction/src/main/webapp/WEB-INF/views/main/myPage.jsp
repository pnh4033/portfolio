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

/* #list_table {
width:70%;
text-align: center;
display: table-cell;
vertical-align: middle;
border-collapse: collapse;
}

.list_class {
background-color: #FCF4FF;
} */

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

/* #list_table td {
border: solid #6397CE 2px;
padding: 2px;
} */

#auction {
padding: 2px;
font-size: 12px;
color: white;
background-color: #007023;
}

#directBuy {
padding: 2px;
font-size: 12px;
color: white;
background-color: #D32E5A;
}

a:HOVER {text-decoration: none;}

#mod_button {
font-size: 15px;
}

</style>

</head>
<body>
  
  
  <div id="wrap">
  
    <div class="container">
    
    <%-- <table id="info_table">
      <tr><td class="info_td">사용자 ID</td><td class="info_td2">${userInfo.userID}</td></tr>
      <tr><td class="info_td">E-MAIL</td><td class="info_td2">${userInfo.userEmail}</td></tr>
      <tr><td class="info_td">연락처</td><td class="info_td2">${userInfo.userCell}</td></tr>
      <tr><td class="info_td">포인트</td><td class="info_td2">${userInfo.userPoint}</td></tr>
      <tr><td class="info_td">가입일</td>
      <td class="info_td2">
      <fmt:formatDate value="${userInfo.createdDate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/>
      </td></tr>
    </table> --%>
    
    
    
    <div style="height: 100px; width: 100%"></div>
    
    
    
    
    
    
    
    
    
    <div id="list_title">
         나의 판매 내역
    </div>
    <div style="height: 40px; width: 100%"></div>
    
    <div class="row">
    <p class="alert alert-danger" style="font-size: 15px; padding: 2px;">
         경매가 포함된 판매 중 입찰이 한건 이상인 물품은 취소 하실 수 없습니다.</p>
    </div>
    <br/>
    
    <div id="ifNull" data-isEmpty="${isEmpty}"></div>
    
    
    <table class="table table-hover" id="list_table">
      <c:forEach items="${myList}" var="list">
      
  
      <tr>
  		<td style="width:50px;">${list.pno}</td>
  		<td><a href="/main/readProduct?pno=${list.pno}">
  		<img src="/main/listImgsPno?pno=${list.pno}" id="listImg"/></a></td>
  		<td style="width: 980px; font-size: 24px;" colspan="6">
  		<a href="/main/readProduct?pno=${list.pno}">${list.title} &nbsp;</a> 
  		
  		<c:if test="${list.finished == '진행중' }">
  		<a href="/main/modifyProduct?pno=${list.pno}">&nbsp;&nbsp;
  		<button type="button" class="btn btn-info" id="mod_button${list.pno}" 
  		data-pno="${list.pno}" style="padding: 2px;">수정</button>
  		</a>
  		</c:if>
  		
  		
  		<c:if test="${((list.finished == '진행중') && (list.tendercnt == 0) && (list.buytype != 'i') || (list.buytype == 'i'))}">
  		<a href="/main/removeProduct?pno=${list.pno}">
  		<button type="button" class="btn btn-warning" id="cancelBtn${list.pno}" 
  		data-pno="${list.pno}" style="padding: 2px;">판매 취소</button>
  		</a>
  		</c:if>
  		
  		</td>
  		
  	  </tr>
  	  
  	  <tr>
  		<td class="list_class" colspan="2">상품명 : ${list.pname}</td>
  		<td class="list_class">즉구가 : ${list.i_price}</td>
  		<td class="list_class">시작가 : ${list.startprice}</td>
  		<td class="list_class">현재가 : ${list.nowprice}</td>
  		<%-- <td class="list_class">판매방식 : ${list.buytype}</td> --%>
  		
  		<td class="list_class">판매방식 : 
            <c:if test="${list.buytype == 'a'}">
              <span id="auction">경 매</span>
            </c:if>
    
    		<c:if test="${list.buytype == 'i'}">
      		  <span id="directBuy">즉시구매</span>
    		</c:if>
    
    		<c:if test="${list.buytype == 'ai'}">
      		  <span id="auction">경 매</span>&nbsp;<span id="directBuy">즉시구매</span>
    		</c:if>
  		</td>
  		
  		<td class="list_class">수량 : ${list.quantity}</td>
  	  </tr>
  	  
  	  <tr>
  		<td class="list_class" colspan="2">등록일 : <fmt:formatDate value="${list.createdate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td class="list_class">종료일 : <fmt:formatDate value="${list.enddate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td class="list_class">구매자 : ${list.buyer}</td>
  		<td class="list_class">입찰자수 : ${list.tendercnt}</td>
  		<td class="list_class" colspan="2" style="font-size: 17px;">
  		
  		<c:if test="${list.finished == '진행중'}">
  		<span class="label label-primary" id="span-pno" data-pno="${list.pno}">${list.finished}</span></td>
  		</c:if>
  		
  		<c:if test="${list.finished == '종료'}">
  		<span class="label label-warning" id="span-pno" data-pno="${list.pno}">${list.finished}</span></td>
  		</c:if>
  		
  		
      </tr>
  	  <tr><td style="border:0; height: 40px;"></td></tr>
      </c:forEach>
    </table>
    
    
    
    </div>
  
  </div>



<!-- 새창으로 값 전달 -->
  <form name="removeForm" id="remove_form" action="/main/removeProduct" target="removeWindow" method="get">
    <input type="hidden" name="pno" value="">
  </form>



<script>


//판매 종료 시간이 지난 물품에 대하여 데이터베이스의 판매 종료 컬럼 업데이트
function setExpire(pno) {
		
		$.ajax({
			
			url:'/main/setExpired',
			data:{	pno:pno},
			success:function() {
				
			}
		
		});
		
}


$(document).ready(function() {
	
	var data=$("#ifNull").attr("data-isEmpty");
	
	if(data == 'empty') {
		
		$("#ifNull").append("<div class='jumbotron'><h1>현재 판매중 인 물품이 없습니다.</h1>"
				+"<p>판매 물품을 등록 하시면 여기에 추가 됩니다.</p></div>");
		
	}
	
	
	$(".label.label-primary").each(function() {
		
		var pno=$(this).attr("data-pno");
		
		$.ajax({
			url:'/getEndDate?pno='+pno,
			dataType:'text',
			success: function(result) {
				
				if(result == '판매 종료') {
					
					setExpire(pno);
					$(this).text("종료");
				
				}else{
					
					$(this).text("진행중");
					
				}
			}
		
			});
		
		
	});
	
	
});






$(".btn.btn-warning").click(function(event) {
	
	event.preventDefault();
	
	
	var pno=$(this).attr("data-pno");
	
	var dispWid=screen.availWidth;
	var dispHei=screen.availHeight;
	
	var winWid=400;
	var winHei=300;
	
	var xloc=(dispWid-winWid)/2;
	var yloc=(dispHei-winHei)/2;
	
	var w=window.open("/main/removeProduct?pno="+pno, "removeWindow", 'top='+yloc+', left='+xloc+', toolbar=no, location=no, status=no, menubar=no, resizable=no, directories=no, width='+winWid+', height='+winHei);

	
});  




</script>



</body>
</html>












