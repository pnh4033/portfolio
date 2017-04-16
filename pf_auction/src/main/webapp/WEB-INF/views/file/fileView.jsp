<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>

</style>

<title>Insert title here</title>
</head>
<body>

<form role="form" method="post">
<input type="hidden" name='fno' value="${fileVO.fno}"/> 
</form>

<div>
<div class="table">

<table>
 <tr>
 <th style="width:10px">fno</th><th style="width:200px">path</th>
 </tr>
<c:forEach var="fileVO" items="${list}">

<tr>
<td>${fileVO.fno}</td><td><a href="/file/fileView?fno=${fileVO.fno}">${fileVO.path}</a>
<input type="hidden" name="fno" value="${fileVO.fno}"/>
<input type="hidden" name="path" value="${fileVO.path}"/>
<c:choose>
	<c:when test="${fileVO.isdir == 'file'}">
    <input class="check" type="checkbox" name="${fileVO.fno}"/>
	</c:when>
	
	<c:otherwise>
	
	</c:otherwise>
</c:choose>
</td>
</tr>


</c:forEach>
</table>

</div>


</div>

<script>
	
	$("p").on("click", function() {
		var formObj=$("form[role='form']");
		var path=$(this).attr("id");
		
		/* alert(path); */
		
		/* formObj.attr("value", path); */
		formObj.attr("action", "/file/readFile");
		formObj.attr("method", "post");
		formObj.submit(); 
		
	});

</script>

</body>
</html>








