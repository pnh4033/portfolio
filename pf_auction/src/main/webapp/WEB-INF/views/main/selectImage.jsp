<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" href="/jquery.treeview.css"/> 
<script src="/jquery.treeview.js" type="text/javascript"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

</head>
<body>

<div id="main">
 <ul id="browser" class="filetree"> 
 
   <li> 
   <span class="folder">폴더</span> 
 
     <ul> 
       <li> <span class="file">폴더 - 파일</span> </li> 
     </ul> 
 
   </li> 
 
 <li> <span class="file">파일</span> </li> 
   
 </ul> 
</div>


	<script>
	$(function(){ 
	// 해당 함수를 호출안할시, 트리기능이 동작을 안함 
	$("#browser").treeview({});
	});
	</script>


</body>
</html>