<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁</title>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
</head>
<%@ include file="../include/menu.jsp" %>
<body>
	<div id=title> 당뇨에 좋은 음식 5가지</div><br/>
 	<img src="${path }/resources/tip21.png" ><br/>
  	<img src="${path }/resources/tip22.png"><br/>
  	<img src="${path }/resources/tip23.png"><br/>
    <img src="${path }/resources/tip24.png"><br/>
    <img src="${path }/resources/tip25.png"><br/>
</body>
</html>
<style>
	body img, div{margin-left:30%}
	#title{font-size:39px;font-family: 'Jua', sans-serif}
</style>