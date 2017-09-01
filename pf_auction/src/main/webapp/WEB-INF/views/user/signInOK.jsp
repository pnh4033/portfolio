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
color: #006052;
text-align: center;
}

#goHome {
text-align: center;
}

#home_btn {
line-height: 40px;
width: 60px;
}

</style>

</head>
<body>

  <div style="height: 200px;"></div>
  
  <div id="title">가입이 정상적으로 완료 되었습니다.</div>
  
  <div style="height: 100px;"></div>
  
  <div id="goHome"><button type="button" id="home_btn">확인</button></div>


<script>

	$("#home_btn").click(function(event) {
		
		event.preventDefault();
		
		self.location="/main/index";
		
	});

</script>

</body>
</html>












