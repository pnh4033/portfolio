<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<style>

html, body {
height: 100%;
width:100%;
}

img {
max-width: 1200px;
}

#showImg {
text-align: center;
width:100%;
height:100%;
}

#desc {
margin: 20px;
padding: 10px;
overflow: hidden; 
}

#desc0 {
width: 280px;
height: 300px;
float: left; 
display: inline-block;
}

#desc_left {
display: table-cell;
vertical-align: middle;
padding: 50px;
margin: 20px;
width: auto;
height: auto;
border-radius: 3px;
border: solid #B6CCEF 2px;
float: left; 
display: inline-block;
}

#desc_center {
width: 100px;
height: 300px;
float: left; 
display: inline-block;
}

#desc_right {
width: 200px;
height: 300px;
border-radius: 3px;
border-color: solid gray 1px;
float: left; 
display: inline-block;
}



table {
vertical-align: middle;
margin: 3px;
padding: 3px;
width: 500px;
height: 300px;
text-align: center;
}

td {
border: solid #B6CCEF 2px;
border-radius: 3px;
margin: 3px;
padding: 3px;
text-align: center;
}

#sample {
width: 250px;
}

#contents {
width: 80%;
height: 300px;
border: solid #2487A0 4px;
border-radius: 5px;
text-align: left;
margin: 0 auto;
padding: 30px;
opacity: 70%;
}

#descTitle {
font-size: 20px;
font-weight: bold;
color: orange;
margin: 0 auto;
}

#buy_menu_wrap {
width: 100%;
background-color: #FFEEDB;
}

#buy_menu {
width:300px;
margin: 0 auto;
}

#buy_menu_table {
height: 100px;
border-top: solid orange 2px;
border-bottom: solid orange 2px;
text-align: center;
}

#buy_menu_table td {
border: 0px;
width: 200px;
}

.buy_btn {
width: 130px;
height: auto;
}

#contents_title {
text-align: center;
font-size: 30px;
color: gray;
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


</style>

<title>상품 조회</title>

</head>


<body>



<div id="desc">

  <div id="desc0"></div>

  <div id="desc_left" class="desc_left"><img src="/main/listImgsPno?pno=${productVO.pno}" id="sample"/>
  <div><p>${productVO.title}</p></div>
  </div>
  
  <div id="desc_center"></div>
  
  <div id="desc_right">
  

  <!-- 새창으로 값 전달 -->
  <form name="tenderForm" id="tender_form" action="/main/tender" target="tenderWindow" method="get">
    <input type="hidden" name="pno" value="${productVO.pno}">
  </form>



  
  <table>
  <tbody id="tbd">
  <tr><td style="width:140px">상품명</td><td>${productVO.pname}</td></tr>
  <tr><td>판매자 ID</td><td>${productVO.seller}</td></tr>
  
  <tr>
  <td>구매방식</td>
  
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
  <tr><td>입찰자수</td><td>${productVO.tendercnt}</td></tr>
  <tr><td>수량</td><td>${productVO.quantity}</td></tr>
  <tr><td>등록일</td><td>${productVO.createdate}</td></tr>
  <tr><td>남은시간</td><td id="remain" data-pno="${productVO.pno}"></td></tr>
  </tbody>
  </table>
  
  </div>




</div>



<div id="buy_menu_wrap">
  <div id="buy_menu">
    <table id="buy_menu_table">
      <tr>
      
        <td><a href="/main/tender" id="tender"><img src="/resources/image/i1.png" class="buy_btn"></a></td>
        <td><a href="#" id="direct"><img src="/resources/image/i2.png" class="buy_btn"></a></td>
      
      </tr>
    </table>
  </div>
</div>

<div style="height: 100px;"></div>


<!-- 로그인 값 저장 -->
<div id="loginVal" data-login="${login}"></div>


<!-- 이미지 목록 -->
<div id="showImg" data-pno="${productVO.pno}">
</div>

<div id="descTitle"></div>
<br/><br/>

<div id="contents_title">상품 설명</div>
<br/><br/>

<c:set var="desc" value="${productVO.desc_product}"/>
<div id="contents">${fn:replace(desc, newLineChar, "<br>")}</div>

<div id='footer'><%@ include file="footer.jsp" %></div>







<script>

var pno=${productVO.pno};
 
function getImageLink(fileName) {      /* 샘플파일 이름으로부터 원본파일 이름 추출 */
	var front=fileName.substring(0,12);
	var rear=fileName.substring(14);
	
	return front+rear;
}







$(document).ready(function() {
	
	
	/* 남은시간 요청 */
	$.ajax({
		
		url:'/getEndDate?pno='+pno,
		dataType:'text',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success: function(result) {
			
			$("#remain").html(result);
			
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
		
});








var login=$("#loginVal").attr("data-login");


$("#tender").click(function(event) {
	
	event.preventDefault(); 
	
	if(login) {
		
	
	
	var dispWid=screen.availWidth;
	var dispHei=screen.availHeight;
	
	var winWid=700;
	var winHei=800;
	
	var xloc=(dispWid-winWid)/2;
	var yloc=(dispHei-winHei)/2;
	
	var openWindow=window.open("/main/tender", "tenderWindow", 'top='+yloc+', left='+xloc+', toolbar=no, location=no, status=no, menubar=no, resizable=no, directories=no, width='+winWid+', height='+winHei);

	
	$("#tender_form").target="tenderWindow";
	$("#tender_form").submit();
	
	}else{
		
		self.location="/user/login2";
		
	}
	
	
	
	
});


</script>


</body>
</html>















