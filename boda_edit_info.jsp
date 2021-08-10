<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="boda.javaexp6_2.*"
    import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/boda_edit_info.css">
<script src="https://kit.fontawesome.com/4849ba1eab.js" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="../js/boda_edit_info.js" defer></script>
<title>bodaLibrary</title>
</head>
<body>
	 <nav class="navbar">
    <div class="nav-wrapper">
      <ul class="logo">
        <li><a href="main_home.html"><img src="../image/BODA_logo.png" onclick="location.href='main_home.html'"></a></li>
      </ul>
      <form class="search_bar">
        <input type="text" id="input" placeholder="무엇을 찾고 계신가요?">
        <button type="submit" id="btn" onkeydown="enterSearch()"><img id="nav_img" src="../image/BODA_search.png"></button>
      </form>
    </div>
    
    <div class="menu-wrapper">
      <ul class="menu">
        <li><a href="login.html">Log in</a></li>
        <li><a href="signup.html">Sign up</a></li>
        <li class="menu1" onclick="doDisplay()"><i class="fas fa-user-circle"></i></li>
      </ul>
    </div>
  </nav>
  
  <!-- 토글하면 나오는 메뉴바 -->
  <nav class="navbar2">
	   <ul class="side_menu1">
	        <li><a href="#"><b>대출도서 관리</b></a>
	        	<a href="boda_book_inquery.jsp">대출도서 조회하기</a>
	        	<a href="boda_date_extend.jsp">대출도서 연장하기</a>
	        	<a href="boda_check_overdate.jsp">연체일 확인하기</a>
	        	<a href="request-book.html"><b>희망도서관리</b></a></li>
	        <li><a href="boda_edit_info.jsp"><b>회원정보 수정</b></a>
	        	<a href="main_home.html"><b>로그아웃</b></a>
	        </li>
	   </ul>
   </nav>
	<div class="middle">
	<aside class="boda_mypage_menu">
		<table class="mypage_menu" border>
      		<tr id="mypage"><td scope="col">마이페이지</td></tr>
      		<tr><td><a href="boda_edit_info.jsp" scope="col" id="select_menu">회원정보수정</a></td></tr>
      		<tr><td><a href="boda_book_inquery.jsp" scope="col">대출도서 조회</a></td></tr>
      		<tr><td><a href="boda_date_extend.jsp" scope="col">대출도서 연장</a></td></tr>
      		<tr><td><a href="boda_check_overdate.jsp" scope="col">연체일 확인</a></td></tr>
      		<tr><td><a href="request-book.html" scope="col">희망도서 신청</a></td></tr>
      	</table>
	</aside>
	<section class="boda_edit_info">
      <div class="content_direction">
      	<a id="main_content_title"><b>회원정보수정</b></a>
      	<i class="fas fa-home"></i>
      	<a>마이페이지</a>
      	<i class="fas fa-arrow-right"></i>
      	<a>회원정보 수정</a>
   	  </div>
<%
	bodaMypageDao dao = new bodaMypageDao();
	bodaMember m = dao.searchMemberInfo("easy@naver.com");
	String email[] = m.getId().split("@");
	String email_head = email[0];
	String email_foot = email[1];
	
	String phone_head = m.getPhoneNumber().substring(0, 3);
	String phone_body = m.getPhoneNumber().substring(3, 7);
	String phone_foot = m.getPhoneNumber().substring(7);
%>

<%
//String edit_email_head = request.getParameter("email_head");
//String edit_email_foot = request.getParameter("email_foot");
//String edit_email = edit_email_head + "@" + edit_email_foot;

//String edit_phone_head = request.getParameter("phone_head");
//String edit_phone_body = request.getParameter("phone_body");
//String edit_phone_foot = request.getParameter("phone_foot");
//String edit_phone = edit_phone_head + edit_phone_body + edit_phone_foot; 

//String edit_addr = request.getParameter("addr");

