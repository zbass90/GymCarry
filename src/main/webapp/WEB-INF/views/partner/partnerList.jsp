<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커에 인포윈도우 표시하기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"   integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet"> <!-- 구글폰트 -->    
<style type="text/css">
	*{font-family: 'Jua', sans-serif; }
	
	.transition.visible{
		overflow-x:scroll;
		overflow-y:hidden;
	}
	.ui.styled.accordion.items:hover{
		background-color:#890422;
	}

</style>
</head>
<%@ include file="../include/menu.jsp" %>
<body onscroll="moveModal()">

<div class="ui placeholder segment">
 <div class="ui two column very relaxed stackable grid">
	<div class="column" style="width:30%;height:730px;overflow:scroll;padding-right:0px;padding-left:1.5%;" >
		<div>
			<form action="${path }/partner/locationApply" id="locationApplyForm">
				<input class="ui inverted red button" type="submit" value="내위치 등록" style="width:100%"/>				
			</form>
		</div>
		<!-- 왼쪽 리스트 -->
		<div class="ui middle aligned animated list">
			
			<c:forEach var="dto" items="${list}">
			<c:if test="${dto.userLat!=null }">
				<div class="ui styled accordion items" onClick="partnerClickEvent(${dto.userno})" style="width:95%;margin:3%" >
					<div class="ui title item">						
						<!-- <i class="dropdown icon"></i> -->
						<div class="image">
							<c:if test="${dto.userimage==null }">
								<img src="${path }/resources/profile.png" style="width:100%;height:100%"/>
							</c:if>
							<c:if test="${dto.userimage!=null }">
								<img src="${path }/profileImg/images/${dto.userimage}" style="width:100%;height:100%"/>
							</c:if>
							
						</div>									
						<div class="content">
							<div class="header">${dto.username}</div>
							<div class="meta">${dto.gender}</div>
							<div class="meta">${dto.useremail}</div>
						</div>					

					</div>
				
					<!-- dropdown -->
					<div class="content">
						<div class="transition hidden" style="width:100%;">				
						<c:forEach var="comDto" items="${comList}">
							<c:if test="${dto.userid == comDto.userid}">
								<img src="${path }/community/images/${comDto.comImage}" style="width:25%;height:130px;float:left;margin-left:10px;margin-bottom:10px; border-radius:12px"/>
							</c:if>
						</c:forEach>
						</div>		
					</div>
				</div>
			</c:if>
			</c:forEach>

		</div>
			
		
	</div>
	
	<!-- 우측하단 모달 -->
	<div class="top aligned column" style="width:70%;padding-left:0px;">
		<div id="map" style="width:100%;height:700px;"></div>
		<c:forEach var="dto" items="${list}">
			<div style="width:25%;position:absolute;bottom:160px;right:70px;z-index:3;display:none" class="modal modal${dto.userno}">
				<div class="ui card">
					<div class="image" style="height:30%">
							<c:if test="${dto.userimage==null }">
								<img src="${path }/resources/profile.png" style="width:100%;height:100%"/>
							</c:if>
							<c:if test="${dto.userimage!=null }">
								<img src="${path }/profileImg/images/${dto.userimage}" style="width:100%;height:100%"/>
							</c:if>
					</div>
					<div class="content">
						<div class="right floated" onClick="closeModal(${dto.userno})">
							<button class="ui inverted red button">X</button>
						</div>						
						<a class="header">${dto.userid}</a>
						<div class="meta">${dto.gender} / ${dto.useremail}</div>
					</div>
					<div class="extra content">
						
							<p class="header">운동목적 : </p>
							<div class="description">
								<c:if test="${dto.purposeExe eq 'purpose1'}">
								체력과 건강을 위해
								</c:if>
								<c:if test="${dto.purposeExe eq 'purpose2'}">
								다이어트 , 몸매 관리를위해
								</c:if>	
								<c:if test="${dto.purposeExe eq 'purpose3'}">
								스트레스 해소를 위해
								</c:if>
							</div>
							<p class="header">평소 운동량 : </p>
							<div class="description">
								<c:if test="${dto.stateExe  eq 'state1'}">
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
							</div>
							<p class="header">목표 체중 : </p>				
							<div class="description">
								<c:if test="${dto.goalExe  eq 'goal1'}">
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
							</div>
					</div>
					
				</div>		
			</div>
		</c:forEach>
		
		
	</div>
	
	 <div class="ui vertical divider"></div>
  </div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2e4394625f5dca9ab561d855a1aa6f1"></script>

