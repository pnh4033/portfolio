<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login</title>

<script type="text/javascript" src="/resources/plugins/jquery/jquery-3.2.0.min.js"></script>

<style>

html body {
width:100%;
height:100%;
font-size: 22px;
text-align: center;
overflow: hidden;
}

.login_input {
line-height: 25px;
width: 300px;
}

table {
margin: 0 auto;
width:60%;
text-align: center;
vertical-align: middle;
}

td {
height: 28px;
}

.login_td {
display: table-cell;
height: 27px;
font-size: 25px;
color: #0051A8;
vertical-align: middle;
}

.loginImg {
width: 27px;
height: auto;
vertical-align: middle;
}

#result {
text-align: center;
color: red;
font-size: 20px;
width: 100%;
}

a:LINK {color: #0051A8; text-decoration: none;}
a:VISITED {color: #0051A8; text-decoration: none;}
a:HOVER {color: #CC2647; text-decoration: none;}

</style>

</head>
<body>

<p><p><p><p><p>

	<form action="/user/loginPost" id="idpwForm" method="post">
	
	  <div>
	    <input type="text" name="userID" id="uid" class="login_input" placeholder="USER ID"/>
	  </div>
	  
	  <div>
	    <input type="password" name="userPassword"  id="upw" class="login_input" placeholder="PASSWORD"/>
	  </div>
	  
	  <p></p>
	  <div>
	    <label>
    	    <input type="checkbox" name="useCookie"> ID 기억하기 </input>
	    </label>
	  </div>
	 
      <p></p>	 
	  <div id="result"></div>
	  
	  <p><p>
	  <div>
	    <!-- <div>
	      CANCEL : <input type="image" class="loginImg" src="/resources/image/cancel.png"/>
	    </div>
	    <div>
	      OK : <input type="image" class="loginImg" src="/resources/image/ok.png"></input>
	    </div> -->
	    
	    
	    <table id="login_table">
	    <tr>
	    
	    <td class="login_td">
	    <!-- OK <input type="image" class="loginImg" id="ok" src="/resources/image/ok.png"></input> -->
	    <a href="/user/login" id="ok" data-login="${login}">OK <img  class="loginImg" src="/resources/image/ok.png"></a>
	    </td>
	    
	    <td class="login_td">
	    <!-- CANCEL <input type="image" class="loginImg" id="cancel" src="/resources/image/cancel.png"/> -->
	    <a href="/user/login" id="cancel">CANCEL <img  class="loginImg" src="/resources/image/cancel.png"></a>
	    </td>
	    
	    </tr>
	    </table>
	    
	  </div>
	  <p><p>
	  
	
	</form>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#uid").focus();
	
	
$("#ok").click(function(event) {
	event.preventDefault(); 
	
	var userID=$("#uid").val();
	var userPassword=$("#upw").val();
	
		
	
	$.ajax({
		type:"post",
		url:"/user/loginAjax",
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:"text",
		data:JSON.stringify({
			userID:userID,
			userPassword:userPassword,
			/* userName:"" */
		}), 

		success:function(result) {
			
			var result_chk=/^[userID]/g;
			var res=result_chk.test(result);
         	
			
			if(result) {
				
         	self.location="/user/loginSuccess";
         	$("#idpwForm").submit(); 
     	
        	opener.location.reload(); 
			
			}
				
		},
		
		error:function() {
		  
			$("#result").text("아이디 또는 비밀번호가 일치하지 않습니다.");
			
		}
		
	});
	

});


	
/* $("#upw").keydown(function(key) {
	
	if(key.keycode == 13) {
		loginChk();
	}
	
}); */


/* $("#ok").cilck(function(event) {
	loginChk();
}); */








$("#cancel").click(function(event) {
	event.preventDefault(); 
	
	window.close();
});




});	
</script>


</body>
</html>
















