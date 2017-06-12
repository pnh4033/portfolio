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



#close {
margin:0 auto;
height: 30px;
width: 40px;
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
    	<div id="close"><a href="#" id="close_a" >CLOSE</a></div>
      </td>
	</tr>
	</table>
	
	
</div>


<script>

$(document).ready(function() {
	opener.location=("/main/listProduct");
});


$("#close_a").click(function(event) {
	event.preventDefault();
	window.close();
});
</script>

</body>
</html>













