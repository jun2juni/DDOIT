<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset='UTF-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <!-- axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 부트스트랩CDN -->
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"
  ></script>
  <!-- 부트스트랩CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
    
<%-- <script src="${pageContext.request.contextPath}/js/certification.js"></script> --%>
<script type="text/javascript">
//document.addEventListener('DOMContentLoaded', function() {});// 이걸 입력하면 자동으로 ajax가 실행됨
// 여기에 초기화 코드 입력
var infoCur;

(function() {
$(function() {
	
	//이부분이 있어야 삭제처리됨... 왜 있어야 하는지는 모르겠음
	  if (document.activeElement) {
         document.activeElement.blur();
     } 
	//certifiList 에 담은것
	//console.log(`${certifiList}`);
	// calendar element 취득
	var calendarEl = $('#calendar')[0];
	// full-calendar 생성하기
	var calendar = new FullCalendar.Calendar(calendarEl, {
		height: '800px', // calendar 높이 설정
		expandRows: true, // 화면에 맞게 높이 재설정
		//slotMinTime: '08:00', // Day 캘린더에서 시작 시간
		// slotMaxTime: '20:00', // Day 캘린더에서 종료 시간


		// 해더에 표시할 툴바
		headerToolbar: {

			left: 'myCustomButton today',
			center: 'title',
			right: 'prev dayGridMonth timeGridWeek next' 		  // 스페이스-버튼띄움 ,-붙여서 생성
		},
		initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		//selectable: true, // 달력 셀 선택 활성화
		//editable: true, // 드래그 해서 수정 하는 기능(등록된일정 변경하는것)
		nowIndicator: true, // 현재 시간 마크
		dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		//droppable: true,
		locale: 'ko', // 한국어 설정

		//자격증일정 등록하는 이벤트
		customButtons: {
			myCustomButton: {
				text: "일정 등록하기",
				click: function() {
					//부트스트랩 모달 열기
					$("#exampleModal").modal("show");
					//java 쌤이랑 완성한 부분(!!!!중요!!!!!!)
					//모달창 이벤트   (여기서 데이터를 보내주는곳)  ''안에 들어간 것은  button 의 id 이
					$("#saveChanges").on("click", function() {
						//이거 옮김 저장하기 버튼에 주는 이벤트
						//certification.do 로 전송해주는 ajax 
						$.ajax({
							url: "certification.do",//보내는 장소
							type: "POST",
							dataType: "json",
							data: {
								//"" 여기에 들어가는 이름은 vo와 같게 입력해야한다
								"certificationNo": $("#no").val(),
								"certificationName": $("#title").val(),
								"groupId":$("#groupId").val(),
								"registrationStartDate": $("#start").val(),
								"registrationEndDate": $("#end").val(),
								"calendarBackgroundcolor": $("#color").val(),
							},
							success: function(data) {
// 								alert("'"+ data.title+"' 이(가) "+"추가되었습니다");
 								location.href ="certification.do";
							}
						});
						//이거는 캘린더에 뿌려지기위해서 있어야되는거 주석처리시 모달창이 닫히지 않고 캘린더의 변화된 모습이 표시되지 않음
						var eventData = {
							No: $("#no").val(),
							title: $("#title").val(),
							institution: $("#groupId").val(),
							start: $("#start").val(),
							end: $("#end").val(),
							color: $("#color").val(),
							
						}; 
						//빈값입력시 오류
						if (
							eventData.title == "" ||
							eventData.start == "" ||
							eventData.end == ""
						) {
							alert("입력하지 않은 값이 있습니다.");

							//끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
						} else if ($("#start").val() > $("#end").val()) {
							alert("시간을 잘못입력 하셨습니다.");
						} else {
							// 일정 추가되는 포맷
							calendar.addEvent(eventData);
							$("#exampleModal").modal("hide");
							$("#no").val("");
							$("#title").val("");
							$("#groupId").val("");
							$("#start").val("");
							$("#end").val("");
							$("#color").val("");
						}
						console.log("eventData.no  "+eventData.no);
						console.log("eventData.title  "+eventData.title);
						//alert("'"+eventData.title+"' 이(가) "+"등록되었습니다");
					});// 자격증일정 입력하는 이벤트 끝남
				}
			},
		},


		//클릭된 이벤트 모달에 표시 (수정삭제를 위한 모달창)
		eventClick: function(info) {
			// 클릭된 이벤트에서 수정과 삭제가 이루어지기때문에 infoCur를 전역변수를 선언하고, 수정,삭제가 각각 이루어진다.
			infoCur = info;
			//클릭된 이벤트의 값을 가져와야 하는데 하지만 가져오지 못함(웹상에서는 가져오는거같음)
			$('#addEventModal').modal('show');
			
			
			var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			var obj = new Object();
			obj.no = info.event.id;
			obj.title = info.event.title;
			obj.groupId = info.event.groupId;
			obj.start = info.event.startStr;
			obj.end = info.event.endStr;
			obj.color = info.event.backgroundColor;//이건 calendarBackgroundcolor임  그래야 가져와짐(콘솔에 찍힘)
			
			//클릭된 이벤트 값을 가져오는곳
			//모달창을 클릭하면 모달창#(아이디)에 값이 들어가게 만들어주는 곳
			$('#addTitle').val(info.event.title);
			$('#addGroupId').val(info.event.groupId);
			$('#addStart').val(info.event.startStr.replace("+09:00",""));
			$('#addEnd').val(info.event.endStr.replace("+09:00",""));
			$('#addColor').val(info.event.backgroundColor).prop("selected",true);
			
			events.push(obj);
			
			console.log("click event obj : ");//이거 시간은찍힘 대신 obj를 찍어야 타이틀이나옴
			console.log(obj);//여기까지 찍힘 
			
			//클릭된 이벤트 수정하는로직은 따로function으로 빼서 사용한다. 맨아래로 이동하시길
			
			
			
			//여기 까지 클릭된이벤트 값을 가져오는곳
			//수정버튼을 누르면 시작되는곳
// 			$('#certiUpdate').on('click',function() {
// 				$.ajax({
// 					url: "certifiUpdate.do",//보내는 장소
// 					type: "POST",
// 					dataType: "json",
// 					data: {
// 						//"" 여기에 들어가는 이름은 vo와 같게 입력해야한다
// 						"certificationNo": info.event.id,
// 						"certificationName": $("#addTitle").val(),
// 						"groupId":$("#addGroupId").val(),
// 						"registrationStartDate": $("#addStart").val(),
// 						"registrationEndDate": $("#addEnd").val(),
// 						"calendarBackgroundcolor": $("#addColor").val(),
// 					},
// 					success: function(data) {
						
// 						//info는 object.Object 로 담긴다.
// 						alert("'"+obj.title+"' 이(가) "+"수정되었습니다");
// 						console.log("info.event.id"+ info.event.id);
// 						console.log("obj.title: "+obj.title);
// 						//console.log(data.groupId);

// 					}
// 				});

// 				var eventData = {
// 					No: $("#no").val(),
// 					title: $("#addTitle").val(),
// 					groupId: $("#addGroupId").val(),
// 					start: $("#addStart").val(),
// 					end: $("#addEnd").val(),
// 					color: $("#addColor").val(),
// 				};
// 				//console.log("eventData : ");
// 				console.log("obj.title : "+obj.title);
// 				console.log();
				
// 				//빈값입력시 오류
// 				if (
// 					eventData.title == "" ||
// 					eventData.start == "" ||
// 					eventData.end == ""
// 				) {
// 					alert("입력하지 않은 값이 있습니다.");

// 					//끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
// 				} else if ($("#start").val() > $("#end").val()) {
// 					alert("시간을 잘못입력 하셨습니다.");
// 				} else {
// 					// 이벤트 추가(여기다 입력해보기 1월 2일의 길준희 !!!!!!!!!!!!!!!!!!!!!)
					
// 					calendar.addEvent(eventData);
// 					$("#addEventModal").modal("hide");
// 					$("#no").val("");
// 					$("#addTitle").val("");
// 					$("#addGroupId").val("");
// 					$("#addStart").val("");
// 					$("#addEnd").val("");
// 					$("#addColor").val("");
// 					//저장클릭시 해당 이벤트가 삭제됨
// 					info.event.remove();
// 				}
// 					 //calendar.unselect();
// 			});
			
// 			update(info);
			
			
			//동기방식으로 실행됨 
			//일정삭제하기 시작
			$('#certifiDelete').click(function() {
			
			    //var docName = $('#title').val(); // 삭제할 이벤트의 고유 ID 가져오기
			    //console.log(docName);
			    if (confirm("'"+info.event.title+'을 삭제하시겠습니까?')) {
					//확인클릭시 해당 이벤트가 삭제됨
					info.event.remove();
					//콘솔에 찍어봄(삭제되는 이벤트)
					console.log(info.event);
					
					var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                   	var obj = new Object();
                   	   obj.no = info.event.id;
                       obj.title = info.event.title;
                       obj.groupId = info.event.groupId;
                       obj.start = info.event.start;
                       obj.end = info.event.end;
                       events.push(obj);

                   console.log("events : "+events);
                   
                   
                   
			        //db.collection("events").doc(docName).delete()
			        //삭제는 되는데 쿼리가 안날라간다.
						$.ajax({
							url: "certifiDelete.do",//보내는 장소
							//method: "DELETE",
							type: "POST",
							dataType: "json",
							//삭제되는 부분인데.해당 자격증번호를 받아서 삭제처리 해야됨
							data: {
								"certificationNo" : info.event.id
							},
							//contentType: 'application/json',
							success: function(data) {
								alert(obj.title + "삭제되었습니다.");
								location.href ="certification.do";
							},
							error:function(data){
								alert(obj.title+"삭제 실패되었습니다.");
							}
						});
                   
			            $('#addEventModal').modal('hide');
			            //alert("삭제가 완료되었습니다.")
			           // calendar.render(); 
			    }
			    
			});//일정삭제하기 닫힘
		}, 
		
		
		
		
		
		
		
		
		
eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
  console.log(obj);
},
eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
  console.log(obj);
},
eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
  console.log(obj);
},
			  	
	//이곳에서 DB와 연동을 하는것 같은데 어떻게 하는지 모르겟음, 아직 DB의 값이 캘린더에 표시 되지 않음
    //데이터 가져오는 이벤트
	events: [
		<c:forEach var="event" items="${certifiList}">
		{
            id: '${event.certificationNo}',
            title: '${event.certificationName}',
            groupId: '${event.institution}',
            start: '${event.registrationStartDate}',
            end: '${event.registrationEndDate}',
            color: '${event.calendarBackgroundcolor}'
          },
		</c:forEach>
	    ]
  });
  calendar.render();
});
})();

