<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<style>

html, body {
height: 100%;
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
text-align: center;
margin: 0 auto;
opacity: 70%;
}

#descTitle {
font-size: 20px;
font-weight: bold;
color: orange;
margin: 0 auto;
}





</style>

<title>Insert title here</title>
</head>
<body>

<div id="desc">

  <div id="desc0"></div>

  <div id="desc_left" class="desc_left"><img src="/main/listImgsPno?pno=${productVO.pno}" id="sample"/>
  <div><p>${productVO.title}</p></div>
  </div>
  
  <div id="desc_center"></div>
  
  <div id="desc_right">
  
  <%-- <div id="pname" class="attr">상품명</div><div id="pname_val" class="val">${productVO.pname}</div>
  <div id="buytype" class="attr">구매타입</div><div id="buytype_val" class="val">${productVO.buytype}</div>
  <div id="startprice" class="attr">시작가</div><div id="startprice_val" class="val">${productVO.startprice}</div>
  <div id="nowprice" class="attr">현재가</div><div id="nowprice_val" class="val">${productVO.nowprice}</div>
  <div id="tender" class="attr">입찰자수</div><div id="tender_val" class="val">${productVO.tendercnt}</div>
  <div id="quantity" class="attr">수량</div><div id="quantity_val" class="val">${productVO.quantity}</div>
  <div id="regdate" class="attr">등록일</div><div id="regdate_val" class="val">${productVO.createdate}</div>
  <div id="remaintime" class="attr">남은시간</div><div id="remaintime_val" class="val"></div> --%>
  
  <table>
  <tbody id="tbd">
  <tr><td style="width:140px">상품명</td><td>${productVO.pname}</td></tr>
  <tr><td>구매타입</td><td>${productVO.buytype}</td></tr>
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









<div id="showImg" data-pno="${productVO.pno}">
</div>


		

<script>

 
function getImageLink(fileName) {      /* 샘플파일 이름으로부터 원본파일 이름 추출 */
	var front=fileName.substring(0,12);
	var rear=fileName.substring(14);
	
	return front+rear;
}







var pno=${productVO.pno};

$(document).ready(function() {
	
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
	
	$("#showImg").append("<br><br><hr><br><br><div id='descTitle'>상품 설명<div>");
	$("#showImg").append("<br><br><div id='contents'>${productVO.desc_product}</div><br><br>");
	$("#showImg").append("<div id='footer'></div>");
	
		
});
		
});



$(document).ready(function() {
	
	
	
	var pno=$("#remain").attr("data-pno");
	
	$.ajax({
		url:'/getExpDate?pno='+pno,
		dataType:'text',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success: function(result) {
			
			$("#remain").html("남은시간 &nbsp;&nbsp;&nbsp;"+result);
		}
	});	 
	

	
	
}); 

</script>


</body>
</html>















