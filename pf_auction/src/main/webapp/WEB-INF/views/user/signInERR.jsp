<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<style>

html body {
width:100%;
height:100%;
}

#title {
width:100%;
font-size: 40px;
color: #D60000;
text-align: center;
}

#goHome {
text-align: center;
}

#home_btn {
line-height: 40px;
}

#sign_btn {
line-height: 40px;
}

</style>

</head>
<body>

  <div style="height: 200px;"></div>
  
  <div id="title">가입이 정상적으로 처리되지 않았습니다.</div>
  
  <div style="height: 100px;"></div>
  
  <div id="goHome">
  <button type="button" id="home_btn">홈으로 이동</button>&nbsp;&nbsp;&nbsp;
  <button type="button" id="sign_btn">가입 페이지로 이동</button>
  </div>


<script>


$(document).ready(function() {
	
	history.pushState(null, document.title, location.href); 
	window.addEventListener('popstate', function(event) { 
	
		history.pushState(null, document.title, location.href);
		
	});
	
});


	$("#home_btn").click(function(event) {
		
		event.preventDefault();
		
		self.location="/main/index";
		
	});
	
	
	
    $("#sign_btn").click(function(event) {
		
		event.preventDefault();
		
		self.location="/user/signIn";
		
	});

</script>

</body>
</html>












