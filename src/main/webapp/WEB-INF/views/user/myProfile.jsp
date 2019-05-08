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
<title>유저정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->
<link rel="stylesheet" href="${path }/css/myProfile.css" type="text/css">
<%@ include file="../include/menu.jsp" %>
</head>
<body>
<!-- 멋쟁이윤성 -->
<div class="container-fluid">
	<div class="row">
	<div class="col-xs-2 col-sm-2 col-md-2"></div>
	<div class="col-xs-8 col-sm-8 col-md-8">
	<input type="hidden" id="userid" value="${dto.userid }"/>
  <h1>Profile</h1>
  <p style="font-size:18px">${dto.userid} 님의 프로필</p>         
	  <table class="table table-condensed">
	    <tbody>
	      <tr>
	        <td rowspan="4" style="text-align: center;"><img src="${path }/profileImg/images/${dto.userimage}" class="avatar-img" id="preView" name="preView"/></td>
	        <td>아이디 : ${dto.userid }</td>
	        <td>이메일 : <c:if test="${dto.useremail!=null}">${dto.useremail }</c:if><c:if test="${dto.naverid!=null}">${dto.naverid }</c:if></td>
	      </tr>
	      <tr>
	        <td>신장 : ${dto.userheight } cm</td>
	        <td>체중 : ${dto.userweight } kg</td>
	      </tr>
	      <tr>
	        <td>가입목적 : 
	        	<c:if test="${dto.purposeExe eq 'purpose1'}">
	        	 체력과 건강을 위해
	        	 </c:if>
	        	<c:if test="${dto.purposeExe eq 'purpose2'}">
	                         다이어트 , 몸매 관리를위해
	            </c:if>   
	        	<c:if test="${dto.purposeExe eq 'purpose3'}">
	                        스트레스 해소를 위해
	            </c:if>
	        </td>
	        <td>평소운동량 :   <c:if test="${dto.stateExe  eq 'state1'}">
	                        전혀 운동하지 않음
	                        </c:if>
	                        <c:if test="${dto.stateExe eq 'state2'}">
	                        가벼운 운동 (주 1~3일)
	                        </c:if>   
	                        <c:if test="${dto.stateExe eq 'state3'}">
	                        적당한 운동 (주 3~5일)
	                        </c:if>
	                        <c:if test="${dto.stateExe eq 'state4'}">
	                        열심히 운동(주 6~7일)
	                        </c:if>
	                        <c:if test="${dto.stateExe eq 'state5'}">
	                        아주 열심히 운동(매일 2회 이상)
	                        </c:if>
	        </td>
	      </tr>
	      <tr>
	        <td>목표 :  <c:if test="${dto.goalExe  eq 'goal1'}">
	                        1주일에 1kg 감량
	                        </c:if>
	                        <c:if test="${dto.goalExe  eq 'goal2'}">
	                        1주일에 0.5kg 감량
	                        </c:if>
	                        <c:if test="${dto.goalExe  eq 'goal3'}">
	                        1주일에 0.25kg 감량
	                        </c:if>
	                        <c:if test="${dto.goalExe  eq 'goal4'}">
	                      	  현재 체중 유지
	                        </c:if>
	                        <c:if test="${dto.goalExe  eq 'goal5'}">
	                        1주일에 0.25kg 찌우기
	                        </c:if>
	                        <c:if test="${dto.goalExe  eq 'goal6'}">
	                        1주일에 0.5kg 찌우기
	                        </c:if>
	                        <c:if test="${dto.goalExe  eq 'goal7'}">
	                        1주일에 1kg 찌우기
	                        </c:if>
			</td>
	        <td>생년월일 : ${dto.birthDate}</td>
	      </tr>
	      <tr>
	      	<td colspan="3">[Additional Info]</td>
	      </tr>
	      <tr>
	      	<td>
	      	 이름 : ${dto.username  }
	      	</td>
	      	<td>
	      	 휴대폰 : ${dto.userphone  }
	      	</td>
	      	<td>
	      	 성별 : <c:if test="${dto.gender=='male'}">남성 <i class="fas fa-mars"></i></c:if><c:if test="${dto.gender=='female'}">여성 <i class="fas fa-venus"></i></c:if>
	      	</td>
	      </tr>
	      <tr>
	      	<td>
	      	 추천인 : ${dto.presentid}
	      	</td>
	      	<td></td>
	      	<td></td>
	      </tr>
	      <tr>
	      	<td></td>
	      	<td></td>
	      	<td></td>
	      </tr>
	     
	    </tbody>
	  </table>
	<!-- 글수정버튼 --> <button class="ui primary button" data-toggle="modal" data-target="#editModal" style="margin-top:25px;font-family: 'Jua', sans-serif;font-size:16px;background-color:#890422">수정</button>
    <!--개인정보수정버튼 --> <c:if test="${dto.naverid==null }"><button class="ui primary button" data-toggle="modal" data-target="#editModal2" style="margin-top:25px;font-family: 'Jua', sans-serif;font-size:16px;background-color:#890422">개인정보수정</button></c:if>
 	<!-- 글삭제버튼 --> <button class="ui primary button" data-toggle="modal" data-target="#deleteModal" style="margin-top:25px;font-family: 'Jua', sans-serif;font-size:16px;background-color:#890422">탈퇴</button>
	  </div>
	  <div class="col-xs-2 col-sm-2 col-md-2"></div>
	</div>
  <div>
  </div>
   <!-- Edit Modal -->
	      <div class="modal fade" id="editModal" role="dialog">
	  	 	<div class="modal-dialog">	
		      <div class="modal-content edit_modal">
		        <div class="modal-header">
		          <h4 class="modal-title">Profile Edit</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		        <div class="row img-div">
		        	<div class="col-xs-4 col-sm-4 col-md-4"></div>
		        	<div class="col-xs-4 col-sm-4 col-md-4">
		        		<img src="${path }/profileImg/images/${dto.userimage}" class="avatar-img" id="preView-modal" name="preView-modal"/><br>
		        		<input hidden="" type="file" id="file-btn"/>
		        	</div>
		        	<div class="col-xs-4 col-sm-4 col-md-4"></div>
		        </div>	
		        <div class="row img-div">
		        	<div class="col-xs-4 col-sm-4 col-md-4"></div>
		        	<div class="col-xs-4 col-sm-4 col-md-4">
		        		<label class="warn-label" id="img-label" style="display:none">확장자는 이미지 확장자만 가능합니다! 다시 업로드해주세요!</label>
		        		<label class="succ-label" id="img-label2" style="display:none">사용가능한 이미지 확장자입니다.</label>
		        	</div>
		        	<div class="col-xs-4 col-sm-4 col-md-4"></div>
		        </div>
		     	 <form action="${path}/user/myProfileEdit.do" method="post" id="mpEdit">	        	
		        	<label class="label-fnt">생일</label>	
						<div class="birthFrm frm-div row">
							<div class="col-xs-4 col-sm-4 col-md-4">
								<select class="ui dropdown frm-sel2" name="birthYear">
								  <c:forEach var="i" begin="1930" end="2019" step="1">
								  	<option value="${i}"<c:if test="${i==dto.birthYear }"> selected</c:if><c:if test="${dto.birthYear==null && i==1990}">selected</c:if>>${i }</option>
								  </c:forEach>
								</select>
							</div>
							<div class="col-xs-4 col-sm-4 col-md-4">
								<select class="ui dropdown frm-sel2" name="birthMonth">
								  <c:forEach var="i" begin="1" end="12" step="1">
								  	<option value="${i}" <c:if test="${i==dto.birthMonth }"> selected</c:if>>${i }</option>
								  </c:forEach>
								</select>
							</div>
							<div class="col-xs-4 col-sm-4 col-md-4">
								<select class="ui dropdown frm-sel2" name="birthDay">
								  <c:forEach var="i" begin="1" end="31" step="1">
								  	<option value="${i}" <c:if test="${i==dto.birthDay }"> selected</c:if>>${i }</option>
								  </c:forEach>
								</select>
							</div>
						</div>
						<div class="genderFrm frm-div">
							<label class="label-fnt">성별</label><br>
							<select class="ui dropdown frm-sel" name="gender">
							  	<option value="male" <c:if test="${dto.gender=='male'}">selected</c:if>>남성</option>
							  	<option value="female" <c:if test="${dto.gender=='female'}">selected</c:if>>여성</option>
							</select>
						</div>
						<div class="row physicalFrm frm-div">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<label class="label-fnt">키</label><br>
								<div class="ui right labeled input frm-div2">
								  <input type="text" name="userheight" value="${dto.userheight }" autocomplete="off" placeholder="키를 입력하세요">
								  <div class="ui basic label">
								    cm
								  </div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<label class="label-fnt">몸무게</label><br>
								<div class="ui right labeled input frm-div2">
								  <input type="text" name="userweight" value="${dto.userweight }" autocomplete="off" placeholder="몸무게를 입력하세요">
								  <div class="ui basic label">
								    kg
								  </div>
								</div>
							</div>
						</div>
						<div class="frm-div">
							<label class="label-fnt">왜 운동하시나요?</label><br>									
							<select class="ui dropdown frm-sel" name="purposeExe">
							  	<option value="purpose1" <c:if test="${dto.purposeExe=='purpose1' }">selected</c:if>>체력과 건강을 위해</option>
							  	<option value="purpose2" <c:if test="${dto.purposeExe=='purpose2' }">selected</c:if>>다이어트, 몸매관리를 위해</option>
							  	<option value="purpose3" <c:if test="${dto.purposeExe=='purpose3' }">selected</c:if>>스트레스 해소를 위해</option>
							  	<option value="purpose4" <c:if test="${dto.purposeExe=='purpose4' }">selected</c:if>>기타</option>
							</select>
						</div>
						<div class="frm-div">
							<label class="label-fnt">평소에 얼마나 운동하시나요?</label><br>									
							<select class="ui dropdown frm-sel" name="stateExe">
							  	<option value="state1" <c:if test="${dto.stateExe=='state1' }">selected</c:if>>전혀 운동하지 않음</option>
							  	<option value="state2" <c:if test="${dto.stateExe=='state2' }">selected</c:if>>가벼운 운동 (주1~3일)</option>
							  	<option value="state3" <c:if test="${dto.stateExe=='state3' }">selected</c:if>>적당한 운동 (주3~5일)</option>
							  	<option value="state4" <c:if test="${dto.stateExe=='state4' }">selected</c:if>>열심히 운동 (주6~7일)</option>
							  	<option value="state5" <c:if test="${dto.stateExe=='state5' }">selected</c:if>>아주 열심히 운동 (매일 2회이상)</option>
							</select>
						</div>
						<div class="frm-div">
							<label class="label-fnt">목표 체중이 어떻게 되세요?</label><br>									
							<select class="ui dropdown frm-sel" name="goalExe">
							  	<option value="goal1" <c:if test="${dto.goalExe=='goal1' }">selected</c:if>>일주일에 1kg 감량</option>
							  	<option value="goal2" <c:if test="${dto.goalExe=='goal2' }">selected</c:if>>일주일에 0.5kg 감량</option>
							  	<option value="goal3" <c:if test="${dto.goalExe=='goal3' }">selected</c:if>>일주일에 0.25kg 감량</option>
							  	<option value="goal4" <c:if test="${dto.goalExe=='goal4' }">selected</c:if>>현재 체중 유지</option>									  	
							  	<option value="goal5" <c:if test="${dto.goalExe=='goal5' }">selected</c:if>>일주일에 0.25kg 찌우기</option>
							  	<option value="goal6" <c:if test="${dto.goalExe=='goal6' }">selected</c:if>>일주일에 0.5kg 찌우기</option>
							  	<option value="goal7" <c:if test="${dto.goalExe=='goal7' }">selected</c:if>>일주일에 1kg 찌우기</option>
							</select>
						</div>
					</form>
		      	  </div>
		        <div class="modal-footer">
		        	<button type="button" id="fake-btn" class="btn btn-default sub-btn">Edit</button>
		         	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		     </div>
	      </div>
	      <!-- 개인정보수정모달 -->
	       <div class="modal fade" id="editModal2" role="dialog">
	   		<div class="modal-dialog">
		      <div class="modal-content">
		      	<form action="${path}/user/userEdit.do" method="post">		      		
		      		<div class="modal-header">
		      			<div class="modal-title">Password edit</div>
		      		</div>
			        <div class="modal-body">
			        	<div></div>
			        </div>
			        <div class="modal-footer">
				       <input type="submit" value="가입수정완료" class="btn btn-default sub-btn"/>
				       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				    </div>
		        </form>
		      </div>
	   	 	</div>
	 	 </div>
	      <!-- 삭제모달 -->
	      <div class="modal fade" id="deleteModal" role="dialog">
	   		<div class="modal-dialog">
		      <div class="modal-content">
		      	<form action="${path}/user/delete.do" method="post">
			        <div class="modal-body">
			        	<div>정말로 탈퇴하시겠습니까?</div>
			        </div>
			        <div class="modal-footer">
				       <input type="submit" value="탈퇴" class="btn btn-default sub-btn"/>
				       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				    </div>
		        </form>
		      </div>
	   	 	</div>
	 	 </div>
