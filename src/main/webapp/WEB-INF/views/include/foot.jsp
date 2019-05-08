<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.foot{
	width:100%;
	height:300px;
	background-color: #fff;
}
.img-a{
	margin-top:30px;
	margin-bottom:10px;
}
.foot-span-fnt{
	color: #777
}
.foot-a-div{
	margin:10px;
}
.foot-a-div a{
	margin:25px;
	color: #890422;
}
.foot-a-div a:hover{
	margin:25px;
	color: #890422;
}
</style>
<footer class="foot container-fluid">
		<div class="row">			
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
			<div class="col-xs-8 col-sm-8 col-md-8">
				 <div class="">
				 	<a href="${path }/"><img src="${path }/resources/logo-string.png" width="140" height="20" class="img-a"/></a><br><br>
				 </div>
				 <span class="foot-span-fnt"><b>© 2019~ GYM CARRY.</b><br><br>
				 (주)짐캐리 대표이사: 강휘 / 공동대표: 정연택, 이윤성, 지경호<br>
				 주소 : 대한민국 서울시 구로구 구트아카데미 2층<br>
				 연락처 : 010-2200-7646<br>
				 이메일 : goott@naver.com<br>		 
				 </span>
				 <div class="foot-a-div">
					 <a href="${path }/terms/terms.do">이용약관</a><a href="${path }/terms/privacy.do">개인정보취급방침</a><a href="${path }/notice.do">공지사항</a>
				 </div>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
		</div>
</footer>