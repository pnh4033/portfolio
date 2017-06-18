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
margin:100px;
font-size: 20px;
}

#title {
width:50%;
font-size: 40px;
text-align: center;
color: #006052;
}

#wrap {
border-left: solid #004C99 4px;
background-color: #EDF0F7;
width: 50%;
margin: 30px;
padding: 60px;
}

input[type=text] {
line-height: 23px;
vertical-align: middle;
}

input[type=password] {
line-height: 23px;
vertical-align: middle;
}

#chk_id_btn {
line-height: 23px;
vertical-align: middle;
}

#submit_btn {
line-height: 23px;
width: 100px;
vertical-align: middle;
}

</style>

</head>

<body>
  <div id="title">
    회원 가입
  </div>
  <div style="height: 50px;"></div>
  
  <div id="wrap">
    
    <div>
	  
	  <form id="signinForm" action="/user/signIn" method="post">
	    
	    <div>
	         아이디 : <input type="text" name="userID" id="uid"><span>&nbsp;&nbsp;&nbsp;</span>
	           <button type="button" id="chk_id_btn">아이디 체크</button>
	    </div><p></p>
	    <div>
	         비밀번호 : <input type="password" name="userPassword" id="upw">
	    </div>
	    <div style="height: 50px;"></div>
	    
	    <div>
	        이름 : <input type="text" name="userName" id="uname">
	    </div><p></p>
	    <div>
	         휴대폰 번호: <input type="text" name="userCell" id="cell">
	    </div><p></p>
	    <div>
	    E-MAIL : <input type="text" name="userEmail" id="email">
	    </div><p></p>
	    <div></div>
	    
	    
	    <button type="button" id="submit_btn">회원 가입</button>
	    
	  </form>
    
    </div>

  </div>



<script type="text/javascript">



var idFlag=false;
var idCheckFlag=false;


/* id 유효성 검사 */
function checkId() {            
	
	var check_id=/^[A-Z|a-z|0-9]{5,12}$/;
	var str=$("#uid").val();
	var result_id=check_id.test(str);
	
	if(!result_id) {
		
		$("#uid").val("");
		$("#uid").focus();
		
		return false;
	}else{
		
		/* alert("이 아이디는 사용이 가능합니다.");  */
		return true;

	}
	
}



/* password 유효성 검사 */
function checkPwd() {          
	
	var check_pwd=/^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
	var str=$("#upw").val();
	var result_pwd=check_pwd.test(str);
	
	if(!result_pwd) {
		
		$("#upw").val("");
		$("#upw").focus();
		
		return false;
		
	}else{
		
		return true;
		
	}

}



/* 휴대폰 번호 유효성 검사 */
function checkCell() {
	
	var check_cell=/^(010|011)\d{3,4}\d{4}$/;
	var cell=$("#cell").val();
	var result_cell=check_cell.test(cell);
	
	if(!result_cell) {
		
		$("#cell").val("");
		$("#cell").focus();
		return false;
		
	}else{
		
		return true;
		
	}
	
}



/* 이메일 유효성 검사 */
function checkEmail() {
	
	var check_email=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var str=$("#email").val();
	var result_email=check_email.test(str);
	
	if(!result_email) {
		
		$("#email").val("");
		$("#email").focus();
		return false;
		
	}else{
		
		return true;
		
	}
	
}


/* 이름 유효성 검사 */
function checkName() {
	
	var check_name=/^[가-힣]{2,5}$/;
	var str=$("#uname").val();
	var result_name=check_name.test(str);
	
	if(!result_name) {
		
		$("#uname").val("");
		$("#uname").focus();
		return false;
		
	}else{
		
		return true;
		
	}
	
}




$(document).ready(function() {
	$("#uid").focus();
});




$("#chk_id_btn").click(function(event) {
	
	event.preventDefault();
	
	var userID=$("#uid").val();
	
	$.ajax({
		
		url:"/user/idChk",
		type:"post",
 		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		}, 
		dataType:"text",
		data:JSON.stringify({
			userID:userID
		}),
		success: function(result) {
			
			var chkRes=checkId();
			
			if(result == 1) {
				
			alert("이미 사용중인 아이디 입니다.");
				
			}else if((result==0) && chkRes){  
				
			alert("이 아이디는 사용이 가능합니다."); 
			idCheckFlag=true; 
				
			}else{
				
			alert("아이디 형식이 올바르지 않습니다.")
				
			}
			
		},
		
		error: function() {
				
				alert("아이디 형식이 올바르지 않습니다.")
			
			$("#uid").val("");
			$("#uid").focus();
			
		}
		
	});
	
});




 $("#submit_btn").click(function(event) {
	
	event.preventDefault();
	
	var uid=$("#uid").val();
	var upw=$("#upw").val();
	
	
	if((uid=="") || (uid==null)) {
		
		alert("아이디를 입력하세요.");
		return false;
		
	}else if(!checkId()){
		
		alert("아이디 형식이 올바르지 않습니다.");
		idCheckFlag=false;
		return false;
		
	}else if(!idCheckFlag){
		
		alert("아이디를  체크 하세요.");
   		return false;
   		
	}else if(!checkPwd()){
		
		alert("비밀번호 형식이 올바르지 않습니다.  (6~20글자 영문,숫자 혼합)");
		return false;
	
	}else if(!checkName()) {
		
		alert("이름 형식이 올바르지 않습니다.");
		return false;
		
	}else if(!checkCell()) {
		
  		alert("휴대폰 번호 형식이 올바르지 않습니다.");
  		return false;
  		
	}else if(!checkEmail()) {
		
		alert("이메일 형식이 올바르지 않습니다.");
		return false;
		
	}else{
		
		$("#signinForm").submit();
		return true;
	}
	
	

	
	
}); 

</script>


</body>
</html>











