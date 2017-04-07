<?xml version="1.0" encoding="UTF-8" ?>
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
width: 200px;
height: 300px;
}
</style>

</head>
<body>
<p>show directory</p>
<div id="folder">

${makeFolder.readFolder("c:\\") }

<%-- <c:forEach var="i" items="${makeFolder}">

<c:if test="${i.value} == 'folder'"><c:out value="${i.key}"/></c:if>

</c:forEach> --%>
</div>
<div>

</div>


</body>
</html>