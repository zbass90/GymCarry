<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GYM CARRY - Join - Email</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
<link rel="stylesheet" href="${path }/css/registerEmail.css" type="text/css">
</head>
<body>
<header>
	<a href="${path }/"><img src="${path }/resources/logo.png" width="300px" height="200px"/></a>
	<div class="container">
		<div class="row">			
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
			<div class="col-xs-8 col-sm-8 col-md-8">
				<div class="paper">
					<div class="paper-top">
						<span class="paper-fnt">좋아요!</span><br>
						<span class="paper-fnt">지금부터 <b>계정</b>을 만들게요!</span>
					</div>
					<form id="directFrm" action="${path}/user/naverRegister.do" method="post">
						<input type="hidden" name="naverAccessToken" value="${naverUser.naverAccessToken }"/>
						<div class="row form-frm">
							<div class="col-xs-6 col-sm-6 col-md-6 form-frm-left">
								<div class="form-div">
									<label class="form-label" id="id-label" style="display:none;">아이디</label>
									<input class="form-input" type="text" placeholder="아이디" id="userid" name="userid" maxlength="24" autocomplete="off" onblur="idCheck('${path}');" alt="id-label" onkeyup="kuEvent(this);"/>
									<label class="warn-label" id="id-label1" style="display:none">아이디는 영문소문자,숫자로 구성된 6-15자리 입니다.</label>
									<label class="warn-label" id="id-label2" style="display:none">중복된 아이디입니다.</label>
									<label class="succ-label" id="id-label3" style="display:none">사용가능한 아이디입니다.</label>
									<label class="warn-label" id="id-label4" style="display:none">아이디를 입력해주세요.</label>
								</div>
								<div class="form-div">
									<label class="form-label" id="email-label" style="display:none;">이메일</label>
									<input class="form-input" type="text" readonly="readonly" placeholder="이메일" id="naverid" name="naverid" value="${naverUser.naverid }" maxlength="24" autocomplete="off" />
								</div>
								<div class="form-div">
									<label class="form-label" id="name-label" style="display:none;">이름</label>
									<input class="form-input" type="text" placeholder="이름" id="username" name="username" maxlength="24" autocomplete="off" onblur="nameCheck();" alt="name-label" onkeyup="kuEvent(this);"/>
									<label class="warn-label" id="name-label4" style="display:none;">이름을 입력해주세요.</label>
									<label class="warn-label" id="name-label2" style="display:none;">이름은 한글 혹은 영문으로 구성된 0~12자리입니다.</label>
									<label class="succ-label" id="name-label3" style="display:none;">정상적인 이름입니다.	</label>
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 form-frm-right">			
								<div style="margin-bottom: 10px;">
									<strong class="form-strong-fnt">휴대전화번호 인증하기</strong><br>
									<span class="form-span-fnt">전화번호 입력 후 인증문자 발송 버튼을 누르세요.</span><br>
									<span class="form-span-fnt">6자리 인증번호 문자를 보내드릴께요.</span>
								</div>				
								<div class="form-input-tel">
									<label class="form-label" id="phone-label" style="display:none;">휴대전화 번호를 숫자만 입력</label>
									<input class="form-input-tel-in" type="tel" name="userphone" id="userphone" placeholder="휴대전화 번호를 숫자만 입력" maxlength="24" alt="phone-label" onkeyup="kuEvent(this);"/>
									<button type="button">인증문자 발송</button>
								</div>
								<div>
									<div class="form-strong-fnt"><strong>추천인 아이디 입력하기</strong></div>
									<span class="form-span-fnt">소개해 준 분의 아이디를 입력해 주세요.<br> 없다면 비워두셔도 됩니다.</span>
									<div style="margin-top:10px;">
										<label class="form-label" id="present-label" style="display:none;">추천인 아이디</label>
										<input class="form-input" type="text" id="presentid" name="presentid" placeholder="추천인 아이디" alt="present-label" onkeyup="kuEvent(this);"/>
									</div>
								</div>
								<div class="ui card">
									<div class="content">
										<div style="font-size:12px;margin-bottom:10px;"><strong>약관 동의</strong></div>
										<div class="form-strong-fnt2"><input type="checkbox" id="terms0" class="checkbox-mg" onclick="allCheck();"/><b> <span id="chk0" >아래 약관에 모두 동의 합니다.</span></b></div>						
									</div>
									<div class="content">
										<div class="form-span-fnt2"><input type="checkbox" id="terms1" name="terms" class="checkbox-mg"/> <a id="chk1" class="chk" href="${path }/terms/terms.do"><ins>이용약관</ins></a> 동의 (필수)</div>
										<div class="form-span-fnt2"><input type="checkbox" id="terms2" name="terms" class="checkbox-mg"/> <a id="chk2" class="chk" href="${path }/terms/privacy.do"><ins>개인정보취급방침</ins></a>동의 (필수) </div>
										<div class="form-span-fnt2"><input type="checkbox" id="terms3" name="terms" class="checkbox-mg"/> <a id="chk3">마케팅 정보 수신 동의 (선택)</a></div>
										<span class="form-span-fnt3">수신동의 여부 및 설정은 회원정보 수정에서 확인할 수 있습니다.</span>
									</div>
								</div>
								<button type="button" onclick="directSubmit();" class="btn-signup">회원 가입</button>
							</div>					
						</div>	
					</form>	
				</div>				
					<div style="text-align:center;margin-top:20px">
						<img src="${path }/resources/logoct.png" width="70px" height="70px"/>		
					</div>	
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
		</div>
	<!-- check box modal 구현 -->
	<!-- The Modal -->
  <button type="button" class="btn btn-primary" id="modal-btn" hidden="hidden" data-toggle="modal" data-target="#myModal">
   Open modal
  </button>
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">약관 동의</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>        
        <!-- Modal body -->
        <div class="modal-body">
        	필수 약관에 동의해주세요!
        </div>        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>        
      </div>
    </div>
  </div>
	</div>
