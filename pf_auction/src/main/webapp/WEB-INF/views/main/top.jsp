<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<style>
	
	body {
	margin:1px;
	}
	
	#wrap {
	overflow: hidden;
	}
	
    #top_left {
    width: 15%;
	height: 150px;
	float: left;
	}
	#top_center{
	width: 70%;
	height: 150px;
	background-color: #E1E9ED;
	float: left;
	}
	#top_right {
	width: 15%;
	height: 150px;
	float: left;
	} 
	
	#homeImg {
	text-align: center;
	vertical-align: middle;
	}
	
	#homeImg td {
	width: 100%;
	height: 148px;
	text-align: center;
	vertical-align: bottom;
	}
	
</style>

<title>Insert title here</title>
</head>
<body>
  
  <div id="wrap">	
	<div id="top_left">
	<table id="homeImg"><tr>
	<td><a href="/main/listProduct" target="_parent">
	<img src="/resources/image/home-1194442_1280.jpg" style="width: auto; height: 100%;"></a></td>
	</tr>
	</table>
	</div>
	<div id="top_center"></div>
	<div id="top_right">
    </div>
    
  </div>


<script>
  $(document).ready( function() {
	$("#reg_btn").on("click", function() {
		window.open("register");
	});
  });
</script>
</body>
</html>