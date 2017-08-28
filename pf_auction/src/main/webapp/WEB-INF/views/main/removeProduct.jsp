<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
html body {
height: 100%;
width: 100%;
}
</style>

</head>

<body>


<div class="container">

  <br/><br/><br/>
  
  <div class="row">
  <div class="col-xs-12" style="text-align: center;"><h3>판매를 취소 하시겠습니까?</h3></div>
  </div>
  
  <br/><br/>
  
  <div style="text-align: center;">
  <div class="col-xs-6"><button class="btn btn-success btn-md" id="ok">확인</button></div>
  <div class="col-xs-6"><button class="btn btn-danger btn-md" id="cancel">취소</button></div>
  </div>

</div>


<script>


var pno=${productVO.pno};

$("#ok").click(function(e) {
	
	e.preventDefault();
	
	$.ajax({
		
		url:'/main/removeProduct',
		type:'POST',
		dataType:'text',
		data:{pno:pno},
		success:function(result) {
			
			window.location.replace("/main/removeOK");
			opener.location.reload();
			
		}
		
	});
	
});


$("#cancel").click(function() {
	
	window.close();
	
});



</script>


</body>
</html>











