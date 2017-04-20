<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

</head>
<body>

<div>
	<div>path <input type="text" name="path" id="testPath" /></div>
	<button id="sendPath">send path</button>
</div>

<ul id="fileLi">

</ul>


<script>
var fno=7;

function getAllList() {
$.getJSON("/file/listFiles/"+fno, function(data) {
	console.log(data.length);
	
	$(data).each(function() {
		str+="<li data-fno='"+this.fno+"' class='replyLi'>"
		+this.fno+" : "+this.path
		+"</li>";
	});
	
	$("fileLi").html(str);
	
});
}


$("sendPath").on("click", function() {
	
	var path=$("#testPath").val();
	
	$.ajax({
		type:'post',
		url:'/file/listFiles/'+fno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":'post',
		},
		dataType:'text',
		data:JSON.stringify({
			fno:fno,
			filename:filename,
			path:path
		}),
		success:function(result) {
			if(result=='SUCCESS') {
				alert('등록');
				getAllList();
			}
		}
	});
	
});

</script>

</body>
</html>

























