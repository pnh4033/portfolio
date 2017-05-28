<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>
<script src='/resources/plugins/jquery-validation-1.16.0/dist/jquery.validate.min.js'></script>

<title>Insert title here</title>

<style>

	html, body {
	height: 100%;
	width: 100%;
	}
	
	#form_wrap {
	overflow:hidden;
	text-align: center;
	}
	
	.regist_product {
	float:left;
	}
	
	.form-title {
	overflow:hidden;
	margin: 0 auto;
	padding: 30px;
	font-size: 13px;
	z-index: 10010;
	text-align: center;
	}
	
	.inner-form {
	width: 750px;
	height: 470px;
	margin: 10px; 
	padding: 20px;
	border: solid 4px;
	border-color: #2162A8;
	border-radius: 8px; 
	text-align: left;
	}
	
	#fileList_div {
	float:left;
	width: 484px;
	margin: 10px;
	height: 470px;
	border: solid 4px;
	border-color: #FF882D; 
	border-radius: 8px;
	text-align: left;
	padding: 20px;
	}
	
	.reg_form {
	background-color: #FFF2C1;
	border: dashed 1px;
	border-color: #CDA4D6;
	}
	
	input[type=text] {
	padding: 2px;
	font-size: 13px;
	}
	
	textarea {
	font-size: 13px;
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
	text-align: center;
	width: 550px;
	padding: 30px;
	overflow: hidden;
	}
	
	#selectImg {
	width: 400px;
	height: 600px;
	background-color: white;
	font-size:13px;
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
	
/* 	ul {
	overflow: hidden;
	}
	
	li {
	margin: 5px;
	float: left;
	} */
	
	iframe {
	width: 0px;
	height: 0px;
	border: 0px;
	}
	
	#fileList_ul {
	width: 455px;
	height: 300px;
	border: solid 4px;
	border-color: #3FC43C;
	border-radius:8px; 
	text-align: left;
	padding: 10px;
	overflow: auto;
	}
	
	
	.fileLi {
	
	}
	
</style>	
</head>

<body>

<div id="form_wrap">
<div class="regist_product">

	
	<!-- 페이징 처리와 검색을 위한 데이터 -->
	<form role="form" name="regForm" id="regForm" action="/main/register" method="post">
	
	<input type="hidden" name="page" value="${ criteria.page }">
	<input type="hidden" name="searchType" value="${ criteria.searchType }">
	<input type="hidden" name="keyWord" value="${ criteria.keyWord }">
	
	<div class="form-title">
	  <div class="inner-form">
	  
		<div>
		<label>제목 : <input type="text" name="title" id="form_title" class="reg_form" size="100" value="${ productVO.title }"></label>
		</div><br>
		
		<div>
		<label for="pname">상품명 : </label>
		<input type="text" name="pname" id="form_pname" class="reg_form" value="${ productVO.pname }">
		</div><br>
		
		<%-- <div>
		<label for="i_price">즉시 구입 가격 : </label>
		<input type="text" name="i_price" id="form_i_price" class="reg_form" value="${ productVO.i_price }">원
		</div>
		<p></p>
		<div>
		<label for="startprice">시작가 : </label>
		<input type="text" name="startprice" id="form_startprice" class="reg_form" value="${ productVO.startprice }">원
		</div>
		<p></p> --%>
		
		<!-- <div id="opt">
		<p>판매방식 선택</p>
		<label for="buytype">즉시구입 </label><input type="checkbox" name="buytype" id="imm" value="i">
        <label for="buytype">경매 </label><input type="checkbox" name="buytype" id="auc" value="a" checked="checked">
		</div>
		<p></p> -->
		
		<div id="opt">
		<select name="buytype" id="form_buytype">
		<option value="n" <c:out value="${productVO.buytype == null ? 'selected' : ''}"/>></option>
		<option value="i" <c:out value="${productVO.buytype eq 'i' ? 'selected' : ''}"/>>즉시구매</option>
		<option value="a" <c:out value="${productVO.buytype eq 'a' ? 'selected' : ''}"/>>경매</option>
		<option value="ai" <c:out value="${productVO.buytype eq 'ai' ? 'selected' : ''}"/>>경매,즉시구매</option>
		</select>
		</div>
		
		<p></p>
		<div id="opt_val"></div>
		
		
		<div>
		<label for="quantity">수량 : </label>
		<input type="text" name="quantity" id="form_quantity" class="reg_form" value="${ productVO.quantity }"> EA
		</div>
		<p></p>
		
		<div>
		<label for="desc_product" id="desc_label">상품 설명</label><br/>
		<textarea class="form_desc" name="desc_product" id="form_desc_product" rows="10" cols="100">${ productVO.desc_product }</textarea>
		</div>
		
