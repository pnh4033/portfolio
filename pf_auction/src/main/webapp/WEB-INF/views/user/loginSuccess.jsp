<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script type="text/javascript" src="/resources/plugins/jquery/jquery-3.2.0.min.js"></script>

<style>

body {
text-align: center;
}

#loginName {
color: #00BF42;
font-size: 30px;
}


a:LINK {color: #0051A8; text-decoration: none;}
a:VISITED {color: #0051A8; text-decoration: none;}
a:HOVER {color: #CC2647; text-decoration: none;}



#close_a {
font-size: 24px;
}

table {
display:inline-block;
margin: 0 auto;
text-align: center;
}

#close_td {
border: solid #CED6DB 0.5px;
border-radius:3px;
}

td {
height: 35px;
}

</style>

<title>Insert title here</title>
</head>
<body>
<div style="height: 50px;"></div>



<div style="margin: 0 auto;">
	
	<table>
	<tr>
	  <td>
    	<div id="loginName">${login.userName} 님 접속 되었습니다.</div>
	  </td>
	</tr>
	<tr><td></td></tr>
	<tr>
      <td id="close_td">
    	<a href="#" id="close_a" >확인</a>
      </td>
	</tr>
	</table>
	
	
</div>



<script>

$(document).ready(function() {
	if(opener) {
		
	opener.location="/main/index";
	
	}
	
	$("#close_a").focus();
	
});


$("#close_a").click(function(event) {
	event.preventDefault();
	if(opener) {
    	window.close();
	}else{
		self.location="/main/index";
	}
});





Func_close=function() {
	
	window.close();
	
}



$("#close_a").keydown(function (key) {
	
	if(key.keyCode == 13) {
		
		Func_close();
		
	}
	
}); 







</script>

</body>
</html>













