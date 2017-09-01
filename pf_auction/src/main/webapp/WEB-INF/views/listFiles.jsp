<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="/resources/plugins/jquery/jquery-3.2.0.min.js"></script>
<!-- <script src="/resources/plugins/multifile-master/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
<script src="/resources/plugins/multifile-master/jquery.form.min.js"></script>
<script src="/resources/plugins/multifile-master/jQuery.MultiFile.min.js"></script> -->
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>
<style>

div{

}

#f_img {
width: 15px;
height: 15px;;
}

#wrap {
overflow: hidden;
}

#left1 {
float: left;
width: 6%;
height: 600px;
}

#left2 {
float: left;
width: 40%;
height: 600px;
border: solid red 1px;
overflow: scroll;
}

#mid {
float: left;
width: 7%;
height: 600px;
}

#right {
float: left;
width: 40%;
height: 600px;
border: solid red 1px;
overflow: scroll;
}

li {
list-style: none;
}

.listDiv {
width: 200px;
}

#history {
width: 100%;
height: 30px;
border: dashed orange 1px;
overflow: hidden;
}

/* #h_ul {
overflow: hidden;
} */

.history_li {
float: left;
margin: 3px;
}

span {
vertical-align: top;
}

#preImg {
vertical-align : center;
text-align : center;
width: 20%;
height: auto;
}

iframe {
width: 0px;
height: 0px;
border: 0px;
}

/* #selectFile {
width:100%;
height: 40px;
text-align: center;
vertical-align: middle;
}

#sendFile {
width:100%;
height: 40px;
text-align: center;
vertical-align: middle;
} */

</style>

</head>
<body>
<br/><br/>
<ul id="history">

</ul>
<br/>



<br/><br/>
<div id="wrap">
<div id="left1"></div>

<div id="selectFile"><input type="button" id="sel_btn" value="이미지 선택"/>
<input type="button" id="all_reset" value="초기화"/>
</div>


<form action="/main/upload" method="post" name="form1" id="form1" enctype="multipart/form-data"
      target="ifrm">
<input type="submit" id="send_btn" value="등록하기"/>
<input type="file" class="mFile" name="mFile" id="mFile" />
</form>


<!-- 파일 목록 -->
<div id="left2">
<ul id="fileLi">
<c:forEach var="i" items="${list}" varStatus="st">
<c:choose>

<!-- 파일/디렉토리 구분 -->
<c:when test="${i.isdir != 'file'}">
<li data-path="${i.path}" data-isdir="${i.isdir}"         
    id="${i.path}" class="firstLi"><img id="f_img" src="/resources/image/g.png"/>
<span>${i.filename}</span></li>
</c:when>

<c:otherwise>
<li data-path="${i.path}" data-isdir="${i.isdir}" 
    id="${i.path}" class="firstLi"><input type="checkbox" name="fileCheck"/>
<span>${i.filename}</span></li>
</c:otherwise>

</c:choose>
</c:forEach>
</ul>
</div>

<div id="mid"></div>

<div id="right">
<ul id="right_ul">
</ul>
</div>


</div>
<div id="d1"></div>

<iframe name="ifrm"></iframe>









<script type="text/javascript">

function addImg(msg) {
	alert(msg);
	$("#form1").reset();
}




/*브라우저에서 로컬 이미지 로드 불가 */
function ext(t) {                       
	var loc=t.attr("data-path");
	var sub=loc.substr(-3, 3).toLowerCase();
	if((sub == 'jpg') || (sub == 'gif') || (sub == 'png')) {
		$("#right").html("<div class='preImg'><img src='"+t.attr("data-path")+"'></div>");
	}
}




$(document).ready(function() {
	$(".firstLi").on("mouseover", function() {
		$(this).css("background-color","#BDCBEF");
		
		
	});
	
	$(".firstLi").on("mouseout", function() {
		$(this).css("background-color","white");
	});
	
	
	$(".history_li").on("mouseover", function() {
		$(this).css("background-color","orange");
	});
	
	$(".history_li").on("mouseout", function() {
		$(this).css("background-color","white");
	});
	
	
});
	


         /* 히스토리 구성 */
	var top=0;
	var history = new Array();
	var p="<li class='history_li'>C:\\</li>";
	
	
	history[top]=p;
	$("#history").append(history[top]);
	top++;

	
	
	
	$(".firstLi").on("click", function() {
		var ts=$(this);
		/* var path=$(this).attr("id"); */ 
		var filename=$(this).attr("data-filename"); 
		var path=$(this).attr("data-path"); 
		var isdir=$(this).attr("data-isdir");  
		var str='';
		var next="";
		var dir="";
		
		
		
		if(isdir=='dir') {
		
		history[top]=path;	
		$("#history").append("<li class='history_li'>"
				+"<img id='f_img' src='/resources/image/g.png'/>"+path+"</li>");
		top++;
	
		
		$.ajax({
			type : "post",
			url : "/file/selectFile/",
		    headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			}, 
			dataType : "text",
			data:path,
			success : function(data) {
				
				var dt=JSON.parse(data);
				
				
				/* 디렉토리가 아니면 파일명 앞에 체크박스 붙임 */
				$(dt).each(function() {
				
					str += "<li data-path='"+this.path+"' data-isdir='"
					    +this.isdir+"' id='"+this.path+"' class='targetLi'>";
					    
					if(this.isdir != 'file') {
						
					    str +=	"<img id='f_img' src='/resources/image/g.png'/>"+ this.filename
					    
					    }else{
					    	
					    str += "<input type='checkbox' name='fileCheck' />"+ this.filename
					    
					    }
					
					
					   str += "</li>";
					 
				
				});
				
		
		
				$("#left2").empty();
				$("#left2").html("<ul>"+str+"</ul>");  
				
				
				$(".targetLi").on("mouseover", function() {
					$(this).css("background-color","#BDCBEF");
					
					
				});
				
				$(".targetLi").on("mouseout", function() {
					$(this).css("background-color","white");
				});
				
				$(".history_li").on("mouseover", function() {
					$(this).css("background-color","orange");
				});
				
				$(".history_li").on("mouseout", function() {
					$(this).css("background-color","white");
				});
				
				
				$(".history_li").click(function() {
					var his_path=$(this).text();
					
					if(his_path=='C:\\') {
						/* location.replace("/main/listFiles"); */
						
						$("#history").empty();
					    history=[];
					    top=0;
						if(history[0] != 'c:\\') {
							
						$("#history").append("<li class='history_li'>"+"C:\\"+"</li>");
						top++;
						
						}
					}
					
					nextFile(his_path);
					
				});
				
				
				
				/* 디렉토리를 선택한 경우 하위 파일 목록 조회 */ 
				$(".targetLi").click(function() {
				dir=$(this).attr("data-isdir");
			    next=$(this).attr("data-path");	

				if(dir=='dir') {
				
				history[top]=next;	
				$("#history").append("<li class='history_li'>"
						+"<img id='f_img' src='/resources/image/g.png'/>"+next+"</li>");
				top++;
					
				nextFile(next);
				
				}  /* end if */
				

				
				});   
					
				
			}
	  
	});		
				
		} /* end if */
		
	});
	


	

	
	
	

