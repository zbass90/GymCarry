<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"   integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->

<style>
	*{font-family: 'Jua', sans-serif}
	img{
		width:100%;
	}
	.container{
		width:80%;
		margin-left:10%;
	}
	#uploadBtn button{
		width:100%;
	}
	
</style>
</head>
<%@ include file="../include/menu.jsp" %>

<body>
	
	<div class="container">
	<div class=list-group style="font-size:23px;margin-bottom:50px;">
  		<div style="font-size:40px;margin-bottom:25px">Gym Carry 커뮤니티</div><br/>
  		<span>유익한 정보를 공유하거나 프로필을 업로드해 자신을 어필해 보세요!</span>
			<button class="ui blue button" onClick="clickUploadBtn()" style="background-color:#890422;">Go!</button>
	</div>
		<!-- 이미지들어갈곳 -->
		
		<div class="ui grid four column" id="contentDiv" style="margin-left:5%">
			<c:forEach var="dto" items="${list}">				
					<div class="column" >
						<form action="${path}/community/view/${dto.comNo }" method="get" ><!-- path variable -->
							<label for="submit${dto.comNo}" style="cursor:pointer";>								
								<img src="${path }/community/images/${dto.comImage}" style="width:250px;height:300px;border-radius:15px;"/>
							</label>			
							<input id="submit${dto.comNo}" type="submit" style="display:none;" />
						</form>
					</div>				
			</c:forEach>
		</div>
		
	</div>


	<!-- 이미지모달 -->
	
	<!-- 업로드 모달 -->
	<div class="ui tiny modal" >
		<div class="header">업로드</div>
		<div class="content">
			<form action="${path}/community/upload.do" method="post" enctype="multipart/form-data">
				<div>
					<label for="comImage">
						<img src="${path}/resources/uploadBtn.png" style="width:50%;margin-left:25%"/>
					</label>
					<input type="file" name="comImage" id="comImage" style="display:none;"/>
				</div>
				<hr/>				
				글내용 
				<input type="text" name="comDes" style="width:100%;height:300px;"/>
				<input type="hidden" name="userid" value="khdrogba"/>
				<div>
					<input type="submit" value="게시" class="ui blue button" style="width:100%"/>	
				</div>
			</form>		
			
		</div>
		
		
	</div>
	<!-- 업로드모달 -->
</body>
<script>
	const grid = document.querySelector(".ui.grid");

	//이미지 업로드 버튼클릭
	function clickUploadBtn(){
		$(function(){
			$('.ui.tiny.modal').modal('show');	
		})
	}	
	
	
</script>

</html>