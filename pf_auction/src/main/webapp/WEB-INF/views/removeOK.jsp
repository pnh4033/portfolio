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
text-align: center;
}
</style>

</head>

<body>

	<div class="container">
	  
	  <br/><br/><br/>
	  <div class="row" style="color: #54B5C9">
	  <div class="alert alert-success">
	  <strong>정상적으로 취소가 완료 되었습니다.</strong>
	  </div>
	  </div>
	  <br/><br/><br/>
	  
	  <div class="row">
	    <button class="btn btn-primary" id="btnOK">확인</button>
	  </div>
	
	</div>


<script>

$("#btnOK").click(function() {
	
	window.close();
	
});

</script>

</body>
</html>








