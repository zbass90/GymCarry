<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
<div id="menu"class="ui secondary right menu " style="font-family: 'Jua', sans-serif;font-size:18px;">
 <a class="item" href="${path }/"><img src="${path }/resources/gclogo.png" style="width:400px;height:250px"/></a>
 <a href="${path }/partner.do" class="item" style="background-color:#890422;border-radius: 10px; border-style:inherit; color:white">파트너찾기 </a>
 <a class="item" href="${path }/notice.do">공지사항</a>
 <a href="${path }/community.do" class="item">커뮤니티</a>
 <c:if test="${loginCheck==null}">
 	<a class="item" href="${path }/user/login.do">로그인</a>
 	<a href="${path }/user/userJoin.do"class="item">회원가입</a>
 </c:if>
 <c:if test="${loginCheck=='Y'}">			  
	 <a class="item" href="${path }/user/logout.do">로그아웃</a>
	 <a class="item" href="${path }/user/myProfile.do">내 정보</a>			 	 	 
 </c:if>
</div>
 
