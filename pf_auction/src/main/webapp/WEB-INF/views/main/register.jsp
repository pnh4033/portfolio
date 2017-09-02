<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>

<title>상품 등록</title>

<style>

	html, body {
	height: 100%;
	width: 100%;
	}
	
	#reg_form_wrap {
	overflow:hidden;
	text-align: center;
	}
	
	.regist_product {
	float:left;
	}
	
	.reg-form-title {
	overflow:hidden;
	margin: 0 auto;
	padding: 30px;
	font-size: 13px;
	z-index: 10010;
	text-align: center;
	}
	
	.reg-inner-form {
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

<div id="reg_form_wrap">
<div class="regist_product">

	
	<!-- 페이징 처리와 검색을 위한 데이터 -->
	<form role="form" name="regForm" id="regForm" action="/main/register" method="post">
	
	<input type="hidden" name="page" value="${ criteria.page }">
	<input type="hidden" name="searchType" value="${ criteria.searchType }">
	<input type="hidden" name="keyWord" value="${ criteria.keyWord }">
	
	
	
	<div class="reg-form-title">
	  <div class="reg-inner-form">
	  
		<div>
		<label>제목 : <input type="text" name="title" id="form_title" class="reg_form" size="100" value="${ productVO.title }"></label>
		</div><br>
		
		<div>
		<label for="pname">상품명 : </label>
		<input type="text" name="pname" id="form_pname" class="reg_form" value="${ productVO.pname }">
		</div><br>
		

		
		<div id="opt">
		판매 방식 : 
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
		
		
		<!-- 판매자 저장 -->
		<input type="hidden" name="seller" value="${login.userID}">
		<input type="hidden" name="userID" value="${login.userID}">
		
<p></p>		

	  </div>  <!-- inner form -->
	  
	</div>  

	</form>
		
</div>


<div id="fileWrap">
<div id="fileList_div">
<div><p style="color:red;">이미지는 다중선택이 가능하며 용량은 10MB 이하로 제한됩니다.</p></div>

<div>

<div id="div_size"></div>

<ul id="fileList_ul">
</ul>
</div>  




<div id="file_div" style="text-align: center;">

  <form action="/main/upload" method="post" name="form1" id="form1" enctype="multipart/form-data">
    <div style="margin:0; padding:0; width:100%; height:30px;"></div>
    <input type="file" name="mFile" id="mFile" multiple accept=".jpg, .gif, .png"/>
    <input type="button" id="reg_send_btn" value="등록하기"/>
  </form>
  <br><br>
  
</div>  <!-- file_div -->

<div id="img"></div>



</div>  <!-- fileList_div -->

</div>  <!-- fileWrap -->
		
		
</div>
		
		
	  
	  



	  
	  

		





	
	
	
	
<script>



/* 선택한 판매 방식에 대한 입력 폼만 생성 */
$("#form_buytype").change(function() {
	
	$("#opt_val").html("");
	
	if($("#form_buytype option:selected").val() == 'i') {
		
		$("#opt_val").append("즉시구매 가격 : <input type='text' name='i_price' id='form_i_price'"
				+"class='reg_form' value='${productVO.i_price}'>원");
		$("#opt_val").append("<p></p>");
		
	}
	
	
	if($("#form_buytype option:selected").val() == 'a') {
		
		$("#opt_val").append("경매 시작 가격 : <input type='text' name='startprice' id='form_startprice'"
				+"class='reg_form' value='${productVO.startprice}'>원  (최소 1000원 이상)");
		$("#opt_val").append("<p></p>");
		
	}
	
	
	if($("#form_buytype option:selected").val() == 'ai') {
		
		$("#opt_val").append("즉시구매 가격 : <input type='text' name='i_price' id='form_i_price' class='reg_form' value='${productVO.i_price}'>원");
		$("#opt_val").append("<p></p>");
		
		$("#opt_val").append("경매 시작 가격 : <input type='text' name='startprice' id='form_startprice' class='reg_form' value='${productVO.startprice}'>원");
		$("#opt_val").append("<p></p>");
		
	}
	
});





//폼 입력 필드 유효성 검사
function submit_chk() {
	
	var title_chk=/^[\w|\W]{2,50}$/g;
	var pname_chk=/^[\w|\W]{1,50}$/g;
	var i_price_chk=/\d{1,9}$/;
	var startprice_chk=/\d{1,9}$/;
	var quantity_chk=/\d{1,9}$/;
	var buytype_chk=/^[a|i|ai]/;    // a:경매  | i:즉구  | ai:경매, 즉구
	
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
		
		alert("제목을 입력하세요. (2자 이상 50자 이하)");
		$("#form_title").focus();
		return false;
		
	}else if(!pname_result) {
		
		alert("상품명을 입력하세요. (50자 이하)");
		$("#form_pname").focus();
		return false;
		
	}else if($("input:checkbox[id='imm']").prop("checked") && !i_price_result){
		
		alert("즉구가를 입력하세요. (1~9자리 숫자)");
		$("#form_i_price").focus();
		return false;
		
	}else if($("input:checkbox[id='auc']").prop("checked") && !startprice_result) {
		
		alert("시작가를 입력하세요. (1~9자리 숫자)");
		$("#form_startprice").focus();
		return false;
		
	}else if(!buytype_result) {
		
		alert("판매방식을 선택하세요.");
		$("#form_buytype").focus();
		return false;
		
	}else if($("#form_buytype option:selected").val() == 'i' && !i_price_result) {      //선택된 옵션에 대해서 검사
		
		alert("즉구가를 입력하세요. (1~9자리 숫자)");
		$("#form_buytype").focus();
		return false;
		
	}else if($("#form_buytype option:selected").val() == 'a' && !startprice_result) {
		
		alert("시작가를 입력하세요. (1~9자리 숫자)");
		$("#form_buytype").focus();
		return false;
		
	}else if($("#form_buytype option:selected").val() == 'ai' && !i_price_result) {
		
		alert("즉구가를 입력하세요. (1~9자리 숫자)");
		$("#form_buytype").focus();
		return false;
		
	}else if($("#form_buytype option:selected").val() == 'ai' && !startprice_result) {
		
		alert("시작가를 입력하세요. (1~9자리 숫자)");
		$("#form_buytype").focus();
		return false;
		
	}else if($("#form_buytype option:selected").val() == 'ai' && !startprice_result && !i_price_result) {
		
		alert("즉구가 와 시작가를 입력하세요. (1~9자리 숫자)");
		$("#form_buytype").focus();
		return false;
		
	}else if(!quantity_result) {
		
		alert("수량을 입력하세요. (1~9자리 숫자)");
		$("#form_quantity").focus();
		return false;
		
	}else if($("#form_startprice").val() < 1000){
	
		alert("시작가는 1000원 이상 이어야 합니다.");
		$("#form_startprice").focus();
		return false;
	
	}else{
		
		return true;
		
	}
	
}



