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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<style>

html body {
width: 100%;
height: 100%;
}

img {
max-width: 250px;
}

input[type=checkbox] {
-webkit-transform: scale(1.5);
padding: 5px;
}

label {
font-size: 16px;
}

.clause_box {
padding:5px;
padding-left:25px;
padding-right:25px;
background-color: #F8E0E6;
border-radius: 4px;
}

#pay_method-box {
border: solid #34C6BE 2px;
border-radius: 4px;
padding: 15px;
}

.p_pay_method {
font-size:25px;
padding-left:10px;
background-color: #f2f2f2;
color: red;
border: solid #f2f2f2 5px;
}

</style>

</head>
<body>


  <div class="container">
    
    
    
    

    <br/><br/><br/>
	<div class="row">
	  <h2>상품 결제</h2>
	</div>
	<br/><br/>
	
	<div class="alert alert-info" style="font-size: 20px;">
	결제 정보
	</div>
	<br/><br/>
	
	
	<table class="table table-hover" style="font-size: 20px;">
	  <tr>
	    <td style="width:50px;">${productVO.pno}</td>
  		<td><a href="/main/readProduct?pno=${productVO.pno}">
  		<img src="/main/listImgsPno?pno=${productVO.pno}" id="listImg"/></a></td>
  		<td style="width: 980px; font-size: 30px; text-align: center; vertical-align: middle;" colspan="6">
  		${productVO.title}
        </td> 	  
	  </tr>
	  
	  <tr>
	    <td colspan="2">상품명 : ${productVO.pname}</td>
	    <td>판매자 ID : ${productVO.seller}</td>
	    <td id="td_price">결제금액 : &nbsp;<span style="color: red; font-size: 24px; font-weight: bold;">
	    <fmt:formatNumber value="${productVO.i_price}" type="currency" groupingUsed="true"/>
	    </span></td>
	  </tr>
	  
	</table>
	

	<br/><br/>
	
	<div class="alert alert-info" style="font-size: 20px;">
	구매자 정보 입력 
	</div>
	<br/><br/>
	
	<h3>주소 입력</h3>
	<table class="table table-hover">
	<tr>
    	<td>
    	<input type="text" class="form-control" id="postcode" placeholder="우편번호">
    	</td>
    	<td>
        <input type="button" class="btn btn-default" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    	</td>
	</tr>
        <td>
        <input type="text" class="form-control" id="address" placeholder="주소">
        </td>
		<td>
        <input type="text" class="form-control" id="address2" placeholder="상세주소">
		</td>

	</table><br/>

	<div class="form-group">
      <label for="input_tel">연락처 &nbsp;&nbsp;&nbsp;&nbsp; (ex : 01012345678)</label>
      <input type="text" class="form-control" id="input_tel" value="${userVO.userCell}"
      style="width: 250px;">
    </div>
    
    
	<br/><br/><br/>


	<div class="row">
	  <div class="alert alert-info" style="font-size: 20px;">
	  결제 수단
	  </div>
	</div>
	
	
	<div id="pay_method-box">
	<div class="row">
	  <div class="col-xs-1"></div>
	  <div class="col-xs-2">
	    <table class="table">
	    <tr class="warning"><td>신용카드</td></tr>
	    <tr class="warning"><td>실시간 계좌 이체</td></tr>
	    <tr class="warning"><td>휴대폰 결제</td></tr>
	    </table>
	  </div>
	  <div class="col-xs-2">
	    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">결제 수단 선택
        <span class="caret"></span></button>
        <ul class="dropdown-menu" style="font-size: 15px;">
          <li><a href="#" id="a_card">신용카드</a></li>
          <li><a href="#" id="a_trans">실시간 계좌 이체</a></li>
          <li><a href="#" id="a_mobile">휴대폰 결제</a></li>
        </ul>
        </div>
	  </div>
	  <div class="col-xs-4">
	    <div class="row"  id="pay_method_selected"></div>
	  </div>
	  <div class="col-xs-1"></div>
	</div>
	</div>



    <br/><br/><br/>
  
  
  
  <div class="row" style="text-align: center; "><h3>약관 동의</h3></div>
  <div class="row">
  <div class="col-xs-3"></div>
  
  <div class="col-xs-6">
    <div class="checkbox">
    <label><input type="checkbox" value="clause-allChk" id="chkAll">
         <span class="label label-primary" style="font-size: 15px;">전체 체크</span>
    </label>
    </div>
  </div>
  
  <div class="col-xs-3"></div>
  </div>
  
  <br/>
  
  <div class="row">
  <div class="col-xs-3"></div>
  
  <div class="col-xs-6">
  <div class="clause_box">
  <div class="row">
    <div class="form-group">
    <label for="clause1">약관 1</label>
    <textarea class="form-control" rows="3" id="clause1">
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    </textarea>
    </div> 
  </div>
  
  <div class="row">
    <div class="checkbox">
    <label><input type="checkbox" value="clause1-chk" id="chk1">약관 1 에 동의 합니다.</label>
    </div>
  </div>
  </div>  <!-- clause box -->
  </div>

  <div class="col-xs-3"></div>
  </div>
  
  <br/>
  
  
  
  
  <div class="row">
  <div class="col-xs-3"></div>
  
  <div class="col-xs-6">
  <div class="clause_box">
  <div class="row">
    <div class="form-group">
    <label for="clause1">약관 2</label>
    <textarea class="form-control" rows="3" id="clause2">
     약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    </textarea>
    </div> 
  </div>
  <div class="row">
    <div class="checkbox checkbox-md">
    <label><input type="checkbox" value="clause2-chk" id="chk2">약관 2 에 동의 합니다.</label>
    </div>
  </div>
  </div>  <!-- clause box -->
  </div>
  
  <div class="col-xs-3"></div>
  </div>
  
  <br/>
  
  
  
  
  <div class="row">
  <div class="col-xs-3"></div>
  
  <div class="col-xs-6">
  <div class="clause_box">
  <div class="row">
    <div class="form-group">
    <label for="clause1">약관 3</label>
    <textarea class="form-control" rows="3" id="clause3">
     약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    약관 1약관 1약관 1약관 1약관 1약관 1약관 1약관 1
    </textarea>
    </div> 
  </div>
  <div class="row">
    <div class="checkbox">
    <label><input type="checkbox" value="clause3-chk" id="chk3">약관 3 에 동의 합니다.</label>
    </div>
  </div>
  </div>  <!-- clause box -->
  </div>
  
  <div class="col-xs-3"></div>
  </div>
  
  
  
  <br/><br/><br/>







    <div class="row">
      <div class="col-xs-4">
      </div>
      <div class="col-xs-2">
      <button class="btn btn-lg btn-primary" id="btnPay">결제</button>
      </div>
      <div class="col-xs-2">
      <a href="/main/listProduct">
      <button class="btn btn-lg btn-warning" id="btnHome">메인 페이지</button>
      </a>
      </div>
      <div class="col-xs-4">
      </div>
    </div>
  

  
  
  














  </div>  <!-- container -->

  <div style="width: 100%; height: 100px;"></div>
  
  <div id="footer"><%@ include file="footer.jsp" %></div>


