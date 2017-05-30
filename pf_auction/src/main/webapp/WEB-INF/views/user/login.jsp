<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login</title>
</head>
<body>

	<form action="/user/loginPost" method="post">
	
	  <div>
	    <input type="text" name="userID" id="uid" placeholder="USER ID"></input>
	  </div>
	  
	  <div>
	    <input type="password" name="userPassword"  id="upw" placeholder="PASSWORD"></input>
	  </div>
	  
	  
	  <div>
	    <label>
    	    <input type="checkbox" name="useCookie"> ID 기억하기 </input>
	    </label>
	  </div>
	  
	  
	  <div>
	    <div>
	      CANCEL : <input type="image" class="loginImg" src="/resources/image/cancel.png"/>
	    </div>
	    <div>
	      OK : <input type="image" class="loginImg" src="/resources/image/ok.png"></input>
	    </div>
	  </div>
	
	</form>

</body>
</html>