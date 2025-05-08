//document.addEventListener('DOMContentLoaded', function() {});// 이걸 입력하면 자동으로 ajax가 실행됨
    // 여기에 초기화 코드 입력


(function() {
	$(function() {
		// calendar element 취득
		
		console.log(`${certifiList}`);
		
		var calendarEl = $('#calendar')[0];
		// full-calendar 생성하기
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: '700px', // calendar 높이 설정
			expandRows: true, // 화면에 맞게 높이 재설정
			//slotMinTime: '08:00', // Day 캘린더에서 시작 시간
			// slotMaxTime: '20:00', // Day 캘린더에서 종료 시간

			// 해더에 표시할 툴바
			headerToolbar: {
				left: 'prev next today',
				center: 'title',
				right: 'myCustomButton dayGridMonth timeGridWeek' 		  // 스페이스-버튼띄움 ,-붙여서 생성
			},
			initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			//selectable: true, // 달력 셀 선택 활성화
			//editable: true, // 드래그 해서 수정 하는 기능(등록된일정 변경하는것)
			nowIndicator: true, // 현재 시간 마크
			dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			//droppable: true,
			locale: 'ko', // 한국어 설정

			//자격증일정 등록하는 이벤트
			customButtons: {
				myCustomButton: {
					text: "자격증 일정 등록하기",
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
									"certificationName": $("#title").val(),
									"registrationStartDate": $("#start").val(),
									"registrationEndDate": $("#end").val(),
									"calendarBackgroundcolor": $("#color").val(),
								},
								success: function(data) {
									alert("'"+ data.title+"' 이(가) "+"추가되었습니다");

								}
							});

							var eventData = {
								title: $("#title").val(),
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
								// 이벤트 추가
								calendar.addEvent(eventData);
								$("#exampleModal").modal("hide");
								$("#title").val("");
								$("#start").val("");
								$("#end").val("");
								$("#color").val("");
							}
						});// 자격증일정 입력하는 이벤트 끝남
					}
				},
			},


			//클릭된 이벤트 모달에 표시 (수정삭제를 위한 모달창)
			eventClick: function(info) {
				//클릭된 이벤트의 값을 가져와야 하는데 하지만 가져오지 못함(웹상에서는 가져오는거같음)
				$('#addEventModal').modal('show');
				//이부분은 모달창을 클릭하면 자동으로 제목이나 이런것들이 불러와지는것같다.
				$('#title').val(event.titlet);
				$('#start').val(start);
				$('#end').val(info.event.end);
				$('#color').val(color);
				
				var events = new Array(); // Json 데이터를 받기 위한 배열 선언
				var obj = new Object();
				obj.title = info.event.title;
				obj.start = info.event.start;
				obj.end = info.event.end;
				obj.color = info.event.color;
				
				events.push(obj);
				
				console.log(obj);//이거 시간은찍힘 대신 obj를 찍어야 타이틀이나옴

				//console.log(events.title); //이거아님
				//console.log(info.event.titlet);//이것도 아님
				//console.log(info.events.titlet);//이것도 아님(이건 그냥 안나옴)
				//console.log(events.titlet);// 이것도 아님
				//console.log(obj.title);// 이것도 아님
				
				//여기 까지 클릭된이벤트 값을 가져오는곳
				
				$('#certiUpdate').on('click',function(info) {
					$.ajax({
						url: "certifiUpdate.do",//보내는 장소
						type: "POST",
						dataType: "json",
						data: {
							//"" 여기에 들어가는 이름은 vo와 같게 입력해야한다
							"certificationName": $("#title").val(),
							"registrationStartDate": $("#start").val(),
							"registrationEndDate": $("#end").val(),
							"calendarBackgroundcolor": $("#color").val(),
						},
						success: function(data) {
							//info는 object.Object 로 담긴다.
							alert(info+"수정되었습니다.");

						}
					});

					var eventData = {
						title: $("#title").val(),
						start: $("#start").val(obj.start),
						end: $("#end").val(obj.end),
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
						// 이벤트 추가(여기다 입력해보기 1월 2일의 길준희 !!!!!!!!!!!!!!!!!!!!!)
						calendar.addEvent(eventData);
						$("#exampleModal").modal("hide");
						$("#title").val("");
						$("#start").val("");
						$("#end").val("");
						$("#color").val("");
					}
				});
				
				//일정삭제하기 시작
				$('#certifiDelete').click(function() {
				
				    //var docName = $('#title').val(); // 삭제할 이벤트의 고유 ID 가져오기
				    //console.log(docName);
				    if (confirm("'"+info.event.title+'을 삭제하시겠습니까?')) {
						//확인클릭시
						info.event.remove();
						//콘솔에 찍어봄
						console.log(info.event);
						var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                       	var obj = new Object();
                           obj.title = info.event.title;
                           obj.start = info.event.start;
                           obj.end = info.event.end;
                           events.push(obj);

                       console.log(events);
				        //db.collection("events").doc(docName).delete()
							$.ajax({
								url: "certifiDelete.do",//보내는 장소
								type: "POST",
								dataType: "json",
								data: {
									//"" 여기에 들어가는 이름은 vo와 같게 입력해야한다
									"certificationName": $("#title").val(),
									"registrationStartDate": $("#start").val(),
									"registrationEndDate": $("#end").val(),
									"calendarBackgroundcolor": $("#color").val(),
								},
								success: function(data) {
									alert(data.title + "삭제되었습니다.");
								},
							});
				            $('#addEventModal').modal('hide');
				           // calendar.render(); 
				            //resetForm(); // 폼 초기화
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
//			eventSources: [
//				{
//					events: async function(info, successCallback, failureCallback) {
//
//						const eventResult = await axios({
//							method: "POST",
//							url: "certifiList.do",
//						});
//						const eventData = eventResult.data();
//						//이벤트에 넣을 배열 선언하기
//						const eventArray = [];
//
//						events.forEach((res) => {
//							eventArray.push({
//								title: eventData.title,
//								start: eventData.start,
//								end: eventData.end,
//								backgroundColor: eventData.backgroundColor,
//							});
//						});
//						successCallback(eventArray);
//
//					},
//          },
//        ]
		events: [
		          {
		            title: 'All Day Event',
		            start: '2025-01-01',
		          },
		          {
		            title: 'Long Event',
		            start: '2025-01-07',
		            end: '2025-01-10'
		          },
		          {
		            groupId: 999,
		            title: 'Repeating Event',
		            start: '2025-01-09T16:00:00'
		          },
		          {
		            groupId: 999,
		            title: 'Repeating Event',
		            start: '2025-01-16T16:00:00'
		          },
		          {
		            title: 'Conference',
		            start: '2025-01-11',
		            end: '2025-01-13'
		          },
		          {
		            title: 'Meeting',
		            start: '2025-01-12T10:30:00',
		            end: '2025-01-12T12:30:00'
		          },
		          {
		            title: 'Lunch',
		            start: '2025-01-12T12:00:00'
		          },
		          {
		            title: 'Meeting',
		            start: '2025-01-12T14:30:00'
		          },
		          {
		            title: 'Happy Hour',
		            start: '2025-07-12T17:30:00'
		          },
		          {
		            title: 'Dinner',
		            start: '2025-07-12T20:00:00'
		          },
		          {
		            title: 'Birthday Party',
		            start: '2025-07-13T07:00:00'
		          },
		          {
		            title: 'Click for Google',
		            url: 'http://google.com/', // 클릭시 해당 url로 이동
		            start: '2025-07-28'
		          }
		        ]
      });
      calendar.render();
    });
  })();