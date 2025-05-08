<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/planner2.css">
<!-- 부트스트랩css -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"> -->
<title>스터디플래너</title>
<script>
 let totalHours = 0;
        let currentDate = new Date();

        window.onload= function(){
            updateDateDisplay();
        }
        
        function toggleTimeSlot(slot) {
            if (slot.classList.contains('selected')) {
                slot.classList.remove('selected');
                totalHours -= 0.17;
            } else {
                slot.classList.add('selected');
                totalHours += 0.17;
            }
            document.getElementById('total-hours').textContent = `총 공부 시간: ${totalHours.toFixed(2)}시간`;
        }

        function changeDate(offset) {
            currentDate.setDate(currentDate.getDate() + offset);
            updateDateDisplay();
        }

        function updateDateDisplay() {
            const options = { year: 'numeric', month: '2-digit', day: '2-digit', weekday: 'short' };
            document.getElementById('date-display').textContent = currentDate.toLocaleDateString('ko-KR', options);
        }


     // 모달 관련 로직
        function openModal() {
            document.getElementById('subject-modal').style.display = 'block';
            loadSubjects();
        }

        function closeModal() {
            document.getElementById('subject-modal').style.display = 'none';
        }
        
        
        
        
        function sendProc(){

             //날짜 값 
                vdata= $('#date-display').text();

               console.log(vdata);


                //클래스의 값 얻ㄱ; 
                $('.time-table div.selected').each(function(i,v){
                	
                     alert( $(this).text())
                	  
                })
               
                
        }
        
        
</script>

</head>
<body>
    <h2 style="text-align: center;" >스터디 플래너</h1>
    <div class="planner-date">
        <button onclick="changeDate(-1)">◀</button>
        <span id="date-display"></span>
        <button onclick="changeDate(1)">▶</button>
    </div>
    <div class="container">
        <div class="left-section">
            <div class="section-header">
                <h4 class="titleName">과목 및 세부사항</h4>
              
                <button type="submit" onclick="openModal()"">과목 추가</button>
            </div>
            <form action="addSubject.jsp" method="post">
                <%-- <select id="subjectName"name="subjectName">
                    <option value="">과목 선택</option>
                    <% 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studyplanner", "root", "password");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT name FROM subjects");
                            while (rs.next()) {
                    %>
                    <option value="<%= rs.getString("name") %>"><%= rs.getString("name") %></option>
                    <% 
                            }
                            conn.close();
                        } catch (Exception e) {
                            out.println("DB 오류: " + e.getMessage());
                        }
                    %>
                </select> --%>
            </form>
           
            <ul class="subject-list">
			
				<div id="registered-subjects">
						<!-- 생성된 과목들이 여기에 표시됩니다. -->
						<!-- 여기에는 한개의 과목씩 생성되어야한다. -->
				
				<div class="planDetail" style="float: left;">
				
