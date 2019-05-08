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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="${path }/css/findIdSuccess.css" type="text/css">
</head>
<body>
<header>
	<a href="${path }/"><img src="${path }/resources/logo.png" width="300px" height="200px"/></a>
	<div class="container">
		<div class="row">			
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
				<div class="col-xs-8 col-sm-8 col-md-8">
					<div class="paper">
						<b class="span-title">아이디 찾기</b><br>
						<span class="span-title2">걱정마세요! 잊어버린 아이디를 찾아드려요.</span><br><br>
						<form method="post" action="${path }/user/findIdresult.do">
							<span class="label-fnt">이름</span>
							<div class="row" style="margin-bottom:30px;">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<input type="text" name="username" value="${userDto.username }" autocomplete="off"  placeholder="가입하신 분의 이름을 입력하세요" class="form-input2"/>
								</div>
							</div>
							<span class="label-fnt">이메일</span>
							<div class="row" style="margin-bottom:30px;">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<input type="email" name="useremail" value="${userDto.useremail }" autocomplete="off"  placeholder="이메일 주소를 입력하세요" class="form-input2"/>
								</div>
							</div>
							<button type="submit" class="btn-findid"><i class="fa fa-search"></i>아이디를 찾아주세요!</button>
						</form>
						<div class="result-div">
							<div class="result-div-in">							
								<i class="fa fa-lightbulb big" aria-hidden="true"></i>
								<span class="fnt1"><b>야호 찾았어요!</b><br>
								<b class="fnt1"> ${userDto.username }</b>의 아이디는 <b class="fnt1">${userDto.userid }</b>입니다.</span>
								<div style="float: right"><a href="${path }/user/login.do"><b class="fnt1">로그인하기 -></b></a></div>
							</div>
						</div>
					</div>					
				</div>
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
		</div>
	</div>
</header>
<%@ include file="../include/foot.jsp" %>
</body>
</html>