//수정을 아작스로 보내는 로직 
function update() {
	$.ajax({
		url: "certifiUpdate.do",//보내는 장소
		type: "POST",
		dataType: "json",
		data: {
			//"" 여기에 들어가는 이름은 vo와 같게 입력해야한다  
			//(여기 큰따옴표에 들어가는 값은 컨트롤러에서 파라미터로 값을 보내기 때문에 컨트롤러에서도 해당이름을 넣어야된다.)
			"certificationNo": infoCur.event.id,
			"certificationName": $("#addTitle").val(),
			"groupId":$("#addGroupId").val(),
			"registrationStartDate": $("#addStart").val(),
			"registrationEndDate": $("#addEnd").val(),
			"calendarBackgroundcolor": $("#addColor").val(),
		},
		success: function(data) {
			
			//info는 object.Object 로 담긴다.
			alert("'"+$("#addTitle").val()+"' 이(가) "+"수정되었습니다");
// 			console.log("info.event.id"+ info.event.id);
// 			console.log("obj.title: "+obj.title);
			//console.log(data.groupId);
			location.href ="certification.do";

		}
	});
}


</script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/chat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/certification.css">
<title>자격증일정목록</title>
</head>
<body style="padding:30px;">
  <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
     
      
    <!-- 등록 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">자격증 일정 등록하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="eventForm">
					
					<div class="mb-3">
						<label for="title" class="form-label">자격증 이름</label>
						<input type="text" class="form-control" id="title" >
					</div>
					<div class="mb-3">
						<label for="groupId" class="form-label">시행기관</label>
						<input type="text" class="form-control" id="groupId" >
					</div>
					
					<div class="mb-3">
                        <label for="start" class="form-label">시험(접수)시작일시</label>
                        <input type="datetime-local" class="form-control" id="start">
                    </div>
					<div class="mb-3">
                        <label for="end" class="form-label">시험(접수)마감일시</label>
                        <input type="datetime-local" class="form-control" id="end">
                    </div>
                    
						<div class="mb-3">
                        <label for="color" class="form-label">배경색상</label> 
                        <select id="color" class="form-control">
								<option value="red">빨강색</option>
								<option value="orange">주황색</option>
								<option value="green">초록색</option>
								<option value="blue">파랑색</option>
								<option value="indigo">남색</option>
								<option value="purple">보라색</option>
							</select> 
                    </div>
				</div>
					</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="saveChanges">	추가</button>
				</div>
			</div>
		</div>
	</div>