/* 선택한 디렉토리의 하위 파일 목록 조회 */
function nextFile(next) {
		
	var ts=$(this);
	var path=next;
	var str='';
	
	if(next=='C:\\') {
		
		top=0;
		history=[];
		$("#history").empty();
		if(history[0] != 'C:\\') {
		
			$("#history").append("<li class='history_li'>"+"C:\\"+"</li>");
			
		}
		
	}
	

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
				
				/* str += "<li data-path='"+this.path+"' data-isdir='"+this.isdir+"' id='"+this.path+"' class='targetLi'>"
				    + this.filename + "<input type='checkbox' name='"+this.path+"' />"
				    + "</li>"; */
				    
				str += "<li data-path='"+this.path+"' data-isdir='"+this.isdir+"' id='"+this.path+"' class='targetLi'>";
			    
				if(this.isdir != 'file') {
				    str +=	"<img id='f_img' src='/resources/image/g.png'/>"+ this.filename 
				    }else{
				    str += "<input type='checkbox' name='fileCheck' />"+ this.filename
				    }
				   str += "</li>";
			});
			
			
			
			$("#left2").empty();
				$("#left2").html("<ul>"+str+"</ul>"); 
				
			next="";
			
			$(".targetLi").on("mouseover", function() {
				$(this).css("background-color","#BDCBEF");
				
				
				
			});
			
			$(".targetLi").on("mouseout", function() {
				$(this).css("background-color","white");
			});
			
			$(".history_li").on("mouseover", function() {
				$(this).css("background-color","orange");
			});
			
			$(".history_li").on("mouseout", function() {
				$(this).css("background-color","white");
			});
			
			
			$(".history_li").click(function() {
				
				var his_path=$(this).text();
				
				if(his_path=='C:\\') {
					/* location.replace("/main/listFiles"); */
					history=[];
				    top=0;
					
					$("#history").empty();
					if(history[0] != 'C:\\') {
					$("#history").append("<li class='history_li'>"+"C:\\"+"</li>");
						
					}
				}
				
				nextFile(his_path);
				
			});
			
			
			  $(".targetLi").click( function() {
				  
				  isdir=$(this).attr("data-isdir");
				/* next=$(".targetLi").attr("data-path"); */
				next=$(this).attr("data-path");
				
				if(isdir=='dir') {
				
				history[top]=next;	
				$("#history").append("<li class='history_li'>"+"<img id='f_img' src='/resources/image/g.png'/>"+ this.filename+next+"</li>");
				top++;
				
			  nextFile(next); 
				  
	} /* end if */
	

	
	
	
	
			  });
			  
		}
		
		}); 
	
}	





/* 체크된 파일의 포맷이 이미지인지 검사, 이미지가 아니면 경고 후 체크 박스리셋 */
$("#sel_btn").click(function() {
	
	$("input:checkbox[name='fileCheck']").each(function() {
		

		
		if(this.checked) {
			
			var temp=$(this).parent().attr("data-path");
			var sub=temp.substr(-3, 3).toLowerCase();
			if((sub == 'jpg') || (sub == 'gif') || (sub == 'png')) {
			
		$("#right_ul").append("<li id='rightLi'>"+$(this).parent().attr("data-path")+"</li>");
		
		}else{
			
			alert("jpg, gif, png 파일만 가능합니다.");
			$("input:checkbox[name='fileCheck']").prop("checked", false);
			
		}  
			
		}
		
	});
});




$("#all_reset").click(function() {
	
	$("input:checkbox[name='fileCheck']").prop("checked", false);
	$("#right_ul").empty();
	
});





$("#send_btn").submit(function() {

	var form=$("#form1")[0];
	var formData=new FormData(form);  
	var inpFile=$("input[name='mFile']")[0];

	
	formData.append("mFile", inpFile).files[0]; 
	
	$("#form1").ajaxForm({
		url:'/main/upload',
		type:'POST',
		data:formData,
		dataType:'text',
		processData: false,
		contentType: false,
		success: function() {
			
			$("#form1").reset();
			
		}
	});
	
}); 
	
	



</script>


</body>
</html>












