<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
 	 section#content div.goodsName a { color:#000; }
 	 
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
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
      <a class="nav-link dropdown-toggle" href="/list?c=100&l=1" id="navbardrop" data-toggle="dropdown">
        무기(Weapon)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/list?c=101&l=2">돌격소총(AR)</a>
        <a class="dropdown-item" href="/list?c=102&l=2">기관단총(SMG)</a>
        <a class="dropdown-item" href="/list?c=103&l=2">산탄총(SG)</a>
        <a class="dropdown-item" href="/list?c=104&l=2">소총(DMR)</a>
        <a class="dropdown-item" href="/list?c=105&l=2">저격총(SR)</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="/list?c=200&l=1" id="navbardrop" data-toggle="dropdown">
        탄(Bullet)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/list?c=201&l=2">5.56mm</a>
        <a class="dropdown-item" href="/list?c=202&l=2">7.62mm</a>
        <a class="dropdown-item" href="/list?c=203&l=2">9mm</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="/list?c=300&l=1" id="navbardrop" data-toggle="dropdown">
        방탄구(Armor)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/list?c=301&l=2">방탄헬멧(Helmet)</a>
        <a class="dropdown-item" href="/list?c=302&l=2">방탄조끼(Jacket)</a>
        <a class="dropdown-item" href="/list?c=303&l=2">전술가방(Backpack)</a>
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

<section id="container">
	<div id="container_box">
		<section id="content">
			<ul>
				<c:forEach items="${list}" var="list">
					<li>
						<div class="goodsThumb">
							<img src="${list.gdsThumbImg}">
						</div>
						<div class="goodsName">
							<a href="/detail?n=${list.gdsNum}">${list.gdsName}</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>
	</div>
</section>

</body>
</html>