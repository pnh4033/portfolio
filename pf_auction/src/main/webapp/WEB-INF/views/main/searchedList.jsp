<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<style type="text/css">

div {
	margin:0px;
	}
    ul {
    list-style: none;
    }
	.wrap {
	margin:0px;
	/* height: 100%; */
	}

	#bottom {
	background-color:#28CC00;
	width: 70%; height: 100px;
	}
	.contents {
	background-color: white;
	margin:0px;
	overflow: hidden;
	}
	
	/* #empty {
	height:60px;
	background-color: white;
	} */
	
	#top_menu {
	width:100%;
	height: 150px;
	/* background-color: #E8963A */
	}
	
	#body {
	margin: 0 auto;
	width: 100%;
	/* height: 100%; */
	}
	
	#center_menu {
	width: 900px;
	height: 80px;
	background-color: #061559;
	border-radius:7px;
	margin: 0 auto;
	padding: 2px;
	display: table-cell;
	vertical-align: middle;
	}
	
	#body_con1 {

	}
	
	#left_bar {border:solid white 1px; float:left; width:15%; height: 99%;}
	#center {border:solid white 1px; float: left; width: 70%; height: 99%;}
	#right_bar {border:solid white 1px; float: left; width:15%; height: 99%;}




html, body {
height: 100%;
font-size: 14px;
}

.pageA {
font-size: 20px;
color:gray;
text-decoration: none;
}


#paging {
list-style: none;
display:inline-block; *display:inline; zoom:1;
}

#pagingDiv {
margin: 0 auto;
text-align: center;
}

#pageLi {
margin: 4px;
width: 26px;
display: inline-block;
font-size: 15px;
border: solid #E888AA 2px;
border-radius: 3px;
vertical-align: middle;
}

table {
text-align: center;
vertical-align: middle;
}

#table_menu td {
padding: 2px;
margin: 20px;

}

#listImg {
max-width: 221px;
max-height: 190px;
}

#listWrap {
overflow: hidden;
text-align: center;
margin: 0 auto;
padding: 0;
}

.list_div {
float: left;
}

.list_ul {
list-style:none;
display: inline-table; 
float: left;
width: 223px;
border-bottom: solid white 50px;
}

.list_li1 {
height: 190px;
text-align: center;
background-color: #EAF5FF;
border-bottom: solid white 3px;
padding: 2px;
}

.list_li {
background-color: #FFF6EF;
text-align: left;
overflow: hidden; 
text-overflow: ellipsis;
white-space: nowrap; 
width: 223px;
}

.expDate {
background-color: #FFF6EF;
text-align: left;
overflow: hidden; 
text-overflow: ellipsis;
white-space: nowrap; 
width: 223px;
}

.list_li_val {
float: left;
display: inline-block;
}

#li_title {
border-bottom: solid white 3px;
}

.active {
background-color: #DABCFF;
color: red;
}

#timeCalc {
width: 0;
height: 0;
}

#table_menu {
border:0px;
margin: 3px;
}

#table_img {
border:0px;
}

#table_title {
border:0px;
color: white;
font-weight: bold;
}

#search_table {
width:80%;
margin:0px;
padding:0px;
border: 0px;
text-align: center;
}

#keyWord_input {
font-size:18px;
color: #00398E;
margin:0px;
padding:2px;
border: solid #F43500 3px;
border-radius: 5px;
background-color: #EAF5FF;
height: 30px;
width: 100%;
}

</style>

<title>MAIN PAGE</title>

</head>


<body id="top">

<div class="wrap" align="center"><!-- wrap -->
  
  
  
  <div id="top_menu" align="center"><%@ include file="top.jsp" %>
  
