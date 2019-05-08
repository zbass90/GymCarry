<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GYM CARRY - Welcome!!!</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
<link rel="stylesheet" href="${path }/css/registerDone.css" type="text/css">
</head>
<body>
<script>
	function regAddInfo(){
		document.querySelector('#regAddFrm').submit();
	}
</script>
<header>
	<a href="${path }/"><img src="${path }/resources/logo.png" width="300px" height="200px"/></a>
	<div class="container">
		<div class="row">			
			<div class="col-xs-3 col-sm-3 col-md-3"></div>
			<div class="col-xs-3 col-sm-6 col-md-6">
				<div class="paper">
					<div class="paper-fnt"><span>감사합니다!<br>
					이제 </span><b>계정</b><span>이 만들어졌습니다!</span><br><br>
					지금, 몇가지만 더 알려 주실 수 있으세요?</div>
					<div class="paper-fnt2"><strong>${userid }</strong>님! 당신의 체질량 지수 (BMI), 목표 체중에 필요한 칼로리 등을 알려드리겠습니다.</div>
					<br><br>
					<div class="paper-fnt3">30초면 됩니다.</div><br><br>
					<div>
						<form id="regAddFrm" method="post" action="${path }/user/regAddInfo.do">
							<input type="hidden" id="userid" name="userid" value="${userid}"/>
						</form>
						<a href="#" class="yesAt" onclick="javascript:regAddInfo();">네:)</a><a href="${path }/" class="nextAt">다음에 할게요.:(</a>		
					</div>			
				</div>
				<div style="text-align:center;margin-top:50px">
						<img src="${path }/resources/logoct.png" width="70px" height="70px"/>		
				</div>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3"></div>
		</div>
	</div>
</header>
<footer>
	<div>
		
	</div>
</footer>
</body>
</html>