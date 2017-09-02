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

#img_mod_wrap {
border: solid #54B5C9 0.5px;
padding: 30px;
width: auto;
height: auto;
}

#price_mod_wrap {
border: solid #54B5C9 0.5px;
padding: 30px;
width: auto;
height: auto;
}

</style>

</head>

<body>



<div class="container">
  
  <br/><br/>
  <div class="row"><h1>등록 정보 수정</h1></div>
  <br/><br/>
  
  <div id="img_mod_wrap">
  <div class="row"><h4>이미지 수정</h4></div>
  <div class="row"><p class="alert alert-danger" style="font-size: 15px;">주의! 이미지는 모두 삭제 후 재등록 됩니다.</p></div>
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
  </div>  <!-- img_mod_wrap -->
  
  <br/><br/><br/>
  
  
  <div id="div-buytype" data-buytype="${productVO.buytype}"></div>
  
  
  <div id="price_mod_wrap">
  <div class="row"><h4>판매가 수정</h4></div>
  <br/><br/>
  
  <div class="row">
    <div class="form-group">
      <label for="mod_imm">즉시구매 가격 수정</label>
      <input type="text" class="form-control" id="mod_imm" 
      style="font-size:15px; bolder;" placeholder="${productVO.i_price}"/>
      &nbsp;&nbsp;
    </div>
      <button class="btn btn-primary" id="btnImmMod">가격 수정</button>
  </div>
  </div>  <!-- price_mod_wrap -->


</div> <!-- class-container -->



<div style="height: 300px;"></div>



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
	
	$(".tr_img").detach();
	
	size=0;
	
	for(var i=0; i<mFile.files.length; i++){
	var fname=mFile.files[i].name;
		
		if(mFile.files[i] != null) {
			
        formData.append('mFile', mFile.files[i]);   /* 폼에 파일 추가 */

		}
        
        size+=mFile.files[i].size;    /* 파일 사이즈 제한을 위해 카운팅 */
        
        
        $("#table_file_list").append("<tr class='tr_img'><td></td><td>"+fname+"</td></tr>");   /* 선택한 파일 목록 만들기 */ 
    	

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

	
	

function submit_chk() {
	
	var i_price_chk=/\d{1,9}$/;
	var i_price=$("#mod_imm");
	var buytype=$("#div-buytype").attr("data-buytype");
	
	var result=i_price_chk.test(i_price.val());
	
	if(buytype == 'a') {
		
		alert("죄송합니다. 경매는 즉시구매 가격 수정이 불가 합니다.");
		return;
		
	}
	
	if(!result) {
		
		alert("숫자만 입력 가능합니다.");
		$("#mod_imm").val("");
		$("#mod_imm").focus();
		
		return false;
		
	}else{
		
		return true;
		
	}
	
}


$("#btnImmMod").click(function() {
	
	if(!submit_chk()) {
		
		return;
		
	}else{
		
		var pno=${productVO.pno};
		var price=$("#mod_imm").val();
		
		$.ajax({
			
			url:'/main/modifyPrice',
			dataType:'text', 
			data:{pno:pno, price:price},
			type:'POST',
			success:function(result) {
				
				alert("즉시구매 가격이 수정 되었습니다.");
				
			}
			
		});
		
	} 
	
});

</script>



</body>
</html>
















