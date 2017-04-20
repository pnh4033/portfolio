<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<style>
#folder {
padding: 10px;
width: 800px;
font-size: 16px;
}
</style>

</head>
<body>
<p>show directory</p>
<div id="folder">

<form role="form" action="selectImage" method="post">
<input type="hidden" name="filePath" value="${fileType.path}"/>
<input type="hidden" name="dirPath" value="${fileType.path}"/>
</form>


<ul>
<c:forEach var="i" items="${fileMap}" varStatus="st">

<c:choose>
<c:when test="${i.key.lastIndexOf(']') == -1}">

<li class="file" name="${st.index}" value="${i.value }"> ${i.key} <input type="checkbox" name="filePath" value="${i.value}"/></li>
</c:when>

<c:otherwise>
<li class="dir" name="${st.index}" value="${i.value }"> ${i.key} <input type="hidden" name="dirPath" value="${i.value}"/>
</li>
</c:otherwise>

</c:choose>

</c:forEach>
</ul>



</div>
<div>

</div>

<script>
$(document).ready(function() {
    $(".dir").on("click", function() {
    	
    	/* var formObj=$("form[role='form']");
    	formObj.submit(function(event) {
    		event.preventDefault;
    		$(this).submit();
    	}); */
    	
    	<%-- var path='<%=  %>'; --%>
    	
    	for(var i=0 ; len=)
    	if($(this).attr("name") == ${idx}) {
    		${subList}
    	}
    	
    	
    	
		var val=$(this).attr('value');
		$(this).append("${subList}");
	});
});
</script>
	
</body>
</html>












