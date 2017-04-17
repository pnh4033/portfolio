<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>

div{
width: 800px;
height: 800px;
background-color: yellow;
}

li {
font-size: 15px;
}
</style>

</head>
<body>
<div>
<ul id="fileLi">

</ul>
</div>

<script>

$(document).ready(function() {
	
getList();	
});  


function getList() {
	$.getJSON("/file/listFiles", function(data) {
		var html="";
		$(data).each(function() {
			str += "<li data-fno='"+this.fno+"' class='list'>"
			    + this.path + "<input type='checkbox' name='"+this.fno+"' />"
			    + "</li>";
		});
		
		$("#fileLi").html(str);
	});
}



	$("#fileLi").on("click", function() {
		
		var fno=$("").val();
		var path=$("").val();

		$.ajax({
			type : 'post',
			url : '/file/listFiles',
		    headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			}, 
			dataType : 'text',
			    data : JSON.stringify({
			    fno : fno,	
				filename : filename,
				path : path,
				isdir : isdir
			}), 
			success : function(result) {
				if(result == 'SUCCESS') {
					
					alert(result);
			}
		  });
	  
	});		



	   
	  
	  
	
	
	
	  $(".list").on("click", function() {
		
		  var filename=$("#checkedFile").val();
		  
		  $.ajax({
			type : 'post',
			url : '/file/setFile/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			dataType : 'text',
			data : JSON.stringify({
				fno : fno,
				fileName : fileName,
				path : path,
				isdir : isdir
			}),
			success : function(result) {
				if(result == 'SUCCESS') {
					alert('등록되었습니다.');
				}
			}
		  });
	  
	  
		  
	  });

</script>


</body>
</html>