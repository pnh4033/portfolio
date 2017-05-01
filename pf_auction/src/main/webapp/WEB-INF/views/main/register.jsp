<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>

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
	width: 350px;
	height: 300px;
	border: solid 2px;
	border-color: #D3DEEA; 
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px;
	border-top-right-radius: 4px;
	border-top-left-radius: 4px;
	text-align: left;
	padding: 10px;
	overflow: auto;
	}
	
	.fileLi {
	
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
                target="ifrm">
            <input type="button" id="send_btn" value="등록하기"/>
            <input type="file" name="mFile" id="mFile" multiple accept=".jpg, .gif, .png"/>
          </form>
		</div>  <!-- filewrap -->

<iframe name="ifrm"></iframe>

<ul id="fileList_ul">
</ul>

</div>


	
	
	
	
<script>
	
$("#mFile").on("change", function() {

	var form=$("#form1")[0];
	var formData=new FormData(form);  
	
	
	for(var i=0; i<$("#mFile")[0].files.length; i++){
	var fname=$("#mFile")[0].files[i].name;

        formData.append('mFile', $('#mFile')[0].files[i]);
    	$("#fileList_ul").append("<li class='fileLi'>"+fname+"</li>");
      
		
    }

	
	$("#send_btn").click(function() {
		$("#form1").submit();
		
		alert("등록 되었습니다.");
		
	/* $("#form1").ajaxForm({
		url:'/main/upload',
		type:'POST',
		data:formData,
		dataType:'text',
		processData: false,
		contentType: false,
		success: function(data) {
			var dt=JSON.parse(data);
			alert(dt);
		
		}
	});  
	
	$(this).submit(); */ 
	
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
















