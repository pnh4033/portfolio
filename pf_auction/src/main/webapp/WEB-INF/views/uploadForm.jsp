<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<!-- <html xmlns="http://www.w3.org/1999/xhtml"> -->
<html>
<head>

	<style>
		iframe {
		width: 0px;
		height: 0px;
		border: 0px;
		}
	</style>

</head>
<body>

	<form id='image_upload_form' action="uploadForm" method="post" enctype="multipart/form-data"
	 target="invisible">
	
	<input type="file" name="file">
	<input type="submit">
	
	</form>
	
	
	<iframe name="invisible"></iframe>
	
	
	<script>
	  function addImg(msg) {
		  
		  alert("success : "+msg);
		  document.getElementById("image_upload_form").reset();
	  }
	</script>

</body>
</html>