<p></p>		

	  </div>  <!-- inner form -->
	  
	</div>  

	</form>
		
</div>


<div id="fileWrap">
<div id="fileList_div">
<div><p style="color:red;">이미지는 다중선택이 가능하며 용량은 10MB 이하로 제한됩니다.</p></div>

<div>
<ul id="fileList_ul">
</ul>
</div>  




<div id="file_div" style="text-align: center;">
  <form action="/main/upload" method="post" name="form1" id="form1" enctype="multipart/form-data">
    <div style="margin:0; padding:0; width:100%; height:30px;"></div>
    <input type="file" name="mFile" id="mFile" multiple accept=".jpg, .gif, .png"/>
    <input type="button" id="send_btn" value="등록하기"/>
  </form>
  <br><br>
</div>  <!-- file_div -->

<div id="img"></div>



</div>  <!-- fileList_div -->

</div>  <!-- fileWrap -->
		
		
</div>
		
		
	  
	  



	  
	  

		





	
	
	
	
<script>

$("#form_buytype").change(function() {
	$("#opt_val").html("");
	
	if($("#form_buytype option:selected").val() == 'i') {
		$("#opt_val").append("즉시구매 가격 : <input type='text' name='i_price' id='form_i_price'"
				+"class='reg_form' value='${productVO.i_price}'>원");
		$("#opt_val").append("<p></p>");
	}
	
	if($("#form_buytype option:selected").val() == 'a') {
		$("#opt_val").append("경매 시작 가격 : <input type='text' name='startprice' id='form_startprice'"
				+"class='reg_form' value='${productVO.startprice}'>원");
		$("#opt_val").append("<p></p>");
	}
	
	if($("#form_buytype option:selected").val() == 'ai') {
		$("#opt_val").append("즉시구매 가격 : <input type='text' name='i_price' id='form_i_price' class='reg_form' value='${productVO.i_price}'>원");
		$("#opt_val").append("<p></p>");
		
		$("#opt_val").append("경매 시작 가격 : <input type='text' name='startprice' id='form_startprice' class='reg_form' value='${productVO.startprice}'>원");
		$("#opt_val").append("<p></p>");
	}
});


function submit_chk() {
	var title_chk=/^[\w|\W]{2,50}$/g;
	var pname_chk=/^[\w|\W]{1,50}$/g;
	var i_price_chk=/\d{1,9}$/;
	var startprice_chk=/\d{1,9}$/;
	var quantity_chk=/\d{1,9}$/;
	var buytype_chk=/^[a|i|ai]/;
	
	var title=$("#form_title");
	var pname=$("#form_pname");
	var i_price=$("#form_i_price");
	var startprice=$("#form_startprice");
	var quantity=$("#form_quantity");
	var buytype=$("#form_buytype option:selected");
	
	var title_result=title_chk.test(title.val());
	var pname_result=pname_chk.test(pname.val());
	var i_price_result=i_price_chk.test(i_price.val());
	var startprice_result=startprice_chk.test(startprice.val());
	var quantity_result=quantity_chk.test(quantity.val());
	var buytype_result=buytype_chk.test(buytype.val());
	
	if(!title_result) {
		alert("제목을 입력하세요.");
		$("#form_title").focus();
		return false;
	}else if(!pname_result) {
		alert("상품명을 입력하세요.");
		$("#form_pname").focus();
		return false;
	}else if($("input:checkbox[id='imm']").prop("checked") && !i_price_result){
		alert("즉구가를 입력하세요.");
		$("#form_i_price").focus();
		return false;
	}else if($("input:checkbox[id='auc']").prop("checked") && !startprice_result) {
		alert("시작가를 입력하세요.");
		$("#form_startprice").focus();
		return false;
	}else if(!buytype_result) {
		alert("판매방식을 선택하세요.");
		$("#form_buytype").focus();
		return false;
	}else if($("#form_buytype option:selected").val() == 'i' && !i_price_result) {
		alert("즉구가를 입력하세요.");
		$("#form_buytype").focus();
		return false;
	}else if($("#form_buytype option:selected").val() == 'a' && !startprice_result) {
		alert("시작가를 입력하세요.");
		$("#form_buytype").focus();
		return false;
	}else if($("#form_buytype option:selected").val() == 'ai' && !i_price_result) {
		alert("즉구가를 입력하세요.");
		$("#form_buytype").focus();
		return false;
	}else if($("#form_buytype option:selected").val() == 'ai' && !startprice_result) {
		alert("시작가를 입력하세요.");
		$("#form_buytype").focus();
		return false;	
	}else if($("#form_buytype option:selected").val() == 'ai' && !startprice_result && !i_price_result) {
		alert("즉구가 와 시작가를 입력하세요.");
		$("#form_buytype").focus();
		return false;
	}else if(!quantity_result) {
		alert("수량을 입력하세요.");
		$("#form_quantity").focus();
		return false;
	}else{
		return true;
	}
}



