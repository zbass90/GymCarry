<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GYM CARRY - Join</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
<link rel="stylesheet" href="${path }/css/userJoin.css" type="text/css">
</head>
<body>
<header>
	<a href="${path }/"><img src="${path }/resources/logo.png" width="300px" height="200px"/></a>
	<div class="container">
		<div class="row">			
			<div class="col-xs-4 col-sm-4 col-md-4"></div>
			<div class="col-xs-4 col-sm-4 col-md-4">
				<div class="paper">
					<div class="paper-top">
						<strong>GYM CARRY</strong><span class="paper-fnt">회원가입</span><br>
						<span class="paper-fnt"><b>계정</b>을 만들어요!</span>
					</div>
					<div class="join-select">
						<div class="facebook-ico"><a href="${path }/user/facebookLogin.do" ><img src="${path }/resources/user/facebook-logo.png" width="20px" height="20px"/>페이스북 계정으로 시작하기</a></div>
						<div class="kakao-ico"><a href="#"><img src="${path }/resources/user/kakao-logo.png" width="20px" height="20px"/>카카오톡 계정으로 시작하기</a></div>
						<div class="naver-ico"><a href="${url }"><img src="${path }/resources/user/naver-ico.png" width="30px" height="30px"/>네이버 계정으로 시작하기</a></div>
						<div class="paper-bottom">
							<div class="paper-bottom-1">
								<span>아니면 그냥,</span>
							</div>							
							<div class="email-ico"><a href="${path }/user/registerEmail.do">이메일로 시작하기</a></div>
							<div class="paper-bottom-2">이미 계정이 있으신가요? <a class="login-ico" href="${path }/user/login.do">로그인 하기</a></div>
						</div>						
					</div>
					<div style="text-align:center;">
						<img src="${path }/resources/logoct.png" width="70px" height="70px"/>		
					</div>			
				</div>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4"></div>
		</div>
	</div>
</header>
<%@ include file="../include/foot.jsp" %>
</body>
</html>