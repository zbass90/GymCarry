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
<title>view</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
<style>
	*{font-family: 'Jua', sans-serif;}
	A:link{text-decoration: none; color:black}
	A:hover{text-decoration:none;color:black}
	A:visited{text-decoration: none;color:black}
	A:active{text-decoration: none;color:black}
</style>
<%@ include file="../include/menu.jsp" %>
</head>
<body>
	<div class="container" style="margin-left:18%">
 		<div style="height:70px;font-size:30px;color:#555555;border-bottom:1px solid #DDDDDD">${dto.title}
 		
 		</div>
 
		<textarea disabled="disabled" style="width:100%;height:300px";>${dto.des}</textarea>
 		<%-- <div style="margin-top:65px;margin-bottom:100px;font-size:18px;color:#838383";>${dto.des}</div> --%>
 		<div style="margin-top:65px;border-top:1px solid #DDDDDD"><a href="${path}/notice.do"><button class="ui primary button" style="margin-top:25px;font-family: 'Jua', sans-serif;font-size:16px;background-color:#890422">Back</button></a>
 		 <c:if test="${loginCheck=='Y' && userid=='khdrogba'}">
 		<!-- 글수정버튼 --> <button class="ui primary button" data-toggle="modal" data-target="#editModal" style="margin-top:25px;font-family: 'Jua', sans-serif;font-size:16px;background-color:#890422">Edit</button>
 		<!-- 글삭제버튼 --> <button class="ui primary button" data-toggle="modal" data-target="#deleteModal" style="margin-top:25px;font-family: 'Jua', sans-serif;font-size:16px;background-color:#890422">Delete</button>
 		</c:if>
 		</div>
 		
	      <!-- Edit Modal -->
	      <div class="modal fade" id="editModal" role="dialog">
	  	 	<div class="modal-dialog">	
		      <div class="modal-content">
		      <form action="${path}/notice/edit/${dto.noticeno}" method="post">
		        <div class="modal-header">
		          <h4 class="modal-title">Notice Edit</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		        	<div>Title : <input type="text" name='title' value='${dto.title}'></div><br/>
		        	<div style="margin-top:20px">Description</div>

		        	<textarea cols="50" rows="8" id="content" name="des" style="width:100%;height:300px"><c:out value="${dto.des}" /></textarea>
		        </div>
		        <div class="modal-footer">
		        	<input type="submit" value="Edit" class="btn btn-default" style="width:80%;background:#890422;color:white"/>
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		        </form>
		      </div>
		     </div>
	      </div>
	       <!-- Delete Modal -->
	      <div class="modal fade" id="deleteModal" role="dialog">
	   		<div class="modal-dialog">
	      	<div class="modal-content">
	      		<form action="${path}/notice/delete/${dto.noticeno}" method="post">
	        <div class="modal-body">
	        	<div>정말로 삭제하시겠습니까?</div>
	        </div>
	        <div class="modal-footer">
		        	<input type="submit" value="Delete" class="btn btn-default" style="width:80%;background:#890422;color:white"/>
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		    </div>
	        </form>
	      </div>
	   	 </div>
	 	 </div>
 		
 		
	</div>
</body>

</html>