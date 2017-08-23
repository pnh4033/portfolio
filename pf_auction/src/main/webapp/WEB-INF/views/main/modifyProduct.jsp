<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

iframe {
width: 0px;
height: 0px;
border: 0px;
}

</style>

</head>

<body>



<div class="container">
  
  <br/><br/>
  <div class="row"><h1>등록 정보 수정</h1></div>
  <br/><br/>
  
  <div class="row"><p class="alert alert-danger" style="font-size: 15px;">이미지는 모두 삭제 후 재등록 됩니다.</p></div>
  <br/>
  

  <div class="row">
  <form action="/main/modifyAttach" method="post" name="form1"
   id="form1" enctype="multipart/form-data">
    <h5><input type="file" class="alert-info" name="mFile" id="mFile" multiple accept=".jpg, .gif, .png"/></h5>
    <!-- <input type="button" id="reg_send_btn" value="등록하기"/> -->
    <input type="hidden" name="pno" value="${productVO.pno}"/>
  </form>
  </div>
  
  <form action="/main/addAttach" method="post" name="form_attach" id="form_attach" target="ifr">
  <input type='hidden' name='pno' id="input_pno" value="${productVO.pno}"/>
  <input type='hidden' name='imgs' id="input_imgs" value="${productVO.imgs}"/>
  </form>
  <iframe name="ifr"></iframe>
  
  <br/>
  
  <table class="table table-hover" id="table_file_list">
    <thread><tr>File Name</tr></thread>
  </table>
  
  <div class="row">
    <button class="btn btn-primary" id="btnImgMod">이미지 수정</button>
  </div>



</div> <!-- class-container -->







<script>


/* 선택된 파일들의 사이즈 초기화 */
var size=0;

var form=$("#form1")[0];
var formData=new FormData(form);  
var mFile=$("#mFile")[0];	


function a() {};


$("#mFile").on("change", function(e) {
	
	e.preventDefault();
	
	//form input file 초기화
	formData.delete('mFile');
	
	
	$(".fileLi").remove();
	size=0;
	
	for(var i=0; i<mFile.files.length; i++){
	var fname=mFile.files[i].name;
		
		if(mFile.files[i] != null) {
			
        formData.append('mFile', mFile.files[i]);   /* 폼에 파일 추가 */

		}
        
        size+=mFile.files[i].size;    /* 파일 사이즈 제한을 위해 카운팅 */
        
        
        $("#table_file_list").append("<tr><td id='table_thmb'></td><td>"+fname+"</td></tr>");   /* 선택한 파일 목록 만들기 */ 
    	

	}
	
});  

	
	$("#btnImgMod").click(function(event) {
		
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
			
		}else{
     		
     		var pno=${productVO.pno};
     		
     		/* 파일 업로드 */
     		$.ajax({
     			url:'/main/modifyAttach',     
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
     				
				
     			
     			var formObj=$("#form_attach")[0];
     			$("#input_pno").attr("value", pno);
     			$("#input_imgs").attr("value", replacedResult);
     			formObj.submit();
     			
     				alert("이미지가 수정 되었습니다.");
     		
     	     		size=0; 
 
     	     		
     	     		
     			}
     		
     		});
     		
		}
			
     		return false;

	});   

	
	

/* $("#btnImgMod").click(function() {
	
	var pno=${productVO.pno};
	
	$.ajax({
		
		url:'/main/modifyAttach',
		type:'POST',
		dataType: "text",
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data:JSON.stringify({
			pno:pno
		}), 
		success:
			function(result) {
			
			alert("modify success : "+pno);
			
		}
		
	});
	
});	 */
	

</script>



</body>
</html>
















