<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

a:HOVER {text-decoration: none;}

img {
max-width: 300px;
}

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

</style>

</head>
<body>

  <div class="container">
  	
  	
  	<br/><br/><br/>
    <div><p><h2>나의 관심 목록</h2></p></div>
    <br/><br/>
    
    <div id="ifNull" data-isEmpty="${isEmpty}"></div>
    
     <table class="table table-hover" id="list_table">
      <c:forEach items="${list}" var="list">
  
      <tr class="fav-tr-${list.pno}">
  		<td style="width:50px;">${list.pno}</td>
  		<td><a href="/readProduct?pno=${list.pno}">
  		<img src="/listImgsPno?pno=${list.pno}" id="listImg"/></a></td>
  		<td style="width: 980px; font-size: 24px;" colspan="6">
  		<a href="/readProduct?pno=${list.pno}">${list.title} &nbsp;</a>
  		
  		<button type="button" class="btn btn-default" id="remove_button${list.pno}" 
  		data-pno="${list.pno}" style="padding: 2px;">목록에서 제거</button>

  		
  		</td>
  		
  	  </tr>
  	  
  	  <tr class="fav-tr-${list.pno}">
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
  	  
  	  <tr class="fav-tr-${list.pno}">
  		<td class="list_class" colspan="2">등록일 : <fmt:formatDate value="${list.createdate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td class="list_class">종료일 : <fmt:formatDate value="${list.enddate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
  		<td class="list_class">구매자 : ${list.buyer}</td>
  		<td class="list_class">입찰자수 : ${list.tendercnt}</td>
  		<td class="list_class" colspan="2" style="font-size: 17px;">
  		
  		<c:if test="${list.finished == '진행중'}">
  		<span class="label label-primary">${list.finished}</span></td>
  		</c:if>
  		
  		<c:if test="${list.finished == '종료'}">
  		<span class="label label-warning">${list.finished}</span></td>
  		</c:if>
  		
  		
      </tr>
  	  <tr class="fav-tr-${list.pno}"><td style="border:0; height: 40px;"></td></tr>
      </c:forEach>
    </table>
    
  
  </div>


<div id="userID" data-userID="${login.userID}"></div>


<script>


var userID=$("#userID").attr("data-userID");



$(document).ready(function() {
	
	var data=$("#ifNull").attr("data-isEmpty");
	
	if(data == 'empty') {
		
		$("#ifNull").append("<div class='jumbotron'><h1>현재 관심 목록에 물품이 없습니다.</h1>"
				+"<p>관심 물품을 등록 하시면 여기에 추가 됩니다.</p></div>");
		
	}
	
});






$(".btn.btn-default").click(function(e) {
	
	e.preventDefault();
	
	var pno=$(this).attr("data-pno");
	
	$.ajax({
		
		url:'/removeMyFavorite',
		data:{userID:userID, pno:pno},
		success:function(result) {
			
			
			var str="."+"fav-tr-"+pno;
			
			$(str).remove();
			
			document.location.reload();
			
		}
		
	});
	
});




</script>


</body>
</html>














