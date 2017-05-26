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

	html, body {
	height: 100%;
	width: 100%;
	}

	.form-title {
	margin: 30px;
	padding: 50px;
	font-size: 13px;
	z-index: 10010;
	}
	
	.inner-form {
	padding: 20px;
	border: solid 4px;
	border-color: #2162A8;
	border-radius: 8px; 
	text-align: left;
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
	display: inline-block;
	text-align: center;
	width: 470px;
	margin: 5px auto;
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
	border: solid 2px;
	border-color: #4FA1FF; 
	text-align: left;
	padding: 10px;
	overflow: auto;
	}
	
	#fileList_div {
	margin: 0 auto;
	width: 480px;
	height: 430px;
	border: solid 2px;
	border-color: #4FA1FF; 
	text-align: left;
	padding: 10px;
	}
	
	.fileLi {
	
	}
	
</style>	
</head>

<body>


<div class="regist_product">

	
	<!-- 페이징 처리와 검색을 위한 데이터 -->
	<form role="form" name="regForm" id="regForm" action="register" method="post">
	
	<input type="hidden" name="page" value="${ criteria.page }">
	<input type="hidden" name="searchType" value="${ criteria.searchType }">
	<input type="hidden" name="keyWord" value="${ criteria.keyWord }">
	
	<div class="form-title">
	  <div class="inner-form">
	  
		<div>
		<label>제목 : <input type="text" name="title" class="reg_form" size="100" value="${ productVO.title }"></label>
		</div><br>
		
		<div>
		<label for="pname">상품명 : </label>
		<input type="text" name="pname" class="reg_form" value="${ productVO.pname }">
		</div><br>
		
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

	  </div>  <!-- inner form -->
	</div>  <!-- form title -->

	</form>

		


<div id="fileList_div">
<div><p>이미지는 다중선택이 가능하며 용량은 10MB 이하로 제한됩니다.</p></div>
<div>
<ul id="fileList_ul">
</ul>
</div>

<div id="fileWrap">
  <form action="/main/upload" method="post" name="form1" id="form1" enctype="multipart/form-data">
    <input type="file" name="mFile" id="mFile" multiple accept=".jpg, .gif, .png"/>
    <input type="button" id="send_btn" value="등록하기"/>
  </form>
</div>  <!-- filewrap -->

</div>
<div id="img"></div>



</div>  <!-- fileList_div -->


	
	
	
	
<script>
	
$("#mFile").on("change", function() {   

	var form=$("#form1")[0];
	var formData=new FormData(form);  
	var size=0;
	
	for(var i=0; i<$("#mFile")[0].files.length; i++){
	var fname=$("#mFile")[0].files[i].name;

        formData.append('mFile', $('#mFile')[0].files[i]);   /* 폼에 파일 추가 */
        
        size+=$("#mFile")[0].files[i].size;    /* 파일 사이즈 제한을 위해 카운팅 */
    	
        $("#fileList_ul").append("<li class='fileLi'>"+fname+"</li>");   /* 선택한 파일 목록 만들기 */ 
        
    	$(".inner-form").append(      /* 등록 폼에 파일명을 붙여서 전송 */
    			"<input type='hidden' name='imgs' value='"+$('#mFile')[0].files[i].name+"'>");
		
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
		}else{
     		
     		
     		
     		
     		/* 파일 업로드 */
     		$.ajax({
     			url:'/main/upload',     
     			data:formData,
     			dataType:'text',
     			processData:false,
     			contentType:false,
     			type:'POST',
     			success: function(result) {
     				
     					
     				/* $("#img").append(
     						"<div>"+"<img src='/main/listImgs?fileName="+data+"'/>"+data+"</div>"); */
				
     		var formObj=$("#regForm")[0];
     		formObj.submit();        /* 등록폼 전송 */
     				
     				alert("등록되었습니다. 창을 닫습니다.");
     	     		/* $("#fileList_ul").empty(); */
     	     		size=0; 
     	     		self.close();

     			}
     		
     		});
     		
     		
     		
     		
     		
		}
			
		
	/* $.ajax({
		url:'/main/upload',
		type:'post',
		dataType:'text',
		processData:false,
		contentType:false,
		success: function(data) {
			var dt=JSON.parse(data);
			$(dt).each(function() {
				alert($(this));
			});
		}
		
	}); */
	
	/* $.ajax({
		url:'/main/listImgs',
		type:'POST',
		dataType:'text',
		processData:false,
		contentType:false,
		success: function(data) {
			
			var str="";
			$.each(function(data) {
				
			$("img").append("<div>"+"<img src='/main/listImgs?fileName="+data+"'/>"+data+"</div>")
			});
		}
		
	}); */ 
	
	
	
	
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
















