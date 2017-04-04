<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>

<style>

	body {
	height: 1500px;
	width: 100%;
	}

	.form-title {
	background-color: #D0E7F4;
	margin: 30px;
	padding: 50px;
	font-size: 20px;
	z-index: 10010;
	}
	
	.inner-form {
	padding: 20px;
	background-color: #E1E9ED;
	border-color: #8EC8D1;
	border: dashed 1px; 
	text-align: left;
	}
	
	.reg_form {
	background-color: #FFF2C1;
	border: dashed 1px;
	border-color: #CDA4D6;
	}
	
	input[type=text] {
	padding: 8px;
	font-size: 16px;
	}
	
	textarea {
	font-size: 18px;
	}
	
	#opt {
	border: dashed 1px;
	border-color: #8EC8D1; 
	background-color: #D0E7F4;
	width: 200px;
	}
	
	#desc_label {overflow: hidden;}
	.form-desc {float: left;}
	
	#s_div {
	font-size: 28px;

	line-height: 30px;
	}
	
</style>	
</head>

<body>


<div class="regist_product">
	<form role="form" action="register" method="post">
	
	<input type="hidden" name="page" value="${ criteria.page }">
	<input type="hidden" name="searchType" value="${ criteria.searchType }">
	<input type="hidden" name="keyWord" value="${ criteria.keyWord }">
	
	<div class="form-title">
	  <div class="inner-form">
	  
		<div>
		<label>제목 : <input type="text" name="title" class="reg_form" size="100" value="${ productVO.title }"></label>
		</div>
		<div>
		<p>add img</p>
		</div>
		<div>
		<label for="i_price">즉시 구입 가격 : </label>
		<input type="text" name="i_price" class="reg_form" value="${ productVO.i_price }">원
		</div>
		<p></p>
		<div>
		<label for="startprice">시작가 : </label>
		<input type="text" name="startprice" class="reg_form" value="${ productVO.startprice }">원
		</div>
		<p></p>
		<div id="opt">
		<p>판매방식 선택</p>
		<label for="buytype">즉시구입 </label><input type="checkbox" name="buytype" value="imme">
        <label for="buytype">경매 </label><input type="checkbox" name="buytype" value="auction" checked="checked">
		</div>
		<p></p>
		<div>
		<label for="quantity">수량 : </label>
		<input type="text" name="quantity" class="reg_form" value="${ productVO.quantity }">EA
		</div>
		<p></p>
		<div>
		<label for="desc_product" id="desc_label">상품 설명</label><br/>
		<textarea class="form_desc" name="desc_product" rows="10" cols="100">${ productVO.desc_product }</textarea>
		</div>
<p></p>		
<div id="s_div" style="align:'left';">
	<p></p>
	<button type="submit" id="reg_submit">등록</button>
</div>	
	  </div>
	</div>

	</form>
	
</div>


	
	
	
	
	<script>
	
	$(document).ready (
	function () {
		var formObj=$("form[role='form']");	
	
	  $("#reg_submit").on("click", function() {
		  formObj.attr("action", "/main/register");
		  formObj.attr("method", "post");
		  formObj.submit();
	  });
	
	});
	</script>

</body>
</html>
















