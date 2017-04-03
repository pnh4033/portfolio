<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<style>
	.form-title {
	background-color: #D0E7F4;
	margin: 50px;
	padding: 50px;
	}
	
	.inner-form {
	background-color: #ADF43A;
	border-color: #2F97C6;
	border: solid dashed 1px; 
	}
</style>	
</head>

<body>


<div class="regist_product">
	<form role="form" action="registProduct" method="post">
	
	<input type="hidden" name="page" value="${ criteria.page }">
	<input type="hidden" name="searchType" value="${ criteria.searchType }">
	<input type="hidden" name="keyWord" value="${ criteria.keyWord }">
	
	<div class="form-title">
	  <div class="inner-form">
	  
		<div>
		<label>제목 : <input type="text" name="title" class="reg_form" value="${ productVO.title }"></label>
		</div>
		<div>
		<p>add img</p>
		</div>
		<div>
		<label for="i_price">즉시 구입 가격 : </label>
		<input type="text" name="i_price" class="reg_form" value="${ productVO.i_price }">
		</div>
		<div>
		<label for="startprice">시작가 : </label>
		<input type="text" name="startprice" class="reg_form" value="${ productVO.startprice }">
		</div>
		<div>
		<label for="buytype">즉시구입 </label><input type="checkbox" name="buytype" value="imme"><br/>
        <label for="buytype">경매 </label><input type="checkbox" name="buytype" value="auction" checked="checked">
		</div>
		<div>
		<label for="quantity">수량 : </label>
		<input type="text" name="quantity" class="reg_form" value="${ productVO.quantity }">
		</div>
		<div>
		<label for="desc_product">상품 설명</label>
		<textarea class="form_desc" name="desc_product" rows="10">${ productVO.desc_product }</textarea>
		</div>
		
	  </div>
	</div>
	
	</form>
</div>

</body>
</html>