<div id="pno" data-pno="${productVO.pno}"></div>
<div id="userID" data-userID="${userVO.userID}"></div>
<div id="orderName" data-orderName="${productVO.title}"></div>
<div id="i_price" data-iPrice="${productVO.i_price}"></div>
<div id="eMail" data-eMail="${userVO.userEmail}"></div>
<div id="userName" data-userName="${userVO.userName}"></div>
<div id="userCell" data-userCell="${userVO.userCell}"></div>



<script>

var IMP = window.IMP; // 생략가능
IMP.init('imp78857475'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용



var pMethod="";
var orderName=$("#orderName").attr("data-orderName");
var i_price=$("#i_price").attr("data-iPrice");
var eMail=$("#eMail").attr("data-eMail");
var buyerName=$("#userName").attr("data-userName");
var buyer_tel=$("#input_tel").val();
var buyer_addr="";
var buyer_postcode="";



$("#address2").focusout(function() {
	
	buyer_addr+=" "+$("#address2").val();
	
}); 
	
	
	




//신용카드 선택 
$("#a_card").click(function(e) {
	
	e.preventDefault();
	
	pMethod="card";
	$("#pay_method_selected").empty();
	$("#pay_method_selected").append("<div class='p_pay_method'>결제 : 신용카드</div>"
			+"<div class='p_pay_method'>"+$("#td_price").text()+"</div>");
	
});

//계좌이체 선택
$("#a_trans").click(function(e) {
	
	e.preventDefault();
	
	pMethod="trans";
	$("#pay_method_selected").empty();
	$("#pay_method_selected").append("<div class='p_pay_method'>결제 : 실시간 계좌 이체</div>"
			+"<div class='p_pay_method'>"+$("#td_price").text()+"</div>");
	
});

//휴대폰 결제 선택
$("#a_mobile").click(function(e) {
	
	e.preventDefault();
	
	pMethod="phone";
	$("#pay_method_selected").empty();
	$("#pay_method_selected").append("<div class='p_pay_method'>결제 : 휴대폰 결제</div>"
			+"<div class='p_pay_method'>"+$("#td_price").text()+"</div>");
	
});



$("#input_tel").focus(function() {
	
	$(this).val("");
	
});



//체크박스 전체 선택
$("#chkAll").change(function() {
	
	var chkAll=$("#chkAll");
	
	if(chkAll.prop("checked")) {
		
		$("input[type=checkbox]").prop("checked", true);
		
	}else if(chkAll.prop("checked", false)) {
		
		$("input[type=checkbox]").prop("checked", false);
		
	}
	
});


//약관 체크 여부 검사
function clauseChk() {
	
	var chk1=$("#chk1").prop("checked");
	var chk2=$("#chk2").prop("checked");
	var chk3=$("#chk3").prop("checked");
	
	if(chk1 && chk2 && chk3) {
		
		return true;
		
	}else{
		
		return false;
		
	}
	
}



/* 휴대폰 번호 유효성 검사 */
function checkCell() {
	
	var check_cell=/^(010|011)\d{3,4}\d{4}$/;
	var cell=$("#input_tel").val();
	var result_cell=check_cell.test(cell);
	
	if(!result_cell) {
		
	    alert("연락처 형식이 올바르지 않습니다.");
		
		$("#input_tel").val("");
		$("#input_tel").focus();
		return false;
		
	}else{
		
		return true;
		
	}
	
}


function formChk() {
	
	var input_tel=$("#input_tel").val();
	
	var postcode=$("#postcode").val();
	var address=$("#address").val();
	var address2=$("#address2").val();
	
	var pay_method_selected=$("#pay_method_selected").text();
	
	if((input_tel == null) || (input_tel == '')) {
		
		alert("연락처를 입력 해 주시기 바랍니다.");
		return false;
		
	}else if((postcode == null) || (postcode == '')) {
		
		alert("우편번호를 입력 해 주시기 바랍니다.");
		return false;
		
	}else if((address == null) || (address == '')) {
		
		alert("주소를 입력 해 주시기 바랍니다.");
		return false;
		
	}else if((address2 == null) || (address2 == '')) {
		
		alert("상세 주소를 입력 해 주시기 바랍니다.");
		return false;
		
	}else if((pay_method_selected == null) || (pay_method_selected == '')) {
		
		alert("결제 수단을 선택 해 주시기 바랍니다.");
		return false;
		
	}else{
		
		return true;
		
	}
	
	
}








$("#btnPay").click(function(e) {
	
	e.preventDefault();
	
	
	//약관동의 여부 체크
	if(!clauseChk()) {
		
		alert("약관에 동의하여 주시기 바랍니다.");
		return;
		
	}
	
	
	
	var pno=$("#pno").attr("data-pno");
	var userID=$("#userID").attr("data-userID");
	
	
	
	
	if(checkCell() && formChk()) {
		
	
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원. 
	    pay_method : pMethod,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : orderName,
	    amount : i_price,
	    buyer_email : eMail,
	    buyer_name : buyerName,
	    buyer_tel : buyer_tel,
	    buyer_addr : buyer_addr,
	    buyer_postcode : buyer_postcode,
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        
	        $.ajax({
	         	url:'/main/paidResult',
	         	type:'POST',
	         	headers:{
	    			"Content-Type" : "application/json",
	    			"X-HTTP-Method-Override" : "POST"
	    		},
	         	data: JSON.stringify({
	         		pno:pno,
	         		userID:userID,
	         		imp_uid:rsp.imp_uid,
	         		merchant_uid:rsp.merchant_uid,
	         		paid_amount:rsp.paid_amount,
	         		apply_num:rsp.apply_num,
	         		buyer_name:rsp.buyer_name,
	         		buyer_email:rsp.buyer_email,
	         		buyer_tel:rsp.buyer_tel,
	         		buyer_addr:buyer_addr,
	         		buyer_postcode:buyer_postcode
	         	}),
	         	datyType:'text',
	         	success:function(result) {
	         		
	         		alert(result);
	         		
	         	}
	         });
	        
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});

	}    /* formChk() */
	
	
});







function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                
                buyer_addr=fullAddr;
                
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;
            
            buyer_postcode=data.zonecode;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address2').focus();
        }
    }).open();
}



</script>


</body>
</html>


