var size=0;
	
$("#mFile").on("change", function() {   

	var form=$("#form1")[0];
	var formData=new FormData(form);  
	
	for(var i=0; i<$("#mFile")[0].files.length; i++){
	var fname=$("#mFile")[0].files[i].name;

        formData.append('mFile', $('#mFile')[0].files[i]);   /* 폼에 파일 추가 */
        
        size+=$("#mFile")[0].files[i].size;    /* 파일 사이즈 제한을 위해 카운팅 */
    	
        $("#fileList_ul").append("<li class='fileLi'>"+fname+"</li>");   /* 선택한 파일 목록 만들기 */ 
        
    	/* $(".inner-form").append(      
    			"<input type='hidden' name='imgs' value='"+$('#mFile')[0].files[i].name+"'>"); */
		
    }

	
	$("#send_btn").click(function() {
		
		
		if(size >= 1024*1024*1024) {
			alert("10MB 이상은 등록할 수 없습니다.");
			$("#fileList_ul").empty();
			size=0;
			return;
		}else if(size <= 0){
			alert("등록할 파일이 없습니다.");
			size=0;
			return;
		}else if(submit_chk()){
     		
     		
     		
     		
     		/* 파일 업로드 */
     		$.ajax({
     			url:'/main/upload',     
     			data:formData,
     			dataType:'text',
     			processData:false,
     			contentType:false,
     			type:'POST',
     			success: function(result) {
     			
     			var rep=result.replace(/\"/g,'');	
     			rep=rep.replace(/\[/g,'');
     			rep=rep.replace(/\]/g,'');
     				
     				/* $("#img").append(
     						"<div>"+"<img src='/main/listImgs?fileName="+data+"'/>"+data+"</div>"); */
				
     		var formObj=$("#regForm")[0];
     		$(".inner-form").append("<input type='hidden' name='imgs' value='"+rep+"'/>");
     		formObj.submit();        /* 등록폼 전송 */
     				
     				alert("등록되었습니다.");
     	     		/* $("#fileList_ul").empty(); */ 
     	     		size=0; 


     			}
     		
     		});
     		
     		
     		
     		
     		
		}
			

	
	
	});   

});  




/* $("#send_btn").on('click', function () {
    $("#fileList_ul").empty();
    var fp = $("#form1");
    var lg = fp[0].files.length; // get length
    var items = fp[0].files;
    var fragment = "";
    
    if (lg > 0) {
        for (var i = 0; i < lg; i++) {
            var fileName = items[i].name; // get file name
            var fileSize = items[i].size; // get file size 
            var fileType = items[i].type; // get file type

            // append li to UL tag to display File info
            fragment += "<li>" + fileName + " (<b>" + fileSize + "</b> bytes) - Type :" + fileType + "</li>";
        }

        $("#fileList_ul").append(fragment);
    }
}); */
	  
	
	  
	
</script>

</body>
</html>
















