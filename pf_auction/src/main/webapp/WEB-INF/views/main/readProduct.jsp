<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<style>

#showImg {
text-align: center;
width: auto;
height: auto;
}

</style>

<title>Insert title here</title>
</head>
<body>
<div id="showImg" data-pno="${productVO.pno}">
${productVO.pno}
</div>


<script>

$(document).ready(function(){
	
	var number=$("#showImg").attr("data-pno");
	alert(number);
	$("#showImg").load("/main/listImgsPnoAll?pno="+number);
	
});

</script>


</body>
</html>