<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="boda.javaexp6_2.*"
    import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/450c3e4f96.js" crossorigin="anonymous"></script>
<script src="../js/boda_book_inquery.js" defer></script>
<title>boda library</title>
<link rel="stylesheet" href="../css/boda_book_inquery.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<script>
</script>

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
      		<tr><td><a href="boda_edit_info.jsp" scope="col">회원정보수정</a></td></tr>
      		<tr><td><a href="boda_book_inquery.jsp" scope="col" id="select_menu">대출도서 조회</a></td></tr>
      		<tr><td><a href="boda_date_extend.jsp" scope="col">대출도서 연장</a></td></tr>
      		<tr><td><a href="boda_check_overdate.jsp" scope="col">연체일 확인</a></td></tr>
      		<tr><td><a href="#" scope="col">희망도서 신청</a></td></tr>
      	</table>
	</aside>
	<section class="boda_book_inquery">
      <div class="content_direction">
      	<a id="main_content_title"><b>대출도서조회</b></a>
      	<i class="fas fa-home"></i>
      	<a>마이페이지</a>
      	<i class="fas fa-arrow-right"></i>
      	<a>대출도서 조회</a>
   	  </div>
<%
	bodaMypageDao dao = new bodaMypageDao();
	ArrayList<bodaBookRecord> rlist = dao.bookInquerqy("easy@naver.com");
	
%>
      <table class="main_content">
      <thead><tr>
          <td class="main_content_th" ><b>번호</b></td>
          <td class="main_content_th" colspan="3"><b>도서이름</b></th>
          <td class="main_content_th"><b>저자명</b></td>
          <td class="main_content_th" colspan="2"><b>반납예정일</b></th>
          <td class="main_content_th"><b>상태</b></td>
        </tr></thead>
      <tbody>
       <%int cnt=rlist.size(); %>
      <%for(bodaBookRecord r : rlist){ %>
      <tr>
      <td><%=cnt %></td>
      <td colspan="3"><%=r.getBookName() %></td>
      <td><%=r.getWriter() %></td>
      <td colspan="2"><%=r.getDueDate() %></td>
      <td><%=r.getRentstate() %></td>
      </tr>
      <%cnt--; %>
      <%} %>
      </tbody>
      </table>
	</section></div>
</body>

<script type="text/javascript">
/*

*/
</script>
</html>