<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
    	<title>GYM CARRY</title>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Fullscreen Background Image Slideshow with CSS3 - A Css-only fullscreen background image slideshow" />
        <meta name="keywords" content="css3, css-only, fullscreen, background, slideshow, images, content" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="${path}/mainSlide/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="${path}/mainSlide/css/style2.css" />
		<script type="text/javascript" src="${path}/mainSlide/js/modernizr.custom.86080.js"></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
		<!--메인 슬라이드쇼  참조 https://tympanus.net/codrops/ -->
		<!-- 그외 css 참조 https://www.w3schools.com -->
    </head>
    <body id="page">
        <ul class="cb-slideshow">
            <li><span>Image 01</span><div><h3>No sweat, no sweet</h3></div></li>
            <li><span>Image 02</span><div><h3>Faith without deeds is useless.</h3></div></li>
            <li><span>Image 03</span><div><h3>United we stand, divided we fall.</h3></div></li>
            <li><span>Image 04</span><div><h3>Weak things united become strong.</h3></div></li>
            <li><span>Image 05</span><div><h3>The will of a man is his happiness.</h3></div></li>
            <li><span>Image 06</span><div><h3>All fortune is to be conquered by bearing it.</h3></div></li>
        </ul>
        <div class="container">
            <!-- top bar -->
            <div class="codrops-top">
                <a href="#">
                    <strong>&laquo; GYM CARRY 최고의 롤모델을 찾아서! Carry해 드립니다. </strong>
                </a>
                <span class="right">
                    <a href="#" target="_blank">GYM CARRY 앱 설치</a>
                    <a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com" target="_blank">
                    	<img src="${path }/resources/naver.png" style="width:25px"> <strong>네이버</strong>
                    </a>
                    <a href="https://www.facebook.com/">
                        <img src="${path }/resources/facebook.png"> <strong>페이스북</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div>
            	<!-- 상단 메뉴 -->
             <div id="menu"class="ui secondary right menu " style="font-family: 'Jua', sans-serif;font-size:18px;">
			  <a class="item" href="${path }/"><img src="${path }/resources/gclogo.png" style="width:400px;height:250px"/></a>
			  <a href="${path }/partner.do" class="item" style="background-color:#890422;border-radius: 10px; border-style:inherit">파트너찾기 </a>
			  <a class="item" href="${path }/notice.do">공지사항</a>
			  <a href="${path }/community.do" class="item">커뮤니티</a>
			  <c:if test="${loginCheck==null}">
			  	<a class="item" href="${path }/user/login.do">로그인</a>

			  	<a class="item" href="${path }/user/userJoin.do">회원가입</a>

			  </c:if>
			  <c:if test="${loginCheck=='Y'}">			  
			 	 <a class="item" href="${path }/user/logout.do">로그아웃</a>
			 	 <a class="item" href="${path }/user/myProfile.do">내 정보</a>			 	 
			  </c:if>
			  
			</div>
			<!-- 상단 메뉴 end -->
            
            <!--중단 포탈 -->
            <header id="portal">
                <h1>GYM CARRY <span>이용하는 방법</span></h1>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;  버튼을 누르면 해당 페이지로 이동합니다.</h2>
				<p>
					<button onclick="scrollTo1()">GYM CARRY 이용 방법</button>
					<button onclick="scrollTo2()">파트너를 추천해 드려요!</button>
					<button onclick="scrollTo3()">커뮤니티에 글 올리기!</button>
					<button onclick="scrollTo4()">생활꿀팁</button>
				</p>
            </header>
            
            <!-- 타이틀1 -->
            <div id=title1>HOW TO USE GYM CARRY</div>
            <!--사용방법 첫번째줄 -->
            
            	<div class="ui steps">
				  <div class="step">
				    <i class="address card icon"></i>
				    <div class="content">
				      <div class="title">회원가입 & 로그인</div>
				    </div>
				  </div>
				  <div class="step">
				    <i class="search icon"></i>
				    <div class="content">
				      <div class="title">파트너 찾기<button style="background-color:#890422;border-radius: 10px; border-style:inherit;"><a href="${path }/partner.do" style=color:white;>Go!</a></button></div>
				    </div>
				  </div>
				  <div class="step">
				    <i class="american sign language interpreting icon"></i>
				    <div class="content">
				      <div class="title">(Email정보확인) 양식에 맞춰 PT 요청</div>
				    </div>
				  </div>
				  <div class="step">
				    <img src="${path }/resources/logoct.png" style="width:40px;"/>
				    <div class="content">
				      <div class="title">매칭된 파트너와 PT시작!</div>
				    </div>
				  </div>
				</div>
			
				
           

           	<!-- 타이틀 -->
           	<div id= title3>Monthly PARTNERS</div>
           	<!-- 추천트레이너 --> 
            <div id="trainers"> <!-- float-frame 과 unit의미없음   -->
       			<c:forEach var="dto" items="${list}">
					<div class="container float-unit">
					<form action="${path}/community/prof/${dto.userid}" method="post" id="comSubmit${dto.userid}" >
					  	<img src="${path }/community/images/${dto.comImage}" alt="Avatar" class="image ui medium rounded" style="height:250px">
					  	<div class="overlay" onClick="comSubmit('${dto.userid}')">
						    <div class="text" ><i class="user circle outline icon"></i>
						    <span id="userid2">${dto.userid}</span><hr/> <!--email적는란 -->
						    <span id="comment2">${dto.comDes}</span> <!-- 코멘트적는란 -->
					    	</div>
					  	</div>
					  </form>	
					</div>
				</c:forEach>
        	</div>
       
        	
        	<div id="title4">JOIN COMMUNITY</div>
        	<div id="com" style="border:outset; margin-top:30px; padding:50px 0px 50px 0px">
        		<h3>1. <a href="#"class="item" style="color:red">회원가입 및 로그인.</a><h3/>
        		<h3>2. <a href="${path }/community.do" style="color:red">GYMCARRY 커뮤니티</a>에 입장!</h3>
        		<h3>3. 글이나 사진 올리기</h3>
        		<h3>4. 운동 외적인 글 또는 광고성 글은 제지 당할 수 있습니다.</h3>
        	</div>
        	
        	<div id ="title5">GYM CARYY 꿀팁</div>
        	<div id=honeyTip>
        		<div class="container float-unit">
				  	<img src="${path }/resources/tip1.jpg" alt="Avatar" class="image ui medium rounded" style="height:250px">
				  	<a href="${path }/honeyTip.do" class="item"><div class="overlay">
					    <div class="text"><i class="hand point right outline icon"></i>
					    <span id="report">강휘 기자</span><hr/> <!-- email적는란 -->
					    <span id="comment">살을 빼기 위해선 절대로 먹어선 안되는 음식 탑 5를 선정해보았습니다.</span> <!-- 코멘트적는란 -->
				    	</div>
				  	</div></a>
				</div>
				<div class="container float-unit">
				  	<img src="${path }/resources/tip2.png" alt="Avatar" class="image ui medium rounded" style="height:250px">
				  	<a href="${path }/honeyTip2.do" class="item"><div class="overlay">
					    <div class="text"><i class="hand point right outline icon"></i>
					    <span id="report2">지경호 기자</span><hr/> <!-- email적는란 -->
					    <span id="comment2">당뇨 극복하기!</span> <!-- 코멘트적는란 -->
				    	</div>
				  	</div></a>
				</div>
				<div class="container float-unit">
				  	<img src="${path }/resources/tip3.png" alt="Avatar" class="image ui medium rounded" style="height:250px">
				  	<a href="${path }/honeyTip3.do" class="item"><div class="overlay">
					    <div class="text"><i class="hand point right outline icon"></i>
					    <span id="report3">이윤성 기자</span><hr/> <!-- email적는란 -->
					    <span id="comment3">연예인들의 다이어트 꿀팁!</span> <!-- 코멘트적는란 -->
				    	</div>
				  	</div></a>
				</div>
				<div class="container float-unit">
				  	<img src="${path }/resources/tip4.jpg" alt="Avatar" class="image ui medium rounded" style="height:250px">
				  	<a href="${path }/honeyTip4.do" class="item"><div class="overlay">
					    <div class="text"><i class="hand point right outline icon"></i>
					    <span id="report3">아이유 기자</span><hr/> <!-- email적는란 -->
					    <span id="comment3">눈건강과 다이어트를 한번에!</span> <!-- 코멘트적는란 -->
				    	</div>
				  	</div></a>
				</div>
				<div class="container float-unit">
				  	<img src="${path }/resources/tip5.jpg" alt="Avatar" class="image ui medium rounded" style="height:250px">
				  	<a href="${path }/honeyTip5.do" class="item"><div class="overlay">
					    <div class="text"><i class="hand point right outline icon"></i>
					    <span id="report3">강휘 기자</span><hr/> <!-- email적는란 -->
					    <span id="comment3">3분할 운동 정석.</span> <!-- 코멘트적는란 -->
				    	</div>
				  	</div></a>
				</div>

        	</div>
        	<div id=blank style="font-size:15px">Gym Carry 
        	대표:강휘<br/>
        	공동대표: 정연택, 지경호, 이윤성<br/>
        	주소:대한민국 서울시 구로구 구트아카데미 2층<br/>
        	연락처:010-2200-7646<br/>
        	이메일: goott@naver.com<br/>
        	
        	</div>
        	
        	
        	<!-- 따라다니는 버튼 -->
        	<a onclick="scrollToTop()">
	        	<div id="top">
					<i class= "arrow up icon" style="width:20px" ></i>
				</div>
			</a>
			
			
			
        </div>   
    </body>
    
