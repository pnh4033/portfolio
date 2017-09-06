<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript" src="/resources/js/getEndDate.js"></script>

<style>

html, body {
height: 100%;
width: 100%;
}

#wrap {
padding: 50px;
width: 500px;
margin: 0 auto;
}

table td {
margin: 4px;
border: solid #D6005C 0.5px;
width: 420px;
}

select {
padding: 2px;
width: 100px;
background-color: #E5EAFF;
}

#title {
text-align: center;
font-size: 25px;
color: gray;
}

#auction {
padding: 2px;
font-size: 14px;
color: white;
background-color: purple;
border-radius: 2px;
}

#nowprice {
color: #BF0065;
font-weight: bold;
}

#directBuy {
padding: 2px;
font-size: 14px;
color: white;
background-color: orange;
border-radius: 2px;
}

#tender_submit {
height: 60px;
width: auto;
}

</style>

<title>입찰</title>
</head>
<body>

<div style="height: 100px;"></div>

<div id="pno_div" data-pno="${productVO.pno}"></div>
<div id="seller_div" data-seller="${productVO.seller}"></div>
<div id="loginID_div" data-userID="${login.userID}"></div>
<div id="buytype_div" data-buytype="${productVO.buytype}"></div>


<div id="title">${productVO.title}</div>
<p></p>


<!-- 로그인 값 저장 -->
<div id="loginVal" data-login="${login}"></div>


<!-- 입찰가 데이터 전송 폼 -->
<form name="" id="tenderVal_form" target="/tender/tenderVal" method="post">
  <input type="hidden" name="tenderValue" id="tenderValue_input" value="${tenderVO.tenderValueInput}"/>
</form>


<div id="wrap">

<table>

  <tr>
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
  
  <tr>
    <td>
      <span id="nowprice">현재가 : ${productVO.nowprice} 원</span>
    </td>
  </tr>
  
  <tr>
    <td>
      <c:if test="${productVO.finished != '종료'}">
        <span style="color:blue; font-weight: bold;">입찰 가능</span>
      </c:if>
      
      <c:if test="${productVO.finished == '종료'}">
        <span style="color:red; font-weight: bold;">입찰 불가</span>
      </c:if>
    </td>
  </tr>
  
  <tr>
    <td>
      <span id="remain">남은 시간 : </span>
    </td>
  </tr>
  
  <tr>
    <td>
      <span>입찰가 입력 (1000원 이상 5000원 이하) </span> 
      
      <select name="tenderVal" id="select_tenderVal">
		<option value="1000" selected>1000</option>
		<option value="2000">2000</option>
		<option value="3000">3000</option>
		<option value="4000">4000</option>
		<option value="5000">5000</option>
	  </select>
		
    </td>
  </tr>
  
</table>

</div>


<div style="height: 150px;"></div>

<div style="text-align: center;">
  <input type="image" src="/resources/image/i1.png" id="tender_submit"/>
</div>






<script>


var pno=$("#pno_div").attr("data-pno");
var seller=$("#seller_div").attr("data-seller");
var userID=$("#loginID_div").attr("data-userID");
var buytype=$("#buytype_div").attr("data-buytype");

var expired="";




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






$(document).ready(function() {

	
	$.ajax({
		url:'/getEndDate?pno='+pno,
		dataType:'text',
		success: function(result) {
			
			var id="#expDate"+pno;
			
			if(buytype == 'i') {
				
				$("#remain").append("");
				return;
				
			}else	if(result != null) {
				
				$("#remain").append("&nbsp;"+result);
				expired=result;
				
			}else{
				
				$("#remain").append(result);
				
			}
			
		}
	});	
	
});




var login=$("#loginVal").attr("data-login");





//판매 종료 시간이 지난 물품에 대하여 데이터베이스의 판매 종료 컬럼 업데이트
function setExpire(pno) {
		
		$.ajax({
			
			url:'/main/setExpired',
			data:{	pno:pno}
		
		});
		
}



$("#tender_submit").click(function() {
	
	
	var now="";
	
	 $.ajax({
			
			url:'/main/isExpired',
			data:{pno:pno},
			success:function(result) {
				
				var str=getEndDate(pno);

			    if(str == '판매 종료') {
				
			        alert("판매가 종료된 상품 입니다.");
			        setExpire(pno);
			        return;
					
				}else{
					
					tender();
					
				}
				
			}
			
		});
	 
	 return false;
	
});


function tender() {
	
	 
	/* 선택된 입찰가 */
	var val=$("#select_tenderVal option:selected").val();
	
        if(login) {
	  
	
	        /* 입찰자가 판매자 인지 체크 */
	        if(seller==userID) {
		
	        	alert("본인이 판매중인 상품은 입찰 할 수 없습니다.");
	        	return;
		
	        }else{	
	
	            $.ajax({
		        url:"/tender/tenderVal",
	        	type:"post",
	        	dataType:"text",
		        headers:{
		    	"Content-Type" : "application/json",
		    	"X-HTTP-Method-Override" : "POST"
	        	},
		        data:JSON.stringify({
		    	pno:pno,
		    	tenderValueInput:val,
	     		buyer:userID,
	    		userID:userID
	        	}),
	        	success:function(result) {
			
		        	alert("등록 되었습니다.");
			
		        }
		
		
	            });
			
	            
        	}

        }else{
	  
	        self.location="/user/login2";
	  
        }
	  
	 
  if(login) {
  
	  //나의 입찰 생성
	  $.ajax({
		
		url:'/tender/addMyTender',
		dataType:'text',
		data:{
			userID:userID,
			pno:pno
		}
		
	});
  
  
	
    }else{
	  
	  self.location="/user/login2";
	  
    }
	
  
}  /* function tender end */
	


</script>


</body>
</html>




