<!-- 수정 모달 -->
<div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addEventModalLabel">자격증일정 수정(삭제)</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="eventForm">
                    <div class="mb-3">
                        <label for="title" class="form-label">자격증명</label>
                        <input type="text" class="form-control" id="addTitle" required>
                    </div>
                    
                    <div class="mb-3">
						<label for="groupId" class="form-label">시행기관</label>
						<input type="text" class="form-control" id="addGroupId" >
					</div>
                   
                    <div class="mb-3">
                        <label for="start" class="form-label">시험(접수)시작일시</label>
                        <input type="datetime-local" class="form-control" id="addStart" required value="${registrationStartDate}">
                    </div>
                    
                    <div class="mb-3">
                        <label for="end" class="form-label">시험(접수)마감일시</label>
                        <input type="datetime-local" class="form-control" id="addEnd" required value="${registrationStartDate}">
                    </div>
                    
                     <div class="mb-3">
                        <label for="color" class="form-label">배경색상</label> 
                        <select id="addColor" class="form-control">
								<option value="red">빨강색</option>
								<option value="orange">주황색</option>
								<option value="green">초록색</option>
								<option value="blue">파랑색</option>
								<option value="indigo">남색</option>
								<option value="purple">보라색</option>
							</select> 
                    </div>
                    
                    <button type="button" id="certifiDelete" class="btn btn-danger">삭제</button>
                    <button type="button" id="certiUpdate" class="btn btn-primary" onclick="update()">저장</button>
                    <button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">취소</button>
                </form>
            </div>
        </div>
    </div>
</div><%--  모달 닫음 --%>

</body>
</html>