</div>
	<footer class="foot container-fluid">
		<div class="row">			
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
			<div class="col-xs-8 col-sm-8 col-md-8">
				 <div class="">
				 	<a href="${path }/"><img src="${path }/resources/logo-string.png" width="140" height="20" class="img-a"/></a><br><br>
				 </div>
				 <span class="foot-span-fnt"><b>© 2019~ GYM CARRY.</b><br><br>
				 (주)짐캐리 대표이사: 강휘 / 공동대표: 정연택, 이윤성, 지경호<br>
				 주소: 대한민국 서울시 구로구 구트아카데미 2층<br>
				 연락처:010-2200-7646<br>
				 이메일: goott@naver.com<br>		 
				 </span>
				 <div class="foot-a-div">
					 <a href="${path }/terms/terms.do">이용약관</a><a href="${path }/terms/privacy.do">개인정보취급방침</a><a href="${path }/notice.do">공지사항</a>
				 </div>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2"></div>
		</div>
	</footer>
<script>

	let img_error_cnt=0;
	let sel_file;
 	function fileUpload(e){
 		e.preventDefault();
 		let files = e.target.files;
 		let filesArr = Array.prototype.slice.call(files);
 		filesArr.forEach(function(f){
 	 		if(!f.type.match("image.*")){
 	 			$('#img-label').css('display','block');$('#img-label2').css('display','none');
 	 			img_error_cnt++;
 	 			return;
 	 		}else{	 		
	 	 		sel_file = f;
	 	 		
	 	 		let reader = new FileReader();
	 	 		reader.onload = function(e){
	 	 			$('#preView-modal').attr('src',e.target.result);
	 	 		}
	 	 		reader.readAsDataURL(f);
	 	 		
	 	 		let file = files[0];
	 	 		//ajax로 전달할 폼 객체
	 	 		let formData = new FormData();
	 	 		formData.append('file',file);
	 	 		let userid = $('#userid').val();
	 			formData.append('userid',userid);
	 	 		//processData: false => post방식
	 	 		//contentType: false => multipart/form-data
	 	 		$.ajax({
	 	 			type: 'POST',
	 	 			url: path()+'/user/changePImg.do',
	 	 			data: formData,
	 	 			dataType: 'text',
	 	 			processData: false,
	 	 			contentType: false,
	 	 			success: function(data){
	 	 				$('#img-label2').css('display','block');$('#img-label').css('display','none');
	 	 				img_error_cnt=0;
	 	 			}
	 	 		});  
 	 		}
 		}); 	
 		
 	}
 	function path() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
 	

	$(function(){
		$('#fake-btn').click(function(){
			if(img_error_cnt>0){
				return false;
			}else{
				$('#mpEdit').submit();
			}
		});
		
		$('#preView-modal').click(function(){
			$('#file-btn').click();
		});
		$('#file-btn').on('change',fileUpload);
	});
</script>
</body>
</html>