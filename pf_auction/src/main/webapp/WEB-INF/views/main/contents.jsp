<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<style>
	div {
	border-color: gray;
	border:dashed 1px;
	}
	section {
	margin:5px;
	}
	.body {
	width:800px;
	
	}
</style>

<title>Insert title here</title>
</head>
<body>
  <section class="contents">

	<div class="body">
		<div><%@ include file="../product/listproduct.jsp" %></div>
	</div>

  </section>
</body>
</html>