<style>
	body{font-family: 'Jua', sans-serif;color:white }
	#menu a{color:white}
	#portal{margin-left:27%}
	#portal button{border-radius:10px;background:#890422;font-family: 'Jua', sans-serif;color:white; font-size:17px;border-style:inherit;cursor:pointer }
	#portal a{font-size:15px}	
	#com{clear:both;} /* float-left 종료시키기 */
	#trainers{margin-left:5% }
	#honeyTip{margin-left:12%;}
	#title1, #title2, #title3, #title5{text-algin:center;margin-top:500px;margin-bottom:50px;font-size:30px}
	#title4{text-algin:center;margin-top:650px;font-size:30px}
	#blank{margin-top:650px;}
	
	.float-unit{float:left;margin-left:50px;margin-bottom:10px;position: relative;width: 200px;}		
	.image {
	  display: block;
	  width: 100%;
	  height: auto;
	}
	
	.overlay {
	  position: absolute;
	  top: 0;
	  bottom: 0;
	  left: 0;
	  right: 0;
	  height: 100%;
	  width: 100%;
	  opacity: 0;
	  transition: .5s ease;
	  background-color: #008CBA;
	}
	
	#trainers .container:hover .overlay {
	  opacity: 0.7;
	}
	#honeyTip .container:hover .overlay {
	  opacity: 0.7;
	}
	
	.text {
	  color: white;
	  font-size: 15px;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate(-50%, -50%);
	  -ms-transform: translate(-50%, -50%);
	  transform: translate(-50%, -50%);
	  text-align: center;
	}
	/* 따라다니는 고정 버튼 */
	#top{ position:fixed; width:30px;height:20px; 
		right:20px; /* 창에서 오른쪽 길이 */ 
		top:97%; /* 창에서 위에서 부터의 높이 */ 
		border-radius:50%;
		background-color:white ;
		color :#890422;
		cursor:pointer;
		}
	
			
</style>

<script>
	function closex(){  //광고 닫는 함수 
		const closex = document.getElementById('carousel-example-generic');
		closex.style.display='none';
	}
	function scrollTo1(){
		window.scrollTo(0,650);	
	}
	function scrollTo2(){
		window.scrollTo(0,1430);	
	}
	function scrollTo3(){
		window.scrollTo(0,2300);	
	}
	function scrollTo4(){
		window.scrollTo(0,3100);	
	}
	
	function scrollToTop(){
		window.scrollTo(0,0);	
	}

	 function comSubmit(userid){
		document.querySelector('#comSubmit'+userid).submit();
	 }
	 

	
</script>


</html>