<script>
	//
	let userLat =0;
	let userLong = 0;
	let partnersLat =0;
	let partnersLong = 0;
	let partnersId ="";
	let list ="${list}";
	list = list.split("UserDTO");
	let locationArr = [];
	
	let infowindow ="";
	
	for(let i =1; i<list.length;i++){
		//"37.ddd,...."
		partnersLat = list[i].substr(list[i].indexOf("userLat=")+8);
		partnersLat = partnersLat.substr(0,partnersLat.indexOf(","))
		//console.log(partnersLat);
		partnersLong = list[i].substr(list[i].indexOf("userLong=")+9);
		partnersLong = partnersLong.substr(0,partnersLong.indexOf("]"))
		//console.log(partnersLong);
		partnersId = list[i].substr(list[i].indexOf("userno=")+7);
		partnersId = partnersId.substr(0,partnersId.indexOf(","));
		
		if(partnersLat!=="null" && partnersLong!=="null"){
			locationArr.push([partnersLat,partnersLong,partnersId])
		}
		
		
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌s표
	        level: 3 // 지도의 확대 레벨
	    };
	//지도 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	

	function setUsersMarker(){
		locationArr.map(function(val,idx){
			//위도 , 경도 , 유저번호가 들어감
			let markerPosition = new daum.maps.LatLng(val[0],val[1]);
			//let markerIcon = new daum.maps.MarkerImage("${path}/resources/db.png");
			var icon = new daum.maps.MarkerImage(
			        '${path}/resources/dumbellmarker.png',
			        new daum.maps.Size(41, 45));
			let marker = new daum.maps.Marker({
				position:markerPosition,
				image :icon,
				clickable:true
			})
			marker.setMap(map);	
			daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
				partnerClickEvent(val[2])
			});
			daum.maps.event.addListener(marker,'mouseover',function(){
				let newIcon = new daum.maps.MarkerImage(
				        '${path}/resources/dumbellmouse.png',
				        new daum.maps.Size(81, 85));
				marker.setImage(newIcon);
				
			});
			daum.maps.event.addListener(marker,'mouseout',function(){
				marker.setImage(icon);
			});

		});
	}
	
	
	function partnerClickEvent(partnerNo){
		partnerNo = partnerNo+"";
		let allModals=document.querySelectorAll('.modal')
		allModals.forEach((val)=>{
			val.style.display="none"
		})
		
		document.querySelector(".modal"+partnerNo).style.display="block";
		let clickedLat = 0;
		let clickedLong = 0;
		locationArr.map((value)=>{
			if(value[2]===partnerNo){
				clickedLat = value[0];
				clickedLong = value[1];
			}
		
		})
		let targetLatLng = new daum.maps.LatLng(clickedLat,clickedLong);
		map.setCenter(targetLatLng)
		targetInfo(clickedLat,clickedLong,targetLatLng)
	}
	


	//클릭한거 윈도우 띄워주기
	function targetInfo(targetLat,targetLong,LatLng){
		infowindow.close();

		let iwContent = '<div style="padding:5px;"><div><p class="ui red ribbon label">상대방의 위치</p></div><a class="ui inverted red button" href="http://map.daum.net/link/map/Hello World!,'+targetLat+","+targetLong+'" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,'+targetLat+","+targetLong+'"  class="ui inverted red button" target="_blank">길찾기</a></div>',
		iwPosition = LatLng;
		
		infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent,
		    removable : true
		});

		let marker = new daum.maps.Marker({
			position : iwPosition
		})
		infowindow.open(map, marker); 
	}

	


	function getLocation(){
		navigator.geolocation.getCurrentPosition(function(pos){
			userLat = pos.coords.latitude;
			userLong = pos.coords.longitude;
			const applyForm= document.querySelector("#locationApplyForm")
			applyForm.innerHTML +=  "<input type='hidden' value='"+userLat+"' name='userLat'/><input type='hidden' value='"+userLong+"' name='userLong'/>"
			//alert(userLat+":"+userLong);
			function setCenter() {            
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new daum.maps.LatLng(33.450580, 126.574942);			    
			    // 지도 중심을 이동 시킵니다
			    map.setCenter(moveLatLon);
			}
			
			function panTo() {
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new daum.maps.LatLng(userLat, userLong);
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(moveLatLon);            
			} 
			setCenter();
			panTo();			
			setMarker();
			
		});
	}
	
	function setMarker(){
		// 마커가 표시될 위치입니다 
		if(userLat!==0){
			var markerPosition  = new daum.maps.LatLng(userLat, userLong); 
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		}
		var iwContent = '<div style="padding:5px;">나의 위치</div>',
	    iwPosition = new daum.maps.LatLng(userLat, userLong); //인포윈도우 표시 위치입니다
	
		// 인포윈도우를 생성합니다
		infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 

	}
	
	const closeModal = (num) =>{
		document.querySelector(".modal"+num).style.display ="none";
	}
	
	function init(){
		getLocation();
		setUsersMarker();

	}
	init();
	$(function(){
		$('.ui.accordion')
		  .accordion()
		;
	})
	
	const moveModal = () =>{
		let positionY = 160 - window.scrollY;
		positionY = positionY+"px";
		let allModal = document.querySelectorAll(".modal");
		allModal.forEach((val)=>{
			val.style.bottom = positionY
		});
		
		
	}
	
</script>
</body>
</html>