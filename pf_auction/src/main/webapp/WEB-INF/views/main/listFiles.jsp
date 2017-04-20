<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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

<c:forEach var="i" items="${list}" varStatus="st">
<ul id="fileLi">

<li value="${i.fno}" id="${i.fno}">${i}<button type="button" id="btn">send</button></li>


</ul>
</c:forEach>
<div id="d1"></div>



<script type="text/javascript">






	$("#fileLi li").on("click", function() {
		var fno=$(this).val();
		var filename=$(this).attr("data-filename");
		var path=$(this).attr("data-path");
		var isdir=$(this).attr("data-isdir");  

		$.ajax({
			type : "post",
			url : "/file/selectFile/"+fno,
		    headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			}, 
			dataType : "text",
			    data : JSON.stringify({
			    fno : fno,	
				filename : filename,
				path : path,
				isdir : isdir
			}), 
			success : function(data) {
				
					
				var str='';
				var dt=JSON.parse(data);
                var f='';
				$(dt).each(function() {
					str += "<li data-fno='"+this.fno+"' id='"+this.fno+"' class='targetLi'>"
					    + this.fno +" : "
					    + this.path + "<input type='checkbox' name='"+this.fno+"' />"
					    + "</li>";
				});
				
				var id="#"+fno;
				$(id).append(str);
				
				$("li").click(function() {
					var nid=$(this).attr("id");
				  nextFile(nid);  
				});
					
				
			}
	  
	});		

	});
	  
	  
function nextFile(nid) {
		
	/* alert(nid); */
	
	var fno=nid;
	/* var filename=t.filename;
	var path=t.path;
	var isdir=t.isdir;  */ 
	
	

	$.ajax({
		type : "post",
		url : "/file/selectFile/"+fno,
	    headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		}, 
		dataType : "text",
		    data : JSON.stringify({
		    fno : fno	
			/* filename : filename,
			path : path,
			isdir : isdir */
		}), 
		success: function(data) {
			var str='';
			var dt=JSON.parse(data);
			$(dt).each(function() {
				var str='';
				str += "<li data-fno='"+this.fno+"' id='"+this.fno+"' class='targetLi'>"
				    + this.path + "<input type='checkbox' name='"+this.fno+"' />"
				    + "</li>";
			});
			
		    var id="#"+fno;
			$(id).append(str);
			
			/*  nextFile(id); */
		}
		
		}); 
}	
	
	


</script>


</body>
</html>












