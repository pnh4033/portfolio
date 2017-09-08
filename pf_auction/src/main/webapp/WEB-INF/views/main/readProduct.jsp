<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%-- <% pageContext.setAttribute("newLineChar", "\n"); %> --%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

html, body {
height: 100%;
width:100%;
}


#auction {
padding: 2px;
font-size: 14px;
color: white;
background-color: purple;
border-radius: 2px;
}

#directBuy {
padding: 2px;
font-size: 14px;
color: white;
background-color: orange;
border-radius: 2px;
}

img {
max-width: 1200px;
margin: 10px;
}

.row {
text-align: center;
}

</style>

<title>상품 조회</title>

</head>


<body>


<div class="container">

<br/><br/>

  <!-- 새창으로 값 전달 -->
  <form name="tenderForm" id="tender_form" action="/tender/tender" target="tenderWindow" method="get">
    <input type="hidden" name="pno" value="${productVO.pno}">
  </form>

	
  <div class="row">
  
    <div class="col-xs-5">
    <table class="table table-hover">
      <tr><td>
        <img src="/main/listImgsPno?pno=${productVO.pno}" id="sample"/>
      </tr></td>
      <tr><td style="font-size: 24px; text-align: center;">${productVO.title}</td></tr>
    </table>
    </div>
    
    <div class="col-xs-2"></div>
    
    <div class="col-xs-5">
    
      <table class="table table-hover">
        <tr><td>판매자 ID</td><td>${productVO.seller}</td></tr>
  
        <tr>
          <td>판매 방식</td>
  
        <td>
          <c:if test="${productVO.buytype == 'a'}">
          <span id="auction">경 매</span>
          </c:if>
    
          <c:if test="${productVO.buytype == 'i'}">
          <span id="directBuy">즉시구매</span>
          </c:if>
    
          <c:if test="${productVO.buytype == 'ai'}">
          <span id="auction">경 매</span>&nbsp;<span id="directBuy">즉시구매</span>
          </c:if>
        </td>
  
        </tr>
        
         <tr><td>즉시구입가</td><td>${productVO.i_price}</td></tr>
         <tr><td>시작가</td><td>${productVO.startprice}</td></tr>
         <tr><td>현재가</td><td>${productVO.nowprice}</td></tr>
         <tr><td>입찰횟수</td><td>${productVO.tendercnt}</td></tr>
         <tr><td>수량</td><td>${productVO.quantity}</td></tr>
         <tr><td>등록일</td><td><fmt:formatDate value="${productVO.createdate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td></tr>
         <tr><td>남은시간</td><td id="remain" data-pno="${productVO.pno}"></td></tr>
         
        
      </table>
    
      <button class="btn btn-info" id="btnFavorite">관심 목록 저장</button>&nbsp;&nbsp;&nbsp;&nbsp;
      
      <c:if test="${productVO.buytype != 'i'}">
      <button class="btn btn-primary" id="btnTender">입찰 하기</button>&nbsp;
      </c:if>
      
      <c:if test="${productVO.buytype != 'a'}">
      <button class="btn btn-danger" id="btnDirect">바로 구매</button>
      </c:if>
      
    
    </div>
  
  </div>	

</br></br>	
  


  

<!-- 로그인 값 저장 -->
<div id="loginVal" data-login="${login}"></div>


<!-- 이미지 목록 -->
  <div class="row">
    <div id="showImg" data-pno="${productVO.pno}"></div>
  </div>

  <div class="row">
    <div id="descTitle"></div>
    <br/><br/>
  </div>  

  <div class="row">
    <div id="contents_title"><h2>상품 설명</h2></div>
    <br/><br/>
  </div>  


<c:set var="desc" value="${productVO.desc_product}"/>

<!-- <div id="contents">

  <textarea class="form-control" rows="15" readonly="readonly" style="font-size: 18px; padding: 10px; width: 100%;">
    ${fn:replace(desc, newLineChar, '<br/>')}
  </textarea>
  
</div> -->

<div id="contents">

  <textarea class="form-control" rows="15" readonly="readonly" style="font-size: 18px; padding: 10px; width: 100%;">
    ${productVO.desc_product}
  </textarea>
  
</div>
</br></br></br>


</div>  <!-- container -->


