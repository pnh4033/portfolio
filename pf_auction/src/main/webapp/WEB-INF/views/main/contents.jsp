<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<style>
	div {
	margin:0px;
	}
    ul {
    list-style: none;
    }
	.wrap {
	margin:0px;
	height: auto;
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
	
	/* #empty {
	height:60px;
	background-color: white;
	} */
	
	#top_menu {
	width:70%;
	height: 100px;
	/* background-color: #E8963A */
	}
	
	#body {
	margin: 0 auto;
	width: 100%;
	height: auto;
	}
	
	#event {
	width: 90%;
	height: 250px;
	background-color: #F4D197;
	}
	
	#left_bar {float: left; width:15%; height: 1500px; background-color:#00405E;}
	#center {float: left; width: 70%; height: 1500px;}
	#right_bar {float: left; width:15%; height: 1500px; background-color:white;}
	
</style>

<title>Insert title here</title>
</head>
<body>
  <div class="wrap" align="center"><!-- wrap -->
  
  
  
  <div id="top" align="center"><%@ include file="top.jsp" %>
  
<!--   <div id="top_menu">
    <div id="regist" align="right"><button type="button" class="btn" id="reg_btn">상품등록</button></div>
  </div> -->
  
  </div>
  
  
  
  <div class="contents" align="center"><!-- contents -->
  
  <div id="left_bar"></div>
  <div id="center">  
    <!-- <div id="empty"></div> -->
    <p></p>
	<div id="body">
	
		<div id="event"></div><p></p>
		
		<div id="body_con1"><%@ include file="listProduct.jsp" %></div>
		
	</div>
  </div>
  <div id="right_bar"></div>
  
  </div>                <!-- contents -->
  
  
  
  </div>            <!-- wrap -->



</body>
</html>












