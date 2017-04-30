<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
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
	
	#fileWrap {
	margin: 5px;
	overflow: hidden;
	}
	
	#selectImg {
	width: 400px;
	height: 600px;
	background-color: white;
	font-size:15px;
	overflow: scroll;
	float: left;
	}
	
	#checkedFile {
	width: 385px;
	height: 600px;
	background-color: white;
	border-left: dashed gray 1px;
	overflow: scroll;
	float: left;
	}
	
	ul {
	overflow: hidden;
	}
	
	li {
	margin: 5px;
	float: left;
	}
	
	iframe {
	width: 0px;
	height: 0px;
	border: 0px;
	}
	
	#fileList_ul {
	width: 200px;
	height: 300px;
	border: solid grey 1px;
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

		<div id="fileWrap">
		  <form action="/main/upload" method="post" name="form1" id="form1" enctype="multipart/form-data"
                >
            <input type="submit" id="send_btn" value="등록하기"/>
            <input type="file" name="mFile" id="mFile" multiple/>
          </form>
		</div>  <!-- filewrap -->

<!-- <iframe name="ifrm"></iframe> -->

<ul id="fileList_ul">
	<li>${result}</li>
</ul>

</div>


	
	
	
	
<script>
	
$("#send_btn").submit(function() {

	var form=$("#form1")[0];
	var formData=new FormData(form);  
	var inpFile=$("input[name='mFile']")[0];
 	
	
	/* formData.append("mFile", inpFile).files[0]; 
	alert(inpFile.files[0].value()); */
	
	for(var i=0; i<$('#form1')[0].files.length; i++){

        formData.append('mFile', $('#mFile')[0].files[i]);

    }

	
	$("#form1").ajaxForm({
		url:'/main/upload',
		type:'POST',
		data:formData,
		dataType:'text',
		processData: false,
		contentType: false,
		success: function(data) {
			var dt=JSON.parse(data);
			alert(dt);
			/* $("#form1").reset(); */
			$("#fileList_ul").html("<li>"+dt+"</li>");
		}
	}); 
	
	
}); 
	  
	
	  
	
</script>

</body>
</html>
















