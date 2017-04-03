<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
	div {
	margin:0px;
	}
    ul {
    list-style: none;
    }
	.wrap {
	margin:0px;
	}

	#bottom {
	background-color:#28CC00;
	width: 70%; height: 100px;
	}
	.contents {
	background-color: white;
	margin:0px;
	overflow: hidden;
	}
	
	#empty {height:60px;}
	
	#top_menu {
	width:70%;
	height: 100px;
	background-color: #E8963A
	}
	
	#body {
	width: 70%;
	height: 800px;
	border: solid red 1px;
	}
	
	#left_bar {float: left; width:15%; height: 800px; background-color:#00405E;}
	#center {float: left; width: 70%; height: 800px;}
	#right_bar {float: left; width:15%; height: 800px; background-color:white;}
	
</style>

<title>Insert title here</title>
</head>
<body>
  <div class="wrap" align="center"><!-- wrap -->
  
  
  
  <div id="top" align="center">
  
  <div id="top_menu">
    <div id="regist" align="right"><button type="button" class="btn" id="reg_btn">상품등록</button></div>
  </div>
  
  </div>
  
  
  
  <div class="contents" align="center"><!-- contents -->
  
  <div id="left_bar"></div>
  <div id="center">  
    <div id="empty"></div>
	<div id="body">
		<div id="body_con1"><%@ include file="listProduct.jsp" %></div>
		<div id="body_con2"><%@ include file="new.jsp" %></div>
	</div>
  </div>
  <div id="right_bar"></div>
  
  </div>                <!-- contents -->
  
  
  
  </div>            <!-- wrap -->

<script>
  $(document).ready( function() {
	$("#reg_btn").on("click", function() {
		$("#body").load("register")
	});
  });
</script>

</body>
</html>












