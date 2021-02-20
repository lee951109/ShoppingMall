<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
footer {
  height: 100px;
  margin-top: -100px;
  background-color: gray;
 }
</style>
</head>

<body>
<div class="container-fluid">
  <br>
  <h3>Sticky Navbar</h3>
  <p>A sticky navigation bar stays fixed at the top of the page when you scroll past it.</p>
  <p>Scroll this page to see the effect. <strong>Note:</strong> sticky-top does not work in IE11 and earlier.</p>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
  <a class="navbar-brand" href="#">Logo</a>
  <ul class="navbar-nav">
  <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        무기(Weapon)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">돌격소총(AR)</a>
        <a class="dropdown-item" href="#">기관단총(SMG)</a>
        <a class="dropdown-item" href="#">산탄총(SG)</a>
        <a class="dropdown-item" href="#">소총(DMR)</a>
        <a class="dropdown-item" href="#">저격총(SR)</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        탄(Bullet)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">5.56mm</a>
        <a class="dropdown-item" href="#">7.62mm</a>
        <a class="dropdown-item" href="#">9mm</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        방탄구(Armor)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">방탄헬멧(Helmet)</a>
        <a class="dropdown-item" href="#">방탄조끼(Jacket)</a>
        <a class="dropdown-item" href="#">전술가방(Backpack)</a>
      </div>
    </li>
  </ul>
  <ul class="nav navbar-nav ml-auto">
   <form class="form-inline my-2 my-lg-0" action="#">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">검색</button>
  </form>
  </ul>
  <ul class="nav navbar-nav ml-auto">
  <c:if test="${member == null}">
    <li class="nav-item">
      <a class="nav-link" href="/member/login">로그인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/member/join">회원가입</a>
    </li>
    </c:if>
    <c:if test="${member != null}">
    	<c:if test="${member.varify == 1}">
    		<li class="nav-item">
    			<a class="nav-link" href="/admin/index">관리자 페이지</a>
    		</li>
    	</c:if>
    <li class="nav-item">
    	<a class="nav-link" href="/member/logout">로그아웃</a>
    </li>
    <br/>
    <li class="nav-item">
    <p class="nav-link" style="color: white;">${member.userName}님 환영합니다.<p>
    </c:if>
  </ul>
</nav>

<!-- 바디 영역! -->
<div class="container-fluid">
바디 영역
</div>


<footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>