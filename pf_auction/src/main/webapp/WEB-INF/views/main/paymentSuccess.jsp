<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 완료</title>

<style>


</style>


</head>
<body>

	<div class="container">
	
	<div style="height: 200px;"></div>
	
		<div class="jumbotron">
			<p>
			<h1>결제가 정상적으로 완료 되었습니다.</h1><br/>
			<h3>이용해 주셔서 감사 합니다.</h3>
			</p>
		</div>
		<br/><br/><br/>
		
		<div class="row" style="text-align: center;">
			<button class="btn btn-lg btn-primary" id="homeBtn">메인 페이지</button>
		</div>
	
	
	</div>




<script>


$(document).ready(function() {
	
	history.pushState(null, document.title, location.href); 
	window.addEventListener('popstate', function(event) { 
	
		history.pushState(null, document.title, location.href);
		
	});
	
});




$("#homeBtn").click(function() {
	
	window.location.replace("/main/index");
	
});

</script>


</body>
</html>