<div id="buyType" data-buyType="${productVO.buytype}"></div>
<div id="userID" data-userID="${login.userID}"></div>
<div id="pno" data-pno="${productVO.pno}"></div>
<div id="finished" data-finished="${productVO.finished}"></div>


<div id='footer'><%@ include file="footer.jsp" %></div>







<script>

var pno=$("#pno").attr("data-pno");
var userID=$("#userID").attr("data-userID");
var finished=$("#finished").attr("data-finished");
var buytype=$("#buyType").attr("data-buyType");

function getImageLink(fileName) {      /* 샘플파일 이름으로부터 원본파일 이름 추출 */
	var front=fileName.substring(0,12);
	var rear=fileName.substring(14);
	
	return front+rear;
}




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
			data:{	pno:pno},
			success:function() {
				
			}
		
		});
		
}





$(document).ready(function() {
	

	
	/* 남은시간 요청 */
	$.ajax({
		
		url:'/getEndDate?pno='+pno,
		dataType:'text',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success: function(result) {
			
			if(finished != '종료') {
				
				if(buytype != 'i') {
					
    				$("#remain").html(result);
    				
				}else{
					
					$("#remain").html("");
					
				}
				
				
			}else{
			
				$("#remain").html("판매가 종료 되었습니다.");
				setExpire(pno);
				
			}
			
		}
		
	});	
	
	
  $.getJSON("/main/listImgsString/"+pno, function(list) {   /* pno 에 해당하는 attach 된 이미지들 로드 */ 
	
	
	
     	$(list).each(function() {
	     	var str="";
		    var fileName=this;
		
	      	fileName=getImageLink(fileName);   /* 샘플파일 이름으로부터 원본파일 이름 추출 */
		
	    	str="<div>"
	    	+ "<img src='/main/listImgs?fileName="+fileName+"'/>"
	    	+"</div>"; 
	    	
	    	$("#showImg").append(str);

	    });
	    
	

		
  });
  

  
  
		
});     /* document.ready(function) end */








var login=$("#loginVal").attr("data-login");
var buyType=$("#buyType").attr("data-buyType");




//입찰 버튼 클릭
$("#btnTender").click(function(event) {
	
	event.preventDefault(); 
	
	if(buyType=="i") {
		
		alert("입찰 할 수 없는 상품 입니다.");
		return;
		
	}
	
	
	var str=getEndDate(pno);

    if(str == '판매 종료') {
	
        alert("판매가 종료된 상품 입니다.");
        setExpire(pno);
        return;
	
	}
	

	
	
    if(login) {
		
	
	
	var dispWid=screen.availWidth;
	var dispHei=screen.availHeight;
	
	var winWid=700;
	var winHei=800;
	
	var xloc=(dispWid-winWid)/2;
	var yloc=(dispHei-winHei)/2;
	
	var openWindow=window.open("/tender/tender", "tenderWindow", 'top='+yloc+', left='+xloc+', toolbar=no, location=no, status=no, menubar=no, resizable=no, directories=no, width='+winWid+', height='+winHei);

	
	$("#tender_form").target="tenderWindow";
	$("#tender_form").submit();
	
	}else{
		
		self.location="/user/login2";
		
	}
	
	
	
	
});




	
$("#btnFavorite").click(function(e) {
	
	e.preventDefault();
	
	if(!login) {
		
		self.location="/user/login2";
		
	}else{
		
	
	if(finished != '진행중') {
		
	    alert("판매가 종료된 상품 입니다.");
	    return;
		
	}else{
		
	$.ajax({
		
		url:'/main/addMyFavorite',
		data:{userID:userID, pno:pno},
		success:function(result) {
			
			alert("관심목록에 등록 되었습니다.");
			
		}
		
	});
		
	}
	
	}
	
	
	
});
	



$("#btnDirect").click(function(e) {
	
	e.preventDefault();
	var expiredResult="";
	
	if(!login) {
		
		self.location="/user/login2";
		
	}else{
		
		var str=getEndDate(pno);

	    if(str == '판매 종료') {
		
	        alert("판매가 종료된 상품 입니다.");
	        setExpire(pno);
	        return;
		
    	}else{
	
	        location.replace("/main/pay?userID="+userID+"&pno="+pno);
	
    	}
	}
	
	return false;
	
}); 










</script>


</body>
</html>















