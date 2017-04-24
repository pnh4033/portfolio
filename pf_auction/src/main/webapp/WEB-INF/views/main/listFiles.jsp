<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="/resources/plugins/jquery/jquery-3.2.0.min.js"></script>


<style>

div{

}

li {
list-style: none;
}
</style>

</head>
<body>

<div id="wrap">

<c:forEach var="i" items="${list}" varStatus="st">
<ul id="fileLi">

<li value="${i.path}" id="${i.path}">${i.path}</li>


</ul>
</c:forEach>


</div>
<div id="d1"></div>



<script type="text/javascript">


	$("li").on("click", function() {
		var ts=$(this);
		var path=$(this).attr("id"); 
		var filename=$(this).attr("data-filename"); 
		/* var path=$(this).attr("data-path"); */ 
		var isdir=$(this).attr("data-isdir");  
		alert(isdir);
				var str='';
		var next="";
		var dir="";
		
		
		$.ajax({
			type : "post",
			url : "/file/selectFile/",
		    headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			}, 
			dataType : "text",
			    /* data : JSON.stringify({
			    /* fno : fno,  */	
				/* filename : filename, 
				path : path
				/* isdir : isdir 
			}),  */
			data:path,
			success : function(data) {
				var dt=JSON.parse(data);
				$(dt).each(function() {
					str += "<li data-path='"+this.path+"' data-isdir='"+this.isdir+"' id='"+this.path+"' class='targetLi'>";
					    
					if(this.isdir != 'file') {
					    str +=	"["+ this.filename +"]" 
					    }else{
					    str += this.filename+"<input type='checkbox' name='"+this.path+"' />"
					    }
					   str += "</li>";
					 
				
				});
				
				$("#wrap").empty();
				$("#wrap").html("<ul>"+str+"</ul>");  
				
				
				$(".targetLi").click(function() {
				dir=$(this).attr("data-isdir");
				alert(dir);
			    next=$(this).attr("id");	
				alert(next); 
				nextFile(next);
					  
				});   
					
				
			}
	  
	});		
				

	});
	




	  
	  
function nextFile(next) {
		
	var ts=$(this);
	var path=next;

			var str='';
	

	$.ajax({
		type : "post",
		url : "/file/selectFile/",
	    headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		}, 
		dataType : "text",
		    data : path, 
		success: function(data) {
			var dt=JSON.parse(data);
			$(dt).each(function() {
				str += "<li data-path='"+this.path+"' data-isdir='"+this.isdir+"' id='"+this.path+"' class='targetLi'>"
				    + this.filename + "<input type='checkbox' name='"+this.path+"' />"
				    + "</li>";
			});
			
			$("#wrap").empty();
				$("#wrap").html("<ul>"+str+"</ul>"); 
				
			next="";
			  $(".targetLi").click( function() {
				  dir=$(this).attr("data-isdir");
					alert(dir);
				next=$(".targetLi").attr("id");
			  nextFile(next); 
				  
			  });
			  
		}
		
		}); 
}	
	
	


</script>


</body>
</html>












