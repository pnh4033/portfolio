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
	    <td>가격 : &nbsp;<span style="color: red; font-size: 24px; font-weight: bold;">
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

	</table>

	<br/><br/><br/>



    <div class="row">
      <div class="col-xs-4">
      </div>
      <div class="col-xs-2">
      <button class="btn btn-lg btn-primary" id="btnPay">결제</button>
      </div>
      <div class="col-xs-2">
      <a href="/main/listProduct">
      <button class="btn btn-lg btn-warning" id="btnPay">메인 페이지</button>
      </a>
      </div>
      <div class="col-xs-4">
      </div>
    </div>
  
  </div>


  <div style="width: 100%; height: 100px;"></div>
  
  <div id="footer"><%@ include file="footer.jsp" %></div>

<script>

var IMP = window.IMP; // 생략가능
IMP.init('imp78857475'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용



$("#btnPay").click(function(e) {
	
	e.preventDefault();
	
	
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원. 
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});

	
	
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
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address2').focus();
        }
    }).open();
}



</script>


</body>
</html>


