//bodaMember edit_m = new bodaMember(edit_email, edit_phone, edit_addr);
//dao.editInfo(m.getId(), edit_m);

%>
      <table class="main_content">
      <thead><tr><td class="main_content_th" colspan="2"><b>회원 정보</b></td>
        </tr></thead>
      <tbody>
      <form id="edit_form" action="boda_edit_info_2.jsp" method="post">
      <tr><td class="main_th_size">이름</td>
      	 <td class="main_td_size"><%=m.getName() %></td></tr> 
      <tr><td class="main_th_size">성별</td>
      	<td class="main_td_size">여성</td></tr>
      <tr><td class="main_th_size">생년월일</td>
      	<td class="main_td_size">2000년07월21일</td></tr>
      <tr><td class="main_th_size">이메일</td>
      	<td class="main_td_size">
      	<input type="text" value=<%=email_head %> name="email_head" id="email_head" size="8"/>
      	<span>@</span>
      	<%
      	String email_option = "selected";
      	String email_foot1 = "";
      	String email_foot2 = "";
      	String email_foot3 = "";
      	String email_foot4 = "";
      	if(email_foot.equals("naver.com")){
      		email_foot1 = email_option;
      	}else if(email_foot.equals("daum.net")){
      		email_foot2 = email_option;
      	}else if(email_foot.equals("gmail.com")){
      		email_foot3 = email_option;
      	}else{
      		email_foot4 = email_option;
      	}
      	%>
      	<select name="email_foot" id="email_foot">	
      	<option value="" <%=email_foot4 %>>선택하세요</option>
      	<option value="naver.com" <%=email_foot1 %>>naver.com</option>	
		<option value="daum.net" <%=email_foot2 %>>daum.net</option>
		<option value="gmail.com" <%=email_foot3 %>>gmail.com</option>
		
		</select></td></tr>
      <tr><td class="main_th_size">핸드폰번호</td>
      	<td class="main_td_size">
 <%
     String phoneOption = "selected";
 	 String phone_head1 = "";
 	 String phone_head2 = "";
 	 String phone_head3 = "";
 	 String phone_head4 = "";
 	 if(phone_head.equals("010")) phone_head1 = phoneOption;
 	 else if(phone_head.equals("011")) phone_head2 = phoneOption;
 	 else if(phone_head.equals("017")) phone_head3 = phoneOption;
 	 else phone_head4 = phoneOption;
 %>     <select name="phone_head" id="phoneCk">
		<option value="" <%=phone_head4 %>>선택하세요</option>
		<option value="010" <%=phone_head1 %>>010</option>
		<option value="011" <%=phone_head2 %>>011</option>
		<option value="017" <%=phone_head3 %>>017</option>
		</select><span>-</span>
		<input type="text" name="phone_body"value=<%=phone_body %> id="inputMobile1" size="7" maxlength="4" />
		<span>-</span>
		<input type="text" name="phone_foot"value=<%=phone_foot %> id="inputMobile2" size="7" maxlength="4" /></td>
      </tr>
      <tr>
      	<td class="main_th_size">주소</td>
      	<td class="main_td_size">
      		<input type="text" id="sample6_postcode" placeholder="우편번호" readOnly/>
			<input type="button" width="30px" height="30px" onclick="search_postcode()" value="우편번호찾기"><br>
			<input type="text" name="addr" id="sample6_address" placeholder="주소"><br>
			<input type="text" id="sample6_extraAddress" placeholder="기본주소" size="50"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" size="50">
		</td>
      </tr>
      </tbody>
      </table>
      </form>

      <div class="main_content_btn">
      	<button id="main_content_btn1" onclick=editBtn()><b>수정하기</b></button>
      	<button id="main_content_btn2" onclick=cancelBtn()><b>취소하기</b></button>
      </div>
	</section>
	</div>
</body>

<script>
function search_postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

</script>
</html>