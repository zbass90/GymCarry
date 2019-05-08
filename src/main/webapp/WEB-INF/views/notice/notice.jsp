<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>게시판 리스트</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
<style>
	*{font-family: 'Jua', sans-serif}
	.row{text-align:center}
	.wordCut{white-space:nowrap; overflow:hidden; text-overflow:ellipsis}
	A:link{text-decoration: none; color:black}
	A:hover{text-decoration:none;color:black}
	A:visited{text-decoration: none;color:black}
	A:active{text-decoration: none;color:black}

</style>
<%@ include file="../include/menu.jsp" %>
</head>
<body>
  <div class="container" style="font-family: 'Jua', sans-serif">
  	<div class=list-group style="font-size:23px">
  		<div style="font-size:40px;">공지사항 </div><br/>
  		<span>이벤트와 새로운 알림을 확인하세요! 
  		 <c:if test="${loginCheck=='Y' && userid=='khdrogba'}">
  		<!-- 글쓰기버튼 -->
  		<button class="ui primary button" data-toggle="modal" data-target="#myModal" style="margin-left:690px;margin-top:25px;font-family: 'Jua', sans-serif;font-size:16px;background-color:#890422">Write</button>
  		</c:if>
  		</span><br/><br/><br/>
  		<c:forEach var="dto" items="${list}">
  			<form action="${path}/notice/view/${dto.noticeno}" id="submit${dto.noticeno}" method="get" >
  			  <div class="list-group-item list-group-item-action"  style="border-radius:10px;cursor:pointer;" onClick="noticeSubmit(${dto.noticeno});">
  			  
				<span class = label style="background:#890422;color:white;font-size:15px;">${dto.noticeno }</span>
				<div class="wordCut" style="margin-top:10px">${dto.title }<i class = "chevron right icon" style=float:right></i></div>
				<div style="color:#99999B;font-size:10px;margin-top:10px ">${dto.regdate }</div>

			  </div>
			</form>
		</c:forEach>
	</div>
	
	
	
	<div class="row" style="margin-left:35%;margin-top:100px">
		<div class="col">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>
	
	 <!-- 글쓰기 모달 -->
		<div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    

	      <div class="modal-content">
	      <form action="${path}/notice/submit.do" method="post">
	        <div class="modal-header">
	          <h4 class="modal-title">Notice</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	        	<div>Title : <input type="text" name='title' placeholder='제목 입력'></div><br/>
	        	<div style="margin-top:20px">Description</div>
	        	<textarea id="content" name="des" style="width:100%;height:300px;" placeholder='공지사항 입력'></textarea>
	        </div>
	        <div class="modal-footer">
	        	<input type="submit" value="Submit" class="btn btn-default" style="width:80%;background:#890422;color:white"/>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	        </form>
	      </div>
	      
	    </div>
	  </div>
	
  </div>
  
 
</body>
<script>

 function noticeSubmit(notice){
	document.querySelector('#submit'+notice).submit();
	
 }
 
 
	
</script>
</html>
