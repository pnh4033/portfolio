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
	font-size: 30px;
	color: #00549E;
	background-color: #E1E9ED;
	float: left;
	}
	
	#top_login {
	background-color: #EFFAFF;
	display: table-cell;
	vertical-align: middle;
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
	
	.userA:LINK {color: white; text-decoration: none;}
	.userA:VISITED {color: white; text-decoration: none;}
	.userA:HOVER {color: #00D8BB; text-decoration: none;}
	
	#login_border {
	width: 200px;
	border-radius:3px;
	text-align: center;
	}
	
	#login_wrap {
	width:250px;
	height:130px;
	text-align:center;
	padding:10px;
	list-style: none;
	color: white;
	display: table-cell;
	}
	
	.login_list {
	border-radius:3px;
	vertical-align: middle;
	width: 115px;
	height: 26px;
	margin: 15px;
	font-size: 18px;
	color: white;
	background-color: #525F66;
	text-align: left;
	}
	
	.loginImg {
	height: 25px;
	width: auto;
	vertical-align: top;
	}
	
	#login_name {
	font-size: 18px;
	color: #0E6BCE;
	}
	
	#login_name_img {
	vertical-align: bottom;
	height: 25px;
	width: auto;
	}
	
	
	
</style>

<title>Insert title here</title>
</head>
<body>
  
  <div id="wrap">	
	<div id="top_left">
	<table id="homeImg"><tr>
	<td><a href="/index" target="_parent">
	<img src="/resources/image/home-1194442_1280.jpg" style="width: auto; height: 100%;"></a></td>
	</tr>
	</table>
	</div>
	<div id="top_center">https://github.com/pnh4033/portfolio.git</div>
	
	<div id="top_login">
	  <div id="login_border">
	  
	  <c:if test="${not empty login}">
	  <div id="login_wrap">
	    <div id="login_name">
	    <p></p>
	    <p></p>
	    <img src="/resources/image/unlock.png" id="login_name_img"> ${login.userName} 님 접속됨</div>
	    <p></p>
	    <div class="login_list"><a href="/user/logout" class="userA">
	    <img class="loginImg" src="/resources/image/undo.png"> 로그아웃 </a></div>
	  </div>
	  </c:if>
	  
	  <c:if test="${empty login}">
	  <div id="login_wrap">
	    <div class="login_list"><a href="/user/login" id="a_login" class="userA">
	    <img class="loginImg" src="/resources/image/ok.png"> 로그인 </a></div>
	    
	    <div class="login_list"><a href="/user/logout" id="a_logout" class="userA">
	    <img class="loginImg" src="/resources/image/undo.png"> 로그아웃 </a></div>
	    
	    <div class="login_list"><a href="/user/signIn" id="a_signIn" class="userA">
	    <img class="loginImg" src="/resources/image/add_row.png"> 회원 가입 </a></div>
	  </div>
	  </c:if>
	  
	  
	  
	  </div>  <!-- login_border -->
    </div>
    
  </div>


<script>
  $(document).ready( function() {
	
	$("#reg_btn").on("click", function() {
		window.open("register");
	});
	
	
	$("#a_login").click(function(event) {
		event.preventDefault();
		
		var dispWid=screen.availWidth;
		var dispHei=screen.availHeight;
		
		var winWid=450;
		var winHei=300;
		
		var xloc=(dispWid-winWid)/2;
		var yloc=(dispHei-winHei)/2;
		
		window.open("/user/login", '_blank', 'top='+yloc+', left='+xloc+', toolbar=no, location=no, status=no, menubar=no, resizable=no, directories=no, width='+winWid+', height='+winHei);
	});
	
	$("#a_logout").click(function(event) {
		event.preventDefault();
		
		self.location="/user/logout";
	});
	
  });
</script>
</body>
</html>


