<script>

let id_error_cnt = 0; 	//id 에러 체크 0=통과, 0<submit 안됨.
let name_error_cnt = 0;

function idCheck(path){	//id 체크
const userid = document.querySelector('#userid').value;
if(userid.search( /^[a-z0-9_]{6,15}$/)){
	$('#id-label2').css('display','none');$('#id-label3').css('display','none');
	$('#id-label1').css('display','block');$('#id-label4').css('display','none');
	id_error_cnt++;
	}else{
		$.ajax({
			async: true,
			type : 'POST',
			data : userid,
			url : path+'/user/idcheck.do',
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
					$('#id-label1').css('display','none');$('#id-label3').css('display','none');$('#id-label4').css('display','none');
					$('#id-label2').css('display','block');id_error_cnt++;
				}else{
					$('#id-label1').css('display','none');$('#id-label2').css('display','none');$('#id-label4').css('display','none');
					$('#id-label3').css('display','block');id_error_cnt=0;
				}
			},
			error : function(error){
				alert('error:'+error);
			}
		});	
	}
}
function nameCheck(){
	const username = document.querySelector('#username').value;
	if(username.length>0 && username.length<12){
		$('#name-label3').css('display','block');$('#name-label4').css('display','none');$('#name-label2').css('display','none');
	}else if(username.length===0){
		$('#name-label4').css('display','block');$('#name-label2').css('display','none');$('#name-label3').css('display','none');
	}else{
		$('#name-label2').css('display','block');$('#name-label4').css('display','none');$('#name-label3').css('display','none');
	}
}

function directSubmit(){ //submit 제어
	let idLength = $('#userid').val().length;
	let nameLength = $('#username').val().length;
	
	let	idDisProp = $('#id-label4').css('display');
	let	nameDisProp = $('#name-label4').css('display');
	
	if(id_error_cnt+name_error_cnt>0){
		return false;
	}else if(idLength===0 && nameLength===0){
			$('#id-label2').css('display','none');$('#id-label3').css('display','none');$('#id-label1').css('display','none');$('#id-label4').css('display','block');
			$('#name-label4').css('display','block');$('#name-label3').css('display','none');$('#name-label2').css('display','none');
			return false;
	}else if(idLength===0 || nameLength===0){
		if(idLength===0){
			label_error('id-label');
		}
		if(nameLength===0){
			label_error('name-label');
		}
		return false;
	}else if(idDisProp==='block' || nameDisProp==='block'){
		return false;
	}else if($('#terms1').prop('checked')===false || $('#terms2').prop('checked')===false){
		$('#modal-btn').trigger('click');
		return false;
	}else{
		alert('회원가입 성공!');
		document.querySelector('#directFrm').submit();
		return true;
	}	
}

function allCheck(){ // 약관 동의 전체 체크 선택/해제
	if($('#terms0').is(':checked')){
		$('input[name=terms]').prop('checked',true);
	}else{
		$('input[name=terms]').prop('checked',false);
	}
}

function kuEvent(c){
	if($('#'+c.id).val().length>0){
		$('#'+c.alt).css('display','block');
	}else{
		$('#'+c.alt).css('display','none');
	}
}

function label_error(tagName){
	for(i=1;i<5;i++){
		if(i===4){
			$('#'+tagName+i).css('display','block');
		}else{
			$('#'+tagName+i).css('display','none');
		}
	}
}
</script>
</header>
<%@ include file="../include/foot.jsp" %>
</body>
</html>