<!--   <div id="top_menu">
    <div id="regist" align="right"><button type="button" class="btn" id="reg_btn">상품등록</button></div>
  </div> -->
  
  </div>
  
  
  
  <div class="contents" align="center"><!-- contents -->
  
  <div id="left_bar"></div>
  <div id="center">  
    <!-- <div id="empty"></div> -->
    <p></p>
	<div id="body">
	
		
	  <div>
		<table id="search_table">
		<tr><td><input type="text" name="keyWord" id="keyWord_input" 
		     value="${criteria.keyWord}"></td><td style="width:60px; text-align: right;">
		<input type="image" id="search_btn" style="width:29px;" src="/resources/image/search.png"/></td></tr>
		</table>
		<p></p>
	  </div>
	
	
		<div id="center_menu">
		<table id="table_menu">
		<tr>
		<td id="table_img">
		<a href="register" target="_blank"><img src="/resources/image/add_database.png"/></a>
		</td>
		</tr>
		<tr>
		<td id="table_title">상품등록</td>
		</tr>
		</table>
		
		</div><p></p>







<div id="listWrap">
<c:forEach items="${list}" var="vo" varStatus="st">
<div class="list_div">
  <ul class="list_ul">
    
    
    <li class="list_li1">
    <a href="/main/readProduct${paging.makeSearchQuery(paging.criteria.page)}&pno=${vo.pno}" class="listItem">
    <img src="/main/listImgsPno?pno=${vo.pno}" id="listImg"/></a></li>
    <li class="list_li" id="li_title">&nbsp;${vo.title}</li>
    <li class="list_li">&nbsp;구매방식 &nbsp;&nbsp; ${vo.buytype}</li>
    <li class="list_li">&nbsp;현재가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${vo.nowprice}</li>
    <li class="list_li">&nbsp;즉구가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${vo.i_price}</li>
	
	<fmt:formatDate value="${vo.enddate}" type="both" pattern="yyyyMMddHHmmss" var="d"/>
	
  
    
    <li class="expDate" id="expDate${vo.pno}" data-pno="${vo.pno}">&nbsp;
    <img src="/resources/image/clock.png" width="18px" style="vertical-align: text-bottom;"/></li>
    
    
    
    </ul>
</div>
  

</c:forEach>
</div>





<div id="pagingDiv">      <!-- 페이징 처리 -->
  <ul id="paging">
    
    <c:if test="${paging.prev}">
      <li id="pageLi"><a href="listProduct${paging.makeSearchQuery(paging.startPage-1)}"
          class="pageA">&laquo;</a></li>
    </c:if>
    
    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
      <li id="pageLi" <c:out value="${ paging.criteria.page == idx ? 'class=active' : '' }"/>>
          <a href="listProduct${paging.makeSearchQuery(idx)}" class="pageA">${idx}</a>
      </li>
    </c:forEach>
    
    <c:if test="${paging.next && paging.endPage > 0 }">
      <li id="pageLi"><a href="listProduct${paging.makeSearchQuery(paging.endPage+1)}" 
          class="pageA">&raquo;</a></li>
    </c:if>
    
  </ul>
</div>







</div>
  </div>
  <div id="right_bar"></div>
  
  </div>                <!-- contents -->
  
  
  
  </div>            <!-- wrap -->

<div id="footer"><%@ include file="footer.jsp" %></div>


<script>

$(document).ready(function () {
	
  $("html body").animate({
	  
  scrollTop: $("#top").offset().top
  
  }, 'slow');
  
});





$(".listItem").click(function(event) {
	
	event.preventDefault();
	
	var t=$(this).attr("href");
	
	/* $("#body_con1").load(t); */
	window.open(t);
	
});






$("#search_btn").click(function(event) {
	
	${paging.criteria.keyWord=null};
	 self.location="/main/searchedList"
	    + "${paging.makeSearchQuery(1)}"
	    + $("#keyWord_input").val();
	    
});






/* 각 상품 별 남은시간 표시 */ 
$(document).ready(function() {
	
	
$(".expDate").each(function() {
	
	var pno=$(this).attr("data-pno");
	
	$.ajax({
		url:'/getExpDate?pno='+pno,
		dataType:'text',
		success: function(result) {
			
			var id="#expDate"+pno;
			
			if(result != null) {
				
				$(id).append("&nbsp;"+result);
				
			}else{
				
				$(id).append(result);
				
			}
			
		}
	
	});	 
	

  }); 

}); 

</script>

</body>
</html>



