<%-- 					과목의 세부사항을 입력하는 창
                 <input type="text" id="subjectDetails" name="subjectDetails" placeholder="세부사항을 입력하세요">
                 <button type="submit" value="저장" class>저장</button>  --%>
				</div>
				</div>
	
            </ul>
            
        </div>
        <div class="right-section">
            <div class="section-header">
                <h4 class="titleName">타임테이블 (10분 단위)</h4>
                <button type="button" onclick="sendProc()">저장</button>
            </div>
          <%--   <div class="time-table">
                <% for (int i = 7; i < 20; i++) { %>
                    <% for (int j = 0; j < 6; j++) { %>
                        <div class="time-slot" onclick="toggleTimeSlot(this)"><%= String.format("%02d:%02d", i, j * 10) %></div>
                    <% } %>
                <% } %>
            </div> --%>
            <div class="total-time">
                <span id="total-hours">총 공부 시간: 0.00시간</span>
            </div>
        </div>
    </div>

        <!-- 모달 -->
        <div id="subject-modal" class="modal" style="display: none;">
            <div class="modal-content">
            
                <span class="close" onclick="closeModal()">×</span>
                <h3>과목 추가</h3>
                <div id="subject-list">
                </div>
                <button type="button" id="add-subject">과목추가</button>
				<button  type="button" id="complete">완료하기</button>
               
            </div>
        </div>
        <script>

        
        
        
        
        
        
        
        
        
        //과목추가 누르면 발생되는 이벤트
        //과목을 추가할 때 과목 색상, 이름 입력 필드, 삭제 버튼을 생성하여 subject-list에 추가합니다
        var subjectList = document.getElementById("subject-list");
        document.getElementById("add-subject").onclick = function() {
			var subjectItem = document.createElement("div");
			subjectItem.className = "subject-item";
			
			var subjectColor = document.createElement("div");
			subjectColor.className = "subject-color";
			subjectColor.style.backgroundColor = getRandomColor();
			subjectItem.appendChild(subjectColor);
			
			//이건 과목추가 모달창에서 과목추가를 눌렀을때마다 생성되는것
			var subjectName = document.createElement("input");
			subjectName.className = "subject-name";
			subjectName.type = "text";
			subjectName.placeholder = "과목명";
			subjectItem.appendChild(subjectName);
			
			var deleteButton = document.createElement("button");
			deleteButton.className = "delete-button";
			deleteButton.innerText = "삭제";
			
			deleteButton.onclick = function() {
				subjectList.removeChild(subjectItem);
			}
			subjectItem.appendChild(deleteButton);
			subjectList.appendChild(subjectItem);
		} 
        
        
        
     // 완료하기 버튼을 클릭하면 subject-list에 있는 과목들을 registered-subjects에 표시하고, 모달창을 닫습니다.
        document.getElementById("complete").onclick = function() {
          var subjects = document.querySelectorAll(".subject-item");
          var subjectArray = [];
          var registeredSubjects = document.getElementById("registered-subjects");
           registeredSubjects.innerHTML = ""; // 기존에 표시된 과목 초기화
          
          subjects.forEach(function(subject) {
            var name = subject.querySelector(".subject-name").value;
            var color = subject.querySelector(".subject-color").style.backgroundColor;
            
            if (name) {
              subjectArray.push({ name: name, color: color });

              
/*               // 과목이 들어가면서 세부사항입력하는것도 같이 나와야 함
              var Detil = `<input type="text" id="subjectDetails" name="subjectDetails" placeholder="세부사항을 입력하세요">
              <button type="submit" value="저장" class>저장</button>` */
              
              var dynamic = `<div id="registered-subjects">
              					<div class="subject-display">
	              					<div class="subject-color" style="background-color: \${color};"></div>
	              					<span>\${name}</span><br>
	              					<div class="timer-display">
	              	                <span id="timerDisplay"> 00:00:00</span>
	              	                <div class="timer-controls">
	              	                    <button id="startBtn" onclick="startTimer()">시작</button>
	              	                    <button id="pauseBtn" onclick="pauseTimer()" disabled>일시정지</button>
	              	                    <button id="stopBtn" onclick="stopTimer()" disabled>종료</button>
	              	                </div>
	              	            </div>
              					</div>
	              				<div>
	              					<input type="text" id="subjectDetails" name="subjectDetails" placeholder="세부사항을 입력하세요">
	              	                <button type="submit" value="저장" class>저장</button><br><br>
	              	            </div>
              				</div>`;
              
              			// 생성된 과목 표시
//               var subjectDisplay = document.createElement("div");
//               subjectDisplay.className = "subject-display";

//               var subjectColorDisplay = document.createElement("div");
//               subjectColorDisplay.className = "subject-color";
//               subjectColorDisplay.style.backgroundColor = color;
//               subjectDisplay.appendChild(subjectColorDisplay);

//               var subjectNameDisplay = document.createElement("span");
//               subjectNameDisplay.innerText = name;
//               subjectDisplay.appendChild(subjectNameDisplay);
              
//               var subjectDetailDisplay = document.createElement("input");
//               subjectDetailDisplay.className="subject-detail";
//               subjectDisplay.appendChild(subjectDetailDisplay);
              
            /*   subjectDisplay.appendChild(`<input type="text" id="subjectDetails" name="subjectDetails" placeholder="세부사항을 입력하세요">
                      <button type="submit" value="저장" class>저장</button>`); */
//               registeredSubjects.appendChild(subjectDisplay);
                 registeredSubjects.innerHTML+= dynamic;
            }
          });
           
          console.log("생성된 과목:", subjectArray);
          //('subject-modal').style.display = 'none'
          //완료하기를 누르면 보달창이 닫혀야 한다................
          modal.style.display = "none";
          
        };   //여기서 ;를 써야 되는건가?
//타이머 버튼을 누르면 시작 삭제되어야 하며 
//해당플래너 과목의 해당하는 번호의 시작시간이 찍히며 
//종료 버튼을 누르면 종료시간이 찍혀야한다.
     
     
     
     
     

        
		// 무작위 RGB 색상을 생성하여 과목 색상으로 사용

		function getRandomColor() {
			var r = Math.floor(Math.random() * 256);
			var g = Math.floor(Math.random() * 256);
			var b = Math.floor(Math.random() * 256);
			return "rgb(" + r + "," + g + "," + b + ")";
		}
    	
		
		
		
		
		
		
		
		
		
        </script>
</body>
</html>