//개행 처리
$("#form_desc_product").focusout(function() {
	
	var str="";
	str=$("#form_desc_product").val();
	str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$("#form_desc_product").val(str);
	
});





/* 선택된 파일들의 사이즈 초기화 */
var size=0;
	
var form=$("#form1")[0];
var formData=new FormData(form);  
	
	
	
$("#mFile").on("change", function() {   
	
	//form input file 초기화
	formData.delete('mFile');
	
	
	$(".fileLi").remove();
	size=0;
	
	for(var i=0; i<$("#mFile")[0].files.length; i++){
	var fname=$("#mFile")[0].files[i].name;
		
		if($('#mFile')[0].files[i] != null) {
			
        formData.append('mFile', $('#mFile')[0].files[i]);   /* 폼에 파일 추가 */

		}
        
        size+=$("#mFile")[0].files[i].size;    /* 파일 사이즈 제한을 위해 카운팅 */
    	
        $("#fileList_ul").append("<li class='fileLi'>"+fname+"</li>");   /* 선택한 파일 목록 만들기 */ 
        
        $("#div_size").text("file size : "+size);
        
    	/* $(".inner-form").append(      
    			"<input type='hidden' name='imgs' value='"+$('#mFile')[0].files[i].name+"'>"); */
		
    }
});  

	
	$("#reg_send_btn").click(function(event) {
		
		event.preventDefault();
		
		if(size >= 1024*1024*10) {
			
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
     			
     			/* 따옴표와 중괄호 제거 */
     			var replacedResult=result.replace(/\"/g,'');	
     			replacedResult=replacedResult.replace(/\[/g,'');
     			replacedResult=replacedResult.replace(/\]/g,'');
     				
				
     		var formObj=$("#regForm")[0];
     		$(".reg-inner-form").append("<input type='hidden' name='imgs' value='"+replacedResult+"'/>");
     		formObj.submit();       
     				
     				alert("등록되었습니다.");
     		
     	     		size=0; 


     			}
     		
     		});
     		
     		
		}
			

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

















